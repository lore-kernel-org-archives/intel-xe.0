Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1FCC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 14:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43231133E9;
	Tue, 23 Apr 2024 14:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJkWFLGv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90821133E8
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 14:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713881153; x=1745417153;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TXFhtx81+Il0ktEXeFeqSD2Ys0bJU26/3VeeX7KzKjc=;
 b=XJkWFLGvKAdJs4fuQlXU+6ElOUFixiZa8TSyM8dkiEOlHqMiYsbZMMLT
 fFVMTuTseKAhtzHKc7f7tfj9hs2GsvXCVx8XCUO0lZr8Mmn0RESng6Xcx
 hp3cEw0ZoTv/LKnvZB3IjsCBBpYCDVqAz87ysoUvNN3WU2KiUdnVgs7rK
 LYUFsjGuVbhJSphhj0unbOkhFiZi6lHFyGwUku24D0fAPAb9VKiEQAacO
 JS6ILk+x783sIkJBUu+r68Xvpz+J5WEe+ArdUYKWQ6F0WITmf4zOZRb+G
 FubHbEe4+Z+ACk0NXWPAuyPyNsM2DT5sbFjXPrcJgb+TY+wW2ggwCHQgv w==;
X-CSE-ConnectionGUID: 3hcbS8JHRNiF2K4jttFr8A==
X-CSE-MsgGUID: 226eWoAuTSuqfPUXAHcKlQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9387672"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9387672"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 07:05:53 -0700
X-CSE-ConnectionGUID: cPMN+2a9SOGoc+fK+Vr1UQ==
X-CSE-MsgGUID: g9JpUY10TGWNLSxgZFKLgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24888805"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 07:05:53 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 07:05:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 07:05:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 07:05:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XH8HKYTbhmgBKa8r9X6o4yRBhBD0KliSZ8lW6kjODEiLpHMc6aDk01oKt7dC8DMhILlnE/WRl6rmE6LkPAoRxOvTk7mzNCDlS5zlNrMCJcxMkaNNntRX0u5yZjeel5I+uDKpbtf85acLb0TiONFbKPQPHm6HFbQ4O0UG0zMD8RSGSq3kflJ/gXhs952gXIuYGPuaSOLerLYag9DGViw8sY6rAu53zTU/c2hu0PIRgl1KcE9bN0TMtakQ4RMrw+1Q8B+SFrBbLqZTF0/OIQmDJqie0eVOMqrmGEd+r3gZfgfFb2fkjZ4PioUa812R2cnWnhdbccO39vUUxXhpYD9l+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVzR1nDrrXBQq07IITQgyMLIs67dzSQxOnsHnvVPfqQ=;
 b=cvCVsufjqNb+HXX24fi7PRznstj7j0+nqmWawiiBHJZEUjn/1vW/tnsKrLb1kJABOEXuXN0gmljWkim/Shh6mMPVvXcfMQEe0ZK7gDyLFF23phKbtKQ/4Le3j/fTZFI8qJWl2Z98ONC1mWY00pc9plUPeA+Mv8yu46vvkSDfwUkBjGnCjdxtJuR64EXF24pVHVeByVEdg3ys4U0GQxDIyl7ojRX6lvRHc/DC0NtI3wLfqBToQOUa7PHD9No7PIX25Yvdeq40PbtrtQB+flKgvTfQvJWVX+5Tpdr9JY5p/P5a1+RtFDGHljya2mpqAFfxAbuyl4mfUhhwsvPb6Ptb4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA1PR11MB6784.namprd11.prod.outlook.com (2603:10b6:806:24c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 14:05:49 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8e17:1f3b:64f:9c67]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8e17:1f3b:64f:9c67%4]) with mapi id 15.20.7519.021; Tue, 23 Apr 2024
 14:05:49 +0000
Message-ID: <8379fc45-959c-409b-af57-06794782c2f8@intel.com>
Date: Tue, 23 Apr 2024 19:35:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vm: Use xe_vm_lock() helper for locking
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20240423070332.2036539-1-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240423070332.2036539-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0191.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA1PR11MB6784:EE_
X-MS-Office365-Filtering-Correlation-Id: 09b2d36d-4201-478a-6d4b-08dc639e7a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UCtmT3dDWG4vaUp4b25EOWFid2NUZHIrR1Y0U0VSV09yNlRuVTBRb0lFZHdi?=
 =?utf-8?B?VlV4T2hqS3NtS2krV29PVVZPdys1TlRUQkVtUlZPKzhiUzlLZXBlbXljZ0hh?=
 =?utf-8?B?MUVQUkIrVWszTXI2WnhzRVN4SU9hQ1laNmxBVDhlQjJmSUhHSFpsUnAzSGZI?=
 =?utf-8?B?b3RSY3hVOXJTeGlGaG1mdnFkb3g4OU5FTUJOQnV2bmZ5Y0g4M2h3S3lyRVo0?=
 =?utf-8?B?ek1DSVV3aDVUcTVrQU1hT09hS2o4R1NjVkZOOTZNdE9NTE9IYmZQTHF1R1dX?=
 =?utf-8?B?M2RjcU9CZTBEMjd1U0IyOWJzL1l3Q2VKdHZjVktjSVlIM0VZdURCb0RwRXhm?=
 =?utf-8?B?SS9aM1pxbGE1a3JNdzlheHpCVjloeEJUbVhkU2U0Ny83QW5hZlI2RHJuSktp?=
 =?utf-8?B?TFpveHBNcGFrb29vMzNtK0g2WDRoM0JjQ3d2WFJ3WFdmOVRGSFl4aEwyUWtP?=
 =?utf-8?B?UzNDZHNWNVlQckd3SGt5L2VnRDZDTmZ1WStqeXpuQ3ZNN0JxNjNZak9RMHVv?=
 =?utf-8?B?TFliUlNzRnYyWHFzOHlxcS9uN0tOTXZrQ21zdVRhaG1PVEY0KzRta3A4RFZz?=
 =?utf-8?B?WFZCM2xETlVwekFFeUtxazd1R2JodEwvVkhUT1B6RmtsZ2FTNWdscGZqWDRK?=
 =?utf-8?B?ZC8yRXc4R254MEZoWi9OaTFpb3pRWkttTm5LSVAzNm1Tdk1IcGo4K2N2L2tF?=
 =?utf-8?B?QXdiMStYdnBLUFVHd3FuMUtIR2ZORGJKUXdIam1PNnIxbkN4TThwMndDZGEr?=
 =?utf-8?B?dUV4cEtHSHk3WnlsMnVJbGhNbExmRGVWa3hSMUtoZTlxMHJ6YjJmVlNFSWx3?=
 =?utf-8?B?SW1mRHVBVnBiY3BZTUFrUzl4T09EWXU3c0IzRkNNK0NDOTdjbUtSWVJiSHlr?=
 =?utf-8?B?QS9RWWJVM25kclExQVZ0WUNoZkNhOFo3TzVyRCtzMmhqK3lqM3JwT2lneXFs?=
 =?utf-8?B?d2U1emdRckFhRHM0YUswaWQzOWNBZHZtU3IyNy9tTUJSeHd0VEJQbjMzR3NR?=
 =?utf-8?B?VFVEbG5mdjJ6Z0c5clMwY3hJZHlhVzBqYjBvTWh2d0NqOWNkNS9NQmhsVXRQ?=
 =?utf-8?B?VGNoTllPbktiYUFVYlRHN2oyOXpzTW4wUmUxdmQ3ZjRzL1ZCMzFiY2lNSDQy?=
 =?utf-8?B?b25sQjBUeHRsVDVDNWEzcjFHd1JtT2V5eUxDeGhpVzZxUFR2OTJiaTU2Tk5w?=
 =?utf-8?B?WHUrMVJKbnhhUUhwMUd4Y2RZNjJlbUJMYVJYUFM4dVlSNWUzL0J4cnZpLzlk?=
 =?utf-8?B?ZmlxV3lLeGdQRDRCZGZtSWN0R1hDcS9DbUhvRG42cmVhM0J2Tks4VWtHSGVh?=
 =?utf-8?B?M0FDQXhCY3pGaVhmY2d4Wmt3UXVMTlRnSzBTMHk5MldGVzBzUTQ1ZzgwUDNN?=
 =?utf-8?B?N3FZSTZ2WGZNS24yVWNycXlwZEw4SkZrNzBFb1dtb0xhZVpzekN6NFp6MDJy?=
 =?utf-8?B?N01sdWFVdXlIcmNzcXlzM0llSDkxZUk0bkw4dmV1eWsvYTVqdmVIcEprbVZZ?=
 =?utf-8?B?VWQrK0Znc2JuUk5wM1pieUd6V3BsdTZUYXdLNG1paWlIZlhvNnN1d0FqT3p5?=
 =?utf-8?B?R2t0WFBtMXNENUdvWkc3K0NnSzJocUU1YlN3ODlEYnp1RzQzK1BYNkpnSXRr?=
 =?utf-8?B?SGc1WUxNaThzT3ZibU5hSTVlNEg1a085N3JNWG1iSEFmRlV1aUhmS2lrOThk?=
 =?utf-8?B?QXVQWjN4ZkJPbU56VUVjMWhkdHRHZ3F3U0ovOW9zMVF5TVRuR1B5OUt3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3pUYzFQejlOM01TWURvL0lnaWFTU3l1YXl6b3h3T1hlb2pzQmhqTnltUTRP?=
 =?utf-8?B?UFJFVDlVOU9td29XZURqUEpyUVc2MnFEUUJLMkdlbUd1MEhZWHRjRVAwQzRm?=
 =?utf-8?B?YmlTVStpWEJUZGlNaEFTNDQrazRLNnJraDRtVzlYWkh5Y2dvMGgxZCtLZmtM?=
 =?utf-8?B?MWdnM2krYWFESXp2aWtRVzZTNFBpRGw3dURuaUc1VnZEWUdwaUtqRlR6M1F2?=
 =?utf-8?B?MVdYVWJhYk84RE9zWUFOK25GSnRLRjhtS20xNHUxSVdqZis2N1ZRUEcrYmFw?=
 =?utf-8?B?NHJ0djk2YlZ1SWQ5Q0tlSjVrckpSQmwxUWF1K0l1OFVncHJiL2U2NGx5UkJr?=
 =?utf-8?B?MmxBTjBGMDdHZDlocGpYRWYzbmdkRXBJWFlFZHcxeC9idnI0MllWNmFjUXNR?=
 =?utf-8?B?MnBSLzF6SGJEWmRIcUpkdjl1NDJzVHlHSnhnZkdMM1pFbCtyQThDZE5wS3pn?=
 =?utf-8?B?NFZvcTFkMFI1WklpSzJpS1ppaUNybUlqZ3RzeCtEOFRvVWJoYXFJU0xKU2VD?=
 =?utf-8?B?UDFjUW5FVnROcEZwdHBUMVM3NTQwSGN6UUlGelhpdzA5bVA3dGlydFpFcDNy?=
 =?utf-8?B?Qm1tT0E0ZlY4WitYQ3JSdG85RVRLckpoNHd5Y2kwQkRTV3E4MVRsQ2JTUTZD?=
 =?utf-8?B?V3NoKzdxTnlMWE83dHBEOHdMZmVBaXZpekFTbmtuTVhzTGR0aE5CZTNWbHI5?=
 =?utf-8?B?RHd3RTRrR0g2ckozdnlLZnc3eEU1STdBZlZ1NUpGN0JCUGQ3Vmo2L1p3dFpv?=
 =?utf-8?B?UEVkNTFCY0lZSWdMTktxS0VqODJxU2RTajliV3RPU2hISkRyNkYxTFcyNWdr?=
 =?utf-8?B?bHcrcXhvbXUwUVlGS1J3QndoMWw4TGxwTmZIN2tnT0NMN2ttL1pUWHp0OUpX?=
 =?utf-8?B?cjlvYUpxUTJQUGt0d1VFdnRaZC9iRVlrYzRoeGt6WDlJeGh5NTRNTGJmeXNm?=
 =?utf-8?B?TG1TSTlhTlVLeXU4S0NEckR0MzR3alpRcmhyclNwYU9HcmhjZThNcE1pTlZI?=
 =?utf-8?B?QThtL1R0VTZmOXEvNHVTeTA3djZ0RzJkSDlJcU92ZVkvSHowbVZkZm9LdDAz?=
 =?utf-8?B?UHVHaWRaKzF5eDIyc1luZ0o3Wk5QUGpreUVSS3BIYjcza0c5Mm1pSTRQK0d6?=
 =?utf-8?B?MExSU04walNZR0dCNjl5NHhSOC9xVC9lQzNwMlZQanJFaXdORjkrYmhDa21T?=
 =?utf-8?B?ZlIvZXNEandUaTIya0FURWNMNmxHZTF3MGZMQnRkQmRlanc0Ylo4blR1OWFQ?=
 =?utf-8?B?VmR3QmNKTFZ3NmJTTHN0d1JUV0NCU1E3eU1DRUdibVQrejRMNzhhZzlvN0Nk?=
 =?utf-8?B?cmFXQ0lFN1dTYVdUNjdWUk5NSVZHSmptOHlQR25xVkl6VXhjdVpVWGtkS0E5?=
 =?utf-8?B?OFJpOWRyQ25KSzc2ZTNsQ1EvcWRqQWhoYXFVVStxMGpWbUU3aVd6c2N6eHV4?=
 =?utf-8?B?bHNnTk1sRVlNdUVVc0VuaEtPcGg3OU1EUVBVOEtLNS9ubXRDQXNYb3ZHTFZG?=
 =?utf-8?B?b21vaGY3c3RxZEpWZWYvRnVRUERnMDFUdFZGTy81YTRzcXEvdE9tMkRlcUY0?=
 =?utf-8?B?M21BV3NRSWZnaTJDN3pFUlhVaFEvZlhTSUpQREJNQlV2WkdGM2FXYUNuOElF?=
 =?utf-8?B?TFhNUU1qeTZTRjhKMTRCZDVSdk5OVi9xWEFUSmRBWkpoYWZIS3UwTDhNRGh6?=
 =?utf-8?B?YTIyS3BFMytuSmRybTN2V2kycGRlSnZXTmxrOWNVZkFWSXQ2MlNmcUpVbC84?=
 =?utf-8?B?OCtrMW4zdTdIS09WUUpSajVqZ1ljMDlLVjRSajRNK3lBMmt1U0M4c0FqcTZw?=
 =?utf-8?B?b3BUVHNjSzRkZWpvL3BjY2RhU1gxMG9NTW92clIxZlluU0txQ1UyT3FQZHVM?=
 =?utf-8?B?akZiRlFENGoxSlJGNy9wMGkvMDFmdFhmOFdHdi9EY1pCWUVQSnFKSTRsSzl1?=
 =?utf-8?B?cERMRU1IU2Z3amxhdHRmanZvRGF4bjB6STBGM2pLOFI3ZHVTZ1pJejByUnAz?=
 =?utf-8?B?R0ZxaG9VdHROVXZ0U1dsaGFNZTV6UENQRmRVQXpXdnZnYm1RWTNaVlcyWHMx?=
 =?utf-8?B?MGZGL2ZySFB1aGl6akVydDNtNE11Wkg2QlBVU2NYMTIxaEZudGhDZDVjd0M3?=
 =?utf-8?B?MXViK2E3NkJkV05mMHZWWEFOS3lCUXlSVFYvZVBnVHMwOUtLMDYvYzBrOGht?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b2d36d-4201-478a-6d4b-08dc639e7a32
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 14:05:48.9924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OM0J6z1p5OPSLroEA1Y2rxQdo1iJ4HWddDv+CCMUe0bCPdGtmMkLwH2a70STVewUMGs5ONcr5rO7pZVeupizug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6784
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



On 23-04-2024 12:33, Himal Prasad Ghimiray wrote:
> There is no change in functionality. Using the helper function
> defined within the driver.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Not sure if Fixes: b06d47be7c83 ("drm/xe: Port Xe to GPUVA") need to be 
added here.
Otherwise looks good to me.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 85d6f359142d..e9c8dc6d7b83 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1279,7 +1279,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   
>   	drm_gem_object_put(vm_resv_obj);
>   
> -	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
> +	err = xe_vm_lock(vm, true);
>   	if (err)
>   		goto err_close;
>   
