Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3D2CD6E55
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 23:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DE710EA59;
	Mon,  1 Jun 2026 23:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJFeMsFb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6779010EA59
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 23:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780356015; x=1811892015;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YyuwD7vR45t6VkEJLRaQEkjmLowRn1P7kiSQnRSDwto=;
 b=mJFeMsFbh4QUwexkCR62WQDpV9KONJxf1huYHZehFIYf3BPg7+8ycCNm
 A4FP2HtNgcvrpYSDZvSeezxOd0QY7Vd0/aZ3gZvade0fLy6jRVAQoA7J9
 W9GdrWMEYa4RqDM803HA0pHCkzAbg0i8sfLMsmx3u1gZmdX9h/jCjJvUB
 X+aKTwO9Nrd2X5rr0/952QpK1TqBS26lpN6CIBRULvl2iKlFp1j8vvYh2
 cwg+kOtQC+At/QWFKjJjoCHah1bmc0sZ9pWIaslPbSB+AgZKFdcJ+v+V1
 10ZmeQnQZ8/k980QfNWGD6IBqD5mfWQoShs9HP/9WCzBoeWaGaRBqTuYg g==;
X-CSE-ConnectionGUID: WDrz4VVpSTa+1+Wg15cjjQ==
X-CSE-MsgGUID: iDUanG4WQ7S9JB5p6ZeqTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="106574874"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="106574874"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 16:20:15 -0700
X-CSE-ConnectionGUID: 8KVXu1FeSveur/btVNY5Jg==
X-CSE-MsgGUID: wOK7qLIwQ1SNRiLs5GhWwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="240722511"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 16:20:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 16:20:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 16:20:14 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 16:20:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXrQ1fEWoo7a2OUwYdVFWAMB/fAWw3RuKzPUW7o5ymKjlIbExFkWhwOmdLTK9xuNHFGPoPcH2D731qyVNgdcsn5oGI9uGx+Xhgla1ftseq40WlcZhuqgYgjeym4Tszc9+6+deKc3sH5KdcHnXbxxZlLzpEHsUGxN6kfUgihXs17rP76HemmcFpEqz+6JMMXSlwYTuwYq3joDy0umnXpnhHDLwqJ9qMMWOkTIAniKN8CXDLL9TQdyYNGxQ7cGgabBbowg7avuZJbK5jSoggf6lxyBugiAUkgqDws4OEQxlbNc2o+pwoH7aUiL2VITCZ6xTYOnbJkodew7X+wHme+pmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEpmGQ8PPew7ku5wo+bdq7ZIrvJS2uAxcyFkixHpY+E=;
 b=DBgkuhrJDz+hp6IPpn/cAlbWseWnWDRMGvR41HYAoO9PfO7cWKf22zFcds9SXI490BgQUbLG4O58sTIHEU+l4ghZj2ab3HZOlmImI+A11c0jSBj0IZ5igpVY0XUKRW6U9prSeHbGr6cQ0MXVFOOynrpsaFcV39IgOlU+sJGZ9flFlEUf6m6gy147rx/NIq85y2Dfolzx2XUeyVnXhbQQC309oAaSRHTLiGQHvM3lYoP2Pd9zwGQUilJqYNfINu0jxdV9e6CAx3FvgapCDVtmDZBMUtRXOeGJtQUoiTr41bhvz8lMmX/B62pjCTsmb2EiSnmu7KN+14ByR2J4zXbp4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CY5PR11MB6512.namprd11.prod.outlook.com (2603:10b6:930:40::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 23:20:12 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 23:20:11 +0000
Message-ID: <66dafe9c-fb46-445d-b8ed-f5e9075294c5@intel.com>
Date: Mon, 1 Jun 2026 19:20:09 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe/guc: Reduce GuC log size from 8MB to 2MB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260511194924.2016315-1-zhanjun.dong@intel.com>
 <20260511194924.2016315-4-zhanjun.dong@intel.com>
 <cf526083-efe8-4e99-98a2-7c35206c9d74@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <cf526083-efe8-4e99-98a2-7c35206c9d74@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0049.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::15) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CY5PR11MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fdb07ad-bcb3-4d70-306f-08dec0345426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|6133799003|18002099003|22082099003|4143699003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: 08S2QMDybQ97+a/JdDRHVR8fs/wp62c+ScgHg0Sl7G4TxAhfyux8KYM2hwQABTZn8pLQpJrI/fF/bx64JjWCYGF+mX5mRB3J363wxR11/+NLyOgyvpVNU+Y1t7pQHzeJTxrXBiX0d3L+JV+/ETwxQoLXdS4D5Z1G+AZ/BaXbzqW1O8TW7LFvv8q7iuyT0D4mMMO8qIIhk6I7etw/WPDGWcY/FC5shwlttjkUtEETIBK5wgkRkVk4M3FGLcNh/AsBf918STroho3bUli5AYjA5t7l1zspALOlm1x0cy+0t+Svumd1/ufeBhEROjJ5EDYIZLvS9qL4D8gwYuEmBUi0p2dP7f8j1L/WrBJ8UiMj2eB+K4te/Scu37xxIZfw/DdqBMioaUmBFcOGyNHEL3zyRWeMwd9WZRrXT4Nf4BjC0c4yZRB0NXFTWhRPYg4MSndBU8LxRtqMshfIuyyr3yHrCwxxugvaZtokVNZyh9LdBzl1QIc916hHaqfq4N4Mgdn4G69DVlBWbZFLZrKXPFTpx+AFIKlm7ov7JOLlbeQZxukyjg1jdT4GRPzZkqrOvk/WTU5jsk2w33EdLJ+6rHoGgECGTnhxrW9NjojjITcIm+maI9M28cgTB4OxfHcdOfdGO4SCX6F89S+u0YeMtM9F7R6FEklqvAw9J5XlM+uLMzr7WocHUJissYscG9G5aO7g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHhBczF2QzJPQ0pNMytuRkhWNkpuS01QRFFQeFhsQzd0M0c5SDZtMmxqb2x1?=
 =?utf-8?B?SG53R3ZIZVNEeUpqc1lRRVRkY1A4TkllNmwrbXRSYmNmVUlQQ2ltK3RXdE4r?=
 =?utf-8?B?UlF1RGhudmhBQXhLaXdiTWx2Y090V3lyNmd0QWNIZ25zMW1WMmkrc0tMNHE4?=
 =?utf-8?B?ZUEvZjNkK3RRTFRFcis1KzI3UTg2dnU2Z05KYUtlZnJyN0J5NXBBSkc3QjJI?=
 =?utf-8?B?b1dwSHgrUWlBQjFVVTd5Q0tFNEcrQkZ0M1Z5RUtSbWhncWlnaFJMK29aU3Ns?=
 =?utf-8?B?bnZqdHlIck84a1JsUlFZU3kzRFIyWGlLT25YMGpGVGM5RmNtQmg5cVlTOUxz?=
 =?utf-8?B?TEszMEdETUk5ZHQ4OVBqblVwMkN5RUJFOEhOUEd3dkF6aXp3MW1rYlRiUjY3?=
 =?utf-8?B?ZDEyY3lCOFQwWVJ0aDVrUGV0VS9HYlZZeitHOWI3YWM3ZWZ1eEVQK1hHdG4v?=
 =?utf-8?B?dTE3bHlHVzhrK0pGcXROS3B1MzNZNUFuV3M1ZkFjd2dGdDFZZ28rM3BvaGli?=
 =?utf-8?B?bWxSVXJzQmcvTXF0VHJtN0RLSklPdnhueUVhOUlPTVowTGZKVXJXbkw4WG9s?=
 =?utf-8?B?b2czbVhMWVdRaU4wZk1xWll1a0tmeVVzQzJnVEVnMmtYS1IzWS9Ea1JkTDJT?=
 =?utf-8?B?UFMvOENXWUVPcklDUlZrWXRQeHY3YWtsbzQyZk5ENk82eXNEeTd3VTdHMTlN?=
 =?utf-8?B?UVJJcWo0SkVvZGtqZVNBdWhzRDN1MEFJRzJBNnVGZXlQa0I0Q1k1TFp3SWll?=
 =?utf-8?B?QURXa2pnWkdzVERJNWNaVGRHMHlaeW54czJGNVBEQ3JRS2ZSYWdDRCtDY29s?=
 =?utf-8?B?dnlRa0JBekoybHFlOUxRZWd4cVN1MjNySDZBbk9KKy9TVlNBNzJxQTJGMnJC?=
 =?utf-8?B?MjRUZDI4aHRqTFJMQ2dPU1U1bmppeVM0cWp3eEExelRsM3VJdGlmc0dHMzUv?=
 =?utf-8?B?SzNmR0RRVzVEb1Y2Q0h5aXVJbm5GeGdhNzZxZWJzRUFVSUtDUGZuSjhLR01W?=
 =?utf-8?B?U2dvMkg5VkFOcm1iSHh6bHhqQWhtL0dWZjBDa3JzZTQwUFZiRHEvNzFEUXNU?=
 =?utf-8?B?aHNreG51L3Facm42UlRkNmFiZlpmN2RWOHk0eWw0Q1hXWnE4a3RDd3d2djhI?=
 =?utf-8?B?NFRjLzFDMVBpdjdKbmlJOG5XQ3VQYmQ4Y052aEg0elljSFFzTnpRY1VtKy90?=
 =?utf-8?B?YTVGbm4rWG5idmlERjFTejB4RDlSY3JXT2xUU1A2dllxUnJITlhYV1ZaVzVK?=
 =?utf-8?B?bWE1QlZrNUZubnFFMGZhdTNUNWlZM2NlTW4wNDV4UWhYd3ZhQ0hja2xJM1Vm?=
 =?utf-8?B?UE5ZbUZEbzlhUWFJcGRMZHFyMlQ1RVJxUE5TeWJPV0NURDhlN0FralRxMjZ6?=
 =?utf-8?B?N1oveXRvN1o3bDNzUzlRRTVPRDI3eDBmSUlUSVhZbnU2ODlOVEh6UlpZNTZq?=
 =?utf-8?B?eDRGK2hPSG9Ib3dQQW50T28xYkM3YmJLT2RoRGlnVU4vWjJXczBIZlI4Y1B5?=
 =?utf-8?B?d1RMNGxIVURmZlpBNjRSU3FvUy9BWEZFOXNNeVZHcHZCT2VZY0ttQmw2UExq?=
 =?utf-8?B?YzUrUkdGUUJ0T3dBQnhvM0dxanVXSENkOFJKSE1aVHV3UzY4djVpWmRhR2px?=
 =?utf-8?B?eDZnZUFuRTAxZ2U0aDNVUlE5UU56NkNGclkzZ1VrVDZlWTlick5jbjhFVFRP?=
 =?utf-8?B?OCt3ZUpYQlNiOTJnN0RCakpZL0NDeVZEeXliUHpabm9WRXdTSkJWdUZOZ3ZV?=
 =?utf-8?B?RmVCeGVUQ2M1czFEdktGS21wODJuK2RaYWMrSW00MHc1YldNRnJIcm5Lclkr?=
 =?utf-8?B?aEJoUHBTYjJnb1VRQVhtK1Z6MlR6cjN4bERWMm5EUnpOcmZkYVBMZjM3eWJn?=
 =?utf-8?B?bi9kWDhQMW1BWlFYTjFjWHR5ZklQUUlGNmdvVUQzemt5UkkzRm80RmZFaUZU?=
 =?utf-8?B?dHFRWnVQSjhhQ3l4WDRTVkY1UzZyenQzalFqTUNTK29sNHdmZmtCNDhEbHd2?=
 =?utf-8?B?SHZOajlKUVoxeE5Fak5EUks4dnNPbzJneXN6b1JSQStSVHhFWGtMS3MvOVVL?=
 =?utf-8?B?QVFVc1FjQWlMdXYyeHVONlRFRW9sb041OFZrNjdRQVphcmY3S054bHhPZUxB?=
 =?utf-8?B?dkR4L1BlK3o0S0tIL1ZFanYrMEp3SjBoaytEYXQxYUpvUU5na2FIaDZudWhM?=
 =?utf-8?B?TzAyVFdrK1praFMxZExNc2dFSmgvWW95RjQzRVUweHpoeHlHUXRJbzdsYzNn?=
 =?utf-8?B?a2daWm4yUm5DWm5Fcm9JSU1CVGRGSEVzKzN4amRXUlkvSlFjS2x4UGxEVGdY?=
 =?utf-8?B?QytpaDZHaTI1eWNvUDJHeGVnaWgwa1VKSnNBc25FYnlMQ0xYWmNyUT09?=
X-Exchange-RoutingPolicyChecked: oDloyQJ8gRLllN+jTEGjPQXjpBS4fsZTMSgBpgBUZN4HHzGZFtP0VhqoPqzclQBfOpCWDRBvlvz/lSWv4xV+bIcWa8bGB2PNa5NG3A9eF/KXdQo0R02ukTxFPPIRj7ED1YneZT9d2PhjUnVNMaXiJevFLcoBjMsioqWnS0+6INUimYCHWSmbgRyYi5js0g2dZd9VVqOIJizmsHPq5vB25RP9R5xSHpAWhW9QrYg2ve08CiiHx4+Cvp/ooyjhRjMZ6lS3ygBMqSK/1HwQAO843epnplBsD+RDTVfuKYkIsN1sKS8iG02t7qtRiynMqoOjk+7OWJwohk35yQ3SVEiL7A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fdb07ad-bcb3-4d70-306f-08dec0345426
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 23:20:11.7885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TAg1Bghr4jJff6Ux9+9IBBA6AxB0k43DtD/RcGs8GF9S1SGeCrKRo4zZmXC06DK3pgEVEl1hC3Ka4G+uFh3MWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6512
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



On 2026-05-28 3:18 p.m., Michal Wajdeczko wrote:
> 
> 
> On 5/11/2026 9:49 PM, Zhanjun Dong wrote:
>> Reduce the default log buffer size to improve system responsiveness and
> 
> default log size is SZ_64K and is not changed by this patch
Typo, here the log buffer size is for CONFIG_DRM_XE_DEBUG, to be updated 
in next rev.

Meanwhile, you raised a good point, when CONFIG_DRM_XE_DEBUG is off, the 
log size is only 64K, looks like no need to do compression.>
>> readability. The previous 8MB threshold caused significant delays during
> 
> 8MB size was used in CONFIG_DRM_XE_DEBUG
> 
>> log output and imposed a heavy load when printing to dmesg.
> 
> hmm, but that was on purpose, as any extra cost caused by such dump, which
> should be sporadic anyway, we were willing to take just to be sure to do not
> lost any information from the too small log
Agree, the heavy load is sporadic and expected.>
>>
>> By reducing the size to 2MB, we maintain a sufficient history while
>> ensuring faster flushing. With a typical 4:1 compression ratio, this 2MB
>> buffer will result in approximately 512KB of compressed data, providing an
>> efficient balance between log depth and system performance.
> 
> hmm, such dumps should be very sporadic, already after HW/FW being broken
> 
> so what do you mean by the 'system performance' here?
Sounds like I need to add more description. Looks like the wording 
"performance" here is not accurate, to be updated in next rev.
> 
> and maybe it would be sufficient just to introduce compression without
> reducing the log size?
When MB data level to be dump to dmesg, it take long time, if just add 
code to print log for debug purpose, test shown when dump > 8MB data, 
some task/thread timeout triggered, those are noises not expected. By 
compress and reduce the size, we expect this kind of noise could be reduced.
If you think 2M is too small under some condition, let me know, now is a 
good time to change it.

Regards,
Zhanjun Dong>
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_log.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>> index d231def50692..44e81a54681f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -17,7 +17,7 @@ struct xe_device;
>>   #define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_1M
>>   #define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_2M
>>   #elif IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> -#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_8M
>> +#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_2M
>>   #define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_1M
>>   #define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_1M
>>   #else
> 

