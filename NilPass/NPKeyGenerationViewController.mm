//
//  NPKeyGenerationViewController.m
//  NilPass
//
//  Created by 0 to ∞ on Apr/27/13.
//  Copyright (c) 2013 0 to ∞. All rights reserved.
//

#import "NPKeyGenerationViewController.h"
#import "NPKeyGenerationDetailViewController.h"

#ifdef __cplusplus
# include "aes.h"

// C Runtime Includes
#include <iostream>
#include <iomanip>

// Crypto++ Includes
// #include "cryptlib.h"
#include "modes.h" // xxx_Mode< >
#include "filters.h" // StringSource and
// StreamTransformation

#include "sha.h"
#include "base64.h"

#endif

@interface NPKeyGenerationViewController () <NPKeyGenerationDetailViewControllerDelegate>

@end

@implementation NPKeyGenerationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)generateHashButtonPressed:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"segueKeyGeneration"
                              sender:self];
}

- (NSString *) generateHashKey
{
    byte key[ CryptoPP::AES::DEFAULT_KEYLENGTH ],
    iv[ CryptoPP::AES::BLOCKSIZE ];
    
    ::memset( key, 0x01, CryptoPP::AES::DEFAULT_KEYLENGTH );
    ::memset( iv, 0x01, CryptoPP::AES::BLOCKSIZE );
    
    // Message M
    std::string PlainText = "Relativitiy is perspective.";
    
    // Cipher Text Sink
    std::string CipherText;
    
    // Encryptor
    CryptoPP::CBC_Mode<CryptoPP::AES>::Encryption
    Encryptor( key, sizeof(key), iv );
    
    // Encryption
    CryptoPP::StringSource( PlainText, true,
                           new CryptoPP::StreamTransformationFilter( Encryptor, new CryptoPP::StringSink(CipherText )) // StreamTransformationFilter
                           ); // StringSource
    
    // example of hashing followed by base64 encoding, using filters
    std::string digest;
    
    CryptoPP::SHA256 hash;  // don't use MD5 anymore. It is considered insecure
    
    CryptoPP::StringSource foo(PlainText, true,
                               new CryptoPP::HashFilter(hash, new CryptoPP::Base64Encoder (new CryptoPP::StringSink(digest))));
    
    NSLog(@"SHA256 Hash %s", digest.c_str());
    
    return [NSString stringWithCString:digest.c_str() encoding:NSASCIIStringEncoding];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    NPKeyGenerationDetailViewController * detailVC = segue.destinationViewController;
    detailVC.delegate = self;
    detailVC.displayedKey = [self generateHashKey];
}

- (void)userDidDismissDetailViewController:(NPKeyGenerationDetailViewController *)detailVC
{
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

/*
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/

@end
