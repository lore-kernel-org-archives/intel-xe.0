Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662C5C2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 11:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271DB10E10C;
	Mon,  1 Jul 2024 11:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dw9hwnnZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD4710E39B
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 11:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719833059; x=1751369059;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lecnm1byxAfGx8JLtApKe1cxvMqXw8MwAoUlSSjD2CA=;
 b=Dw9hwnnZySUi/d+gKABVtTGiU8rYMkUkjiK5TBhtauuf4GrXSSuwUMhH
 FGyV5Ry/ePEOAmMLvi6KtIE53b9DatWV4wbrIj3U7MwHuLZRME9ISwy8z
 G180G9QVCoexCQmpEmEWuYSfTsH4mdHXKh9Rfd2Cg1DL9Wd8sFIjdUbgR
 gKhPP/vXk/Awp4XETn+mwFc7CLSt7vLx1GWFGNbEc5n/IAxLJph8sFwcJ
 5ts+TioVBeNC801kSsxjIWKV586hL3bTE1Nj35Ox60d9xTStN0dGyusAX
 J2UqVVui+Yuqur8NEgsL2QmLcdbVL8wbH/gs9K0KxARejqovpwgm0M+cA A==;
X-CSE-ConnectionGUID: W9vRrZrqT3e7oNJ5QhgA5Q==
X-CSE-MsgGUID: YUE94FC4Rei8ZeYDoiECTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="27548109"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="27548109"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 04:24:19 -0700
X-CSE-ConnectionGUID: 66mBZfj2RdWNyvdr1en96g==
X-CSE-MsgGUID: CvS2tmufTN+ZR1b/Z+YdOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="45394210"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 04:24:18 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 04:24:18 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 04:24:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 04:24:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 04:24:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ki2Ue/oveV1ZjKLNv/8UEEMOCowyx5OQypYYHISXwdllDrvLQeX0Iv8B5z2t4qh/s9BYWTlApVFD/lh0aP2AWBEJqCnOUKY3ouGYjJw+MLIeC/BZAjfR4fZ2eJLEfhxLQC6b9r6lY9eFBOtp09Wei235nSQt/nS+8vw14iKgukgLG/q0kjY9F9MrzwTssobAxGoNWTo0OjHIsYdGJAApkEZqxgSlVhxAnmRJX1QE/CR/GG9ohuMlDBJnR2P4nwKLDTc8R48GnHC9BizVxhlwW6kDmKgujxUGuEwDU/YwT6wumakzD/FYtWA6MXeHsPNTZ+QHmAx+1oodBGb+tN6tbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uD+XKjVcn6V9cDxZvN5llyOcgcvcukDjdtn73jDjwNA=;
 b=YTrohOLaqWLvRvgOxmNsUi4WqPzuLinOnTZbcce9iSft7Z8LkwJcfKvAr5icOlGAu6ec9eAWNbPLDxIlopIWQZcQJUsv2W+Drf8DKE/1CUr3VpxwWUFCbyJd8G3DAn2IRUi/CkbwRdxLYigcyOnI6kuaG8ccyQxZDtx3ryixdVKG9usfafofPRSCi1BN4QnvkI8zlqqlIwJSswGPPXTN352tOVBLW5JLv/G4YLVBJNCENaGEuQJ9aJgTUe3HCdYclNaBqrwhPrdqK6yY8kmoZIhyvjhT+DWhCQh8jyrHEILxxwbhgiY5HUWufTQ7NmhmShOnv5HMXoVrqA5PCZYiKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7457.namprd11.prod.outlook.com (2603:10b6:8:140::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 11:24:10 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 11:24:10 +0000
Date: Mon, 1 Jul 2024 13:24:06 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/pf: Skip fair VFs provisioning if already
 provisioned
Message-ID: <20240701112406.3z6b3lkvqhqbukoe@intel.com>
References: <20240701102738.934-1-michal.wajdeczko@intel.com>
 <20240701102738.934-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240701102738.934-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR0102CA0052.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::29) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e14434c-2cea-42df-5a47-08dc99c053f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjdhbjRGaThxUlV2VVNBWVV6MCsvWG9nK0p0SUlYY3o5VDIyNlBRVDdnYlVI?=
 =?utf-8?B?Y3FvaVQxcG1ZSFhVU1hDVWROMTdsbFplaExUTEpIRW5QTkpXc2habGlFTm45?=
 =?utf-8?B?S0VNYlF4T2t6SnVZU3ZDVmMwRllPNk9JdGVDdWVnb0FjRk11N20wYnhLQ2tK?=
 =?utf-8?B?dVZUaXQvREpORnZ3dzkxWUxJL2JOQmhLMG0raGQ4MnZiZ0RMVnJtdW41cXNZ?=
 =?utf-8?B?bE5kZ29lc3paaDZjVmFLeHEwYlFiUUYvT0RmUnl2SXgwQnIwNFRab2RnOVZV?=
 =?utf-8?B?c1pTMW9LZ0Rla3Q1cG9RcENqUzZ4eVdSeWNSK25ySnRHNUN3VXpEbjlOSURP?=
 =?utf-8?B?SVczRFV5MDQ4aDFvajVJZFFqWWtnc0xnRkl2Ull1UHZCMTN1VkxKVVVRTDlj?=
 =?utf-8?B?SWVmL2cvOHEvWHA4TWxYYk9QQmdLY3E0UFdaYlBWaEZsWnlNL1VSOURPRVV0?=
 =?utf-8?B?c2JDRnFFTE56cUNKOFR0K2pMVDZtU3JnQkZRS0YrS1JwazNBUUxseStnOVNs?=
 =?utf-8?B?cHRvZmtJTER1RXk1a0hGL2dFWXZjbHZldkZpRjNBcTAvMzZHeFdqaUhaTHFk?=
 =?utf-8?B?WG03WGdxTWxia0craEVrOUhwbGFEeUxocXRaSjBWMHNpdXlCZ1h3c3dqa3RP?=
 =?utf-8?B?YTZweFV0eFJ0bGJpQ2NwY3NXR1BOZWg3dmVKOWMvaDBJT2tCem9SdWJVa3dN?=
 =?utf-8?B?dDJHdWUwUFg3V2xHdFhkRnRxUkhXdHRuTitaa0pQd1l6Ni9FdnIxYTNORDls?=
 =?utf-8?B?ODlHOGJqY3ExSWlKMHhvdlJ5RWNOYXJFQVFwNUtHck9IV0dEdVVFYzZaeHJv?=
 =?utf-8?B?UzFCaUh1d2xIenIycWJHWnRyVmxjMDR1NVRGZ1RjbXhWSTY0YVdzc3dZbTUx?=
 =?utf-8?B?Q1l5dVR1RmtUT2w3WHlyQW1CdVlkaXkwQnRRaW9IdmgrVitsbGFyUFE5TFJG?=
 =?utf-8?B?Q1EwVzdUeEhJSCs0V2ZrL2FuVmpXRHMxK2lHamt3N2h0VlpVUENOQ1Z5TVdl?=
 =?utf-8?B?UitUQVp6dndpK1ptd0RtcXYvM0FLd1VPc2NrMG5xeWVRcXJVRndYWkl3UmJX?=
 =?utf-8?B?RDN6MktPSTFub1BxdlJHWkROajdDNDViOUZoekd5SURuTVpLK2lsQ3FsTW5H?=
 =?utf-8?B?ellZK3QwMkFDZWJoZkZOVFBwVkJ2NkRmeWpTY1Y5MC9YcGFCdkk5ZkMxZzZj?=
 =?utf-8?B?cFhSNzlzOU5kVkNUWmxyaGxPUkV6aERCb2RURFJ0UElYbTFvaXFINWpxRFRU?=
 =?utf-8?B?SWI1ZHNYVm9oSGt1bXJhS2wrV3NmZkdxU2VtMm1NanB4Qy9DWmJueENNNEh0?=
 =?utf-8?B?THJYS0J5M1NLSGMzVU4xNThTbG1GcWZIWXlaekhCcUdiZWY2Ujh5TStCclBU?=
 =?utf-8?B?RHBMMnFjTGhLZkNnYitONkM0cVBHTzU1NkVXc3Z0Z3M4MFRyRzN3Z1BTWDV0?=
 =?utf-8?B?Q3hhYThTVnN2K1lVV2xiWUp5cU0xRDlPRWlIbUFzeG1yYk0xT2t2Nk9BVUNP?=
 =?utf-8?B?b1BoZ0g4YjZiZkdURVBZUFNCUDV0ZVJiOGlaQTBMbERuMFNoTmxORnFRWklU?=
 =?utf-8?B?dUhKUUp3dkE0Nm1NenVGWHpQVGNKZ0IvZjNYbnBhSWV1SDEyMlBhN2hBMHZW?=
 =?utf-8?B?TXVsZWFKNW5Dcm1VMGlFYkdoVVJpamVTOEY1Z2pISXN2dU4yRjU4eXZzYzUx?=
 =?utf-8?B?Z1pZVXBYVmFDWUd6VG1PUS9XVFo3S3lqSFRVQ2dvMXJGSEtoZTkvVlp4eW1a?=
 =?utf-8?B?b2dQL01UZElYbmhNY3BNRkNvMkExQU5QUmhiOEFsVS9MUmE3Mnd0dlFZejla?=
 =?utf-8?B?Snl6UFRTc3AvNVhzeTNBUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q20wOTl1UlNiK2NvR1Z1U3V1U01pZ1pTV3NDN0FKRmFCb081bVllTWhQbjVX?=
 =?utf-8?B?cWVwMTJ6REtWbGltekVZNElDaG5nREZYUyt3eXRCUWtQaklBVlpNSFIzSU02?=
 =?utf-8?B?bkc1YUNDSHdoZFZOWFFNdFRpQkhENjZNWGpkbVIrdGtLUGExelk1YkE0TzJB?=
 =?utf-8?B?OGk4cjFBdXI3c1J1OCtGcC9OdTh4K0J4R1hBa0ZRY2xYQ2ZNNHJuWHZOU2cv?=
 =?utf-8?B?VExSbG9SUlZsKzFxdSs4NVA1TysvZThhR2dsREEyd3piV1FYOUhTTHVVMmQv?=
 =?utf-8?B?VCtjTDlJTmlwdEcrdmxuVTVXMU9qM3NaWEx3Y2lCenpPR1VicGMyWnN6RUFl?=
 =?utf-8?B?SW1hYjZyWVNYc3k0VGZuTFZOaTNRYzVDMGpMdzRhQWNVSllqMmZ5dDB5aFND?=
 =?utf-8?B?NUxQZVZQSVh0QXhnbDlIUWpYVUZyNnMreWdrLzc4QVZhbW1ObWtOTnhaZGF5?=
 =?utf-8?B?MzdIMlB1ODkvdnhJcEQwcGViQkd4YnVCY1FVV0dqVUpSa1hNM0NtZ2pKdnBP?=
 =?utf-8?B?VlB1dUQ5NWtkcEtlaUNFR28yc1l0ZXRlcEJLZ3pZMVVOOXF4ei9WUVNKU2tZ?=
 =?utf-8?B?amZNQk14dU1pdGoxZmE5TXlBR3NManh0MkJLUUpjQTBQTm5lK3JLYmpYRTFs?=
 =?utf-8?B?TjFNZHljeTRFdytzQ2N1SURRbFNmSDQ2Z3NDZ3hJLytIRnc0NXJVNWJyUkxS?=
 =?utf-8?B?UzRCenFiellHd3NEeHBBM1hUM1Mzb2MyczZadjRiL1k1UG5rd0ZSSkxZajd5?=
 =?utf-8?B?Uk10MnVqMGp5aG9RQ202NDM3TjFveWxtN1I5M05JbWd2RERzZXQ0ZTBybTJu?=
 =?utf-8?B?bTM3OFFyUHF2ZWo1N1k3dThNb2d3MHl3a2EwcTlsVEVGL0k5TTdmeEFxM3JS?=
 =?utf-8?B?Y2g2TndPZVYwYVBPc0lqZWd5T1liYWtMaWRxWnpGOTI4dUlnU2pQWCtNQmxp?=
 =?utf-8?B?TndqQ2haaW82cW5Rdy84UkNWNlI3SzFrTGdTWFREN21tamZTdXhxOHBvOHZF?=
 =?utf-8?B?UjMrMS9ySkVZczdrSmF6bE5uVWVMSDVWdzNQakpnelM3dzlGT2lqWDNMQUdl?=
 =?utf-8?B?RlllaXBpYWJabGpwaGVHOVNLck1Kci9GMTdlWjVHKzNVUXlhanAwS0ROWGdi?=
 =?utf-8?B?RTdhcGFST3lnSk5ObFl4Ti9zOTl4eHNFU3l0L040RXpzNHQ4UWM1S0lGVHoy?=
 =?utf-8?B?elpaVEkxRi9xaXltTjZXOEVjR3FlcXg3K2ZNa202cjJ6bThnUDRQOHM3RkR3?=
 =?utf-8?B?S1FqZ0t3dFFjYWk4OEJNQ3lCTnBqaU1pZ00zNFVlREE2Q0tJMi80VmVxNHFE?=
 =?utf-8?B?S1FNOWZBd2luamMvbG5JbG1TWGpibjZzRWJXdVJJNlZ0c1AreE1TSUl3bG1R?=
 =?utf-8?B?R2lPdm1ERTBoYnVvMXd4a0NiMGVHaGo3MHI4aWNCancyQWRZcnB3bFVQRjBa?=
 =?utf-8?B?amZ5anlnclRaM0FoamtmYkYrNkNFTVl4b3ZRV0hJN1NDTkNNbHpRK0NpbnI0?=
 =?utf-8?B?eWlOSi9DeUhDeVRWbGY3V0ZJSE5BR1JjU0FhajMrMWRqY0xBTVdhYnY1ZDVK?=
 =?utf-8?B?MVVFbmhhVXFpcDJHY1FybEc3cURoNC83Wis5R3pyZ3FuSk1CUGgrN0VpVEZB?=
 =?utf-8?B?bzNsZFlxSkk5dXpITzc5Nk5kK2lPWU9kVUhzZnEwY0dTaDRIWld1a1B5aTFw?=
 =?utf-8?B?OXkrWXFVaXhHbGhXQitBQ1FvcGZzUy8wL0I0U2RBMDRQZHFFbFhHeEVzcW1M?=
 =?utf-8?B?T0lTcS9xK0hmRDlCbHVqVnpzMy8vdHgwak5PYjV6WlQ3U0xVNDFhN0U1VXI0?=
 =?utf-8?B?OEFoQjU1ZlRGNTMvL1ZDbXR1MWMxdmhSbUFjc2NzK2paQkpMcWw0enNkZ0tw?=
 =?utf-8?B?c044aUFBMDVaN01BQmIyTWNFS1hxWDlzdjNzbWpuTis4cXFZR0MvMG5lbVZY?=
 =?utf-8?B?eTAyR0ZuK0JUcUxRbjVZM3dYVG9scDFQbFlmTjQ2UXl5aDR6bEtyQnR2UEFX?=
 =?utf-8?B?Zm85Vk1wc3UrNHVIaDVZMGtNN1JXUVBKQ1hsUWx3SDI1RHF6YjVNdGtvQW5L?=
 =?utf-8?B?d0x6OXd1bnR5dVlZVnFuZkIrYUw0ZHBlaGVBSmpSQlJXYk4rbSsrclhIdENp?=
 =?utf-8?B?cjBoVlIwNVpBTlBpOERtOXpLTWdpUnBEWWRxOWVGc0RmSU9CWFI0RVNJZ2xP?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e14434c-2cea-42df-5a47-08dc99c053f3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 11:24:10.2410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WagRWHO2hLGuv06HuV2vCwJx73SjGvYfSpk7n/i07fg2ltY8hdX4Xg6AJi0FC7hkNUycelf2d75JsNX2yEtMUEoGwSF1FNbCBxpbKKvRCtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7457
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-lip-01 12:27:36 +0200]:
> Our debugfs allows to view and change VFs' provisioning configs.
> 
> If we attempt to experiment with VFs provisioning before enabling
> them, this early config will affect fair provisioning calculations,
> and will also be overwritten, which is undesirable behavior.
> 
> To improve this, check if the VFs configs are empty (unprovisioned)
> before starting the fair provisioning procedure.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 48 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 +
>  drivers/gpu/drm/xe/xe_pci_sriov.c          | 13 ++++++
>  3 files changed, 63 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 694671497f6e..810b579a0025 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1922,6 +1922,54 @@ int xe_gt_sriov_pf_config_push(struct xe_gt *gt, unsigned int vfid, bool refresh
>  	return err;
>  }
>  
> +static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt *primary_gt = gt_to_tile(gt)->primary_gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	bool valid_ggtt, valid_ctxs, valid_dbs;
> +	bool valid_any, valid_all;
> +
> +	valid_ggtt = pf_get_vf_config_ggtt(primary_gt, vfid);
> +	valid_ctxs = pf_get_vf_config_ctxs(gt, vfid);
> +	valid_dbs = pf_get_vf_config_dbs(gt, vfid);
> +
> +	/* note that GuC doorbells are optional */
> +	valid_any = valid_ggtt || valid_ctxs || valid_dbs;
> +	valid_all = valid_ggtt && valid_ctxs;
> +
> +	if (IS_DGFX(xe)) {
> +		bool valid_lmem = pf_get_vf_config_ggtt(primary_gt, vfid);
> +
> +		valid_any = valid_any || valid_lmem;
> +		valid_all = valid_all && valid_lmem;
> +	}
> +
> +	return valid_all ? 1 : valid_any ? -ENOKEY : -ENODATA;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_is_empty - Check VF's configuration.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier (can't be PF)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: true if VF mandatory configuration (GGTT, LMEM, ...) is empty.
> + */
> +bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid)
> +{
> +	bool empty;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid);
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	empty = pf_validate_vf_config(gt, vfid) == -ENODATA;
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return empty;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_config_print_ggtt - Print GGTT configurations.
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index e8238c1ad06a..58c8f879d7ab 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -53,6 +53,8 @@ int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned
>  int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force);
>  int xe_gt_sriov_pf_config_push(struct xe_gt *gt, unsigned int vfid, bool refresh);
>  
> +bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
> +
>  int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p);
>  int xe_gt_sriov_pf_config_print_ctxs(struct xe_gt *gt, struct drm_printer *p);
>  int xe_gt_sriov_pf_config_print_dbs(struct xe_gt *gt, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index 74c8fadc9365..aaceee748287 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -13,6 +13,17 @@
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_printk.h"
>  
> +static int pf_needs_provisioning(struct xe_gt *gt, unsigned int num_vfs)
> +{
> +	unsigned int n;
> +
> +	for (n = 1; n <= num_vfs; n++)
> +		if (!xe_gt_sriov_pf_config_is_empty(gt, n))
> +			return false;
> +
> +	return true;
> +}
> +
>  static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
>  {
>  	struct xe_gt *gt;
> @@ -20,6 +31,8 @@ static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
>  	int result = 0, err;
>  
>  	for_each_gt(gt, xe, id) {
> +		if (!pf_needs_provisioning(gt, num_vfs))
> +			continue;
>  		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
>  		result = result ?: err;
>  	}

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
