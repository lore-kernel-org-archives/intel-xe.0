Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32BDCCF9E3
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 01:01:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1A010E463;
	Tue, 11 Nov 2025 01:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LMhC2C0L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B283A10E463
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Nov 2025 01:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762822898; x=1794358898;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rf/Eh23j6lfaE7x7SiHzi8+6ZYO5AwaIOqfR6q/2dMA=;
 b=LMhC2C0Lw5EeQaUbqD6VTY6TuzBx9mML3wtHUbfm/FSkpCa2/Qs1uRk1
 vdC/XvQ2/2++dQvqZzNWVyGTjQq8iNZwtbUQHdFwlieugYzEsohScxhtF
 GGNMDnP4CA5UtLZRLjtjzwtoUEDkDhsPcIRu8tTRaF0SUqhpWN0e80ReY
 gs56zdHNcljaTJaKfGy/vymfb85EurJdaa0JAgvnEQ6L0mliQRWar2tYQ
 vNTNthxjUwbnw+l04gM/BIUUAKjzlmTj4LEwNPrCf1cLmDtpZeoEV6ISi
 hHfMKjknjvSVZtpDQhiuIse5jLH9GeRoJlx91z4YHLFBq49uTOABFCggj w==;
X-CSE-ConnectionGUID: k+sqqLULQcO+B2PFmrKu3Q==
X-CSE-MsgGUID: J/liBYACR8qXUXOtN8K7gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64812195"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64812195"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:01:38 -0800
X-CSE-ConnectionGUID: irC+pXyDRYyjdOHidS9bdw==
X-CSE-MsgGUID: TReysHj8SBONpNZj4TOUsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188459509"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:01:38 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:01:37 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:01:37 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:01:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbPngQSKV9zS6uVge2wMYdYd0u09g9eCxefPWI8XNRnhqF032WzXwuMB2CLe1NbAi3/fKLTfMuqPnJorqNyyBiPmIIDW6dwo7PlwXhyR67iUDMI/ZFo1uT3R1egiBz36We0xpjUdrcRut7IQlY9kp3L6fRv6ZVn8cnpEDgWTh3qfi4rMr+0DFOSmaQk/Ost14dkHTBKjo5c/BruGdGpYfaRF7nKa8Xu/GimOM0kEKHr0pVCm+RL5DjoUj+2rOyyDrfbpYpUsbTyTvlfa5dZr0bYEmVJ/c9M6sN9ba1hyoZCkC4Pwu5o3GHM4w/PXm5rYpDsBIthUVtlxnBKZMO3IFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgS5NiW6hlhqgBvxdpnfV85W2amun1miTdJ3f2kXw24=;
 b=rFvYRgdK30eKvJFBVzT/JiGfZfCX2sm/QRWVScXL8vqhEK+DS2lH5LO3Uqu6FVz6jTSxDn9z+f3iJsc/dSbub7OZf+ci1Wr7a8/XjFUX2IsFowdaoF3xqSOlaKWUmVOPUsWBJdclSBn2oomIELLYN2pm2bXWf1xvXwiTzcvL4RFCx2w3e+etwKAa/WXWDjXUX1YYb75SPYPvRwwLi6L90fAt7gLG+e/ixFqmTOmhqymXMsPj7x9JxToK0nVj+iofZXAbq4S+Q/wLgf2SFdl3VbgEfead0D38ZfgkW5qbOp/wR6+UL1n85x7ipkupIvVT8hyMwV6m10fQR0e6XNexTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4520.namprd11.prod.outlook.com (2603:10b6:208:265::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:01:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:01:35 +0000
Date: Mon, 10 Nov 2025 17:01:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 11/12] drm/xe: Add context-based invalidation to GuC
 TLB invalidation backend
Message-ID: <aRKK7ODeOdwdA+Do@lstrano-desk.jf.intel.com>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
 <20251104195616.3339137-12-matthew.brost@intel.com>
 <746dd3acad81c8af5cb408ff4b50936ecacfeb5c.camel@intel.com>
 <aQ2ZXhKjys6Rdwiw@lstrano-desk.jf.intel.com>
 <8f6d42889021852ae2219cc8f7b1c2e5c5f873e4.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f6d42889021852ae2219cc8f7b1c2e5c5f873e4.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:a03:338::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4520:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d12dc9d-1a3d-468a-3494-08de20bddc1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEpodUN2NEhONWJmSVJmRGVXKzEyZmcyWmxsRjVGY2U3ZzlhdWEza3luUzBt?=
 =?utf-8?B?VWtuZVVtMEpUVXZMdlpqMDN3M0hyeWJPMGdWbzBqbEZ1VDZNYlFlSnRNYVZN?=
 =?utf-8?B?aE5nUXZLeXFkVjl3T2N5ditQVG1pZ0dtMWlDZWsyL1lyR3VTT3pNM2h0Rmhx?=
 =?utf-8?B?dU5taHkwb1NCZDlrRjNQd1hRQXhEQnRveXI5T1R2QmR6UFhZc0srcENUeFRN?=
 =?utf-8?B?NC9oQlAzSWlDQVNzRGRYM1ZtU2k0MEd3RFoyN053eTRWODJ6cnByWENVV1Rk?=
 =?utf-8?B?bEJNUE5WK3NOT1pVd2NOYVQ3S1RTSk9PUnc3SDR3YUNXS3FJeHE5VVpIYWZh?=
 =?utf-8?B?SUpMTjZ5UDdsbEx5NXVqUnM3dWdmTmp1d3lwK1c3Q0w0UDVQcVBVQVAycmVq?=
 =?utf-8?B?dVJvN1N2RHI1T3VuNTZkOFNVZUpEWGswMEUvV3JURHg5Y2Vnb0Jod2FMTGJQ?=
 =?utf-8?B?L1pKWUdGa0NLeWtwT3p6RWtoTDRqK0RteHBvYU54SUplQ1IxYlZnSnl2Smlm?=
 =?utf-8?B?TnNSbzJaVmZhTlNqckx2KzYxT0pmZkZEUG1EcXE1QWxPa2REOVBLL01JdFEw?=
 =?utf-8?B?cXNUWGQ1b2F4U25PMWFaSWF6QzFud0JNclBjL2EwTUNRd0h6cElZYTlIVk8x?=
 =?utf-8?B?M0g1VTU2M2FCNXR4cWZiM2UxdzgzVW5HcHNXb0pxTnVybWszTndLZERsV0NP?=
 =?utf-8?B?UElQN1VnSGFJekhnNXZzcUxTQ2xUclI5aFEzOUp1ZmlDeHlMRGs5T1JlRG02?=
 =?utf-8?B?VFF2RXAwMWhwZ2pkYTZEcVNIeG5JWkdJRnZudXUvbXcrUldkRmtLY2llZzZh?=
 =?utf-8?B?VWlMMHpmbmVvNEhKVFpaWEhwRWVsbGVPR1UvbFNvdTcydWg3aGw4SjVWMTdY?=
 =?utf-8?B?N2pOQTNxVVlUTnZ2bUJQTGlkcTErODVhNFZaZWpYYmtTNjladSt0Z2VramdX?=
 =?utf-8?B?RnhoeXo1UldWMVRVNU1VK21hUEdrcnlaNk5KSU5ySkZlVFpjUVIxTXpORC9p?=
 =?utf-8?B?RVBmT0UwRllmT2NBQUFGdXdTdExQRSsrM2dUWjhzNHdVUVRRcUtkM21pOThv?=
 =?utf-8?B?cWZIK3ZyblBLVGpOR1Y5RVV4UHV1dG1TaVJzc3pVaXZ5cHF6U3lINlZUVCtr?=
 =?utf-8?B?VXJ5Nyt4SG9rR0M2K0hueW4xRmQyZzJkQzFLckgzUFVVbFFDTnhmaEF5cFJr?=
 =?utf-8?B?VGRLRXlOeXhKcFNqNzA0N0xPM3ZwSTg2cDBaWEdJTmdLei9lZk9VZDMxTGJy?=
 =?utf-8?B?Tm5pcHRQWHhEbUZYMFBtNk9aTzVEMkNIbzEranp1U01HRGdGNDZoTEpPRFl0?=
 =?utf-8?B?ZGd0cHBjcGxPY3J6S3JHUnc4THYvUlFmdGlzSDIwS015d05nUmZzSUxwd3Fz?=
 =?utf-8?B?TlY0bmtjT3FZMElENmZWZTVKU2s3N0UyREZYeUlseGg0TVRFUzY0MUp3emh2?=
 =?utf-8?B?N0FaN1E4TXJmellHbmVtcEFaRTM0dTRiZkcyV014b0NKSnZJWWFCYkowYkxr?=
 =?utf-8?B?VXQ4OTN2aUFZV3llU0JJMEtrNWhJWFp3MkVaR0wxSkovOFhGS1VlR1FtOUFx?=
 =?utf-8?B?bFdqa0JBNktBV0VlN2k4L0hTUkVRVzIwSXN3NFNPdHN2K0s2SjNyVXhUVXl4?=
 =?utf-8?B?OFMrSWhISmxYSXhLTGFtenBnM3Q0SVR3ZGJKL2h0NmJJMEhJNkd2ZkJOcVZX?=
 =?utf-8?B?R0FyY2RNY2xkM29NZG9CN3VtUWE3UXZSUW5lRjlTWEh1ajdnN1RnRWEvS3pX?=
 =?utf-8?B?QVlGZkZqRlo1OXJackhqMkpSMVp4cVZaY1F2cFpBLzV5OE5mU3ZkUHhHRXFB?=
 =?utf-8?B?dmNMTWFPb2VYK3BRWUk0VmJBV2lkdzMwbDVaSG54SHBrcWh5N1QzVzFUTlZo?=
 =?utf-8?B?QWZ0ZmhNSGxIZjRsNmhDV0JHVVpvK2h0cWM3aTBYUU5Va2N2S28vRGYzSWJK?=
 =?utf-8?Q?uHkxTWzJZBKHvDQ7qDodOfHw28Z5UpwG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q21kOFJlMHFFN3Y5OWY2dFN4SncxRG1oK1NveExSL3NldnVCT0lMSUFVN3Q1?=
 =?utf-8?B?WEdmVFBmTFU2OThDTjVDcm12ZnBiWHNFM3RYbWlwWUVpMU1sMVZ0bWg2OXRt?=
 =?utf-8?B?aGF1aW5zbmFCL1BZVVltR21RMTFzaW9qVDc2UkJxU1pabUhVNE4xWGc0VTcr?=
 =?utf-8?B?ZUVRRWRqdTZ1RENqbjdwOCtCY2VXZXhWM09TM1VIaWRTQ0lRUlZydEhWRC9u?=
 =?utf-8?B?aVBHL3RkNUVWZUduS1QwY3dtTEI5RnVvL0NLRXI0Z08wS2pFbWJHcENNZjNM?=
 =?utf-8?B?N2dDa1lvdDN1NU5xRUQ1cVljUDcxZnBWQmIyT21JWlQyYVFLNTdONWZoczR3?=
 =?utf-8?B?NGV1UE1TS0h6REwzK0lneU55Y1MwMXdNU0Zqb3NMcU4zSjRPallNMURGWkVU?=
 =?utf-8?B?V2ZNUmdyc0pGNFRkV0VnLzVyZlBIZkUxRlFBb25NUXltd21JSFoyYVBDY2lj?=
 =?utf-8?B?dnJlTGhkL0sxOTBXcE1TVWZpenl3VXVoM2EwVklqbFNjdFQrRyszU2Y2VmRx?=
 =?utf-8?B?TjhhTW1ZOHV0cCtXcTA2TkVoOEVxbGZyQUJhRTBLa2lMRjlYZUgyZWFkTGVr?=
 =?utf-8?B?N2NoZHVjQnlFbktyY3g2blhyTTZ4cW5qb29VQ25ZQ21IR041Y0h3MEN2Z25D?=
 =?utf-8?B?OVRpbGViWDZzdzBqVGpYRHdYd29TK1ZoVkdxc0tOeDZLMlhDL0lzUnRoVGtQ?=
 =?utf-8?B?RjdwOTZDYnA1UUhvVG1YL2QzcTFlVFZhYnhWQzVhT3RDL2kzUG1YY0RsdDU2?=
 =?utf-8?B?Vmk1NWFTSjUrbVFCZTJSNjUvL0VBUDkvYU5ESEhnUjI2eXBtUVprVndjWSth?=
 =?utf-8?B?RStMTFhmNzdjRDExS2JCR2J2cjRLNS9CalRHNUo2c2JwQXd4UjZEU0VjK1pT?=
 =?utf-8?B?VHZTZEJpL0locHJkemREOVBXb2FIdFk3Tys3blBFdTZQcE9iUFo4WEhIdXJu?=
 =?utf-8?B?eEpCZSt0dTgzRzRSMEkrK1JaeUtrNjFzQlh1UTRqNDVHaWdvMnpmeTMvYzAr?=
 =?utf-8?B?QnE3MWdjbmFOWVlqd3pITWtOcTdsZFdBOUV5K2ZDTS9xS29uSTVKNlBCWUd4?=
 =?utf-8?B?UWRublJNRFJwbEQ1RXJsc0dybjNseTVsRFgvYjg3RUNjUkxYcjVWTjhzWUNm?=
 =?utf-8?B?bndhY1pLSmxIUmtIK0todVY0bDdTcG1VM1VZTGFGTktUM0Fva25nc1p6Tkdv?=
 =?utf-8?B?UXVWYTh0WFFkTy9EQkxXaThGY1dFOVErL0N5K0VhUWsrb3gyUlZYM3VWeXVp?=
 =?utf-8?B?UFRWaFQvV3NiUGFUNkIxY3cydVhTMW9TbDk4cCtrcDdzMmZhbWVUbnZlMW9R?=
 =?utf-8?B?bDdmTDVKTjVLVVZJbWZ3Y0Vmajk5b2pNZ0xKTTRVZ3M1d0tYVitaUitvK1NT?=
 =?utf-8?B?blBxUzQ2NUx2ai9vSEZUcE5hWW9kd2Y2SHQ0RXkyQnRtQWs2Qlg0eDFpQTRG?=
 =?utf-8?B?ZWE1a0t6Z0RaOUdMMGN5R3pnNlJ2dzYxa0NJeXRVaU5ZTWo5T0JJVG5CYndB?=
 =?utf-8?B?OUZrYmIrdmIybFhkaGlmaWMwNzZ1OWRaSXUwUGljeUV4azEweThSV1NSdkMr?=
 =?utf-8?B?SHN0aWEvWllkbGd6d0Q3UkF2cFFXQ094SGF4ZDRiY3RrUE5rRzZDanNtR1N2?=
 =?utf-8?B?RmFXOE1CcnliVnhFNWhPSmFqdDI5YkFtaHVXUWNvVlVuYVYxNk13bmdSbW41?=
 =?utf-8?B?MWgrWHU0RnhidmIvTFNLQ1FqdTlSRFUva2UyTFFvMjV2VWozRmJlNTN4QlRW?=
 =?utf-8?B?VmNiL3pNSlJqdXc0UWxzMmJ6Z05TZlhFd1lqSUZGQ3c0VFpZWG5VRDZBa28r?=
 =?utf-8?B?T05zZnpFSkNoVUxpeGJKbzFRaGlHWFZvZUxPQThqZ1ZrY2w0Ym5Mb05lM3Vr?=
 =?utf-8?B?ckI0TnZpZmpQT1kvdC9nSmlyS0lZZFlScTZQTjQ2RGM5Z3VJN0hNU2RNWEZ2?=
 =?utf-8?B?VERGbk16UU9Sdm52dmJBRDFqcGVpYzlhOFN6Q3MvSEMrbGJuaUFCa0g5OHh4?=
 =?utf-8?B?VS9lWk1nR2p0SUJyOG5rMHFVYXRvL1EwUk1jOUtKWDBONWZPb2FyTENRMGdE?=
 =?utf-8?B?MzdIN0lCUWRTeGlnMmgwWHZOb1czaThzVTJMRUpMV0h4cWkwUkxBSFI0WDhI?=
 =?utf-8?B?SmJUZUR5ai90MFUyWkc4UHlHdk5jazZCNmtSOUNXY3ZTUXFMazNJSFRQVmJS?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d12dc9d-1a3d-468a-3494-08de20bddc1d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:01:34.9552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DCHLk5st5EzwPnTbdbJ7eiCqAGTqYuEYpKGZNa3GtkwLWzk0aZACKjZkUtRVzz2m7yk2vvqbz4QanAxuMTeNRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4520
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

On Mon, Nov 10, 2025 at 12:29:57PM -0700, Summers, Stuart wrote:
> On Thu, 2025-11-06 at 23:01 -0800, Matthew Brost wrote:
> > On Thu, Nov 06, 2025 at 02:50:45PM -0700, Summers, Stuart wrote:
> > > On Tue, 2025-11-04 at 11:56 -0800, Matthew Brost wrote:
> > > > Introduce context-based invalidation support to the GuC TLB
> > > > invalidation
> > > > backend. This is implemented by iterating over each exec queue
> > > > per GT
> > > > within a VM, skipping inactive queues, and issuing a context-
> > > > based
> > > > (GuC
> > > > ID) H2G TLB invalidation. All H2G messages, except the final one,
> > > > are
> > > > sent with an invalid seqno, which the G2H handler drops to ensure
> > > > the
> > > > TLB invalidation fence is only signaled once all H2G messages are
> > > > completed.
> > > > 
> > > > A watermark mechanism is also added to switch between context-
> > > > based
> > > > TLB
> > > > invalidations and full device-wide invalidations, as the return
> > > > on
> > > > investment for context-based invalidation diminishes when many
> > > > exec
> > > > queues are mapped.
> > > > 
> > > > v2:
> > > >  - Fix checkpatch warnings
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_device_types.h  |   2 +
> > > >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 122
> > > > +++++++++++++++++++++++++-
> > > >  drivers/gpu/drm/xe/xe_pci.c           |   1 +
> > > >  drivers/gpu/drm/xe/xe_pci_types.h     |   1 +
> > > >  4 files changed, 124 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index 145951dd95c9..ca285f4bce11 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -316,6 +316,8 @@ struct xe_device {
> > > >                 u8 has_mem_copy_instr:1;
> > > >                 /** @info.has_pxp: Device has PXP support */
> > > >                 u8 has_pxp:1;
> > > > +               /** @info.has_ctx_tlb_inval: Has context based
> > > > TLB
> > > > invalidations */
> > > > +               u8 has_ctx_tlb_inval:1;
> > > >                 /** @info.has_range_tlb_inval: Has range based
> > > > TLB
> > > > invalidations */
> > > >                 u8 has_range_tlb_inval:1;
> > > >                 /** @info.has_sriov: Supports SR-IOV */
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > index 6978ee8edf2e..1baaf577cded 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > @@ -6,14 +6,17 @@
> > > >  #include "abi/guc_actions_abi.h"
> > > >  
> > > >  #include "xe_device.h"
> > > > +#include "xe_exec_queue_types.h"
> > > >  #include "xe_gt_stats.h"
> > > >  #include "xe_gt_types.h"
> > > >  #include "xe_guc.h"
> > > >  #include "xe_guc_ct.h"
> > > > +#include "xe_guc_exec_queue_types.h"
> > > >  #include "xe_guc_tlb_inval.h"
> > > >  #include "xe_force_wake.h"
> > > >  #include "xe_mmio.h"
> > > >  #include "xe_tlb_inval.h"
> > > > +#include "xe_vm.h"
> > > >  
> > > >  #include "regs/xe_guc_regs.h"
> > > >  
> > > > @@ -136,10 +139,16 @@ static int send_tlb_inval_ppgtt(struct
> > > > xe_guc
> > > > *guc, u32 seqno, u64 start,
> > > >  {
> > > >  #define MAX_TLB_INVALIDATION_LEN       7
> > > >         struct xe_gt *gt = guc_to_gt(guc);
> > > > +       struct xe_device *xe = guc_to_xe(guc);
> > > >         u32 action[MAX_TLB_INVALIDATION_LEN];
> > > >         u64 length = end - start;
> > > >         int len = 0;
> > > >  
> > > > +       xe_gt_assert(gt, (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE
> > > > &&
> > > > +                         !xe->info.has_ctx_tlb_inval) ||
> > > > +                    (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX
> > > > &&
> > > > +                     xe->info.has_ctx_tlb_inval));
> > > > +
> > > >         action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
> > > >         action[len++] = seqno;
> > > >         if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
> > > > @@ -176,6 +185,100 @@ static int send_tlb_inval_asid_ppgtt(struct
> > > > xe_tlb_inval *tlb_inval, u32 seqno,
> > > >                                    
> > > > XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> > > >  }
> > > >  
> > > > +static bool queue_mapped_in_guc(struct xe_guc *guc, struct
> > > > xe_exec_queue *q)
> > > > +{
> > > > +       return q->gt == guc_to_gt(guc);
> > > > +}
> > > > +
> > > > +static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval
> > > > *tlb_inval,
> > > > u32 seqno,
> > > > +                                   u64 start, u64 end, u32 asid)
> > > > +{
> > > > +       struct xe_guc *guc = tlb_inval->private;
> > > > +       struct xe_device *xe = guc_to_xe(guc);
> > > > +       struct xe_exec_queue *q, *last_q = NULL;
> > > > +       struct xe_vm *vm;
> > > > +       int err = 0;
> > > > +
> > > > +       lockdep_assert_held(&tlb_inval->seqno_lock);
> > > > +
> > > > +       if (xe->info.force_execlist)
> > > > +               return -ECANCELED;
> > > > +
> > > > +       vm = xe_device_asid_to_vm(xe, asid);
> > > > +       if (IS_ERR(vm))
> > > > +               return PTR_ERR(vm);
> > > > +
> > > > +       down_read(&vm->exec_queues.lock);
> > > > +
> > > > +       /*
> > > > +        * XXX: Randomly picking a threshold for now. This will
> > > > need
> > > > to be
> > > > +        * tuned based on expected UMD queue counts and
> > > > performance
> > > > profiling.
> > > > +        */
> > > > +#define EXEC_QUEUE_COUNT_FULL_THRESHOLD        8
> > > 
> > > Does seem interesting for this to be configurable. Maybe different
> > > applications have different requirements here... But also we should
> > > have some kind of default. No issue with what you 
> > > 
> > 
> > Yes, I figure we can make this tunable somehow.
> > 
> > > > +       if (vm->exec_queues.count[guc_to_gt(guc)->info.id] >=
> > > > +           EXEC_QUEUE_COUNT_FULL_THRESHOLD) {
> > > > +               u32 action[] = {
> > > > +                       XE_GUC_ACTION_TLB_INVALIDATION,
> > > > +                       seqno,
> > > > +                       MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> > > > +               };
> > > > +
> > > > +               err = send_tlb_inval(guc, action,
> > > > ARRAY_SIZE(action));
> > > > +               goto err_unlock;
> > > > +       }
> > > > +#undef EXEC_QUEUE_COUNT_FULL_THRESHOLD
> > > > +
> > > > +       list_for_each_entry_reverse(q, &vm->exec_queues.list,
> > > > +                                   vm_exec_queue_link)
> > > 
> > > Braces here around the if() {}. Otherwise it's too easy to
> > > accidentally
> > > add lines below the if condition with unintended behavior.
> > > 
> > > > +               if (queue_mapped_in_guc(guc, q) && q->ops-
> > > > >active(q))
> > > > {
> > > > +                       last_q = q;
> > > > +                       break;
> > > > +               }
> > > > +
> > > > +       if (!last_q) {
> > > > +               /*
> > > > +                * We can't break fence ordering for TLB
> > > > invalidation
> > > > jobs, if
> > > > +                * TLB invalidations are inflight issue a dummy
> > > > invalidation to
> > > > +                * maintain ordering. Nor can we move safely the
> > > > seqno_recv when
> > > > +                * returning -ECANCELED if TLB invalidations are
> > > > in
> > > > flight. Use
> > > > +                * GGTT invalidation as dummy invalidation given
> > > > ASID
> > > > +                * invalidations are unsupported here.
> > > > +                */
> > > > +               if (xe_tlb_inval_idle(tlb_inval))
> > > > +                       err = -ECANCELED;
> > > > +               else
> > > > +                       err = send_tlb_inval_ggtt(tlb_inval,
> > > > seqno);
> > > > +               goto err_unlock;
> > > > +       }
> > > > +
> > > > +       list_for_each_entry(q, &vm->exec_queues.list,
> > > > vm_exec_queue_link) {
> > > > +               int __seqno = last_q == q ? seqno :
> > > > +                       TLB_INVALIDATION_SEQNO_INVALID;
> > > > +               u32 type = XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX;
> > > > +
> > > > +               /*
> > > > +                * XXX: Techincally we can race here and queue
> > > > can
> > > > become
> > > > +                * inactive, not ideal. The TLB invalidation will
> > > > timeout in
> > > > +                * this case unless we get GuC support to convert
> > > > to
> > > > NOP...
> > > 
> > > We actually can't support this. It won't just time out, GuC will
> > > return
> > 
> > Yes, I agree. I think we'd receive a failure response to
> > GUC_HXG_TYPE_FAST_REQUEST, but if I recall correctly, in my testing I
> > only saw timeouts on TLB invalidations sent to unregistered GuC IDs.
> > Let
> > me follow on failure case (I hit this in case when then the multi-GT
> > code wasn't quite right yet).
> 
> I can look up the exact cases, but I had done a lot of testing around
> this internally and any sufficiently large exec queue
> registration/deregistration count is going to likely hit this. It has a
> pretty large impact on CI.
> 
> > 
> > > an error (invalid parameter that the context isn't registered and
> > > we're
> > > trying to submit something via context invalidation - nothing
> > > actually
> > > gets sent to hardware) and we will issue a GT reset. We should make
> > 
> > A failure response to GUC_HXG_TYPE_FAST_REQUEST is indeed a GT reset.
> > 
> > > sure when we send this, the context is registered and any
> > > deregistration explicitly happens afterwards.
> > > 
> > > This is why generally we want to do this add/remove not at the
> > > queue
> > > level but at the guc registration/deregistration level to guarantee
> > > this. But I see you split the queue add and the submission based on
> > > this active flag. Right now I believe we're tracking "pending
> > > deregistration" with exec_queue_destroyed && exec_queue_registered,
> > > although it might be nice to have an explicit state there.
> > 
> > Locking is required to make this race-free, which just doesn't work.
> > 
> > - TLB invalidations must be issued if the context is enabled or even
> > if a
> >   disable is pending—otherwise, we risk memory corruption, which
> > could be
> >   catastrophic.
> 
> Agreed.
> 
> > - The context disable "done" G2H is received under the CT lock; the
> >   subsequent deregister is also issued under the CT lock.
> > - The lock that iterates over a VM's exec queues (contexts) is the
> > outer
> >   lock of the CT lock.
> > 
> > As far as I can tell, we can't resolve this race without inverting
> > the
> > locking order—at least not in any way I'd consider a reasonable
> > locking
> > scheme for the KMD.
> 
> Can't we just tie this to register_exec_queue() (for the add),
> disable_scheduling_deregister(), __deregister_exec_queue(), and
> guc_exec_queue_stop() (for the remove) and avoid the in-flight issue
> around locking? So basically we ensure that the list is only populated
> after the "register" CT is sent and before the "deregister" CT is sent,
> therefore ensuring that any TLB inval sent to those queues are
> sequenced properly around the register and deregister CT messages.
> 
> So basically (see the removal after we mark the queue as "destroyed"):
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index ec0d1d1b0249..7a6ef3811808 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -708,6 +708,8 @@ static void register_exec_queue(struct
> xe_exec_queue *q, int ctx_type)
>         else
>                 __register_exec_queue(guc, &info);
>         init_policies(guc, q);
> +
> +       add_to_vm_exec_queue_list();
>  }
>  
>  static u32 wq_space_until_wrap(struct xe_exec_queue *q)
> @@ -950,6 +952,7 @@ static void disable_scheduling_deregister(struct
> xe_guc *guc,
>         clear_exec_queue_enabled(q);
>         set_exec_queue_pending_disable(q);
>         set_exec_queue_destroyed(q);
> +       remove_from_vm_exec_queue_list();

We can't avoid skipping the TLB invalidation here because the context is
possibly running. So we skipping a TLB invalidation, the context touchs
a page that should have been invalidated, and boom memory corruption.

>         trace_xe_exec_queue_scheduling_disable(q);
>  
>         /*
> @@ -1219,6 +1222,7 @@ static void __deregister_exec_queue(struct xe_guc
> *guc, struct xe_exec_queue *q)
>         xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
>  
>         set_exec_queue_destroyed(q);
> +       remove_from_vm_exec_queue_list();

This is actually fine.

But the 2nd half of disable_scheduling_deregister (the safe point to
skip TLB invalidation), is done in deregister_exec_queue which is the in
G2H handler under the CT lock, which is where we'd invert locking.
Again, changing the locking model, is basically a non-starter for me.

>         trace_xe_exec_queue_deregister(q);
>  
>         xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> @@ -1971,6 +1975,7 @@ static void guc_exec_queue_stop(struct xe_guc
> *guc, struct xe_exec_queue *q)
>                    EXEC_QUEUE_STATE_KILLED | EXEC_QUEUE_STATE_DESTROYED
> |
>                    EXEC_QUEUE_STATE_SUSPENDED,
>                    &q->guc->state);
> +       remove_from_vm_exec_queue_list();
>         q->guc->resume_time = 0;
>         trace_xe_exec_queue_stop(q);
> 
> > 
> > > 
> > > Alternatively we could also capture that error response from GuC,
> > > although there are a few different places we can get an error there
> > > and
> > > we might not want to overload the CT error handler in the event
> > > there
> > > is a legitimate state or hardware error that requires a guc
> > > reload/GT
> > > reset.
> > > 
> > 
> > I believe the solution lies in GuC support. We could introduce a flag
> > in
> > the H2G TLB invalidation that signals: "I understand the risks—this
> > may
> > race. If it does, discard the TLB invalidation and still return a
> > valid
> > G2H TLB done response."
> 
> Of course, it would be nice if we had a dedicated error G2H that would
> call this out explicitly. Right now we just get a general "invalid
> parameter". Even having a way to easily identify the sequence number in
> question (which I know is slightly different after your changes in this
> series).
> 
> > 
> > We’d likely disable this in CI builds unless it causes noise. In
> > production, if we hit this race (which should be rare, given CI
> 
> Not rare, see my comment above. I think this needs to be fixed - we
> can't merge this with GT resets happening after the exec queue
> submission and destroy count gets high enough.
> 

Ok, then I think we really need to take this up with arch - either we do
something like I suggest above or change the GuC interface to remain
ASID based (no KMD changes) and the GuC does a ASID -> context hash
table lookup and figures out which contexts that actually need an
invalidation (it has this information, racwe free, also it likely can be
smart and skip ones which don't need an invalidations which should
reduce the overall cost of TLB invalidations too).

Matt

> Thanks,
> Stuart
> 
> > passes
> > with the race exposed), the worst-case outcome is an extra TLB
> > invalidation—which is acceptable.
> > 
> > Matt
> > 
> > > Thanks,
> > > Stuart
> > > 
> > > > +                */
> > > > +               if (!queue_mapped_in_guc(guc, q) || !q->ops-
> > > > > active(q))
> > > > +                       continue;
> > > > +
> > > > +               xe_assert(xe, q->vm == vm);
> > > > +
> > > > +               err = send_tlb_inval_ppgtt(guc, __seqno, start,
> > > > end,
> > > > +                                          q->guc->id, type);
> > > > +               if (err)
> > > > +                       goto err_unlock;
> > > > +       }
> > > > +
> > > > +err_unlock:
> > > > +       up_read(&vm->exec_queues.lock);
> > > > +       xe_vm_put(vm);
> > > > +
> > > > +       return err;
> > > > +}
> > > > +
> > > >  static bool tlb_inval_initialized(struct xe_tlb_inval
> > > > *tlb_inval)
> > > >  {
> > > >         struct xe_guc *guc = tlb_inval->private;
> > > > @@ -203,7 +306,7 @@ static long tlb_inval_timeout_delay(struct
> > > > xe_tlb_inval *tlb_inval)
> > > >         return hw_tlb_timeout + 2 * delay;
> > > >  }
> > > >  
> > > > -static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
> > > > +static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
> > > >         .all = send_tlb_inval_all,
> > > >         .ggtt = send_tlb_inval_ggtt,
> > > >         .ppgtt = send_tlb_inval_asid_ppgtt,
> > > > @@ -212,6 +315,15 @@ static const struct xe_tlb_inval_ops
> > > > guc_tlb_inval_ops = {
> > > >         .timeout_delay = tlb_inval_timeout_delay,
> > > >  };
> > > >  
> > > > +static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops = {
> > > > +       .ggtt = send_tlb_inval_ggtt,
> > > > +       .all = send_tlb_inval_all,
> > > > +       .ppgtt = send_tlb_inval_ctx_ppgtt,
> > > > +       .initialized = tlb_inval_initialized,
> > > > +       .flush = tlb_inval_flush,
> > > > +       .timeout_delay = tlb_inval_timeout_delay,
> > > > +};
> > > > +
> > > >  /**
> > > >   * xe_guc_tlb_inval_init_early() - Init GuC TLB invalidation
> > > > early
> > > >   * @guc: GuC object
> > > > @@ -223,8 +335,14 @@ static const struct xe_tlb_inval_ops
> > > > guc_tlb_inval_ops = {
> > > >  void xe_guc_tlb_inval_init_early(struct xe_guc *guc,
> > > >                                  struct xe_tlb_inval *tlb_inval)
> > > >  {
> > > > +       struct xe_device *xe = guc_to_xe(guc);
> > > > +
> > > >         tlb_inval->private = guc;
> > > > -       tlb_inval->ops = &guc_tlb_inval_ops;
> > > > +
> > > > +       if (xe->info.has_ctx_tlb_inval)
> > > > +               tlb_inval->ops = &guc_tlb_inval_ctx_ops;
> > > > +       else
> > > > +               tlb_inval->ops = &guc_tlb_inval_asid_ops;
> > > >  }
> > > >  
> > > >  /**
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > > > b/drivers/gpu/drm/xe/xe_pci.c
> > > > index 1959de3f7a27..9a11066c7d4a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > @@ -863,6 +863,7 @@ static int xe_info_init(struct xe_device *xe,
> > > >                 xe->info.has_device_atomics_on_smem = 1;
> > > >  
> > > >         xe->info.has_range_tlb_inval = graphics_desc-
> > > > > has_range_tlb_inval;
> > > > +       xe->info.has_ctx_tlb_inval = graphics_desc-
> > > > > has_ctx_tlb_inval;
> > > >         xe->info.has_usm = graphics_desc->has_usm;
> > > >         xe->info.has_64bit_timestamp = graphics_desc-
> > > > > has_64bit_timestamp;
> > > >  
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h
> > > > b/drivers/gpu/drm/xe/xe_pci_types.h
> > > > index 9892c063a9c5..c08857c06c7e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > > > @@ -63,6 +63,7 @@ struct xe_graphics_desc {
> > > >         u8 has_atomic_enable_pte_bit:1;
> > > >         u8 has_indirect_ring_state:1;
> > > >         u8 has_range_tlb_inval:1;
> > > > +       u8 has_ctx_tlb_inval:1;
> > > >         u8 has_usm:1;
> > > >         u8 has_64bit_timestamp:1;
> > > >  };
> > > 
> 
