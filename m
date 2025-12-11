Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0A4D3E793
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 05:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AB210E03F;
	Thu, 11 Dec 2025 05:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/AjvRK5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E990610E03F
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 05:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765431417; x=1796967417;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S51+mqBw/C7f9UiM4f46ta5kvR/qL7+3Da9hjLMyfRI=;
 b=K/AjvRK5Ratt/4n15zXi9oOV0QyVxrWXIVbKCHZLIetw1AaGmC17OrFH
 mMKEURvB3v3wkiNyju31DWoJjNiSYWgfyDyG+hvhqnRYpb+BkHRoojj1P
 CrRCxL+URWdjHXfVqbw6sd3wYMRfLflpTzV6iDi4hdtzoOjDuvvHkSCxE
 Pgp2JlaEhKL+fFjkH6DfnJPqQIRPk0M0pgj/YnO6qcbI4DzvLFjgt9qP4
 +Gxbc+LOr/Ne5W0YxlJrlTD9vHIMzd7mnbnI+I6XQqiOhooX0mOLMXfDt
 xbfO8SobEvkIpOiS0QOIGdYPdbGiu+LYdX+dzlWiyP6aTsOXcuPb2VNnO w==;
X-CSE-ConnectionGUID: quvycdr0QjCo2WcHFT3n2Q==
X-CSE-MsgGUID: 3nG4KDk/QwSTVj5jTICyhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78027154"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="78027154"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 21:36:56 -0800
X-CSE-ConnectionGUID: 2yVdMHSyRFWcqBXkKFbtnA==
X-CSE-MsgGUID: s+V9QZAeQ7CrsCPIm2Xs8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="201132634"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 21:36:56 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 21:36:56 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 21:36:56 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 21:36:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=by6pUZNcFce1+hQjm8IvBzzMc16DdcCrGXA1vCxfc3hC92uDWdQty8FRa/U0ADSCGeqv62k2I3zeF/q8653Oa2ZdfeRpdStFnAbqb5MApj+8NoqBNZEASp5AmH0MuWiZiSkH5Rwd7OU0O4aMIFjjoN6Lm1lv4siS8XvhV72iMzvKS4lV7KJUzI28KkbtCimeHpnr4NmUHBqP76e2xMrIaFW3wb0MzEmCKndAnGiHQ1cKRrPZVb8zYgJc1W9GZ25L4WfJ/E5NTA4PrAa2i76V/5DpcTJlP5HMGa1rY8EK7nyTdQlrNguxZtIUwJGqHhfAs9i7de8lG7xGPmF4O8o63A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kvdqr1+n4qiX1gi4oqNeXIb3vq99Kd6ERnYKhwlSQo8=;
 b=SzM4VtcxCHUy+8Bk34lg5PzGEeA/1c4LfEb+/AfLdX+DyLuEHqPWzCSwz5i6u/FBSAHa5O9yaZgkUfcfU/z5fl353o0hbSABO8uvH+wP05Vl3Ude3762kVXpRAFYCuJE8YdEyrwqHGndFqYggEIf6yyRLJKHZBUwqIbnPLL689hsH/vjVS5qeDKXQ0ZjLEabatm12nPy9FsYBG7kLIySiNPGPvNR/9LeotIS1PJbaIwTRVJCO3F0CFPhwM7tWg8G9pNqwpPBIauCh2kp447kWpuwriV9aNj+jKhO7p8De6SJ73w7eBZc3uDC4fppbhZ/VQn+unb/siN9bvFLQ3H5Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by CH0PR11MB8216.namprd11.prod.outlook.com (2603:10b6:610:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 05:36:54 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 05:36:54 +0000
Message-ID: <d2b6e9a7-59c4-4555-9819-c6dcc60d59ad@intel.com>
Date: Thu, 11 Dec 2025 11:06:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Use DRM_BUDDY_CONTIGUOUS_ALLOCATION for
 contiguous allocations
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>
References: <20251209172919.2304341-2-sanjay.kumar.yadav@intel.com>
 <7fa53fa2-61a5-44d4-b429-dfe40d7476ed@intel.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <7fa53fa2-61a5-44d4-b429-dfe40d7476ed@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0205.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::14) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|CH0PR11MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be5ec61-b0de-4107-8ff9-08de38774a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RW03eDRSU2ZTaTNBOHJjVmgzWkdZTmo3T0UrajJDdjBMWUF2Yy9VRUdnQzh3?=
 =?utf-8?B?QjdnbGhjTjJjc1AwQmVpL3NTVW0rYVdNWjAvcDd3RWsvZjlkTDM2dUNUQjJH?=
 =?utf-8?B?Unh6WWFXaGZvMWpjUy8zenpDdlp0dGZvTVdybEJocEZOWU1jeU5HYm55MlpK?=
 =?utf-8?B?U25CdjBvMEI0VTNJZWdsRXlTbXdvUnlSdDVMWVlzdi9TcVpTZ3RyNHgyV1RH?=
 =?utf-8?B?UHJVL3BpSndsNVAvRTViaERCVXkwVVBxZmRBTmtGcWx0dVJwTFdud1JhSS9a?=
 =?utf-8?B?b0NnOXNjZHdPTW0vUk83c0ZSS1ptV0RSV3RBUGIxN0hYTGV0eEJUOVkvL1RF?=
 =?utf-8?B?NmF4ZlFWSlpLb2xJbjBYU3lYUnFVSmVYRis3OWlLUmpoV0hsb1d2K3hKZ3Z4?=
 =?utf-8?B?bXpFSENVcDAxcFN4Y2hBdGFnOWw4QlZST1lvVEtkSjBRUjNaT05SYVZ0dnc3?=
 =?utf-8?B?NEcvOG9MQlV1ZEErRVNZelZVS2M1ZWNoWmVsVGMrTnFoTUJoa01zd3BQTnlZ?=
 =?utf-8?B?TE1yVXdPeGtxSVBydnFmMmNydzJOQzlVd1UrblZoKzh5Y3lVcDBaQVpsNmlr?=
 =?utf-8?B?VW9PYjdrZVI1bDBXNUUrcFhpQU5EanhDZU55eGd6bHFIV2daMVEwWHRoazVE?=
 =?utf-8?B?SmdwM2NDU0ZMaXQxSmFRTGNNWjZDWEVvTDYzaGE5aWVUT1N5ZkZRV1NjZWQz?=
 =?utf-8?B?N2I5OWZ5cSs0ckFEbW9GVXFrNUtUVDFoVGw5cElWMFVzNUdIbkdJN1NoamVV?=
 =?utf-8?B?TDdOeGpaY0RZMFgxNGJsaU8rZm1nYjljZmZEUFRJN2k0TlRzWXZ5SXpSTUVn?=
 =?utf-8?B?WWk4bDB2Q25Ca0lFUG53UDVqN05yak85RWZqa1Z3V1hJeGNCdyt3ajRXcGpn?=
 =?utf-8?B?Q25DdkxNVXZhMGFrbllKWkMrbVlXL0VtWGk5NnlYZlBsQlhWR2RVVlUwbmxx?=
 =?utf-8?B?bDhqVXIxQXNzcE9NZDRsTjZpWHlDT0NGNFRQcHE2ckJNWTlPYnY0cERWUVVk?=
 =?utf-8?B?QndVd0RWM3JKMk1VWFBCQVNtZHJrRmxFdUYrNHFjVFQrVVNORE5IdGN6Z2Fh?=
 =?utf-8?B?azhFOUtPZENyVmtCdU1YS1RyYTM5NlhlMHpnREgyeGlZQWZuOHFRa08vZyt6?=
 =?utf-8?B?NUk0Wjc5a09tYkFjQml3cnRoaFFBeUZpczFScTNNbGdlTUdvcU9pbGZJaWo3?=
 =?utf-8?B?QmVtY204SW01d01LR3NiamtDdnJhSVdLRzE3czlSNDRpZEhCUVUrc1lkcHE3?=
 =?utf-8?B?REJOSVA2UG5sRTZRSEx3aC91OTNDclQ0Q1NyWFdFbVJxOGJ3N1F0SjZFQkhp?=
 =?utf-8?B?Vml2dndvMlVHQUdrNzhRNFAzdXFRSDN3clF1RlBUdUhnVWkva0prcjhQeEEy?=
 =?utf-8?B?V2hORDNUelU3emhWTDAvZUtxNzF6SUdpWXR5N3JickNSM3o3aTI3WE41TGMr?=
 =?utf-8?B?L2srQ1d4RjFhTGF6QW1mWlNtR1BvSW1yQU9xVVJjVEVVRE9xM05FRU5welFX?=
 =?utf-8?B?OElNRXVnZktpSThJbTl0NzhCZVlvM0VWa0VBdDVTZDB6VmFKSWxSQ2pRTUFq?=
 =?utf-8?B?SnNJOGphY29zMm9MdXd3THdXaStrRGQ2ejd2SzNSWHNrM0l2aG0rb1NoamQ4?=
 =?utf-8?B?ZGxGNlBJMUp4SUcxSS9Ra3BkZ1NQQVd5UTFZZCtTQ0grY202S1FvRkxWTjdr?=
 =?utf-8?B?NjU3azNpYVRRTFFQdVVlTGpZM1VRMFA2UVZES3hpTVgzQmZMdkh0UUs2NVp0?=
 =?utf-8?B?VU0rbjE0RmxCZnprNTV1ZWpIZ25HWWZHYUpZK2xZb1E3VTFlRzZML0RVUUZz?=
 =?utf-8?B?bERrWVR2b1M2Q3BnMjhQcC9OVGZzQytJY3hZNTB2cHNmMUpvWmFsUTk5UnBS?=
 =?utf-8?B?WDhzTUFZZFo3WlJiN3ZPZVRibHdSQWVqNmxMRi81ZEFHSVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1BEWGMvaGg1Y2ZVNThWQUxsdHFRa3pNTWlvUjZBSXhtSkxVUVBwZ2ltZVJM?=
 =?utf-8?B?TWpZWUJyTjBKamtoSjIydjRDUmUzdlNiQU9DcEd1MDFYNEZGdmtYc0sxOEc2?=
 =?utf-8?B?aW5MWjVYS3lReGJhZXFmamJDWnQwY1RHbFJrQVlNN3RxZ29Jc2J4UkJxU251?=
 =?utf-8?B?TFlZZHl4QStYRW9UcVYzd1ZmejlRdnVucXN4MEFCSVZ5ZkZzUE52cENUaURr?=
 =?utf-8?B?QUhybThldE5qbFI1SFMyS01YTlhIVzhOOU9nVU5YV3ZLd2g4R214RDQ2TDJW?=
 =?utf-8?B?Um1aYVhBMXNVRmFKaktEWXJJM2VEem02VE45RDIySFJ0dXRYNm9TRGNDWlQ3?=
 =?utf-8?B?ek4yNUpYYW1ScStRcStCV1RyZVBVNjFya2JVRXg3Uk5lZ1huTGh5MVd5VDF5?=
 =?utf-8?B?ZktZSDZ0WmtxaGZZVU0ydS94NXpzTEdEaTNlRnFLT0tRNEkySGxjMm05Sm0r?=
 =?utf-8?B?TTg5d3pDVkk4T3VSaVZHQzB2Kzg4c1p1V0FXaEd4aVB5M21tNTJYZDQyaGlU?=
 =?utf-8?B?TGZ0aEl6YXlZaWNHRGt5NHJuTGV5QUNDd2QrREtCc0NMQnk1VGFxSndqQ2xu?=
 =?utf-8?B?b3NxRGlGcWlubmJweHV2NWo0bS9XMTFHb0R6QVlsVDNYYUlJNGFLVzU4YjNU?=
 =?utf-8?B?TnNoNXhMSENjVUxVYmdMWVRBTzRMK3Y0RkRhc2RQd01GSGRzY1NYZUdpME1h?=
 =?utf-8?B?MnhVMWhDWk15M3Fid1JzNTNRaDZ4SCtBeVZNK0NuWmw3T2ZSc1dFVXZBRWZI?=
 =?utf-8?B?OFZmNkE5RlJRemRxdk9SWTJoM0lLWGdHYVZ6NGRpSnFKUDZVQkcxS0VQdmtM?=
 =?utf-8?B?dnBoZjZwMEUzQWQvSnkwNUVzc3VRZVpFWlRmcm9HbmkvSVE5bVRBTUZTVWpR?=
 =?utf-8?B?SURLSzBxbXIvZTBNM25nQWxaM294UVplT3dSVzZ3YVBpVWZWNk5hcXUweUhn?=
 =?utf-8?B?UlBMV0JGMHVXOFN0YlA4a1p4cnlKQkNlVGFYNnVEZWxNTE9DTVBRWHdVRGs3?=
 =?utf-8?B?NExzVWVBenJrYy9EbzZDaFFNREZkNVpiSWxEYTQ5V2sxaEZTYkRMMXpmWm13?=
 =?utf-8?B?MGFlUjNWaUJvckZ4OFg1R2VUUGJWZEhwaUhoSm5pcEd4aFRUR1NKUEZ4MUcw?=
 =?utf-8?B?cXhFTjhmNWZVODZZeCtOQkEyNmZNTGEvV0RjVlNwbmpnVG1MV2ZRcDBSMVYv?=
 =?utf-8?B?SE1INWdtZEFkQXREaWp5RTVEdDVDS3NCZjNzeHZERDhhNTJCQlRzMGVoSmdX?=
 =?utf-8?B?dGxMckh0N3FOTFBHY3YvemxydGhXekFTeVF1bXg3S0hRUlA5ekJSNHNsQzZh?=
 =?utf-8?B?NWNDeHVYcUlXOWJWc2gwSHMxR0VnZjduVm5IMTlwZU9kdjd5WHRQVE9vcTZ5?=
 =?utf-8?B?TkEvOUZQa2lJZlg2TVE5NzdpampKUG5PTFlteHR0QXlDaWtYazJqUDV5V2dC?=
 =?utf-8?B?VlRIZEVER2d4OUJxVU82ZXJ0U29LcmJlVDlIdWRtM0hteENFdXJYQThjdG94?=
 =?utf-8?B?ZE12T2MyeWNnQkQvd0xFb29ucVpmekhYR2J3UE5TbG0wbE1lZWJTSytzc0lJ?=
 =?utf-8?B?VVcyT0RGN05WeUdaVjhHRDJnb0tJQ0xvRlk5NlVvcjJwZmhUMVdkbldFcFhs?=
 =?utf-8?B?K2lqSlBsMElObnZESmE5S3VwTmpoME5ab2t6U1N0YVpFRSt5L2VQMVB3NVcr?=
 =?utf-8?B?ZjRLQ3BBZUY3SWlheGl0bDVyL1VIb3FYbWVBWXg5cnk0ekdMUlNKOEhWMFBx?=
 =?utf-8?B?UUw5ekpVM2hXemZmSFlmZXZkR01xbW5kOFRwODd6Z2NSdkFNeGRJN3hXWVpl?=
 =?utf-8?B?TzJOY0JNZDh6SWVkOGRlWXpra3BuM0ZVT2kwR1VydE9MVEsvbnJpL2R6aDNt?=
 =?utf-8?B?Y2xKbS80QTNjczNPOXJPcVVObGl1b0hGeGs5MTBabHZibjkzS2x3NTZpL3FY?=
 =?utf-8?B?ZlVha2FjcjVYb3gwWURhbi95ZktaMVhteG1kc3NWVUNnSmdlU3o5Zk4xVk56?=
 =?utf-8?B?OHpsaUtBZXlBVVpEbFREL1YxS2ZqcDFHam1sZjlFRW83K2pvZG5ZZ1plZUt4?=
 =?utf-8?B?akVnZWhtR0ZyMHZZblZVMUxveDd1ZTAvVEdBeGRUdkVZaGpLMnlwaHFvQ2Rt?=
 =?utf-8?B?Y1dLRkVwdFIwZWVuN1YwQVRpTW5WNktHTjgyQkVXZ0djK1poTHBDeXYxSnpx?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be5ec61-b0de-4107-8ff9-08de38774a94
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 05:36:54.0641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HXhBhaXEz+O6y3nORZbLg0gazpjLmDxL4IVGsNRiM/9OGiMpH8PRKcipzRZ/nzAwPAT+l/dgWrmHEGnQcFaOPl9zXN+2ZmFX98t2ULnEa0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8216
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


On 10-12-2025 15:55, Matthew Auld wrote:
> On 09/12/2025 17:29, Sanjay Yadav wrote:
>> The VRAM/stolen memory managers do not currently set
>> DRM_BUDDY_CONTIGUOUS_ALLOCATION for contiguous allocations. Enabling
>> this flag activates the buddy allocator's try_harder path, which helps
>> handle fragmented memory scenarios.
>>
>> This enables the __alloc_contig_try_harder fallback in the buddy
>> allocator, allowing contiguous allocation requests to succeed even when
>> memory is fragmented by combining allocations from both(RHS and LHS)
>> sides of a large free block.
>>
>> v2: (Matt B)
>> - Remove redundant logic for rounding allocation size and trimming when
>>    TTM_PL_FLAG_CONTIGUOUS is set, since drm_buddy now handles this when
>>    DRM_BUDDY_CONTIGUOUS_ALLOCATION is enabled
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6713
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 16 +++-------------
>>   1 file changed, 3 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> index 9f70802fce92..1a819b627afe 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> @@ -82,6 +82,9 @@ static int xe_ttm_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>       if (place->flags & TTM_PL_FLAG_TOPDOWN)
>>           vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>>   +    if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>> +        vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
>> +
>>       if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
>>           vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>>   @@ -111,25 +114,12 @@ static int xe_ttm_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>           goto error_unlock;
>>       }
>>   -    if (place->fpfn + (size >> PAGE_SHIFT) != lpfn &&
>> -        place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> -        size = roundup_pow_of_two(size);
>> -        min_page_size = size;
>> -
>> -        lpfn = max_t(unsigned long, place->fpfn + (size >> 
>> PAGE_SHIFT), lpfn);
>> -    }
>
> lgtm. One thing to consider is whether this might now open us up to:
>
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6712
>
> This is likely not an issue for VRAM but stolen can trigger this path 
> and the region size there is pretty small and we heavily use CONTIG 
> for at least fbc IIRC, so this could now be triggerable. I guess lets 
> just wait and see what upstream CI says, but not 100% if something in 
> the wild might hit it even if CI is clean (or perhaps something in 
> internal). If we want to play it safe we could land this after fixing 
> 6712, but up to you (assuming upstream CI is at least happy).
>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Hi Matt A

Thanks for the review and the heads-up about issue #6712! I appreciate 
you pointing out the possible risk with stolen memory and FBC.
I think let's wait and fix #6712 first before landing this patch. Better 
to be safe and avoid introducing any regressions.

-Sanjay

>> -
>>       err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
>>                        (u64)lpfn << PAGE_SHIFT, size,
>>                        min_page_size, &vres->blocks, vres->flags);
>>       if (err)
>>           goto error_unlock;
>>   -    if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> -        if (!drm_buddy_block_trim(mm, NULL, vres->base.size, 
>> &vres->blocks))
>> -            size = vres->base.size;
>> -    }
>> -
>>       if (lpfn <= mgr->visible_size >> PAGE_SHIFT) {
>>           vres->used_visible_size = size;
>>       } else {
>
