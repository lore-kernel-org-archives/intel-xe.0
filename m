Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10254C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 10:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECC211297C;
	Mon, 22 Apr 2024 10:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ks3bc2QF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E399112979
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 10:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713781590; x=1745317590;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sH2/pshjrp9EnvcuI9SriywMFQiDiXh54lt6Gb+01e8=;
 b=Ks3bc2QFg85dntBEu5xdTT0UttfMJiX1y+GxcE1h+1FJmPRSv72UVhDo
 tTR4599r6xRGSuWNpJLrcEwTphvdn+iNuplCVCj4AJDGqTWhjOAVfZ5yQ
 hKUvlnZcPyXE8mIyYOpO47EaBy/mH+JrknyxTKCnwYZtSD6QYuOncwfc7
 +JVmNTV1IjHltTlH5GmXoG7WXACBGyxuBS5ZMVbzsZRirAVgxeG8fZLxK
 LDWun50NEP1mq+gACnPJJwXa9pBl2UsWDlNlpLlSw+yEy2gvIK/cqZcEu
 3pyTPQBjRTcLmvaZt5drYGoTFUFOJI6Brck2/5CDiNaoWgd/WTqi9pc2z A==;
X-CSE-ConnectionGUID: KudTAhVlQv66Kv3qQUrf+g==
X-CSE-MsgGUID: E0w2FE+xQ+GuhlagQF5K1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="19917109"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="19917109"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 03:26:29 -0700
X-CSE-ConnectionGUID: 3KcjGEL2RUiUk4JgZqR2Bg==
X-CSE-MsgGUID: BvJ5OE0pTny480ie6X1JZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="28637330"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 03:26:30 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 03:26:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 03:26:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 03:26:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 03:26:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Meh5NWv8T52zfRAGv9lRqKOd+rg0hi16E7sJZ7JL/kaKFGZ9bNCEDG3YxsSRYQO4ebXcQvdnX9xVoREAAl4dVrvoBlxv87EumDd5xhn+TlLnwbSiy3iaOvSyFEr9EVZ007u9noX41Cru+2ArvhxzEK+LhnNYqEob531Cfvwy0iDQaMU2Xw2qk5v9uBWk+oo3fl6DBQ7Gd3zCCoTeluu7A1JgV5KCOQ/b7to0wg6SK7TxDl2JAyWuPhjzYLtGRGC30tATS2BFzURkb64axjqTwMU9x1AxRdkb6J56+O1cXIpYpUsXs1YxN5a6Wa/mSMA2/PuaVEnCrDmF7waQEJQzSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HICD0tIQQDhhtN8LXRVtUgCcNa0XHdh4l4c2OkXeGVU=;
 b=Ou7f1+skdaOeIZQ6SEr1SPQwW2FTmt4udxTPb0b4/5POc2snXnUQROn4+AY6I/ODL4utlJcs3JD7YIty5DSSorfuoirf063dj+bjPxjQhi0gq938IafXhw8Kr3Luh3YjtwQeSNcjrfcmgKCM6giMxD7Hn6B81Qt3t2BGQSqjIR7ipbm1Op9IVu0eW3D1JCzX0pPxjnnfwxRkHT4ZpAnXkmxnKLY/pp/bUMQwFjoD7ncPxF1xR3NfHKDTiAqh6JTXuMSL11KiV4HiXbhOyGtG37QVR0BxQdozCIuSdX48x8swbE7FD3x8kT3g0P1F4JpmkgWFTMn3rJOskK3BQWm4Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CY8PR11MB7687.namprd11.prod.outlook.com (2603:10b6:930:74::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Mon, 22 Apr
 2024 10:26:20 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 10:26:20 +0000
Date: Mon, 22 Apr 2024 12:26:18 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/xe/guc: Add GuC Relay ABI version 1.0 definitions
Message-ID: <20240422102618.vtaapag6sskxqju6@intel.com>
References: <20240418152802.182-1-michal.wajdeczko@intel.com>
 <20240418152802.182-2-michal.wajdeczko@intel.com>
 <20240422092537.lbe5asu3gofps2ib@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240422092537.lbe5asu3gofps2ib@intel.com>
X-ClientProxiedBy: MI1P293CA0018.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CY8PR11MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c910ee-6e58-49ae-4a8c-08dc62b6a6ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXN3QUhXYkVMc25veVg4cXdvSlJqZC9TaFo4NmNoU2VQSmRGNFMxa0dMQUZV?=
 =?utf-8?B?S0RJQWg4QXhZcVArOE5CZGxKSGVYUGh4cmVHUGEwK1ZtR0pYUUF2QmlJV2p3?=
 =?utf-8?B?TlVPMTRNTWdqN0llQjljN0JkUC9EZXJhSloxTGplVWplS2VRalBFcFBDeVJO?=
 =?utf-8?B?cVRMb1ErcHF1MGJYblhjR3BRMk9MQmFnVSt1QWRDTGE5d25iYU5uWU0wckNZ?=
 =?utf-8?B?RU9UazBORmVzN0V2WENNN2MvLzVxZlNJMUc5UXRUYWg3TXloRUN5ZExUVGc4?=
 =?utf-8?B?MTFjdHRiM3FzTkI2aC9rWlBhQjRCeGtrMUN0L25NdjYvTWEwZG9BTDJyZ3Vy?=
 =?utf-8?B?N2tUc0I4UE5jWkppbnpqUEpTNitxWFVnL2E0Vk9hbjFRbmdreEhhdllOSitu?=
 =?utf-8?B?ejBld2lGb2Y2dU1WM2MvZjRXMmtzcjEybTM0V3JOOFEwR2V6TkdHZ0pDbms0?=
 =?utf-8?B?US9LdmtuVVo0RnBLZ2t6OWxFVnRacDVEZG9MZ3F1aStJVnk0YkpVc1VOemcy?=
 =?utf-8?B?RXUrOTRZbEVRbldDTjVHM3RFNVRuU2lQdVNzSlF4dGREclhVVm9MSnZrbER0?=
 =?utf-8?B?eDVxSjQwT3hmYXh2a3J6eEthL1BRV01qTEc3UEJCK2RhZDB0aDFiM1JtSTVa?=
 =?utf-8?B?SVJqSXBsNEVqQmZUbGtIR015MmpOTG1oVStMNVZIT0xFdUVOZE1KR1VOTXVu?=
 =?utf-8?B?TThYR2ZRbEdRVG1lZ2x0U2NscHRQTmxpVEdDRkZZa2VFdU14Y1B2L2NGWFM1?=
 =?utf-8?B?UmgzbVBWK3lrMVIzSllycUVldzhZOUhvaDByNFJVd0tKcmVpQ1ZTbjI2M2hL?=
 =?utf-8?B?RFMvZStzdmY4eTBMN1BqMUpTWDd4LzIzN2ZYWHVyVGkxc1poV2U0QmtLQ0to?=
 =?utf-8?B?OE1NN1VEREZJMUorRlYxbExtenJPYWR5bk8yMVgzV0kycVpkdml2NlZET1VF?=
 =?utf-8?B?VGtLWmhYWEVpWHY0Q3I4dUdnR1JsRitRaDE0R08vRzhneXZ3VWE0bnFqc2JY?=
 =?utf-8?B?dFNmMnkyajFIREs5blRPUWovZXd4Q0Z6QUl2Q3RsWEVZTHVtWTdYb0pKRFg4?=
 =?utf-8?B?WHVvRldTaXE4Y245MFM1UWpGMCtUNjI4QUJYMjZRZFkzeG1ONXNZSFdYNHF3?=
 =?utf-8?B?QW5mTXdqa3F4bU1Ua25BWUd4UjZ0Ykkvcmo5T2NUM2tKVEgrb1NFSlNoRmdi?=
 =?utf-8?B?U05haHJ0YVFUQ0ZUYXZWck1CdHA2M3k2RkJLSjRyTGh5aWlnM2d1MmFtc2py?=
 =?utf-8?B?MlNHemVXVGVtYzVlOHBkQTJGVGM3S2RiZWN6SnNKN1ZubnBwak5vc3Y1SlJh?=
 =?utf-8?B?ZFpkU1lQYU01aHllcG1WdnY0cTdQNk1nZTNSb3VWYnR0d1hzdUFFZ3hPait6?=
 =?utf-8?B?SWhPc0hNa2lBa2E2YUorVWxYVXc4M2wvaDh0czRLbVNuSlBONmNZY1JEeGVu?=
 =?utf-8?B?dTV2WW4rSE9oVGdGd05nQjlYN0pObFdYYnl5aS9vWTdadVd5YlN5Q1ZhTTlW?=
 =?utf-8?B?Z0ZBVUxuS2k1WWlGMFg5UW9yeDE5VnRnQjY1VnM5OVQ1L1dXclZycXZEbG5D?=
 =?utf-8?B?amg0M3pkZDZpZkFwMkNiZEViVEZFOFFuUHZ1cVh3VzZxUE5pMEhmWHZoWUNy?=
 =?utf-8?Q?xH3epxS3tovPUnx3XIZiaHYdiRPs1fJRl9wlSKGc92eI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEkvM1B4RGswTEVPL0FZbmxaNkV0eElqVHlZZmRSZFlQTStKL2NUZ0Y5UHI5?=
 =?utf-8?B?ZmlCMHJCVlg3dmxBT3V2SHNHZlZmSUN6TDNVZ29VYS9DQjFBUFkwdHJRVXg1?=
 =?utf-8?B?RURXQnRod1lEUXlRYWpmMUsxM1d4M2t4YkJCMkFXL0I5VUFRb2tPS1F0TDlV?=
 =?utf-8?B?d2pDTFNVTjhrbkQ1NVdhTEl5dnJuZE1lTUIwT2p4YytLYUplVEhrdWRpV3Mr?=
 =?utf-8?B?aTcrSDZCMll5MDB0N2N6bzJOWU80bEFScjlXSmRmSzJkUFlZUEt6M3JFWlpt?=
 =?utf-8?B?cy9hdFppdmFqMndRYUtOclNsZ1NaUHQrTWlFbmFqbmxmS0xLb1NzcXJYRWNu?=
 =?utf-8?B?cldzTWlzdHE5ZUEyV0czcjhjbTF4WDFJdGYxbExWemllVWQ1d2s2QjdmSVlP?=
 =?utf-8?B?TUttS0h5T2pKekRnU3Z5OFZQUmVQVy94UkpFeFREbFVFZ0FnNWEyRlBTZ2Yv?=
 =?utf-8?B?RFNESlZFQVBEU0txcjFadW1ENHdGWDRiMlI3ZllKMndOVkEwaXFwTnhrVi9k?=
 =?utf-8?B?dUR1L1MxcEE3cFZXazVYbXlWWFY0SGtQQmFCcVdIWE1ndWR4TnUyOTRwdGRJ?=
 =?utf-8?B?cm1MU0FmRE92VDdJQnZtYzd4QWtiSjVkMy9xOGYxODVmdlpGMi9mWlJXWUUz?=
 =?utf-8?B?THozL3RqcXBPNnpQNHk4clAybTJxeGxFYnloYnR5YVhwZWtVY0FMSGNpdE9q?=
 =?utf-8?B?WVRkNFZKOUZLaXNUTjJhUlF1dktlVWpuQklDeDFlRDJMUWZLeElBbmxSbUx0?=
 =?utf-8?B?UGRXbXFHOUhneE5kV00wK0ZvRW5ORHlaVDk4K1I5RHBkeXQ0Z1R2T3pyREwy?=
 =?utf-8?B?S0J4cjNvSXRabmxXZzkyWTNseW9ha2pZdVVxUDhaWThlZVpsNm9RdHVuRzMz?=
 =?utf-8?B?dFJENkZTUlNVOXc2eWRNZDF6cGpGLzhtbzhjdjhROC9GMzQ2WURqOVQ3VnJN?=
 =?utf-8?B?K2hxRi96KzZwUXJNZHhEM3ZNYjVGVk5hM3h5TVp1dks1WXZOdnUzeFJIYkZL?=
 =?utf-8?B?MkliV2NnT1d3UUd4cDlYTk5UM3RPa1k3bEhEVFQxcUt3a2d4UENZbndQcnN5?=
 =?utf-8?B?THM3NHlEUTNRd2VXSVFra09FZytySnVDRmFGYXVFTGRTRVZFVHZYM3lwbmRW?=
 =?utf-8?B?U1F1Y0dacW45eFdwRVdySmRzL0V6MCs5eTUzRkUxQjRMdXRZdmRrL1JHVmxz?=
 =?utf-8?B?N2o0cmV2NTlmVjVlMnVlbTRiNWIwcFpEOTRTN3NDb3FWV21MbTZKR3FuRitm?=
 =?utf-8?B?OWhpRFlueDNQa3NKMEpTVlJ2cjdLZS9Sdk03TndydWlyQ2toVURrQ1dvQmp6?=
 =?utf-8?B?cTRWNXQwWnFybGtXWVFSVnVXeFRkOUFUUks5am41c0RjL2wrTEtYU0x1dW9N?=
 =?utf-8?B?Z3dFK0pVRjdmS29iQndxMXY0Vk9QckQvUTdJaE9ha3RtbytrbHoyaTl4bFpL?=
 =?utf-8?B?eWtIZGNjOXJ5MGVwKzd0MFBlc0ZpdGZFUDFWTlVMbUtaaDFoNEdNVnpPSDBD?=
 =?utf-8?B?ZG1ZZjBEZE5GTjdKWjBhMlM3VkorakFBZVNBNGxrZzBmUVQ3OHR0dXpSNjZJ?=
 =?utf-8?B?ZjdkeXNxMVE2bGNDVHR3K2dqb0Y4TzFjYmpNMEZVMndYRWRTOEpqcDg3SmxL?=
 =?utf-8?B?UnoydU12YTkvTWpXMys2UHNDaWtYRTErWWR3SytycFJENVNQMjU2YzQ5QWxk?=
 =?utf-8?B?S04vL24rd1hrZkVVdWlJMWlKUS83bjErWk5RQ1ZhMU1zQytqQnBiS2JpVVBj?=
 =?utf-8?B?b3VzU3VqYjRSeXlNR0VhUWFHbkROQk5XcEt6RkFOcmNDLzd0Szk1dzQrSXB3?=
 =?utf-8?B?Z2luUVZsTnVISCtRYVJMbmlrNjdXWENiNGdwd1lGSklPaEJKWkhveUg3b1BV?=
 =?utf-8?B?RkdpSGl4Ly9xTnhCT2F1N2xMb09jQkl3Wm1RaFhyUHRmYStKazJSNkZ1S0ti?=
 =?utf-8?B?WDVzc3FvN0ZwUHRKejVxQ0FFQncyUW1LWERsME5QNUpRL3Q4a0s1cm9kMWFN?=
 =?utf-8?B?dUl2NkllWDZPNHQrUzBSd3VwM0FKQ3dDNk8wdEVra2ovVC9KK3M1c0tQcnZy?=
 =?utf-8?B?Vm9yK1lUZjJEeWJneU1ONjFTSHFhZHZ1WkszNWNQTFdSU3JDTmFKbVJIU3A3?=
 =?utf-8?B?L1NsSkd6anhIMlpRemVIcVBaR2RzSDdCbUVuczVoRy9wRCs4bXRvb3lQc0V5?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c910ee-6e58-49ae-4a8c-08dc62b6a6ee
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 10:26:20.5911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nyVTYz6/3oU5Z++JxfHmWpWQ50LQuOwEQoxnl0CTNLV2rSQZcqVhDFCsvibPU3sL3xhD3ZOMKW6fxNn6L9vgiBsQE/EwiUjPt68L00vcwfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7687
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

Piotr Piórkowski <piotr.piorkowski@intel.com> wrote on pon [2024-kwi-22 11:25:37 +0200]:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-kwi-18 17:27:58 +0200]:
> > This initial GuC Relay ABI specification includes messages for ABI
> > version negotiation and to query values of runtime/fuse registers.
> > 
> > We will start handling those messages on the PF driver soon.
> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >  .../gpu/drm/xe/abi/guc_relay_actions_abi.h    | 147 +++++++++++++++++-
> >  1 file changed, 146 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
> > index 747e428de421..05a2066ef7f7 100644
> > --- a/drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
> > +++ b/drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
> > @@ -1,11 +1,156 @@
> >  /* SPDX-License-Identifier: MIT */
> >  /*
> > - * Copyright © 2023 Intel Corporation
> > + * Copyright © 2023-2024 Intel Corporation
> >   */
> >  
> >  #ifndef _ABI_GUC_RELAY_ACTIONS_ABI_H_
> >  #define _ABI_GUC_RELAY_ACTIONS_ABI_H_
> >  
> > +#include "abi/guc_relay_communication_abi.h"
> > +
> > +/**
> > + * DOC: GuC Relay VF/PF ABI Version
> > + *
> > + * The _`GUC_RELAY_VERSION_BASE` defines minimum VF/PF ABI version that
> > + * drivers must support. Currently this is version 1.0.
> > + *
> > + * The _`GUC_RELAY_VERSION_LATEST` defines latest VF/PF ABI version that
> > + * drivers may use. Currently this is version 1.0.
> > + *
> > + * Some platforms may require different base VF/PF ABI version.
> > + * No supported VF/PF ABI version can be 0.0.
> > + */
> > +
> > +#define GUC_RELAY_VERSION_BASE_MAJOR			1
> > +#define GUC_RELAY_VERSION_BASE_MINOR			0
> > +
> > +#define GUC_RELAY_VERSION_LATEST_MAJOR			1
> > +#define GUC_RELAY_VERSION_LATEST_MINOR			0
> > +
> > +/**
> > + * DOC: GuC Relay Actions
> > + *
> > + * The following actions are supported from VF/PF ABI version 1.0:
> > + *
> > + *  * `VF2PF_HANDSHAKE`_
> > + *  * `VF2PF_QUERY_RUNTIME`_
> > + */
> > +
> > +/**
> > + * DOC: VF2PF_HANDSHAKE
> > + *
> > + * This `Relay Message`_ is used by the VF to establish ABI version with the PF.
> > + *
> > + * This message definition shall be supported by all future ABI versions.
> > + * This message definition shall not be changed by future ABI versions.
> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 27:16 | DATA0 = MBZ                                                  |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  15:0 | ACTION = _`GUC_RELAY_ACTION_VF2PF_HANDSHAKE` = 0x0001        |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  | 1 | 31:16 | **MAJOR** - requested major version of the VFPF interface    |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  15:0 | **MINOR** - requested minor version of the VFPF interface    |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  27:0 | DATA0 = MBZ                                                  |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  | 1 | 31:16 | **MAJOR** - agreed major version of the VFPF interface       |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  15:0 | **MINOR** - agreed minor version of the VFPF interface       |
> > + *  +---+-------+--------------------------------------------------------------+
> > + */
> > +#define GUC_RELAY_ACTION_VF2PF_HANDSHAKE		0x0001u
> > +
> > +#define VF2PF_HANDSHAKE_REQUEST_MSG_LEN			2u
> > +#define VF2PF_HANDSHAKE_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
> > +#define VF2PF_HANDSHAKE_REQUEST_MSG_1_MAJOR		(0xffffu << 16)
> > +#define   VF2PF_HANDSHAKE_MAJOR_ANY			0
> > +#define VF2PF_HANDSHAKE_REQUEST_MSG_1_MINOR		(0xffffu << 0)
> > +#define   VF2PF_HANDSHAKE_MINOR_ANY			0
> 
> NIT: Maybe you should add a description of MAJOR_ANY and MINOR_ANY to the documentation
> of this action.
> 
> > +
> > +#define VF2PF_HANDSHAKE_RESPONSE_MSG_LEN		2u
> > +#define VF2PF_HANDSHAKE_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
> > +#define VF2PF_HANDSHAKE_RESPONSE_MSG_1_MAJOR		(0xffffu << 16)
> > +#define VF2PF_HANDSHAKE_RESPONSE_MSG_1_MINOR		(0xffffu << 0)
> > +
> > +/**
> > + * DOC: VF2PF_QUERY_RUNTIME
> > + *
> > + * This `Relay Message`_ is used by the VF to query values of runtime registers.
> > + *
> 
> NIT: I would describe more what runtime registers are (as a struture itself)
> Because here you have a parameter "START" whose description indicates that it is some
> kind of index. But someone who has the first contact with this has to check the code
> to find out what this index is.
> You could describe that runtime registers is a predefined list of registers depending
> on the platform, and the index indicates the positions in the list.

In addition, from the implementation in https://patchwork.freedesktop.org/patch/590250/?series=132612&rev=2
it looks like 0 is an allowed value and doesn't mean we don't want any registers...
also worth adding here

Piotr
> 
> 
> > + * This message definition is supported from ABI versions 1.0.
> > + *
> > + * VF provides @START index to the requested register entry.
> > + * VF can use @LIMIT to limit number of returned register entries.
> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 27:16 | DATA0 = **LIMIT** - limit number of returned entries         |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  15:0 | ACTION = _`GUC_RELAY_ACTION_VF2PF_QUERY_RUNTIME` = 0x0101    |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  | 1 |  31:0 | DATA1 = **START** - index of the first requested entry       |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  27:0 | DATA0 = **COUNT** - number of entries included in response   |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  | 1 |  31:0 | DATA1 = **REMAINING** - number of remaining entries          |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  | 2 |  31:0 | DATA2 = **REG_OFFSET** - offset of register[START]           |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  | 3 |  31:0 | DATA3 = **REG_VALUE** - value of register[START]             |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   |       |                                                              |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |n-1|  31:0 | REG_OFFSET - offset of register[START + x]                   |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  | n |  31:0 | REG_VALUE - value of register[START + x]                     |
> > + *  +---+-------+--------------------------------------------------------------+
> > + */
> > +#define GUC_RELAY_ACTION_VF2PF_QUERY_RUNTIME		0x0101u
> > +
> > +#define VF2PF_QUERY_RUNTIME_REQUEST_MSG_LEN		2u
> > +#define VF2PF_QUERY_RUNTIME_REQUEST_MSG_0_LIMIT		GUC_HXG_REQUEST_MSG_0_DATA0
> > +#define VF2PF_QUERY_RUNTIME_REQUEST_MSG_1_START		GUC_HXG_REQUEST_MSG_n_DATAn
> > +
> > +#define VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN	(GUC_HXG_MSG_MIN_LEN + 1u)
> > +#define VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MAX_LEN	\
> > +		(VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN + VF2PF_QUERY_RUNTIME_MAX_COUNT * 2)
> > +#define VF2PF_QUERY_RUNTIME_RESPONSE_MSG_0_COUNT	GUC_HXG_RESPONSE_MSG_0_DATA0
> > +#define   VF2PF_QUERY_RUNTIME_MIN_COUNT			0
> > +#define   VF2PF_QUERY_RUNTIME_MAX_COUNT			\
> > +		((GUC_RELAY_MSG_MAX_LEN - VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN) / 2)
> > +#define VF2PF_QUERY_RUNTIME_RESPONSE_MSG_1_REMAINING	GUC_HXG_RESPONSE_MSG_n_DATAn
> > +#define VF2PF_QUERY_RUNTIME_RESPONSE_DATAn_REG_OFFSETx	GUC_HXG_RESPONSE_MSG_n_DATAn
> > +#define VF2PF_QUERY_RUNTIME_RESPONSE_DATAn_REG_VALUEx	GUC_HXG_RESPONSE_MSG_n_DATAn
> > +
> >  /**
> >   * DOC: GuC Relay Debug Actions
> >   *
> 
> 
> Personally, I would expand the action descriptions a bit ( comments
> above), but still:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > -- 
> > 2.43.0
> > 
> 
> -- 

-- 
