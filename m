Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D47C27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 15:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE9210F1DC;
	Fri, 21 Jun 2024 15:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gTs5NqQ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A4310F1DC
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jun 2024 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718982078; x=1750518078;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FcsTr+nyDQV5mgICAf4sKRitAQgk86O55JRsK9rCyOI=;
 b=gTs5NqQ9om/Or/r3FEBdrkATtg3kl0y3L9y8MvZtQCTgqfHOSbhJupfG
 f/kNSaQOLnFWb7JQfMUU5mg8lZ7w9+qJRlG4QDAbq3GDBsJtBBdCTHa68
 m31tlj3VHoqiKp7cvfMgvO1ebZxP3Sj3uY7SWNh6vsQJZ3w7ll1/c05X0
 kyzhdbljXXgwFoHXlSwMq2GE4DrtvPz8Bz24GGGUyFsG5My9k+gWXflrN
 IBar4mAnvBw/x3Nl/Yb8ROUVuKwLBBPnS/W5CcYFhStbDxIJnDihUJUg5
 xQ1hcArEi38EwAApP9xwWNjGEUUxJjMoXOummR6C2JMcZ58lCDbnU/G3Q w==;
X-CSE-ConnectionGUID: pzupzQ4SQ2S2uOuz4SmyBw==
X-CSE-MsgGUID: TWBfvZKKQm+GF7Xicht1Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16164234"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="16164234"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 08:01:18 -0700
X-CSE-ConnectionGUID: yLom7YC8SMCmzi8SLZWB5w==
X-CSE-MsgGUID: GiOUYh55SmydVyE7FmDKGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="46974208"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jun 2024 08:01:18 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 08:01:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 08:01:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 08:01:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtVHatmEnBGzSt7qrbsG5DI/kVfah6fe8AC3xQNE9zfg9mH0e47E9nagbg5z5t2cdCOlnDfTDGOly9epxgWiEPKQ8PhvRhzvOLSJ7kna6y0aHi3y5mJCqgxSHaOZGOZTYW6Mcfa0qmUor7QkRSwygSKt/8pYzXcIi+fyKByFNnh4hw8QW1RUh3vFBN0zv7/PCis13Hqvv40rSP4JrivsgYp2gnaQnRSLDEIP13USK1VhW/2huivDGpT7pfsgCMnkUbE18mYYBkCDVCusPehZIW9fAz63YfyIexpg6tYd/Sw97DmOMCGI8g10UKiSxq+4kbqvSgpQemTlg9/dxNs6Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUberiy9YFSo/gUdAat+fa9Lwd4x3aGJx7RYYyoCcDU=;
 b=P2yY6nRDCiSV8Pag47eXB7grUWh5XQUSMb7FZuAtfNicsc4SvEXpzxIMRVzfQ9m26tp+4W1MBmCjwAmp3CQ9wB+GHLoJqViP8l1yxe3M0mbAD4pkbIOQLsgf3z0nGVBgRU/0JadnbFBT+3XhgqcWaAdfCXFWkF+BQXucSn4cErg3tT8oUOG7iB/VvN0rTX3kCmdGAx0ap7V7lYUD7vKPEOneAtndUo3pzMCyaXfxqJjrn47Fuwr9/KOuEvBNEnwP+ZVfw+flAYhcRPi1Vll4QR4Hwjzs6zfRQD+qnJMSsGMVE530pZNlAlFXSyUW+h2+yZAZ2MuE0kY68hjJp5NcIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by BN9PR11MB5321.namprd11.prod.outlook.com (2603:10b6:408:136::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 15:00:54 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7677.030; Fri, 21 Jun 2024
 15:00:54 +0000
Date: Fri, 21 Jun 2024 11:00:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw=?= =?utf-8?Q?=3A?= failure for Apply
 Wa_22019338487 (rev5)
Message-ID: <ZnWVohF-rdFeqRA-@intel.com>
References: <20240620224928.3986377-1-vinay.belgaumkar@intel.com>
 <171893274681.130457.15334661464596210590@a6498e030952>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171893274681.130457.15334661464596210590@a6498e030952>
X-ClientProxiedBy: BYAPR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::35) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|BN9PR11MB5321:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed9cd4c-1e70-4a28-1a16-08dc9202f290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2djM3JNWVdLeU8yZEErYXAzRmJBK2FrMG9kM0ZVdXlwYlhiUStVOWE4UzlW?=
 =?utf-8?B?TUxwNWpaWis5V0lWYzFKTGxxUDlpSHdQeGRNRkFhQW12aXJDYWQ0eXpINEp5?=
 =?utf-8?B?ZzAxMXR3aWcyUmJVdWg5MTFWa1pPRVpVMXlsZUVDK3RrZzNtY3hFNllMN1h2?=
 =?utf-8?B?RDZZaWZuTVZPZnByK3UzaVZhTW5jd3FUSUJ0THQ4RHNBRkVJeWxYM0NsYS9k?=
 =?utf-8?B?S3E3Q1l6VkM5Q0t2c08rN253eElvek1xZGdBSFgvaWpXK2M3R3F1MzhRcVNz?=
 =?utf-8?B?TWJqbkhybm9Qc2cvVjBLd3lKY1JZSi90OU9oeFBqTmVtNFdRVmdqejRhWDRJ?=
 =?utf-8?B?WlVwY1oxVUxTMDkreGxrMERwSVg3NVpzWnZubkFYL0ZqR2MzWTlaZ0ZPMEtE?=
 =?utf-8?B?TFZ6M2swZzhsamcvYVN5NGVOOEY3eWU0MnRRMGNxb2NqRGRkRmR4dERLaS96?=
 =?utf-8?B?QXB1eWV2anRYU3dhRmFObVY4VEFvYmNVQTJLQ2gweVgrU2hMa3ZubjRXVkZx?=
 =?utf-8?B?cS9UeXF4NjdQeWRLODBDc2I3Y3lkcWcyeGVEQi9VbXJlVXFvblE0d1BzVFVF?=
 =?utf-8?B?Y0tLejVQM2lzUnA2Unc5aTNUYjFDSUZuZURuTC9xYUxNSnNTUjRkYmdBaFR1?=
 =?utf-8?B?ZW1laVYyMWhic3NjaVpjbmpqWWp2bEdQL1JTNHE2eitIYXJrRUlaZDNYZFBl?=
 =?utf-8?B?WTBPNDNJa1l2ZEhvT0pQVmI4UHBSaU1jRnREbW1vYkIvc0hFQmdrNFFQdlJi?=
 =?utf-8?B?ODJsL3ptK0FPR2h3Q2s5ZW5iUGdZbHhQaHdMVDIwdmI2YjFEQ0Y0cUU1U0Rk?=
 =?utf-8?B?UlZVQ2txNmJTdFBoT0gvVS9zUC90SEpmVlZ6eTd4bDRJREdEV3JQQkk0bmJp?=
 =?utf-8?B?cVFsRVo2R0NUQlFlWkhPKzFNWFFlUlZ1a0NVUForQ2dOVkZnUDYyMk5QbGIy?=
 =?utf-8?B?dk9CUnMrV1dwakd4STE0T0hnaHR1UVc5ZFZubHVKSk1EUTRxcCs1WlhyekFJ?=
 =?utf-8?B?NzdmZ3d6S3ZXOFc1SW1uSlgrVEt1MkI4cko2NUI4bzc5UmJGUmlmQnNNc1Yx?=
 =?utf-8?B?alZPT0JXdFFiTVU4TkUrM2EwN2lmWkwxdEF5ZlY2M0lqZ01uRkFDeFVZelpo?=
 =?utf-8?B?dm1MODZSdmRjYUpzTG1vT2lwdWhRMWFxdm55MDdXQWtTcUlveTFETVA0TEtV?=
 =?utf-8?B?c1VqZ2gydmVWVDZoSTU3eVc2d2hJMksyc1VsU0lmUzNGbE9KbHdZU2x6WUFI?=
 =?utf-8?B?TmlvRFI3VGtoSjgwZitiT0NVUHlrZDcrWnVmK04xQkRoWFE1b0ZJN3h1QXZ4?=
 =?utf-8?B?VUhwK0JpdSs1TmJ0TmdtNVpBdTNieW1iMDl3SmEwR3lKNkZzeS91Z3JTZDdj?=
 =?utf-8?B?aXVlUlhLUnhNL3ZxYXlxNVhaVDhJcDhtdzg4WEdFN2VEMkozUGhOMml5OXBk?=
 =?utf-8?B?YWQrcmh6S3YrNFJ2RnR3WEhkVURCN3NvZHRrc0JOa2t5YVFMZ3BKK2RxdkZD?=
 =?utf-8?B?MUdrOWlESkc5bEJsOERSOXU2ejhDUm15V00zUzNCVXliVlIweDhBemtocjZz?=
 =?utf-8?B?VlNVc3pVRkEvNSt1VVliSTdzSU14REY5T3J5c2dtT1BTaTZSSjdCQ0pKRWdO?=
 =?utf-8?B?Q3hEMko4MUphL0taZ01EZmxFNFhJMXBKaGJjSWR4Uk1yWldva2lGVUthUXBP?=
 =?utf-8?B?eERuV080WitaSzZ5U1J3bEJ3dG1jaVZJeE1RS3M3UEFHTFVyK3IzWlJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFQyU3pwOUJIM1BFTHBUanNDSUFWZll2Q1Arb3ZWMGFlZklNVzNIUGRYcGNS?=
 =?utf-8?B?cmtSdVV3WnRrdXBXTldJQVl3NktTMkZzNWhNY2lVY3g2SlVHdFNEb1RzQ21P?=
 =?utf-8?B?NXlocE51aFQ0UmRTSUhJSlFZN3oxaXlrRWQzNWJBYjNZNjBBMVZJUGNFK1p2?=
 =?utf-8?B?ZHpGbDFaZXJqWG9VZjEycHJLall0WEdMQXk0endFa0dzUzlMU293eTlJY0c3?=
 =?utf-8?B?eVB2dWVuWTlyTHdqN2VDdnpwc2praEdQcHgwTjMyS3ltNjFvcXV3Vy81MVJF?=
 =?utf-8?B?RGZhWmRVa094Uk9nRDFoV3hvcS9FSGJiSWpxZ09qTHNYeXdOZWpyRmQySGdx?=
 =?utf-8?B?bGpHcjNhRGxkNE5RMGhaeXRiTmxUcHJaYUV1bGcyc2dTSzNELzFZUkM4WWJ6?=
 =?utf-8?B?dStZZjNqMEtPQ29SakdzMExmNkdRV2N5TFV3RnQzcWJsQ01sQytNdXBlYjVE?=
 =?utf-8?B?a3ZLRjhZVjN6YmRRNlorV2k0UW81aStyTXpZR05SMmJONmI3WUFZOG5sVzhj?=
 =?utf-8?B?bE1qS2NNUncrakpILzdsaVBubXlKUGFpWVhWd1Q1bEpwYTU5dmtnZVh4T05R?=
 =?utf-8?B?WlU4VXRvNkM2eExSSFhCNUM1VXRlOGFuMUVzckpIMHl3NmR4KzJqa010R1l0?=
 =?utf-8?B?WGhEV1JKamJZWmM4K0lTMzQ5K0puSWZ3VWYxWUxrYkNFUDl5cHJ4VnhPTmQ3?=
 =?utf-8?B?MGVnVVNTK1JRNmhTeVc1c2VlY2dUS3NxNlBIMmE5bm5zcVh0MFVybjBjbG9X?=
 =?utf-8?B?V0hBQlBNVDV4UEpuWFduOWlLdGR2YXpVVWEvYTlidUdXQzRlWkZRVWRheWg4?=
 =?utf-8?B?dG9WRXEvb3hNWFB3NkdzOHFvTHZYSUhha3B3WGo1QWRHYkNOUVo3SWtLS29p?=
 =?utf-8?B?SERjU2N4UXRPc016SmVqM2h1eGVSRG95dEFTZGIzL1V0bUhyV3JVYk5XRGJX?=
 =?utf-8?B?dUk5OFNOTUVLQVZLUTdoZEtZK0tHR2RWMEFyRlBlWUNZZlMrSzBxekhYaERj?=
 =?utf-8?B?K3loZ2JBVXUyNTBwNEttanFvd3d3dlY0a1RPK3V3NUM5MUNMSmVxOVIxczhv?=
 =?utf-8?B?OEFwOCtEZysxMXRQU292bEg4aklnelpocHZTc2J3RWJJSHpWT3NtR3FkWUJT?=
 =?utf-8?B?L1QvT1ROTUhlLzNoU3NYaEdqcWdoUnpVYnhGdE1YRVNaVGxnU1U1L01Da1hr?=
 =?utf-8?B?ZkZYVTZZOEhxd0V3NXdRZlZpcjNjL1duSWQyR0FUa1RwcGtJeFdmdXIyelJ3?=
 =?utf-8?B?Qk5rQzkxQXdrQ2NBMml4YUZsMENTY0JaLzYyNkJSUzBjb3pPNENQckdIbDVP?=
 =?utf-8?B?TW9CYmdIMGtENkkwdFJaQUNHNjI4OHNHeVh4eE0rVXFRSFZFbW5BNUhUSjNC?=
 =?utf-8?B?TDRPZW9xTDVRUzI2ZkI0Z1NFOUNBZERDRVZSMXhTTlN4eVRYdkduZEpIa2po?=
 =?utf-8?B?QXliLzJhOEV0VU9SWjhBSm9iYjM5aFlsUjI5eG5XNDBnZHdoN2syL0FKanM4?=
 =?utf-8?B?OWhoS0Mzd0pYTUZCazBuSXZFOEM5Mjc4bUFCVW5heDdvOGR4QUxKcTFwdTJU?=
 =?utf-8?B?eU40YjhhRk9NbXczRW10NURCV05IOVErbFFjYnN0WVNCSXBoUEZzSi9FazNV?=
 =?utf-8?B?YnhDYTBWc09UVFlZRlk1T0RPWjBOb09acm9WVS9mSjM2bmM2NlB2VmZNYlFF?=
 =?utf-8?B?MHcvdVpKTUc1OTE2QTNEbWVKLzR6bmVJbFQrVFhmaU45UzgwaDlEY1lncllF?=
 =?utf-8?B?SmR0YTZ2VXpEYllpZnpOWWNGc1lzSUw1c2hORW4xMGZCY2xKNG9ZM1pZb3lq?=
 =?utf-8?B?d2RWMWNaSG92RHlPYkV5OTgrSmRBTCtaYXVXSUtnb0RSOERLVVpNUk82c3hm?=
 =?utf-8?B?YS9ta3Q4cVRnWmVmYmhpbHFPQzhkTHNrNk9VNkNJby93Rlg5b3JsYkhkOVdv?=
 =?utf-8?B?ZFRWeFVPUnd3ZDdSNk4rTUlKRk5PM1JNQVIxNGhGU093TXAvbXF2cHFySnk3?=
 =?utf-8?B?Z0tSRnBqN2lCVktZSUt5ZTRuNExnY3RHcnNKNlhOYmtXbVVaN2phV1JZaWhz?=
 =?utf-8?B?clp0U1o1VHZFcnNyR1hmQTlESGwwZXFUMmRDa0VKRHJtRXc0d095Z1VJZzZk?=
 =?utf-8?Q?JG26tbD/r/7zGJ44mtiOBXvyg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed9cd4c-1e70-4a28-1a16-08dc9202f290
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 15:00:54.1603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FsSeXL85+fNQcsA6bCDwMKKmG+cPWEmnOU5s8QpV0h9Fs65vWAl4recIKgR9RCF6/wXDpYshXNiOq4Yu9dHD9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5321
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

On Fri, Jun 21, 2024 at 01:19:06AM -0000, Patchwork wrote:
>    Patch Details                                                                
>                                                                                 
>  Series:  Apply Wa_22019338487 (rev5)                                           
>  URL:     [1]https://patchwork.freedesktop.org/series/134921/                   
>  State:   failure                                                               
>  Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/index.html
>                                                                                 
> CI Bug Log - changes from xe-1509-0f80a34bf301a2001705a212b94b07a51056b451_full 
>                              -> xe-pw-134921v5_full                             
>                                                                                 
> Summary                                                                         
>                                                                                 
>    WARNING                                                                      
>                                                                                 
>    Minor unknown changes coming with xe-pw-134921v5_full need to be verified    
>    manually.                                                                    
>                                                                                 
>    If you think the reported changes have nothing to do with the changes        
>    introduced in xe-pw-134921v5_full, please notify your bug team               
>    (I915-ci-infra@lists.freedesktop.org) to allow them                          
>    to document this new failure mode, which will reduce false positives in      
>    CI.                                                                          
>                                                                                 
> Participating hosts (3 -> 3)                                                    
>                                                                                 
>    No changes in participating hosts                                            
>                                                                                 
> Possible new issues                                                             
>                                                                                 
>    Here are the unknown changes that may have been introduced in                
>    xe-pw-134921v5_full:                                                         
>                                                                                 
>   IGT changes                                                                   
>                                                                                 
>     Warnings                                                                    
>                                                                                 
>      • igt@kms_vblank@ts-continuation-suspend:                                  
>           • shard-dg2-set2: [3]DMESG-WARN ([4]Intel XE#1214) -> [5]DMESG-WARN   
>             +1 other test dmesg-warn                                            
>                                                                                 
>     Suppressed                                                                  
>                                                                                 
>    The following results come from untrusted machines, tests, or statuses.      
>    They do not affect the overall result.                                       
>                                                                                 
>      • igt@xe_vm@large-userptr-binds-1073741824:                                
>                                                                                 
>           • {shard-lnl}: NOTRUN -> [6]INCOMPLETE +1 other test incomplete       
>      • igt@xe_wedged@wedged-mode-toggle:                                        
>                                                                                 
>           • {shard-lnl}: [7]PASS -> [8]ABORT                                    


not related. Thanks for addressing all the issues here.

But we will have to wait before we can push this.

We need to wait latest drm-intel-next request to get merged
into drm-next, then backport drm-next into drm-xe-next before
we can merge, because the patch is not applying cleanly in
drm-xe-next without the commit 03c7918d0d52 ("drm: move
i915_drm.h under include/drm/intel")

Thanks for the patience.

>                                                                                 
> Known issues                                                                    
>                                                                                 
>    Here are the changes found in xe-pw-134921v5_full that come from known       
>    issues:                                                                      
>                                                                                 
>   IGT changes                                                                   
>                                                                                 
>     Issues hit                                                                  
>                                                                                 
>      • igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:  
>                                                                                 
>           • shard-adlp: [9]PASS -> [10]DMESG-WARN ([11]Intel XE#1214 /          
>             [12]Intel XE#324) +1 other test dmesg-warn                          
>      • igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:        
>                                                                                 
>           • shard-dg2-set2: [13]PASS -> [14]DMESG-WARN ([15]Intel XE#1214 /     
>             [16]Intel XE#282) +6 other tests dmesg-warn                         
>      • igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:                     
>                                                                                 
>           • shard-dg2-set2: [17]PASS -> [18]DMESG-WARN ([19]Intel XE#1214 /     
>             [20]Intel XE#282 / [21]Intel XE#910)                                
>      • igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:                  
>                                                                                 
>           • shard-dg2-set2: [22]PASS -> [23]INCOMPLETE ([24]Intel XE#1195) +3   
>             other tests incomplete                                              
>      • igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:           
>                                                                                 
>           • shard-adlp: [25]PASS -> [26]FAIL ([27]Intel XE#1874)                
>      • igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:                 
>                                                                                 
>           • shard-dg2-set2: [28]PASS -> [29]DMESG-WARN ([30]Intel XE#1214)      
>      • igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:                  
>                                                                                 
>           • shard-adlp: [31]PASS -> [32]FAIL ([33]Intel XE#899)                 
>      • igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:                  
>                                                                                 
>           • shard-dg2-set2: [34]PASS -> [35]FAIL ([36]Intel XE#899)             
>      • igt@xe_evict@evict-beng-cm-threads-large:                                
>                                                                                 
>           • shard-dg2-set2: [37]PASS -> [38]TIMEOUT ([39]Intel XE#1473 /        
>             [40]Intel XE#392)                                                   
>      • igt@xe_gt_freq@freq_fixed_exec:                                          
>                                                                                 
>           • shard-adlp: [41]PASS -> [42]FAIL ([43]Intel XE#1414)                
>      • igt@xe_pm@s4-mocs:                                                       
>                                                                                 
>           • shard-adlp: [44]PASS -> [45]ABORT ([46]Intel XE#1794)               
>                                                                                 
>     Possible fixes                                                              
>                                                                                 
>      • igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:      
>                                                                                 
>           • shard-dg2-set2: [47]INCOMPLETE ([48]Intel XE#1195) -> [49]PASS +1   
>             other test pass                                                     
>      • igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:               
>                                                                                 
>           • {shard-lnl}: [50]FAIL ([51]Intel XE#1659) -> [52]PASS               
>      • igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6:        
>                                                                                 
>           • shard-dg2-set2: [53]DMESG-WARN ([54]Intel XE#1214 / [55]Intel       
>             XE#282) -> [56]PASS +3 other tests pass                             
>      • igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:                          
>                                                                                 
>           • shard-dg2-set2: [57]DMESG-WARN ([58]Intel XE#282 / [59]Intel        
>             XE#910) -> [60]PASS                                                 
>      • igt@kms_cursor_legacy@forked-move@pipe-a:                                
>                                                                                 
>           • shard-dg2-set2: [61]DMESG-WARN ([62]Intel XE#282) -> [63]PASS +2    
>             other tests pass                                                    
>      • igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:           
>                                                                                 
>           • shard-adlp: [64]FAIL ([65]Intel XE#1874) -> [66]PASS +1 other       
>             test pass                                                           
>      • igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:                      
>                                                                                 
>           • shard-dg2-set2: [67]FAIL ([68]Intel XE#899) -> [69]PASS             
>      • igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:                  
>                                                                                 
>           • shard-adlp: [70]FAIL ([71]Intel XE#899) -> [72]PASS                 
>      • igt@kms_vblank@accuracy-idle:                                            
>                                                                                 
>           • {shard-lnl}: [73]FAIL ([74]Intel XE#1523) -> [75]PASS +1 other      
>             test pass                                                           
>      • igt@xe_evict@evict-beng-mixed-threads-large:                             
>                                                                                 
>           • shard-dg2-set2: [76]INCOMPLETE ([77]Intel XE#1195 / [78]Intel       
>             XE#1473 / [79]Intel XE#392) -> [80]PASS                             
>      • igt@xe_evict@evict-mixed-threads-large:                                  
>                                                                                 
>           • shard-dg2-set2: [81]TIMEOUT ([82]Intel XE#1473 / [83]Intel          
>             XE#392) -> [84]PASS                                                 
>      • igt@xe_exec_basic@twice-basic-defer-bind:                                
>                                                                                 
>           • shard-adlp: [85]DMESG-WARN ([86]Intel XE#1214) -> [87]PASS +2       
>             other tests pass                                                    
>      • igt@xe_exec_reset@close-fd:                                              
>                                                                                 
>           • {shard-lnl}: [88]DMESG-WARN ([89]Intel XE#1638) -> [90]PASS         
>      • igt@xe_waitfence@exec_queue-reset-wait:                                  
>                                                                                 
>           • {shard-lnl}: [91]INCOMPLETE -> [92]PASS                             
>                                                                                 
>     Warnings                                                                    
>                                                                                 
>      • igt@kms_async_flips@async-flip-with-page-flip-events:                    
>                                                                                 
>           • shard-adlp: [93]DMESG-WARN ([94]Intel XE#1033 / [95]Intel           
>             XE#1214) -> [96]DMESG-WARN ([97]Intel XE#1033 / [98]Intel XE#1214   
>             / [99]Intel XE#324)                                                 
>      • igt@kms_big_fb@x-tiled-8bpp-rotate-90:                                   
>                                                                                 
>           • shard-dg2-set2: [100]SKIP ([101]Intel XE#316) -> [102]SKIP          
>             ([103]Intel XE#1201 / [104]Intel XE#316) +2 other tests skip        
>      • igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:          
>                                                                                 
>           • shard-adlp: [105]FAIL ([106]Intel XE#1231) -> [107]DMESG-FAIL       
>             ([108]Intel XE#324)                                                 
>      • igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:             
>                                                                                 
>           • shard-dg2-set2: [109]SKIP ([110]Intel XE#1124 / [111]Intel          
>             XE#1201) -> [112]SKIP ([113]Intel XE#1124) +5 other tests skip      
>      • igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:  
>                                                                                 
>           • shard-dg2-set2: [114]SKIP ([115]Intel XE#1124) -> [116]SKIP         
>             ([117]Intel XE#1124 / [118]Intel XE#1201) +3 other tests skip       
>      • igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:                      
>                                                                                 
>           • shard-dg2-set2: [119]SKIP ([120]Intel XE#607) -> [121]SKIP          
>             ([122]Intel XE#1201 / [123]Intel XE#607)                            
>      • igt@kms_big_fb@yf-tiled-addfb-size-overflow:                             
>                                                                                 
>           • shard-dg2-set2: [124]SKIP ([125]Intel XE#610) -> [126]SKIP          
>             ([127]Intel XE#1201 / [128]Intel XE#610)                            
>      • igt@kms_bw@linear-tiling-4-displays-2160x1440p:                          
>                                                                                 
>           • shard-dg2-set2: [129]SKIP ([130]Intel XE#1201 / [131]Intel          
>             XE#367) -> [132]SKIP ([133]Intel XE#367)                            
>      • igt@kms_bw@linear-tiling-4-displays-2560x1440p:                          
>                                                                                 
>           • shard-dg2-set2: [134]SKIP ([135]Intel XE#367) -> [136]SKIP          
>             ([137]Intel XE#1201 / [138]Intel XE#367)                            
>      • igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:                             
>                                                                                 
>           • shard-dg2-set2: [139]SKIP ([140]Intel XE#1201 / [141]Intel          
>             XE#1252) -> [142]SKIP ([143]Intel XE#1252) +1 other test skip       
>      • igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:                      
>                                                                                 
>           • shard-dg2-set2: [144]SKIP ([145]Intel XE#1201 / [146]Intel XE#455   
>             / [147]Intel XE#787) -> [148]SKIP ([149]Intel XE#455 / [150]Intel   
>             XE#787) +5 other tests skip                                         
>      • igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-6:      
>                                                                                 
>           • shard-dg2-set2: [151]SKIP ([152]Intel XE#1201 / [153]Intel          
>             XE#787) -> [154]SKIP ([155]Intel XE#787) +20 other tests skip       
>      • igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
>                                                                                 
>           • shard-dg2-set2: [156]SKIP ([157]Intel XE#787) -> [158]SKIP          
>             ([159]Intel XE#1201 / [160]Intel XE#787) +41 other tests skip       
>      • igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:           
>                                                                                 
>           • shard-dg2-set2: [161]SKIP ([162]Intel XE#455 / [163]Intel XE#787)   
>             -> [164]SKIP ([165]Intel XE#1201 / [166]Intel XE#455 / [167]Intel   
>             XE#787) +11 other tests skip                                        
>      • igt@kms_chamelium_color@ctm-green-to-red:                                
>                                                                                 
>           • shard-dg2-set2: [168]SKIP ([169]Intel XE#1201 / [170]Intel          
>             XE#306) -> [171]SKIP ([172]Intel XE#306)                            
>      • igt@kms_chamelium_color@ctm-limited-range:                               
>                                                                                 
>           • shard-dg2-set2: [173]SKIP ([174]Intel XE#306) -> [175]SKIP          
>             ([176]Intel XE#1201 / [177]Intel XE#306)                            
>      • igt@kms_chamelium_hpd@hdmi-hpd:                                          
>                                                                                 
>           • shard-dg2-set2: [178]SKIP ([179]Intel XE#373) -> [180]SKIP          
>             ([181]Intel XE#1201 / [182]Intel XE#373) +2 other tests skip        
>      • igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:                             
>                                                                                 
>           • shard-dg2-set2: [183]SKIP ([184]Intel XE#1201 / [185]Intel          
>             XE#373) -> [186]SKIP ([187]Intel XE#373) +6 other tests skip        
>      • igt@kms_content_protection@dp-mst-lic-type-1:                            
>                                                                                 
>           • shard-dg2-set2: [188]SKIP ([189]Intel XE#1201 / [190]Intel          
>             XE#307) -> [191]SKIP ([192]Intel XE#307)                            
>      • igt@kms_cursor_crc@cursor-rapid-movement-512x170:                        
>                                                                                 
>           • shard-dg2-set2: [193]SKIP ([194]Intel XE#308) -> [195]SKIP          
>             ([196]Intel XE#1201 / [197]Intel XE#308)                            
>      • igt@kms_cursor_crc@cursor-sliding-512x170:                               
>                                                                                 
>           • shard-dg2-set2: [198]SKIP ([199]Intel XE#1201 / [200]Intel          
>             XE#308) -> [201]SKIP ([202]Intel XE#308) +1 other test skip         
>      • igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:                     
>                                                                                 
>           • shard-dg2-set2: [203]DMESG-WARN ([204]Intel XE#1214 / [205]Intel    
>             XE#282) -> [206]DMESG-WARN ([207]Intel XE#282 / [208]Intel          
>             XE#910)                                                             
>      • igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:    
>                                                                                 
>           • shard-dg2-set2: [209]DMESG-WARN ([210]Intel XE#282) ->              
>             [211]DMESG-WARN ([212]Intel XE#1214 / [213]Intel XE#282) +1 other   
>             test dmesg-warn                                                     
>      • igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>                                                                                 
>           • shard-dg2-set2: [214]SKIP ([215]Intel XE#323) -> [216]SKIP          
>             ([217]Intel XE#1201 / [218]Intel XE#323)                            
>      • igt@kms_cursor_legacy@single-bo@all-pipes:                               
>                                                                                 
>           • shard-dg2-set2: [219]DMESG-WARN ([220]Intel XE#1214 / [221]Intel    
>             XE#282) -> [222]DMESG-WARN ([223]Intel XE#282) +3 other tests       
>             dmesg-warn                                                          
>      • igt@kms_feature_discovery@display-3x:                                    
>                                                                                 
>           • shard-dg2-set2: [224]SKIP ([225]Intel XE#1201 / [226]Intel          
>             XE#703) -> [227]SKIP ([228]Intel XE#703)                            
>      • igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>                                                                                 
>           • shard-dg2-set2: [229]SKIP ([230]Intel XE#1201 / [231]Intel          
>             XE#455) -> [232]SKIP ([233]Intel XE#455) +5 other tests skip        
>      • igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:      
>                                                                                 
>           • shard-dg2-set2: [234]SKIP ([235]Intel XE#651) -> [236]SKIP          
>             ([237]Intel XE#1201 / [238]Intel XE#651) +15 other tests skip       
>      • igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:             
>                                                                                 
>           • shard-dg2-set2: [239]SKIP ([240]Intel XE#1201 / [241]Intel          
>             XE#651) -> [242]SKIP ([243]Intel XE#651) +13 other tests skip       
>      • igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:                            
>                                                                                 
>           • shard-dg2-set2: [244]SKIP ([245]Intel XE#653) -> [246]SKIP          
>             ([247]Intel XE#1201 / [248]Intel XE#653) +15 other tests skip       
>      • igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:                            
>                                                                                 
>           • shard-dg2-set2: [249]SKIP ([250]Intel XE#1201 / [251]Intel          
>             XE#658) -> [252]SKIP ([253]Intel XE#658)                            
>      • igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:           
>                                                                                 
>           • shard-dg2-set2: [254]SKIP ([255]Intel XE#1201 / [256]Intel          
>             XE#653) -> [257]SKIP ([258]Intel XE#653) +13 other tests skip       
>      • igt@kms_hdr@invalid-hdr:                                                 
>                                                                                 
>           • shard-dg2-set2: [259]SKIP ([260]Intel XE#455) -> [261]SKIP          
>             ([262]Intel XE#1201 / [263]Intel XE#455) +13 other tests skip       
>      • igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:         
>                                                                                 
>           • shard-dg2-set2: [264]SKIP ([265]Intel XE#455 / [266]Intel XE#498)   
>             -> [267]SKIP ([268]Intel XE#1201 / [269]Intel XE#455 / [270]Intel   
>             XE#498) +1 other test skip                                          
>      • igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
>                                                                                 
>           • shard-dg2-set2: [271]SKIP ([272]Intel XE#498) -> [273]SKIP          
>             ([274]Intel XE#1201 / [275]Intel XE#498) +2 other tests skip        
>      • igt@kms_pm_dc@dc3co-vpb-simulation:                                      
>                                                                                 
>           • shard-dg2-set2: [276]SKIP ([277]Intel XE#1122 / [278]Intel          
>             XE#1201) -> [279]SKIP ([280]Intel XE#1122)                          
>      • igt@kms_psr@fbc-pr-no-drrs:                                              
>                                                                                 
>           • shard-dg2-set2: [281]SKIP ([282]Intel XE#1201 / [283]Intel          
>             XE#929) -> [284]SKIP ([285]Intel XE#929) +9 other tests skip        
>      • igt@kms_psr@fbc-psr-cursor-plane-onoff:                                  
>                                                                                 
>           • shard-dg2-set2: [286]SKIP ([287]Intel XE#929) -> [288]SKIP          
>             ([289]Intel XE#1201 / [290]Intel XE#929) +7 other tests skip        
>      • igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:                        
>                                                                                 
>           • shard-dg2-set2: [291]SKIP ([292]Intel XE#1127 / [293]Intel          
>             XE#1201) -> [294]SKIP ([295]Intel XE#1127)                          
>      • igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:                       
>                                                                                 
>           • shard-dg2-set2: [296]SKIP ([297]Intel XE#1127) -> [298]SKIP         
>             ([299]Intel XE#1127 / [300]Intel XE#1201)                           
>      • igt@kms_tiled_display@basic-test-pattern-with-chamelium:                 
>                                                                                 
>           • shard-dg2-set2: [301]SKIP ([302]Intel XE#1201 / [303]Intel          
>             XE#1500) -> [304]SKIP ([305]Intel XE#1500)                          
>      • igt@kms_writeback@writeback-invalid-parameters:                          
>                                                                                 
>           • shard-dg2-set2: [306]SKIP ([307]Intel XE#1201 / [308]Intel          
>             XE#756) -> [309]SKIP ([310]Intel XE#756)                            
>      • igt@sriov_basic@bind-unbind-vf:                                          
>                                                                                 
>           • shard-dg2-set2: [311]SKIP ([312]Intel XE#1091 / [313]Intel          
>             XE#1201) -> [314]SKIP ([315]Intel XE#1091)                          
>      • igt@sriov_basic@enable-vfs-autoprobe-off:                                
>                                                                                 
>           • shard-dg2-set2: [316]SKIP ([317]Intel XE#1091) -> [318]SKIP         
>             ([319]Intel XE#1091 / [320]Intel XE#1201)                           
>      • igt@xe_copy_basic@mem-set-linear-0xfffe:                                 
>                                                                                 
>           • shard-dg2-set2: [321]SKIP ([322]Intel XE#1126) -> [323]SKIP         
>             ([324]Intel XE#1126 / [325]Intel XE#1201)                           
>      • igt@xe_exec_fault_mode@once-userptr-invalidate-imm:                      
>                                                                                 
>           • shard-dg2-set2: [326]SKIP ([327]Intel XE#288) -> [328]SKIP          
>             ([329]Intel XE#1201 / [330]Intel XE#288) +11 other tests skip       
>      • igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:                   
>                                                                                 
>           • shard-dg2-set2: [331]SKIP ([332]Intel XE#1201 / [333]Intel          
>             XE#288) -> [334]SKIP ([335]Intel XE#288) +12 other tests skip       
>      • igt@xe_huc_copy@huc_copy:                                                
>                                                                                 
>           • shard-dg2-set2: [336]SKIP ([337]Intel XE#255) -> [338]SKIP          
>             ([339]Intel XE#1201 / [340]Intel XE#255)                            
>      • igt@xe_module_load@many-reload:                                          
>                                                                                 
>           • shard-dg2-set2: [341]DMESG-WARN -> [342]DMESG-WARN ([343]Intel      
>             XE#1214)                                                            
>      • igt@xe_pat@pat-index-xelpg:                                              
>                                                                                 
>           • shard-dg2-set2: [344]SKIP ([345]Intel XE#1201 / [346]Intel          
>             XE#979) -> [347]SKIP ([348]Intel XE#979)                            
>      • igt@xe_pm@s3-d3cold-basic-exec:                                          
>                                                                                 
>           • shard-dg2-set2: [349]SKIP ([350]Intel XE#1201 / [351]Intel          
>             XE#366) -> [352]SKIP ([353]Intel XE#366)                            
>      • igt@xe_pm@s3-vm-bind-unbind-all:                                         
>                                                                                 
>           • shard-dg2-set2: [354]DMESG-WARN ([355]Intel XE#1162 / [356]Intel    
>             XE#1214 / [357]Intel XE#1941) -> [358]DMESG-WARN ([359]Intel        
>             XE#1162 / [360]Intel XE#1941)                                       
>      • igt@xe_query@multigpu-query-engines:                                     
>                                                                                 
>           • shard-dg2-set2: [361]SKIP ([362]Intel XE#1201 / [363]Intel          
>             XE#944) -> [364]SKIP ([365]Intel XE#944) +1 other test skip         
>      • igt@xe_query@multigpu-query-uc-fw-version-guc:                           
>                                                                                 
>           • shard-dg2-set2: [366]SKIP ([367]Intel XE#944) -> [368]SKIP          
>             ([369]Intel XE#1201 / [370]Intel XE#944) +1 other test skip         
>      • igt@xe_wedged@basic-wedged:                                              
>                                                                                 
>           • shard-dg2-set2: [371]DMESG-WARN ([372]Intel XE#1760) ->             
>             [373]DMESG-WARN ([374]Intel XE#1214 / [375]Intel XE#1760)           
>                                                                                 
>    {name}: This element is suppressed. This means it is ignored when            
>    computing                                                                    
>    the status of the difference (SUCCESS, WARNING, or FAILURE).                 
>                                                                                 
> Build changes                                                                   
>                                                                                 
>      • Linux: xe-1509-0f80a34bf301a2001705a212b94b07a51056b451 ->               
>        xe-pw-134921v5                                                           
>                                                                                 
>    IGT_7894: 7894                                                               
>    xe-1509-0f80a34bf301a2001705a212b94b07a51056b451:                            
>    0f80a34bf301a2001705a212b94b07a51056b451                                     
>    xe-pw-134921v5: 134921v5                                                     
> 
> References
> 
>    Visible links
>    1. https://patchwork.freedesktop.org/series/134921/
>    2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/index.html
>    3. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html
>    4. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>    5. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html
>    6. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-lnl-3/igt@xe_vm@large-userptr-binds-1073741824.html
>    7. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html
>    8. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html
>    9. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>   10. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>   11. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   12. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   13. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html
>   14. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html
>   15. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   16. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   17. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>   18. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>   19. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   20. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   21. https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   22. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-435/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
>   23. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-435/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
>   24. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   25. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
>   26. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
>   27. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   28. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
>   29. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
>   30. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   31. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>   32. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>   33. https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   34. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>   35. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>   36. https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   37. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html
>   38. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large.html
>   39. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   40. https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   41. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-adlp-9/igt@xe_gt_freq@freq_fixed_exec.html
>   42. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-adlp-8/igt@xe_gt_freq@freq_fixed_exec.html
>   43. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
>   44. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-adlp-8/igt@xe_pm@s4-mocs.html
>   45. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-adlp-9/igt@xe_pm@s4-mocs.html
>   46. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   47. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-435/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html
>   48. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   49. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-435/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html
>   50. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>   51. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   52. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>   53. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html
>   54. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   55. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   56. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html
>   57. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>   58. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   59. https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   60. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>   61. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_cursor_legacy@forked-move@pipe-a.html
>   62. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   63. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-a.html
>   64. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
>   65. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   66. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
>   67. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>   68. https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   69. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>   70. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>   71. https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   72. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>   73. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-lnl-2/igt@kms_vblank@accuracy-idle.html
>   74. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
>   75. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-lnl-4/igt@kms_vblank@accuracy-idle.html
>   76. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html
>   77. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   78. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   79. https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   80. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html
>   81. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html
>   82. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   83. https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   84. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
>   85. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-adlp-8/igt@xe_exec_basic@twice-basic-defer-bind.html
>   86. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   87. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-adlp-8/igt@xe_exec_basic@twice-basic-defer-bind.html
>   88. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-lnl-1/igt@xe_exec_reset@close-fd.html
>   89. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
>   90. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-lnl-3/igt@xe_exec_reset@close-fd.html
>   91. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-lnl-2/igt@xe_waitfence@exec_queue-reset-wait.html
>   92. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-lnl-1/igt@xe_waitfence@exec_queue-reset-wait.html
>   93. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html
>   94. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   95. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   96. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
>   97. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   98. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   99. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  100. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
>  101. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>  102. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
>  103. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  104. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>  105. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>  106. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>  107. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>  108. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  109. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>  110. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>  111. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  112. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>  113. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>  114. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>  115. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>  116. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>  117. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>  118. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  119. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>  120. https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>  121. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>  122. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  123. https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>  124. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>  125. https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>  126. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>  127. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  128. https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>  129. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
>  130. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  131. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>  132. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
>  133. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>  134. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
>  135. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>  136. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
>  137. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  138. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>  139. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
>  140. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  141. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>  142. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
>  143. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>  144. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
>  145. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  146. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  147. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  148. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
>  149. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  150. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  151. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-6.html
>  152. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  153. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  154. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-6.html
>  155. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  156. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
>  157. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  158. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
>  159. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  160. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  161. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>  162. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  163. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  164. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>  165. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  166. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  167. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  168. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-433/igt@kms_chamelium_color@ctm-green-to-red.html
>  169. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  170. https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>  171. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html
>  172. https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>  173. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html
>  174. https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>  175. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html
>  176. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  177. https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>  178. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html
>  179. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  180. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html
>  181. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  182. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  183. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
>  184. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  185. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  186. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
>  187. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  188. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-1.html
>  189. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  190. https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>  191. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html
>  192. https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>  193. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>  194. https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>  195. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>  196. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  197. https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>  198. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html
>  199. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  200. https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>  201. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
>  202. https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>  203. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>  204. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  205. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>  206. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>  207. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>  208. https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>  209. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>  210. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>  211. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>  212. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  213. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>  214. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>  215. https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>  216. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>  217. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  218. https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>  219. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-433/igt@kms_cursor_legacy@single-bo@all-pipes.html
>  220. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  221. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>  222. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_cursor_legacy@single-bo@all-pipes.html
>  223. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>  224. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-464/igt@kms_feature_discovery@display-3x.html
>  225. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  226. https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>  227. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
>  228. https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>  229. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>  230. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  231. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  232. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>  233. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  234. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>  235. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  236. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>  237. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  238. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  239. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
>  240. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  241. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  242. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
>  243. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  244. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
>  245. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  246. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
>  247. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  248. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  249. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>  250. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  251. https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>  252. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>  253. https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>  254. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>  255. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  256. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  257. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>  258. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  259. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
>  260. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  261. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_hdr@invalid-hdr.html
>  262. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  263. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  264. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>  265. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  266. https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>  267. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>  268. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  269. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  270. https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>  271. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
>  272. https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>  273. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
>  274. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  275. https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>  276. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html
>  277. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>  278. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  279. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html
>  280. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>  281. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-433/igt@kms_psr@fbc-pr-no-drrs.html
>  282. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  283. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  284. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_psr@fbc-pr-no-drrs.html
>  285. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  286. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
>  287. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  288. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
>  289. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  290. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  291. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>  292. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>  293. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  294. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>  295. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>  296. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>  297. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>  298. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>  299. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>  300. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  301. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>  302. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  303. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>  304. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>  305. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>  306. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-464/igt@kms_writeback@writeback-invalid-parameters.html
>  307. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  308. https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>  309. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html
>  310. https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>  311. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-433/igt@sriov_basic@bind-unbind-vf.html
>  312. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>  313. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  314. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@sriov_basic@bind-unbind-vf.html
>  315. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>  316. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
>  317. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>  318. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@sriov_basic@enable-vfs-autoprobe-off.html
>  319. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>  320. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  321. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>  322. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>  323. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>  324. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>  325. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  326. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html
>  327. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  328. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html
>  329. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  330. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  331. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
>  332. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  333. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  334. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
>  335. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  336. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
>  337. https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>  338. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@xe_huc_copy@huc_copy.html
>  339. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  340. https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>  341. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@xe_module_load@many-reload.html
>  342. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@xe_module_load@many-reload.html
>  343. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  344. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html
>  345. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  346. https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>  347. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
>  348. https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>  349. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html
>  350. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  351. https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>  352. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html
>  353. https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>  354. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-464/igt@xe_pm@s3-vm-bind-unbind-all.html
>  355. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>  356. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  357. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
>  358. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html
>  359. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>  360. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
>  361. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-433/igt@xe_query@multigpu-query-engines.html
>  362. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  363. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  364. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
>  365. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  366. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>  367. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  368. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>  369. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  370. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  371. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1509-0f80a34bf301a2001705a212b94b07a51056b451/shard-dg2-432/igt@xe_wedged@basic-wedged.html
>  372. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>  373. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v5/shard-dg2-464/igt@xe_wedged@basic-wedged.html
>  374. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  375. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
