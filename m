Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15744FA375B
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 15:50:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C777A10ED41;
	Fri, 13 Sep 2024 15:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DawwYdNj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02D210ED41
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726242650; x=1757778650;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b5xHpICE9B4szQckFzc6Me5Ow8hQjbProgIQqUh4340=;
 b=DawwYdNj3ZuEHxxWScRRoAU3NHweS/Gto5M+u1kEmv74ufuGnuJsUR69
 QMI0kRvWboslbPUDA9xoYlz5m7J0de04sn2MODt2iL5237U7waKJMcrA3
 XzBICIlWdoUBdxk2iOD6LK1TwUaEpqUdl7ALuklDrY+zIhzek7RoEY8XQ
 vDRAi9e0dbDKAgl/4FmUARfCpg9CVl++s2COy8smOiTlwypYq1zx34bKA
 xqHk+dD6f5doQYlW9lBig+bp5aeLLGd2bHtYZ4HGeAH2Nta5/2ERyJ01z
 1xHH/eWK4RYcpxnYflnPwfKRabxJpMNEyXucgC6tBPSVWVkKKsfMUiYF7 Q==;
X-CSE-ConnectionGUID: WGobJ3j2Rou6iHrTILxGEg==
X-CSE-MsgGUID: Qk5aoj/uQ76o77Eris9IYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="29042192"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="29042192"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 08:50:50 -0700
X-CSE-ConnectionGUID: Q+HWhg1sTb+g2tm1tnCW6g==
X-CSE-MsgGUID: Buy18oZSSpaF9pMlYhIPDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="98942000"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 08:50:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 08:50:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 08:50:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 08:50:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 08:50:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeoTcao0c7JAbRvxhBaVwmgooW56nn/rxrJ/6RQLaHzBV30J4wIFboBHpDwH8rFa/Qdh3d5wXhLIjY05AWKP9+2bKQ09Tm1sS2JsFdEkphbgWtSqORWUXjuGAUeDvLVUJv5anb2FDOxD6AWRQ5eZF5EQnVwP3lFmrIiC5q/kGXLNVhjMCLgpw2YLxPQCxDVy1NQZBI3z2+XoOTUkw4qBEFg5S+yK17nbXlesmxDxc4jSk1rv7SCaXQNHpOHMC3Y6ifmOX7XqqU/vYkwG6Ns+Ij59WbmL7YQKed5JDgWyWoJQ8IhSEkED+ivEP2AVfGdeEV8SrYgy2cE6Y4tKumrphQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BRYwxuFH+4Y4X/KLjc/WoTiMHE8GpuECCUrFjaPpnk=;
 b=ej948kF4zprTaZgxYnS4pYK3o4ehk5W4vr0u2R3aLjMyYmOOB7ryrj+F7w4alIB9x4xZ878e11IT3QHDVwskR1Jwh3CUhkrAzwInP5MTm5RS+Px/hrjjpL/hrQer3vwkqtjZi23NOE0bUpgtcKPhTzDfF/Sy8+6LIk4+HmRfgt1VlVEGdPoBLZmyl1ygrwuRh1pT7eQtsTx1gBNo1/eTl+6a8maXZImptl0McQAGwP5ppfc6P5u2iYLFeod+Ny8coTcqVfgjGIBUjJshJgAT4FEU1t66zuZofR8s5F17SlmkhSg2TntnEd3/EBAxLPqH1oVUl33fQXJLPXJWKSdqgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH7PR11MB6770.namprd11.prod.outlook.com (2603:10b6:510:1b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Fri, 13 Sep
 2024 15:50:41 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%4]) with mapi id 15.20.7962.016; Fri, 13 Sep 2024
 15:50:41 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 "rafael@kernel.org" <rafael@kernel.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Restore pci state upon resume
Thread-Topic: [PATCH] drm/xe: Restore pci state upon resume
Thread-Index: AQHbBUbLBVvG9/fELUmHMXiDmfbEybJVjhuAgABOzgCAAAEl4A==
Date: Fri, 13 Sep 2024 15:50:41 +0000
Message-ID: <CY5PR11MB62116B4BFDAB0E07D93C588E95652@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240912190530.435976-1-rodrigo.vivi@intel.com>
 <ZuQbnRfh-wkuMR83@intel.com> <ZuRduLqXs4za8_PN@intel.com>
In-Reply-To: <ZuRduLqXs4za8_PN@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH7PR11MB6770:EE_
x-ms-office365-filtering-correlation-id: 9cc52635-a4c6-4243-8e09-08dcd40bd237
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?pDyFe6rW+IesyCYoBU5MYdqaAYTpidXH/+lp09hfPzLihhDPcp8QtqFGs2?=
 =?iso-8859-1?Q?nAYHXaX0iGmQ77Ztt1y5Tmmz34pQhBeAfmFaK9Bu5LWjNnedaRTgNlUgbs?=
 =?iso-8859-1?Q?ogSsuy1X23UHNJqL09FtVcfmmuLVQQMcpxE62y4G8c99F7qPh0mvJhw+EY?=
 =?iso-8859-1?Q?quoLtNowD1BkdvUwCVToCKq5sVLd1Se/RdcaF0hvz80JwGFI1i9rhYCw20?=
 =?iso-8859-1?Q?xcP9cCjuzUcKg4mjgQrHxSXkjRb56d8WHerFQA4xeIhqhZkVGSiVNL5dLC?=
 =?iso-8859-1?Q?IyMwlq3U7BsA0sQqx5vSbwZn7fRssX8VNT/Cqfjsy4tCOn6ygdrPqIG1dZ?=
 =?iso-8859-1?Q?zzUxS4R9fr/6kckM6a8vt4RSJHrajijavM5OG62G9sR7nsPR72L9gEuhmh?=
 =?iso-8859-1?Q?8RLwwh0zNSbF1o6G0wQbNewlUZTiYFoo/1Fa+9sI+rTI+uiWc5f1o83p+g?=
 =?iso-8859-1?Q?Ow1g5gl/lDvG2qDCK5SiNC+I9BTcEsqR3fOaz8ZYEjlgMeYVmUDGZT4bo3?=
 =?iso-8859-1?Q?KRwkxg41/txnGQ1qBxIWAeOKvEHUYmvI0bZpz81+vp4HneT38n4KejM5jA?=
 =?iso-8859-1?Q?rCkyhoroHtSKXX+68BNs1HjQ6KWI/YkctFNwsoqsVyaocQZo4MPueE/j13?=
 =?iso-8859-1?Q?o83Rag6DDW2MvqDW/e+lyiEPg/R+Lgyl9iorCiIzKYPTShFThem5t58Epl?=
 =?iso-8859-1?Q?RcTNRPSF7pnGdKW6pIUPEv6sKfV7FymNT2gT4a1hBG9D9GWE0QePLNt5kV?=
 =?iso-8859-1?Q?b5V81QCyqVW85YcRxLNJf8ylH0uAAYE7/ksUBDfkFFYMg46XP2mQlPAm63?=
 =?iso-8859-1?Q?xcEFGjrYFnW7CycdePZ6rn5hJYF0QxWIL1cFzCQm80PMBnP6P3qUiPZ1oQ?=
 =?iso-8859-1?Q?m2wvGY682sFfqGs8mJUhQ7PJPnMgY7UTM5iJLabBOX8yJWnGlpLip1n3L8?=
 =?iso-8859-1?Q?kUTDeIVboh4vi1cJBcuL1gi/Uxe6k8PmEXZTh3nS6FrW3CPsmbVxP/IJa/?=
 =?iso-8859-1?Q?GnXActAjrLjOsut9dd+2sgY22S3+PMxUyy+ddbbEZJojcc8TdIpLcOToOe?=
 =?iso-8859-1?Q?mSWQUq1RlOm9tm2/MDcKyQVG1tWCXG1XGqUidEa21OSMYMgxPtpOewHvjn?=
 =?iso-8859-1?Q?EOAd1Cy69nErDsyE077Yj8enBByNDFCuHvEub5aoP5/Jf9Gn9rpe64ct2A?=
 =?iso-8859-1?Q?d7DRXNV/tGvCa2h/mc/bjM5clE2KG0lpkoZkrhP3jR/TjG5b+cSTV0rjzS?=
 =?iso-8859-1?Q?tUBdd1bpdCMmcy6EewTvIbKaM5VLuiIqDMotBMrYgKZ9vA55zhq4w8DTdy?=
 =?iso-8859-1?Q?vA58PFXfoBa6v+rUDRLqfj0G+nqgyCfd4h4o9HiePHwFX/vXwym5XZJklZ?=
 =?iso-8859-1?Q?tynpTA/5P5tA90jOg9vfev9wxFPBtj+c6BW8TXZEPctl+duWHgu0OeeNUQ?=
 =?iso-8859-1?Q?ZtosGH20Y+hrONQaWuhUrVlBoO24m0gXWJLWKQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QSqdJFjd+DJCP3gVpwF6mDLTI1pR8q9VQp1gTiDNGijTe0z2BWbbyQpL+c?=
 =?iso-8859-1?Q?//dGFKHsf8+z6MCDXCusFkzltGrjoMUk0rpLI2Hnzcp9XSuqysWmwG4Z23?=
 =?iso-8859-1?Q?oq02AEu5gE5gb5oMOQdGdC+p/Ogwruo+HVxQOGbrWPaXA8fTsGsSuLaOZa?=
 =?iso-8859-1?Q?Ji/rICE0OMmHrXGWcxjsugkymGU63aE3VV5KILxMzUltivugEpcK5Sf7pC?=
 =?iso-8859-1?Q?y4tAjtoX6YW6Th9wdiGFweC+TC0/yzggESiH6rb5jD9VlkDeha6pD06ti2?=
 =?iso-8859-1?Q?u8oyaSXmJh2tP/SBetKlGs9KOwHrISh3yRAOnzqX/Znz5dNPGGcN179vMv?=
 =?iso-8859-1?Q?Wk+RSEIa3EZRJa5SCvFbiqbvjRCaFGHHbiu74+UgAkaqzoy/n7TYN6j1oo?=
 =?iso-8859-1?Q?S0rjvSfFYlhVJ2TCf/3dVfTGhoVLnQRwMwlowSwQgH3gkeW/LrtZpN9izb?=
 =?iso-8859-1?Q?U31wDwORAtKMNPN49IrR9YQmngjO7M3LK0oFpKdNC9wcrHM1LtJN/7K2JW?=
 =?iso-8859-1?Q?UAN+GbF60mvTkVR2dND/zZFVvLGj5ealzXhvA6lYk7s6PoiTVCMzHz30Su?=
 =?iso-8859-1?Q?nPC6n8yYp1TTCk38WoW5KS7c7UBkVYWe7c0oJolQ0C69bRv4RlujsWzukJ?=
 =?iso-8859-1?Q?pHEZpHZzzTYXU/mUvWYxj6X2Tq7tNfQiKb5qIhav8Qjr5FyuYQ/NCBDKkY?=
 =?iso-8859-1?Q?iecG2hQvKjvLEUiEaf8FaYJR+OUPL1ly7Zg8iMroETcY4gmB7krgDjwHbv?=
 =?iso-8859-1?Q?aX9mHDP/wJ220oHpATszAGFJ7ZH8F3OaVJcObZAjRPxwnBYD0cXSd7HOjP?=
 =?iso-8859-1?Q?OwMGyl6WmK/SBslu2dW/V+qB6XkAn7BFgnGlsr8XfDRDtYPR1m13PupP21?=
 =?iso-8859-1?Q?/NWG0/TNJFGeZPCBFVhYx9ySbLsTQiSFo1LAXFWyG6SJxNOFNGiPkhQKUd?=
 =?iso-8859-1?Q?sVFB14vImGWHAEP9xrpKkYLh1vWaIU8L6XiTidpI/VW4so2s5FX0b5X1li?=
 =?iso-8859-1?Q?cvxb+Wgkdu059U7rfOdClELrhKHjdh8bT/4IiXT01K+oHu86Dcj0x7m5K4?=
 =?iso-8859-1?Q?1zE5nWGR6AHm4lefU+ZfgzSwSzHTqY/pBQs3it0vZYm9pe+ndZwr0UvylD?=
 =?iso-8859-1?Q?ryjy+SvqfdEwi8Zqi+qV8jW/HdFYdKUEfrWYMvhMUmnveHvu97C3bSm4So?=
 =?iso-8859-1?Q?4Rmf4frsGdi+Uab9fqkvIdjoA8HFazfUAjmki2lq6R3clnnlACAQxQtJmI?=
 =?iso-8859-1?Q?P70W9/0FteZRBQij53s2vtxhMYf6f+mKFyqkpLThowI1W6ia4ZgEBqcUnh?=
 =?iso-8859-1?Q?ORmNE1988hM8LnMBhjxVQKHluxhRpxLIchOuvg0FSxHn4qu4UrwwazdEoB?=
 =?iso-8859-1?Q?vcLk5XHWgsvrWS0ElOVy1MqPDwUtydnVmh5Fg2dpXsmFR4eimTp2rxdUUF?=
 =?iso-8859-1?Q?VPCN4/kL1Men4AHcPQ9fXCQ0PKpmaLNFhZeXEuE90eyZ0Yge5WwAX7uPJ/?=
 =?iso-8859-1?Q?Dbd5PDgiXwurjYn/Ss7Dl3OFPiKmdXCFznHpu2WgZseNomeJIm8rHdtoOM?=
 =?iso-8859-1?Q?r7/3UNBdbacW69kUOqizSqkHur2Rp3TD4MHZQmKC7da2hfO3NY12gNH3tB?=
 =?iso-8859-1?Q?QsObkl+Zcj5FffebZpYQmMSU1YEOsY4bwv?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc52635-a4c6-4243-8e09-08dcd40bd237
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 15:50:41.5996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YwXCsaihtzbZaRpNElAQ8cxcNlSlFsbcSI7uBpNCGGPcB093JXzPzKgHqK1RGAJnfWl2PysDvF/1ZmIpcW/Y14yH1nMDdtlStuT3dXxkJ8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6770
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodr=
igo
> Vivi
> Sent: Friday, September 13, 2024 9:14 PM
> To: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>; rafael@kernel.org
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe: Restore pci state upon resume
>=20
> On Fri, Sep 13, 2024 at 02:01:49PM +0300, Ville Syrj=E4l=E4 wrote:
> > On Thu, Sep 12, 2024 at 03:05:30PM -0400, Rodrigo Vivi wrote:
> > > The pci state was saved, but not restored. Restore right after the
> > > power state transition request like every other driver.
> > >
> > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> > > GPUs")
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pci.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > > b/drivers/gpu/drm/xe/xe_pci.c index 5ba4ec229494..6d29ef4b396f
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -949,6 +949,8 @@ static int xe_pci_resume(struct device *dev)
> > >  	if (err)
> > >  		return err;
> > >
> > > +	pci_restore_state(pdev);
> >
> > Why is xe even doing this stuff by hand instead of letting the pci
> > core handle it?
>=20
> That's a fair question, given that there's not much documentation around =
it.
>=20
> Looking the pci code, it looks that the pci core is not calling itself fo=
r the
> restoration of the config space anywhere and looking to other drivers aro=
und it
> looks like a safe thing to do.
I observed below pci dbg logs which indicates, save/restore done by pci cor=
e during suspend/resume.

[  414.365382] i915 0000:03:00.0: saving config space at offset 0x0 (readin=
g 0x56938086)
[  414.373199] i915 0000:03:00.0: saving config space at offset 0x4 (readin=
g 0x100007)
[  414.380852] i915 0000:03:00.0: saving config space at offset 0x8 (readin=
g 0x3000004)
[  414.388587] i915 0000:03:00.0: saving config space at offset 0xc (readin=
g 0x0)
[  414.395806] i915 0000:03:00.0: saving config space at offset 0x10 (readi=
ng 0x60000004)
[  414.403725] i915 0000:03:00.0: saving config space at offset 0x14 (readi=
ng 0x0)
[  414.411022] i915 0000:03:00.0: saving config space at offset 0x18 (readi=
ng 0x8000000c)
[  414.418928] i915 0000:03:00.0: saving config space at offset 0x1c (readi=
ng 0x40)
[  414.426319] i915 0000:03:00.0: saving config space at offset 0x20 (readi=
ng 0x0)
[  414.433628] i915 0000:03:00.0: saving config space at offset 0x24 (readi=
ng 0x0)
[  414.440926] i915 0000:03:00.0: saving config space at offset 0x28 (readi=
ng 0x0)
[  414.448235] i915 0000:03:00.0: saving config space at offset 0x2c (readi=
ng 0x49058086)
[  414.456147] i915 0000:03:00.0: saving config space at offset 0x30 (readi=
ng 0xffe00000)
[  414.464057] i915 0000:03:00.0: saving config space at offset 0x34 (readi=
ng 0x40)
[  414.471449] i915 0000:03:00.0: saving config space at offset 0x38 (readi=
ng 0x0)
[  414.478753] i915 0000:03:00.0: saving config space at offset 0x3c (readi=
ng 0xff)
---------------------------------------------------------------------------=
-----------------------------------------------
[  444.303318] i915 0000:03:00.0: restoring config space at offset 0x3c (wa=
s 0xffffffff, writing 0xff)
[  444.312456] i915 0000:03:00.0: restoring config space at offset 0x38 (wa=
s 0xffffffff, writing 0x0)
[  444.321402] i915 0000:03:00.0: restoring config space at offset 0x34 (wa=
s 0xffffffff, writing 0x40)
[  444.330430] i915 0000:03:00.0: restoring config space at offset 0x30 (wa=
s 0xffffffff, writing 0xffe00000)
[  444.339978] i915 0000:03:00.0: restoring config space at offset 0x2c (wa=
s 0xffffffff, writing 0x49058086)
[  444.349525] i915 0000:03:00.0: restoring config space at offset 0x28 (wa=
s 0xffffffff, writing 0x0)
[  444.358469] i915 0000:03:00.0: restoring config space at offset 0x24 (wa=
s 0xffffffff, writing 0x0)
[  444.368417] i915 0000:03:00.0: restoring config space at offset 0x24 (wa=
s 0xffffffff, writing 0x0)
[  444.378371] i915 0000:03:00.0: restoring config space at offset 0x24 (wa=
s 0xffffffff, writing 0x0)
[  444.388318] i915 0000:03:00.0: restoring config space at offset 0x24 (wa=
s 0xffffffff, writing 0x0)
[  444.398266] i915 0000:03:00.0: restoring config space at offset 0x24 (wa=
s 0xffffffff, writing 0x0)
[  444.408207] i915 0000:03:00.0: restoring config space at offset 0x24 (wa=
s 0xffffffff, writing 0x0)
[  444.418192] i915 0000:03:00.0: restoring config space at offset 0x24 (wa=
s 0xffffffff, writing 0x0)
[  444.428138] i915 0000:03:00.0: restoring config space at offset 0x24 (wa=
s 0xffffffff, writing 0x0)
[  444.438085] i915 0000:03:00.0: restoring config space at offset 0x24 (wa=
s 0xffffffff, writing 0x0)
[  444.448026] i915 0000:03:00.0: restoring config space at offset 0x24 (wa=
s 0xffffffff, writing 0x0)
[  444.457970] i915 0000:03:00.0: restoring config space at offset 0x24 (wa=
s 0xffffffff, writing 0x0)
[  444.466912] i915 0000:03:00.0: restoring config space at offset 0x20 (wa=
s 0xffffffff, writing 0x0)
[  444.476858] i915 0000:03:00.0: restoring config space at offset 0x20 (wa=
s 0xffffffff, writing 0x0)
Thanks,
Anshuman
>=20
> And the pci_restore_state is paired with the pci_save_state.
> Both i915 and Xe are doing the pci_save_state and not restoring it.
>=20
> So, we either add the restore state to both, or we remove the save state.=
 Adding
> seems to be the most conservative approach, hence this patch (i915 is que=
ued
> in a branch with other display refactor).
>=20
> Rafael, any guidance here?
>=20
> Cc: Rafael J. Wysocki <rafael@kernel.org>
>=20
> >
> > > +
> > >  	err =3D pci_enable_device(pdev);
> > >  	if (err)
> > >  		return err;
> > > --
> > > 2.46.0
> >
> > --
> > Ville Syrj=E4l=E4
> > Intel
