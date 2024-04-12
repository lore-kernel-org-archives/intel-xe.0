Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE62FC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 18:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5779110F7C6;
	Fri, 12 Apr 2024 18:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Db3GNYyJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E868610F7CD
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 18:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712947164; x=1744483164;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2mLed2Z2qFMunVuy0YUqPJ7tfzU5uXH4isVs4ER9lZY=;
 b=Db3GNYyJiRjOII5wGYqvr8EP3hO4xtc1hjarea3WpZSOw82GPnDwGEtR
 GcB/vtwTgDpIFQvGDgclK0P2bgMtXBRvyEM71oJDDG9ervmNhQ1ccxkWr
 CByQnW1SIbZRgDIeqEXZIKA2kMYk5SuY3uWWxLikvWxK/0p3ifV5kZpfi
 jnZILZ+NsRH5wdO0nrXSurdgKTWWj4gmwgnQsZVkpRLSwUj8XN+WzGb6u
 0l9AghkorI2by+q5xbblSZ8ZPIG9JJ2nuRFxkvweAiDpeD7akRNM/KV4z
 0k2z+Emy2huORfRdThGL87at0zMNmgSWp2Wecqa2M2xUHataRbspK5fZz Q==;
X-CSE-ConnectionGUID: hs+WDyA0RUe0q//0BCRO7A==
X-CSE-MsgGUID: WBZUW25gQVWcIxCYpisLtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8282416"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8282416"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 11:39:23 -0700
X-CSE-ConnectionGUID: y3PvMUdUQYi7WoG6NHunRg==
X-CSE-MsgGUID: a4zFr+VyQKa3naZ5GuaFAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21302923"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 11:39:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 11:39:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 11:39:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 11:39:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 11:39:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvtNWShQbE/bcKT/y2SdbyuzZ4ajVHkhUHpLVYLC8lBjUcTZmQGIrtqSD57K+OVEONSC51Nm0canRulFXDZwvBVZgvnbmMqa+S8EaqUldpZbc81FrSQ4z0Bbk2hEtU8dTFLr4sksO15lEvmUggyqHeDBhUgFPDfOfPo4mMAUXV/7UxcRJKGy9TcKzFNVv5gLPRfBFWqgty8m93XW8ALg7gXmcuN6WqjBm4L8WdZ/QaQpSi6069Bp49i5qvn0p5uj8Y5EOCgpVAIlmQ5MnkFhbYDgl0lIBWO9m6DrL/ecEOnGtu5ZxniBgY6KZKpjAhPxZ3VFgIiKsOK/OfliawEuRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfgDAzmMkaO5lzu52AVRi0IewAjynkaksPW828saEwM=;
 b=ih8tRDBLWBkoKXvmgygzUIRqfX6yKN/F/imMT1jC+PFZZK/c92CtnnOUf2x2HeA8EdSqmVD6n1gwcVD9IRZft9Hp4IGjDuchWih+UXhUUqTy3J41m2/VE5YOqRfq0meSu+7hiZqXKTW7ipn/DYkYz83qYllCybb6ZoBx04R8I+Bfl+aXIj6/5Z9hQxJn0vMgiZD6qC1qD0V//pHHz+D4qfBvfc/CxSW1fJbvwrk5/7HDjVOWs/nWBP1cULx3oBk57cA3Q1k3DtoAPDOPYgsjaKV1jqw+D05ZISPadWpBjykcmQjsu5y/g4qbMr7RmhY/5/tbBI8NndWVdMZS4HmiPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA2PR11MB4842.namprd11.prod.outlook.com (2603:10b6:806:f8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Fri, 12 Apr
 2024 18:39:20 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Fri, 12 Apr 2024
 18:39:20 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: RE: [v2 27/31] drm/xe/svm: Handle CPU page fault
Thread-Topic: [v2 27/31] drm/xe/svm: Handle CPU page fault
Thread-Index: AQHairlbYWseFE6xEUWVygHR4om6n7FiVI2AgAEE3GCAAZqhAIAABsNQ
Date: Fri, 12 Apr 2024 18:39:20 +0000
Message-ID: <SA1PR11MB69916019138E34B76B6D1FF692042@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-28-oak.zeng@intel.com>
 <ZhdF33hVByZy0od2@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB69919A436E1D1098148A1E0992042@SA1PR11MB6991.namprd11.prod.outlook.com>
 <Zhl5KFMvLbP2FvjJ@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zhl5KFMvLbP2FvjJ@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA2PR11MB4842:EE_
x-ms-office365-filtering-correlation-id: c6ea9247-cdab-4600-50fd-08dc5b1fddb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y4CkAT5KsC1WdyS8npX0XSpLgNCpMhvSuFcmSI5R3qRtamE/EQHcpSEf3VCHHiej4S1Nwr+kTbKjaFBI4TJ56Y9NC0c90msUaPpJOp1w8Hzq8JC3Z4DOKN4H2A/tJ6sLyruKlWHrzbFpzQV0V0AgR9Zg+FJuzMYVCHk0dzPXf/OVoVyGnZI1Q4xdFipiTpPs662Q8Pi1Strz3jY60mCxYFZHbH2q2Xg3Mb6pfXxwCLmev2hpTgSF3q2BRZE3gfG8Pm4q0rlwvManIG1905yngllSSCa9MXA0Eo65pww2raLtWlNd3+tP5duPFcM7BP24J/aIBmH9HhNio1SaadYb7Dd1Am9v9HzNR3uNZ9Qa0BdXiRnlU/MJhYSAjcRWte96M7AGVt9L7MZJxCHL/4brieR/dgL0I5n+S74QAtBLHqvoE5BQ4fWMLD+G5lOFw+AhiR5dFs6GF+i9EBIQOHQYWyWDhincTe8H13cbbJ+DSPA6b+eTZxkYw3xZYxBuP0caCWMquAZ8KMCZWTKHMzRGhJgxDPUwFoeFWfas2WfHnW7C+x8JqbcNZyY+TpJu0ygmtlxU02DmMgKD7Xx3xy0kdYcWlJvQnTg8pGy+keJbnuViupoiedhIYUoltnQ0i2eJJ5Sy5wA8RzSNwYeezMz1HPXgo6nB9busYVIYBu2pKW0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?noOykWA8zcYHeqRF2mqHhmwsMh0YgZxPTvwMJvSMmsMwulG2Zf2DQ+cxls?=
 =?iso-8859-1?Q?CQ/g76o1naE9+SYFoRk7PABkSoA9AiMglBHy6zlQmumS1C76emIK8/JEXv?=
 =?iso-8859-1?Q?FXR2j9FoPIIwsFZ7JUHmkZWUTZtJO/GeeddFEawZzZze6si0OAQ1qNiLlO?=
 =?iso-8859-1?Q?6txWMSVIhp0rFsEgAvRGY97emUy9w0HTfQCRn2feYMzN1eQpOQchRhOEbG?=
 =?iso-8859-1?Q?k4PktWuC2iCS5ALomWg+GJ3GIABKhElczyAfqGplpUa/azZs4hfRiWPDs7?=
 =?iso-8859-1?Q?XitNva68F5QV7KFAVd6PW65IaWEx9nMLT5A8nojPge8BgK/ZDc5Z4Tjw6e?=
 =?iso-8859-1?Q?iCreo27bEAneWIYdrsO8Me16qi473WP4vj0uY7kI5bnwDqfndGv94YVwJ/?=
 =?iso-8859-1?Q?ndKp77IwOyxImOfAntkEFZlfZnAZFj95EEPE/5sE1soEN69XgLYDGUFyun?=
 =?iso-8859-1?Q?ESPSS3MCybqGiZ7IJOK6phK308HxPcpcvVfnS6Z24KheVHkApMz323rNUA?=
 =?iso-8859-1?Q?pnJEitB67ALkBVuxL6naGVp8Y/IM7VhcX5/IhZwpSJgkhO5n01poiMGAEJ?=
 =?iso-8859-1?Q?416t2UC1f4WzlcQFE7CuiA9mT93Ee5dTdxMCW8vw5aEtfwwE7ZyNBd92J1?=
 =?iso-8859-1?Q?aITOI43voiQZCdDmnLQvNvt33auCaXclOdC0T1piOZfLPb4mdKKvNkXidv?=
 =?iso-8859-1?Q?rFgbZaUcSy4j8y3QnT/fFehRuI1fmm44/0/+nz47HmJpYZRd/i8mzQjVb2?=
 =?iso-8859-1?Q?N9Ls+0T0eo6rR0u/lbTQiiT99XwUacaYUtJY1v+YELcF1loKJrcI7CLnY1?=
 =?iso-8859-1?Q?/j6yPYFdR7krB3Op1VU2Hmb5E+nxLSKVTtmElwug+B7b6kBcXjhjvSzABX?=
 =?iso-8859-1?Q?yqqAjDMf5K50LLuTGetwAC0Tq8/1lGrgptSp9kqP/BetAor6P26OnDj37V?=
 =?iso-8859-1?Q?ZlC+bpa3TDN3qs5wtZ9R29NGXuNwMlY+IPe5JWzbAVJGNApJsiFMqJziRQ?=
 =?iso-8859-1?Q?PB4byyZtu5ePgAH+vReO+9unf3NeO1fDCUxm8C27Z5SeRT2PXnyCH5L1CV?=
 =?iso-8859-1?Q?cOQNtSX+9e5J0AjjIahN2KfprvJxNn8AlFDTKADxDYEqUx8IedBDBWAKBm?=
 =?iso-8859-1?Q?sYHaVNamAiFlW4ols5iOaD56B4FuC60AfqZsAezVatJQUMWpaDkkS9MEnB?=
 =?iso-8859-1?Q?VTtE0KYYLMrpsFzVtTnpqpWbsa7P6P0uoZtZTvxcC3XptTvHkmzkv450s5?=
 =?iso-8859-1?Q?6De0uwObtEW7jIGJbA1m140pMJ5x+FpbcFs44qCXDFLZdcwQa5lnL7zg2K?=
 =?iso-8859-1?Q?8slEFfvwRPgBR9GM8C3nkIgmjZV1/gMW50SlxDnzJMx2OT7gMw+2ctKW4T?=
 =?iso-8859-1?Q?AQAoKHzmtwu8sXJZKRZ+B1qCQTvWQjqH/Zwjexz14vJHSbYhv/wUo+elf+?=
 =?iso-8859-1?Q?765/5XKv1bUg6IkRuKKiNlHIxewnbdx3cfjFfbZfddTizV9LOVtNL6rzo9?=
 =?iso-8859-1?Q?RCj7bNjwO72u+YuklMQBIdClW6wy0oRX+HY5+KstXn/7lVlmbh+b+5VFT8?=
 =?iso-8859-1?Q?XyBtd+KJhADZi7gE/W2gP1FDJJYcslKpBXiLtpyluUuejNqU2XV8kXUKqx?=
 =?iso-8859-1?Q?ySU9795g2Y4kI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ea9247-cdab-4600-50fd-08dc5b1fddb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 18:39:20.0833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +XUHH/Wp/Da7oEmltC0fSFzd5+5htjKRIQgcuJvKDITLwiCvOCkajRYlhgJj6ran559dzADgRm+lshGlB86Z5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4842
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Friday, April 12, 2024 2:11 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> Brian <brian.welty@intel.com>
> Subject: Re: [v2 27/31] drm/xe/svm: Handle CPU page fault
>=20
> On Fri, Apr 12, 2024 at 11:24:06AM -0600, Zeng, Oak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Wednesday, April 10, 2024 10:07 PM
> > > To: Zeng, Oak <oak.zeng@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > > <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> > > <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty=
,
> > > Brian <brian.welty@intel.com>
> > > Subject: Re: [v2 27/31] drm/xe/svm: Handle CPU page fault
> > >
> > > On Tue, Apr 09, 2024 at 04:17:38PM -0400, Oak Zeng wrote:
> > > > Under the picture of svm, CPU and GPU program share one same
> > > > virtual address space. The backing store of this virtual address
> > > > space can be either in system memory or device memory. Since GPU
> > > > device memory is remaped as DEVICE_PRIVATE, CPU can't access it.
> > > > Any CPU access to device memory causes a page fault. Implement
> > > > a page fault handler to migrate memory back to system memory and
> > > > map it to CPU page table so the CPU program can proceed.
> > > >
> > > > Also unbind this page from GPU side, and free the original GPU
> > > > device page
> > > >
> > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > Co-developed-by: Niranjana Vishwanathapura
> > > <niranjana.vishwanathapura@intel.com>
> > > > Signed-off-by: Niranjana Vishwanathapura
> > > <niranjana.vishwanathapura@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > > > Cc: Brian Welty <brian.welty@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/Makefile         |   1 +
> > > >  drivers/gpu/drm/xe/xe_svm.h         |   8 +-
> > > >  drivers/gpu/drm/xe/xe_svm_devmem.c  |   7 +-
> > > >  drivers/gpu/drm/xe/xe_svm_migrate.c | 222
> > > ++++++++++++++++++++++++++++
> > > >  4 files changed, 230 insertions(+), 8 deletions(-)
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_svm_migrate.c
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makef=
ile
> > > > index f89d77b6d654..65289acdd563 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -131,6 +131,7 @@ xe-y +=3D xe_bb.o \
> > > >  	xe_step.o \
> > > >  	xe_svm.o \
> > > >  	xe_svm_devmem.o \
> > > > +	xe_svm_migrate.o \
> > >
> > > See comments about file org, same thing applies here. Let's put all o=
f
> > > the svm implementation in a single file.
> > >
> > > >  	xe_sync.o \
> > > >  	xe_tile.o \
> > > >  	xe_tile_sysfs.o \
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_sv=
m.h
> > > > index f601dffe3fc1..c9e4239c44b4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > @@ -7,11 +7,11 @@
> > > >  #define __XE_SVM_H
> > > >
> > > >  #include <linux/mm_types.h>
> > > > +#include <linux/mm.h>
> > > >  #include "xe_device_types.h"
> > > >  #include "xe_device.h"
> > > >  #include "xe_assert.h"
> > > > -
> > > > -struct xe_vm;
> > > > +#include "xe_vm_types.h"
> > > >
> > > >  /**
> > > >   * struct xe_svm - data structure to represent a shared
> > > > @@ -31,6 +31,9 @@ struct xe_svm {
> > > >  	struct list_head vm_list;
> > > >  };
> > > >
> > > > +#define xe_svm_for_each_vm(svm, vm)
> > > 	\
> > > > +		list_for_each_entry(vm, &svm->vm_list, svm_link)
> > > > +
> > >
> > > Don't think this is need, see below.
> > >
> > > >  extern struct xe_svm *xe_create_svm(void);
> > > >  void xe_destroy_svm(struct xe_svm *svm);
> > > >  extern struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm);
> > > > @@ -79,4 +82,5 @@ int xe_devm_alloc_pages(struct xe_tile *tile,
> > > >
> > > >  void xe_devm_free_blocks(struct list_head *blocks);
> > > >  void xe_devm_page_free(struct page *page);
> > > > +vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf);
> > > >  #endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > index 088ac209ad80..32ada458f1dd 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > @@ -37,11 +37,6 @@ struct xe_svm_block_meta {
> > > >  	unsigned long bitmap[];
> > > >  };
> > > >
> > > > -static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> > > > -{
> > > > -	return 0;
> > > > -}
> > > > -
> > > >  static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offse=
t)
> > > >  {
> > > >  	/** DRM buddy's block offset is 0-based*/
> > > > @@ -168,7 +163,7 @@ void xe_devm_free_blocks(struct list_head
> *blocks)
> > > >
> > > >  static const struct dev_pagemap_ops xe_devm_pagemap_ops =3D {
> > > >  	.page_free =3D xe_devm_page_free,
> > > > -	.migrate_to_ram =3D xe_devm_migrate_to_ram,
> > > > +	.migrate_to_ram =3D xe_svm_migrate_to_sram,
> > >
> > > Again single file so this will be static function, no reason to expor=
t
> > > this.
> > >
> > > >  };
> > > >
> > > >  /**
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > b/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > > new file mode 100644
> > > > index 000000000000..0db831af098e
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > > @@ -0,0 +1,222 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright =A9 2023 Intel Corporation
> > > > + */
> > > > +
> > > > +#include <linux/gfp.h>
> > > > +#include <linux/migrate.h>
> > > > +#include <linux/dma-mapping.h>
> > > > +#include <linux/dma-fence.h>
> > > > +#include <linux/bitops.h>
> > > > +#include <linux/bitmap.h>
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/slab.h>
> > > > +#include <drm/drm_buddy.h>
> > > > +#include "xe_device_types.h"
> > > > +#include "xe_device.h"
> > > > +#include "xe_trace.h"
> > > > +#include "xe_migrate.h"
> > > > +#include "xe_ttm_vram_mgr_types.h"
> > > > +#include "xe_assert.h"
> > > > +#include "xe_pt.h"
> > > > +#include "xe_svm.h"
> > > > +#include "xe_vm.h"
> > > > +
> > > > +
> > > > +/**
> > > > + * alloc_host_page() - allocate one host page for the fault vma
> > > > + *
> > > > + * @dev: (GPU) device that will access the allocated page
> > > > + * @vma: the fault vma that we need allocate page for
> > > > + * @addr: the fault address. The allocated page is for this addres=
s
> > > > + * @dma_addr: used to output the dma address of the allocated page=
.
> > > > + * This dma address will be used for gpu to access this page. GPU
> > > > + * access host page through a dma mapped address.
> > > > + * @pfn: used to output the pfn of the allocated page.
> > > > + *
> > > > + * This function allocate one host page for the specified vma. It
> > > > + * also does some prepare work for GPU to access this page, such
> > > > + * as map this page to iommu (by calling dma_map_page).
> > > > + *
> > > > + * When this function returns, the page is locked.
> > > > + *
> > > > + * Return struct page pointer when success
> > > > + * NULL otherwise
> > > > + */
> > > > +static struct page *alloc_host_page(struct device *dev,
> > > > +							 struct vm_area_struct
> > > *vma,
> > > > +							 unsigned long addr,
> > > > +							 dma_addr_t
> > > *dma_addr,
> > > > +							 unsigned long *pfn)
> > >
> > > Weird alignment, also I don't think we are want to allocate a page at
> > > time...
> > >
> > > Beyond that, can't say I'm a fan of 2 arguments being return and
> > > populated here either (dma_addr_t *dma_addr, unsigned long *pfn). I
> > > haven't seen a lot that style function in Linux.
> > >
> > > Probably makes more sense to have a function which allocates pages,
> > > locks them, and populates the pfn array (migrate_pfn) rather than doi=
ng
> > > this a page at a time.
> > >
> > > > +{
> > > > +	struct page *page;
> > > > +
> > > > +	page =3D alloc_page_vma(GFP_HIGHUSER, vma, addr);
> > > > +	if (unlikely(!page))
> > > > +		return NULL;
> > > > +
> > > > +	/**Lock page per hmm requirement, see hmm.rst*/
> > > > +	lock_page(page);
> > > > +	*dma_addr =3D dma_map_page(dev, page, 0, PAGE_SIZE,
> > > DMA_FROM_DEVICE);
> > >
> > > The device is writing to these pages so I think DMA_BIDIRECTIONAL is
> > > needed, right? As mentioned above I think this should be broken out i=
nto
> > > a different step too.
> > >
> > > > +	if (unlikely(dma_mapping_error(dev, *dma_addr))) {
> > > > +		unlock_page(page);
> > > > +		__free_page(page);
> > > > +		return NULL;
> > > > +	}
> > > > +
> > > > +	*pfn =3D migrate_pfn(page_to_pfn(page));
> > > > +	return page;
> > > > +}
> > > > +
> > > > +static void free_host_page(struct page *page)
> > > > +{
> > > > +	unlock_page(page);
> > > > +	put_page(page);
> > > > +}
> > > > +
> > > > +/**
> > > > + * migrate_page_vram_to_ram() - migrate one page from vram to ram
> > > > + *
> > > > + * @vma: The vma that the page is mapped to
> > > > + * @addr: The virtual address that the page is mapped to
> > > > + * @src_pfn: src page's page frame number
> > > > + * @dst_pfn: used to return dstination page (in system ram)'s pfn
> > > > + *
> > > > + * Allocate one page in system ram and copy memory from device
> memory
> > > > + * to system ram.
> > > > + *
> > > > + * Return: 0 if this page is already in sram (no need to migrate)
> > > > + * 1: successfully migrated this page from vram to sram.
> > > > + * error code otherwise
> > > > + */
> > > > +static int migrate_page_vram_to_ram(struct vm_area_struct *vma,
> > > unsigned long addr,
> > > > +						unsigned long src_pfn,
> > > unsigned long *dst_pfn)
> > > > +{
> > >
> > > We definitely don't want to copy 1 page at time. I touch on this in [=
1].
> > > Basically this going to perform poorly unless we use larger copies, t=
he
> > > migrate code supports non-contigous sram addresses, and vram addresse=
s
> > > will likely be contigous due to the buddy allocator.
> > >
> > > [1]
> https://patchwork.freedesktop.org/patch/588548/?series=3D132229&rev=3D1
> > >
> > > > +	struct xe_mem_region *mr;
> > > > +	struct xe_tile *tile;
> > > > +	struct xe_device *xe;
> > > > +	struct device *dev;
> > > > +	dma_addr_t dma_addr =3D 0;
> > > > +	struct dma_fence *fence;
> > > > +	struct page *host_page;
> > > > +	struct page *src_page;
> > > > +	u64 src_dpa;
> > > > +
> > > > +	src_page =3D migrate_pfn_to_page(src_pfn);
> > > > +	if (unlikely(!src_page || !(src_pfn & MIGRATE_PFN_MIGRATE)))
> > >
> > > I'm going to say this is a bug if !src_page ||
> > > !is_zone_device_page(src_page) || !(src_pfn & MIGRATE_PFN_MIGRATE)
> and
> > > we return -EFAULT (or another error code if that makes more sense). W=
e
> > > are migrating from the device where we know we have backing store fro=
m
> > > the original fault.
> > >
> > > > +		return 0;
> > > > +
> > > > +	mr =3D xe_page_to_mem_region(src_page);
> > > > +	tile =3D xe_mem_region_to_tile(mr);
> > > > +	xe =3D tile_to_xe(tile);
> > > > +	dev =3D xe->drm.dev;
> > > > +
> > > > +	src_dpa =3D xe_mem_region_pfn_to_dpa(mr, src_pfn);
> > > > +	host_page =3D alloc_host_page(dev, vma, addr, &dma_addr, dst_pfn)=
;
> > > > +	if (!host_page)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	fence =3D xe_migrate_pa(tile->migrate, src_dpa, true,
> > > > +						dma_addr, false, PAGE_SIZE);
> > > > +	if (IS_ERR(fence)) {
> > > > +		dma_unmap_page(dev, dma_addr, PAGE_SIZE,
> > > DMA_FROM_DEVICE);
> > > > +		free_host_page(host_page);
> > > > +		return PTR_ERR(fence);
> > > > +	}
> > > > +
> > > > +	dma_fence_wait(fence, false);
> > >
> > > Even if we did want to migrate a page at a time, we only need to wait=
 on
> > > the last fence due to the ordered nature of exec queues.
> > >
> > > > +	dma_fence_put(fence);
> > > > +	dma_unmap_page(dev, dma_addr, PAGE_SIZE, DMA_FROM_DEVICE);
> > >
> > > With above, will likely unmap all dma pages in a single function once
> > > the last fence is signaled.
> > >
> > > > +	return 1;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_svm_migrate_to_sram() - Migrate memory back to sram on CPU
> page
> > > fault
> > > > + *
> > > > + * @vmf: cpu vm fault structure, contains fault information such a=
s vma
> etc.
> > > > + *
> > > > + * Note, this is in CPU's vm fault handler, caller holds the mmap =
read
> lock.
> > > > + *
> > > > + * This function migrate one gpu vma which contains the fault addr=
ess to
> > > sram.
> > > > + * We try to maintain a 1:1 mapping b/t the CPU vma and gpu vma (i=
.e.,
> > > create one
> > > > + * gpu vma for one cpu vma initially and try not to split it). So =
this
> scheme
> > > end
> > > > + * up migrate at the vma granularity. This might not be the best
> performant
> > > scheme
> > > > + *
> > > > + * This can be tunned with a migration granularity for  performanc=
e, for
> > > example,
> > > > + * migration 2M for each CPU page fault, or let user specify how m=
uch
> to
> > > migrate.
> > > > + * This is more complex due to vma splitting.
> > > > + *
> > > > + * This function should also update GPU page table, so the fault v=
irtual
> > > address
> > > > + * points to the same sram location from GPU side. This is TBD.
> > > > + *
> > > > + * Return:
> > > > + * 0 on success
> > > > + * VM_FAULT_SIGBUS: failed to migrate page to system memory,
> > > application
> > > > + * will be signaled a SIGBUG
> > > > + */
> > > > +vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf)
> > > > +{
> > > > +	struct xe_mem_region *mr =3D xe_page_to_mem_region(vmf->page);
> > > > +	struct xe_tile *tile =3D xe_mem_region_to_tile(mr);
> > > > +	struct xe_device *xe =3D tile_to_xe(tile);
> > > > +	struct vm_area_struct *vma =3D vmf->vma;
> > > > +	struct mm_struct *mm =3D vma->vm_mm;
> > > > +	struct xe_svm *svm =3D xe_lookup_svm_by_mm(mm);
> > >
> > > I don't think this is needed... More below.
> > >
> > > > +	unsigned long addr =3D vma->vm_start;
> > > > +	u64 npages =3D vma_pages(vma);
> > > > +	struct xe_vma *xe_vma;
> > > > +	vm_fault_t ret =3D 0;
> > > > +	struct xe_vm *vm;
> > > > +	void *buf;
> > > > +	int i;
> > > > +
> > > > +	struct migrate_vma migrate_vma =3D {
> > > > +		.vma		=3D vmf->vma,
> > > > +		.start		=3D vma->vm_start,
> > > > +		.end		=3D vma->vm_end,
> > >
> > > So I know in my PoC I had the fault user pointer (xe_vma) =3D=3D stru=
ct
> > > vm_area_struct of the GPU fault. That is definitely wrong. We likely
> > > want to allocate sub-range of vm_area_struct for the xe_vma, we can c=
all
> > > this a chunk size. Logical chunks sizes would be aligned 2MB, 64k, an=
d
> > > finally 4k in sizes trying the largest first... The chunk sizes are
> > > trivial as we likely can just have table with values, the key here is
> > > the vm_area_struct vm_start / vm_end are not what we want to use here
> > > rather xe_vma_start(vma) and xe_vma_end(vma). I think we get the
> xe_vma
>=20
> After I typed this, realized I made a mistake here...
>=20
> s/xe_vma_start/xe_vma_userptr/
> s/xe_vma_end/xe_vma_userptr + xe_vma_size/
>=20
> But you get the idea - the zone_device_data points Xe specific chunk
> data (currently xe_vma, could be xe_pt_state our something later if we
> switch to 1:N).
>=20
> Check AMD's + Nvidia's drivers and they both use this field in a similar
> way.
>=20
> > > from the faulting page vmf->page->zone_device_data field unless you h=
ave
> > > another use that field...
> >
> > You are right. Such work is planned in the memory attributes part that =
Himal
> is working on. We have a migration_granularity attribute which allow user=
 to
> set the chunk size.
> >
>=20
> That makes sense. The chunk size is always just hint though, right?


I believe we should have a default chunk size, such as 2M, and user can ove=
rwrite it through hints.

>=20
> > >
> > > I also comment on my patch with my suggestion implement chunk sizes t=
oo.
> > >
> > > > +		.pgmap_owner	=3D xe,
> > >
> > > Again helper for this.
> > >
> > > > +		.flags		=3D MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> > > > +		.fault_page =3D vmf->page,
> > > > +	};
> > > > +
> > > > +	buf =3D kvcalloc(npages, 2* sizeof(*migrate_vma.src), GFP_KERNEL)=
;
> > > > +	migrate_vma.src =3D buf;
> > > > +	migrate_vma.dst =3D buf + npages;
> > > > +	if (migrate_vma_setup(&migrate_vma) < 0) {
> > > > +		ret =3D VM_FAULT_SIGBUS;
> > > > +		goto free_buf;
> > > > +	}
> > > > +
> > > > +	if (!migrate_vma.cpages)
> > >
> > > This is an error, need to set a return value.
> > >
> > > > +		goto free_buf;
> > > > +
> > >
> > > We probably should check migrate.cpages !=3D npages too as I also thi=
nk
> > > this is an error.
> > >
> > > > +	for (i =3D 0; i < npages; i++) {
> > > > +		ret =3D migrate_page_vram_to_ram(vma, addr,
> > > migrate_vma.src[i],
> > > > +							migrate_vma.dst + i);
> > > > +		if (ret < 0) {
> > > > +			ret =3D VM_FAULT_SIGBUS;
> > > > +			break;
> > > > +		}
> > > > +
> > > > +		/** Migration has been successful, free source page */
> > > > +		if (ret =3D=3D 1) {
> > > > +			struct page *src_page =3D
> > > migrate_pfn_to_page(migrate_vma.src[i]);
> > > > +
> > > > +			xe_devm_page_free(src_page);
> > > > +		}
> > > > +
> > > > +		addr +=3D PAGE_SIZE;
> > > > +	}
> > >
> > > I touch on this above, this should be reworked to roughly:
> > >
> > > - alloc pages and populate migrate_vma.dst
> > > - dma map sram pages
> > > - migrate a chunk of contigous vram addresses at a time
> > > - wait on last dma fence from migrate
> > > - unmap dma pages
> > > - unlock and free all pages
> > >
> > > > +
> > > > +	xe_svm_for_each_vm(svm, vm) {
> > > > +		xe_assert(xe, vm->mm =3D=3D mm);
> > > > +		xe_vma =3D xe_vm_lookup_vma(vm, vmf->address);
> > > > +		if (xe_vma)
> > > > +			xe_vm_invalidate_vma(xe_vma);
> > > > +	}
> > >
> > > I've touched on why this isn't needed... I think one of these
> > > migrate_vma_* functions will trigger all MMU notifiers registered for
> > > the range. The notifier owns the invalidate then.
> >
> > Very good point. Yes after read migrate_vma_setup function, I agree thi=
s
> function will call mmu notifiers with MMU_NOTIFY_MIGRATE event. Today we
> invalidate vma with this event. So yes, above codes are not needed.
> >
> > I do identified one potential improvement: when mmu notifier is called =
back
> with MMU_NOTIFY_MIGRATE event, if the migrate_vma_setup is called from
> the gpu page fault path, we can ignore the gpu vma invalidation as we wil=
l
> update gpu page table later after migration anyway. I think an page table
> invalidation is not needed in such case. But this should be just a minor
> improvement.
> >
>=20
> We skip invalidations if the initial_bind flag is clear which should
> cover at the initial GPU fault. There is certainly room for improvement
> / optimizations in the MMU notifier though, it is kinda messy right now
> too. IMO work like this can be done once the basic design is working +
> tests in place to verify changes / optimizations.
>=20

agreed

> >
> > >
> > > Beyond this, maybe I'm confused about a few things and how this fits =
all
> > > together. Doesn't every user process have its own unique mm, fd, and =
vm
> > > (e.g. own address space)? If a user want a shared address space then =
use
> > > threads with a single mm, fd, and vm.
> >
> > Yes, this is also my understanding. Each user process has its own mm st=
ruct
> and device fds.
> >
> > In a shared address space case, such as there are multiple pthread crea=
ted
> through pthread_create in one process, all those pthreads should have dif=
ferent
> kernel task_struct, but all those task_struct (say we get it from "curren=
t" macro)
> should share one same mm struct, which means they all lives inside one cp=
u
> address space.
> >
> > Now with this work, we are now basically extending this shared cpu addr=
ess
> space to gpu program. So both cpu program and gpu program can share one
> address space.
> >
> > Since we allow user to create multiple gpu vm for one device (lets focu=
s on
> one device for now), so each shared address space can have multiple gpu v=
m...
> each gpuvm should be able to register its own mmu notifier to core mm, ev=
en
> if those notifier has the same address range. But I will have to test thi=
s out. If
> all this works, above codes are not needed. If different gpuvm can't regi=
ster
> mmu notifier for same address range, then we would need a fix....
> >
>=20
> The mmu notifier code is implemented with the interval tree which
> supports overlapping rangers (i.e. we can have multiple VM's register
> notifiers with the sam address range in a single MM).

Ok, that is great. I will delete the xe_svm struct.

Oak

>=20
> >
> > >
> > > So even if we had to resolve the xe_vma's here and do an invalidate h=
ere
> > > very confused what this is doing. This is this the case with multiple
> > > devices and each VM points to a different device?
> >
> > Right now I only focus on single device. See above. This is to solve on=
e gpu
> device but multiple gpu vm case. But as said above, for now I don't think=
 this is
> needed. I need to test more on the mmu notifier behavior: whether it allo=
w us
> to insert two notifiers for the same range for one mm....
> >
>=20
> Agree that our focus should be on single device now. If that design it
> well thought out I don't think extending this to multiple devices will
> be a huge change either.
>=20
> Matt
>=20
> > Oak
> >
> > Again so that case I
> > > don't think a xe_svm structure would be needed, on GPU fault we shoul=
d
> > > be to detect from the faulting page zone_device_data and pgmap owner
> > > if the fault already has a physical backing on another GPU and resolv=
e
> > > how to map it into GPU with a fault... Jason suggests this in the
> > > following thread [2] and I think I agree with him.
> > >
> > > [2] https://lore.kernel.org/all/5495090e-dee1-4c8e-91bc-
> > > 240632fd3e35@amd.com/T/
> > >
> > > > +	migrate_vma_pages(&migrate_vma);
> > >
> > > This logic is going to change but ...
> > >
> > > On an error I think we only want to call migrate_vma_finalize to reve=
rt
> > > pages back to the original state (i.e. migrate_vma_pages commits the
> > > page changes which we don't want to do on an error).
> > >
> > > > +	migrate_vma_finalize(&migrate_vma);
> > > > +free_buf:
> > > > +	kvfree(buf);
> > > > +	return 0;
> > >
> > > I don't think 0 should blindly be return here, if there is an error
> > > return VM_FAULT_SIGBUS. We likely want a high level error message too=
.
> > >
> > > Matt
> > >
> > > > +}
> > > > --
> > > > 2.26.3
> > > >
