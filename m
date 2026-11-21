Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD0E606A325
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 06:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F99gHVpC;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=doDXg9ki
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDE810E07D;
	Sat, 21 Nov 2026 06:56:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB41A10E07D
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 06:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795244154; x=1826780154;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=nKs6lrS7/vUgMT0Q8xJ5IxmxMsnAgGqqmBFFKc5N75Q=;
 b=F99gHVpCICqWR7rQYqEmv+RPrP+wTm20KfPTddfjZqwnGIOT0jQBkbgX
 H0W57BCBXIqsAJ4mImACAbk/HcknSSECH9VhxRy0kStiGQDqcSsijTxcY
 04FoOBZQHNiqENxBVNIWu+yfoXx6JwuWgvsJEm56C7LnOL2z1+WcqdJPA
 YvkZIm25IJEkxrrTlNr1leXrPVFCeUsCmZ1xzWOLTq20Pcjcl+ez8NNjD
 A2j7pVK5wuuoYQb+BuQAcmwa57VXoQBXcOIQyP0oN1XkVCGkBHccu/tNW
 PM1fYlzHQMUzNoi0eTJmTzoDrlkTHzc72eC/niiE14NatB8QZdQf87CCI g==;
X-CSE-ConnectionGUID: GmP7ZsxrRX20pd7TE7GQ7w==
X-CSE-MsgGUID: WaiSnNGTQ12bG2pfJWA+Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4152756"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208,217";a="4152756"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 22:55:54 -0800
X-CSE-ConnectionGUID: iX1ai51jSmukTr77y+0NMQ==
X-CSE-MsgGUID: BcsCoTAdRIa7BMGVcf5IKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208,217";a="12695924"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 22:55:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 22:55:52 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 22:55:52 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 22:55:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LaihVrDhAJ3V12kQc3BEx00e/uXnenlJmOEtveQQYr64qfcsmZcT8DdX+s+At/p8fvimz1zU6W7sT7hx4u9ziuC4x0k+5tIQxIAJwfnH/iresiSSSXcnIvJN0rEd2vqMrHn888kuTAIAHI2MPtbc1+7lH4vs4M/QFMbs8ebC7X5QWFuWpCs1lYRlExW6vCHWJ89kD4BueiO+lVEC5gn89Hh36IN7dCi4/Poo13pJmiL7VkWFaERfPVbMoEILW+dF2/M0NkSzEJX8qhke2xzTvViDx9fDV6adX6Dni23sV4TakWHuOGvvdPrCtWLw98wFbuBUKEeSlVa4TbrQGKsXMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h59HM/Qo0Ay3W/cACP56CZoJEwjU2pJgeACCd5jl2qs=;
 b=T3zii5VcqM5wDYLRQihhMWNI9K44U9R6ZjOjKtW+UFNtOqwS39xzV9UNlnjAmahkPlfBh4zfeccByF6dcng6zBkGmfNVzeHqmlbA5DwQNUKk2KABToZX8SeoXzVOSvYynVqX803gE7eGVT1ArGe1C2f6zLLW42XZIfMK73UY4ay+wbjDR7v8ugOlhWk0jSonT/EGTU98EHsPVLHrUtih10LHpC385AU7TpDABUco2TM/a6VGOW5uoFd6CANOE5F+Bj3vSkgJvJYhoewvg/CuxMw4vk8gkzZdngQQi25WgWMpabqdQ9IZMsG5Ut0do++Andv5pb53wX2ZVvp3FSsGlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h59HM/Qo0Ay3W/cACP56CZoJEwjU2pJgeACCd5jl2qs=;
 b=doDXg9kiV5qjTaSxjZFS8+pDrIGJo1pwjv8pGVRz8mYeKcx6Gy9Ek49vRj3dx45N2fc7oWq2lvGQNscpbPfNgwCCLa+yWtTxn7Cv1DJqWOag4/ie/X5ptcMFCp7LcjEQnYxTUsWr+S4TB1Yixfd0V9S8Qk2Q+iVhmW9nFDbp7oE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SA1PR11MB227966.namprd11.prod.outlook.com (2603:10b6:806:51a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sat, 21 Nov
 2026 06:55:48 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 06:55:47 +0000
Content-Type: multipart/alternative;
 boundary="------------p5CjRoywTW1r46KkSDjHcBYH"
Message-ID: <3e63b622-21ec-41eb-beb1-cbe37d062d14@intel.com>
Date: Sat, 21 Nov 2026 12:25:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] drm/xe/cper: Emit software CPER records
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20261119060019.2031897-8-mallesh.koujalagi@intel.com>
 <20261119060019.2031897-11-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261119060019.2031897-11-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: MA5PR01CA0136.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::19) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SA1PR11MB227966:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e878b8-244c-438b-ef36-08df479c78b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|4143699003|11063799006|56012099006|261021121427099003|261022113327099003|261022105027099003|261009223027099003|261028144727099003|261026140227099003|261102123227099003|18002099003|22082099003|6133799003|8096899003|3023799007;
X-Microsoft-Antispam-Message-Info: FN+eUemnlInykzS4RnhaY3mvjZ+1qZYy8b+ELr/0ppftG4Ds89Meo1JHqCUKRNeqU248Ov/bhAYhSPsfjnWUsVlQfKZ42wQb5SbRg37Ex15SouikrC7bb7wgaHAoNWBw+0TuKsCgJgucv+OwKl0bEVQtmOsxFuGSVZcyJ/kdrm25HD2yjjp4o3o1GOXL7M54H+Ia/+QTGNChEAE2K+ADhiR0K1FWkD2/bLVxUgRZeVaeovOuHFB2VAKehBum6klhO58hZLoEA38mED0B97l1qGtyTbt1jkENeyRozDHAE/B5JQytU76SsHpW/mbh1xBFZo1LuZkZUvlYNx6f+1kwfPHrzel/BFKPULma5yZ7nKFc5vGqCbZ57TiTK6LWw+4TbwUl7MS/GACDd7aM/QVou+v+Ckv5Yo6h+bEdXU/Id5v8LxVlrBiKpUbp4rtC7oa2zYGSCDvhCVOOFA+Ed1UA+k7JXzDzbyahjeZLTBhm2RFPskrzVQ6HNNM1hUx9y+ETHzm41WyhxGNJG2zsA+KNFdR/7Iu8VSlhYLb0T34vx1jWj7fxflFgzLKYp9suPM8EF5vNIKIISxQ/ygE+hLz670PLAWeqN0aRBANNBUeM/Yg4LXtcu3LONveEbLO4Ih7sCG/IcTxWw2v9yR4QaTzH0hToGzZ6wHRxOvkJXfsJips=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261022113327099003)(261022105027099003)(261009223027099003)(261028144727099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(8096899003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzBWS0Y3c0VJWVJwb01UVUJkVWlaZVd6R2RYYnZvbVVhaDJWYjcxUUVyNE9q?=
 =?utf-8?B?bkZ6am4xdEU4TUNHaE1Va3lrLzYwRUN2cHNHVDlHZjVxM2N6UlRFZXFGaTZW?=
 =?utf-8?B?YXJwdzRpZXlEc0g2R1RlRTcyY3ExTWZHeStPSjlWVUFmTE5GQmYrREdvenN4?=
 =?utf-8?B?UERGQk02WVdhYzloRVJBUEx0bUNxaFVxcUtNaGhUcGJ6cWpKL2Q2UkJiWUQ0?=
 =?utf-8?B?R1N6MnllQ2Zxc1hWYkZXV1RmQk9JOGc2L2Y1Wm9NdmRENTE2NzhwMnpwbTJ2?=
 =?utf-8?B?a1d4ZUhEZlgvQ08vSDRtS0JUamFIc2xIQysycTBRN2k1VWhrN2lBRHBZSy8r?=
 =?utf-8?B?Uzl0OFZWcUxSb28waXE3MkYvNklIYmRJKzlqSldOblVLaFo4bHhzbHlocXN6?=
 =?utf-8?B?MThITjBtaFFqSU5XUU1BeE9hZUNMVWMyd2h5SjQ3bG5lY3lvUm02aFRJc2FJ?=
 =?utf-8?B?TmxzVFZvUDlncU5jS0JNK0tUbGdlMmdwekZzTDJRdnRrdUl6YWE2dUtUN0w1?=
 =?utf-8?B?T0ZoYzh1M1hiaGVHaVBuZHFxeXhVbUxRemwrTmNML0hReGxsWGlqbVYzMHZS?=
 =?utf-8?B?WFJSNXp0ZWNtZDhrL1ozaVZjMHhqcVNyYXFFUFczK1NJL0hPYmJnWjFMRGJI?=
 =?utf-8?B?b2pRZ3NINGpXdS82UjQ1S204WHMxV01sY0dqVUlLNDExN1ZKdC9wdjF0V0ZW?=
 =?utf-8?B?U2JRTm1Ia3VLWXI4ZzZHQytBOXhPeURwSXlVcnpndURSZ0wrVDZnRzQyMyth?=
 =?utf-8?B?ZUVZanZuOVRCOE5ROTEzTzNsVWVSZllneGQxR1o1dVdmKzl1WXZ1Wms0QVVT?=
 =?utf-8?B?ZkNvMUZKUW1VM2tGc0VJNXlFanlWRDNFUFhBN3R1amM0SEJjQ3ZUMHUyU1VH?=
 =?utf-8?B?aXpEbS9mc0p3V2VEWmQ0WWtTV0huZm94TVZUUzRqZmtsQ2ZJd0htUnBXTk8w?=
 =?utf-8?B?dm5ZTjZIVjFPNGFDMFJhY0VMN1dPTmN4dkZuNklqV2ZWdnlHbUlYS053ZGdy?=
 =?utf-8?B?V1FJVFZ4ZnNHOW1yYi9md3FaMXJnMFprQlhnN1NJNlB4c09vcUFtb2tqTnlw?=
 =?utf-8?B?S1dKQlN1ZG1mQlRSSGl2RWsxeVZ1OHJQblRuazRiWThUUGhtcXNBVmdlV1N0?=
 =?utf-8?B?YVFqZnJyNVMvS1ptUWtCNlR6Tld3L3lDa0piKzJydCtxbnExT0doZHRIWkRD?=
 =?utf-8?B?M0hGbmlkZ3U3UklkSVV5cEE3UkxzYUJNQ3J6aEpCc2pVTlRSd2xyb2c0ck8y?=
 =?utf-8?B?VFNxT2xiY1IxMG5pSVRjdzU2OFBwYlNsQWlJYXZrNDdyc1RQQXp3SWxZTkJL?=
 =?utf-8?B?cjQ2UW9IZFltS0F1NlA0Wk9xcmRyRGl5V3JKdlRwZFYvWGJTNXdtZmw4RUdi?=
 =?utf-8?B?aUxjSU9sSXVNQ2RlQ2U5dS9JQUZ5THJGdFd5eGVoVlNxeEJnQ0JzelBRU053?=
 =?utf-8?B?S0VuRUNPcWVWVWZrd0pzR3A1YmVoSElmcVVDekFNcVdhcXpteXFsYzJENE9O?=
 =?utf-8?B?d0dBd3ZvRzNlb3c1QmFoc0dyNHNEU1hGR0pEcDMrOUlIQnpCK0dGVFVwdm5N?=
 =?utf-8?B?TTFNb0hGMFd0UVdFNVNIMVJ4MjNFYzlpcUlweVlLOFFjNkc2RXc5OE0xM1J5?=
 =?utf-8?B?MWE3eHFxcjZFOVlmcHFsV0R3K0M1WE83YkhJRFFOL25FU2R3UTFlYlBudGlt?=
 =?utf-8?B?NnFZV3JZRTZGN2lmSGJpL3o3ZzMvZklHWFZ0czJtTFRGOTFsQWhTWS9ZU0sy?=
 =?utf-8?B?RFZSN2NZdkZyT0dKZEpFZXJQTFl2L2JuRWxIWk1aUUtSNzV4TGx5YndFZ1Yz?=
 =?utf-8?B?Y05wdGZjSVlMd1RBK1FpdWdUZkRVcTMwd3lOUUtMZitlTmg5WHpTUk80eCt6?=
 =?utf-8?B?MDNqSlV1b09SYkdjYjF0aDR5TFUwa1p5SVlZMTM3SVVyRGRBT2ZmTm5yL2xH?=
 =?utf-8?B?anExdGgxUG13eHRFOWFKSUVOTlRTMzhmeDk1UlpTdGFrV29Pb3R4UzQzYU13?=
 =?utf-8?B?aGhaK2Y2aVpPTkRuSFkxZ2MzMzRBRll3eUFSMlJOYUJzR3ozTWpIZTF0K0lq?=
 =?utf-8?B?QnBrRlR6ekJsR0RqSVNOQjQ0L0EwUjFjWmtLT2VGQ0hlZEIzZVhjNktEdzZL?=
 =?utf-8?B?MHl0cWVDT2wzSVNOdEJkb3YyTWRiK2EwdkRQRm5wMndvOG1pQVJjQ1lVRmRS?=
 =?utf-8?B?MGZ0ZnJCL044bnNHZjBiZTVtVEszVVpCNUtraWVrSEpGOUkwNy9rYVE2RnVz?=
 =?utf-8?B?M2ZxS3pTcGNsZStmL2lLTFpvcDUwajBISmhjcDgzREc2WVBBRERTdWt0ZEdu?=
 =?utf-8?B?eDZ3YzYyUXY0a1JlZXRic1ZBbERMdnVCWWN4M0tKamQrdlBuWEJrUT09?=
X-Exchange-RoutingPolicyChecked: mHfwZfnPL40AQBBe5MaxEdMndlH0h8UzaLbg7Uz8RteEmXom9UsKlFcRBWDrUDWWrGb84aFaYQc/pzwzrxCzR5sY7BE+jBZY+STb6+ipdhr14difzxi+jAKE6BkII91AA8XH/8Jhp1+Af6r3sWUMu3oAgNb4QwvnYYwlyup9H6AesTqBvyCj7tMj6UekfYrRegaV+CmBi6DF0R+6dKZw9vcp4hJtG55RZAGVZVVk+NxdBVPQeKKFzc+lfDjLqLd/EZWWKDdef4pgO8GeP+zxbCUuL57MNtSLTrZTOpv4d++c9i9XS/yMdlrwheU5iO3JBX5g5pWZMUyf3X3XVQCr9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e878b8-244c-438b-ef36-08df479c78b9
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 06:55:47.6801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOo3Gk6J+lsr36Xwr2y+24uJHrqmXAWKuqerpicUtdx2oMe4yru5OcZJUEZYI+9XY+2QuFmjyslcmY1dzMEbhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB227966
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------p5CjRoywTW1r46KkSDjHcBYH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 19-11-2026 11:30, Mallesh Koujalagi wrote:
> Emit CPER records for software SIGIDs and attach the
> formatted log message as record data.
s/record data/info data/
>
> Cc: Badal Nilawar<badal.nilawar@intel.com>
> Signed-off-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
> ---
> v4:
> - Emit complete message. (Badal/Aravind)
>
> v5:
> - Move initialization closer to use. (Badal)
> - Warn if CPER Message allocation failed.
> - Emit CPER record header without msg if allocation failed.
> ---
>   drivers/gpu/drm/xe/xe_cper.c       | 10 ++++++++++
>   drivers/gpu/drm/xe/xe_cper_types.h |  4 ++++
>   2 files changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index 4cb83896c6b5..558f58694511 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -258,6 +258,12 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   	struct xe_cper_intel_hdr ihdr = {};
>   	struct xe_cper_driver_error_class *driver = &error_class.driver;
>   	u64 timestamp;
> +	char *msg;
> +	size_t msg_len;
> +
> +	msg = kvasprintf(GFP_KERNEL, vaf->fmt, *vaf->va);
> +	if (!msg)
> +		xe_warn(xe, "Failed to allocate CPER message\n");
>   
>   	driver->error_type = cper_sev;
>   	driver->error_component = component;
> @@ -265,8 +271,12 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   	if (IS_ERR(data))
>   		driver->cause = -PTR_ERR(data);
>   
> +	msg_len = msg ? strlen(msg) + 1 : 0;
>   	timestamp = ktime_get_real_ns();
> +
>   	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, &ihdr);
> +	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
> +	kfree(msg);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
> index c9ea8b1694a9..88a83ef86b23 100644
> --- a/drivers/gpu/drm/xe/xe_cper_types.h
> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
> @@ -40,6 +40,10 @@
>   	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
>   		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
>   
> +#define INTEL_CPER_NOTIFY_DRV_ERROR \
> +	GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
> +		  0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
> +

With a comment addressed:

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks,
Badal

>   /* Section Types */
>   #define INTEL_CPER_SECTION_ACCEL_GENERIC \
>   	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
--------------p5CjRoywTW1r46KkSDjHcBYH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 19-11-2026 11:30, Mallesh Koujalagi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261119060019.2031897-11-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">Emit CPER records for software SIGIDs and attach the
formatted log message as record data.</pre>
    </blockquote>
    s/record data/info data/
    <blockquote type="cite" cite="mid:20261119060019.2031897-11-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">

Cc: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
Signed-off-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
v4:
- Emit complete message. (Badal/Aravind)

v5:
- Move initialization closer to use. (Badal)
- Warn if CPER Message allocation failed.
- Emit CPER record header without msg if allocation failed.
---
 drivers/gpu/drm/xe/xe_cper.c       | 10 ++++++++++
 drivers/gpu/drm/xe/xe_cper_types.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 4cb83896c6b5..558f58694511 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -258,6 +258,12 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	struct xe_cper_intel_hdr ihdr = {};
 	struct xe_cper_driver_error_class *driver = &amp;error_class.driver;
 	u64 timestamp;
+	char *msg;
+	size_t msg_len;
+
+	msg = kvasprintf(GFP_KERNEL, vaf-&gt;fmt, *vaf-&gt;va);
+	if (!msg)
+		xe_warn(xe, &quot;Failed to allocate CPER message\n&quot;);
 
 	driver-&gt;error_type = cper_sev;
 	driver-&gt;error_component = component;
@@ -265,8 +271,12 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	if (IS_ERR(data))
 		driver-&gt;cause = -PTR_ERR(data);
 
+	msg_len = msg ? strlen(msg) + 1 : 0;
 	timestamp = ktime_get_real_ns();
+
 	cper_init_intel_hdr(xe, &amp;error_class, timestamp, sigid, 1, &amp;ihdr);
+	cper_record_emit(xe, cper_sev, &amp;INTEL_CPER_NOTIFY_DRV_ERROR, &amp;ihdr, msg, msg_len);
+	kfree(msg);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index c9ea8b1694a9..88a83ef86b23 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -40,6 +40,10 @@
 	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
 		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
 
+#define INTEL_CPER_NOTIFY_DRV_ERROR \
+	GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
+		  0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
+</pre>
    </blockquote>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>With a comment addressed:</p>
    <p>Reviewed-by: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a></p>
    <p>Thanks,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:20261119060019.2031897-11-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">
 /* Section Types */
 #define INTEL_CPER_SECTION_ACCEL_GENERIC \
 	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
</pre>
    </blockquote>
  </body>
</html>

--------------p5CjRoywTW1r46KkSDjHcBYH--
