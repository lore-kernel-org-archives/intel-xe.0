Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97E9103E305
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 15:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCFD10E458;
	Fri, 13 Mar 2026 15:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QUvgs17m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D011110E458
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Mar 2026 15:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773416232; x=1804952232;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3XAvoCPTDAVLuMtjxf5p6N/lj30vFRxz6EUZqWjb0Uc=;
 b=QUvgs17mJsDrvaTi4+pJUaq5wvYQNJd8Zx0aiCarK6nKdYCi4NJahPtd
 di/30gtJwKdxTAUo3FLivsBceXFgXh1h9Gss8F4a1Je7SeH1mMCgFF0kd
 a0edImxch/ZNvc61j4oeTo5L3c6lmh1R84euZt5XeCzIw1uhCKEbNyeE5
 ih0laeo/1s+gFKD/SSEQG1iaajrEGYym+usQfGzLaRF2pSuX3TcXljNrH
 FSQmcjbxdC4tsrW9OLxNxwn8B2y3aMnimw5K0Z3Lu1sGGZyXW4Zdq9KWk
 UOYYeOsZPOGZbOmDVm5pW1RY8MCtZz0QhgiMh2UBi8yg/bC3RXLWP7tdn g==;
X-CSE-ConnectionGUID: oMFOwEIOSqeB5SIpppI2JQ==
X-CSE-MsgGUID: yV47ZM2pTdyvcwVKcXsAKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74419380"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="74419380"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 08:37:12 -0700
X-CSE-ConnectionGUID: Av1N3/o0QgSqwPtZd+Vo+g==
X-CSE-MsgGUID: 7O10QmEEQyiCl35hJMIYLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="225655546"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 08:37:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 08:37:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 13 Mar 2026 08:37:10 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 08:37:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tw7+HCOAX8Zl+4/xuJv9rRY3mB4nB7u/3485RbEc4hvQRM0ZgpyjBzy0HL/QadVb70+hNBsBJrVvfX8miuPaeu9qZS1OElDYKZqw0yjvNEUWq3dwOuhXWiyP3VpHB4USDkMqbo0QpxhqeUDwmb2IE+R/ph85PYlvcHOVTQfQ5qvDdY+cyU38eP5FX5Mi30Ebtpu5/LsCB1xGwN2dgU68mQv+bzZTuumkZmezppTuNoyDEllaTJKRIRUFfy1sYs5gCBmFcLwhO3K7a8M+x2M38dJljMOM3ai5mGW6o/73eycHFKhMXHjQ5CRNpC4oAviRNwlY1KDWWIsHE23YLPhwbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgzuAxAC16n9INMvsbCwkYnQ26WW3xLHtSXpn+GsURY=;
 b=AzqiwLP3TfFMtO25wgSXCWqxbv/kULpK2j+5/a48bD8Z2LvNsMLrKUdM3Zcjvqbpp+mToInKmfr7g/5+uKSgI64/2EKXB1LWVZNmoYwk5MQNnMOc/9E4fCkPzJ+RVrVImX4f3YvQEjjMXbo0/zh3zN6620CGTSpgjyKrYKEalslfEc+1tRzNGbE2z/A8+4tK3HfbEUJDalJHzW03rh7d9TyX99g436Aftrohf1W6hAmUKUlyDaaRoqvtHj/koIwOIn+08+6IR90h3IO0oYWC2SpWo0bYT/cKDy2UQB74ZNe1U27q8/wUKsdV+qMsw2yCFJZZo54OABWoMD6YKWoTxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CY8PR11MB7945.namprd11.prod.outlook.com (2603:10b6:930:7b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 15:37:05 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414%4]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 15:37:05 +0000
Message-ID: <91958e39-1ad7-42e6-b4d0-86e2fe38ca30@intel.com>
Date: Fri, 13 Mar 2026 11:37:03 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] drm/xe/guc_submit: Support cancelling submission
To: <intel-xe@lists.freedesktop.org>
References: <20260308135536.3852304-1-raag.jadav@intel.com>
 <20260308135536.3852304-4-raag.jadav@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20260308135536.3852304-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:a03:333::15) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CY8PR11MB7945:EE_
X-MS-Office365-Filtering-Correlation-Id: e3226f99-f9cf-4d34-ea24-08de81166115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: NZxZ7A+wQYVBDb8rEL/Yb3Da1og7Tlwrg3FIq9i/3Pf17Ut791YdsTudg1zuERqoSrEVcFXy3vJs6vXWzAPYArLS9omlh5OYNTjSn6PSqT65x6Du3XXjw96ssDDA72phjNNqxjDbwGffFypIhrqVec3yiXLfMCGqm5ix2cYiS0xpud8+tI2voLxEkfpR3KJhYUOkKX/enhaqU0UtndM2GBAYYVVJ3qB5UOPu/qqXSRksyt1LcUUw83IFmWbPfVu8RrQN/c9Gw9Vz3afbbuHv8mqw7s+ks8K1W5b1oe/6LzgD6fxfie4mFkZx9ToMduMVsi7atKlxr3ABKJ/vNOhC3ssbD1WxqO9fU4jl4mz0EG8CDs46A8DoYptg5F7HV5PLiGPssPqYkRDO+Jwk16obywy99/0G1r4+b/dDC75FvVeGi7bz02tMLQ3ZZYhFMT0sxUspe8cngLEV1pSA3XZT4DWAcXfMFs3KQ7O6C5l/UOBEfNirWLqyCnXdbQSWM5bfYCflbO3rPV/qvVFuIGzzHjtr3fII8xn9Yi47BU+mNah7I2f/dwR7DovjgWu2cjg0ro320I2S1F/hh/rVZhCL7D8j09ySzmrSaL1bljLUnWSUp7nWgcRCRwMyBFSwo/JcGZDzMCzGsmLZeU7D0Q68AbpWiNaDNThoKkVL2lSolCvCYZ3HgnnCa/KIm5CsbarXDPcBR7nMAVVvNEEHgF3KmVCYmpHE9q3RQI8M/gFWNks=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OU5BbGNSVm94d2g3dUJDOTQzUng4RDRCeWRRUC9VNExxMnplRVE3eGkvQTlM?=
 =?utf-8?B?bVZJbmNjbHhHRC9sQVpodmlmaXZpeWxNbndudXl1RENHandUbCtFS25qbGtl?=
 =?utf-8?B?YldDcUFGU0o1b0I5N21od1BpcVNlWm9GdzltZDQ3YVF6N3o1c3YraEtTekNI?=
 =?utf-8?B?b0J5Rjhna0g4cVRIbEZhQ0gxTzFtQkdQb3FDcXFQekthNzBNU0Q2UmpwZU5m?=
 =?utf-8?B?a0I4RnFLMjNQRjlqTkQ5bmluU2Z2VDcwSWJaVHJtcVh1ZkFaNEFTK2ptUzJl?=
 =?utf-8?B?eUplNjI5N0pRMHB4Z1NOM2RNNHlSazdUaVdlWXB4TEEwaTc2MS9XVUtKOUVi?=
 =?utf-8?B?NHp0d2F4c1o3OW9BdnJIMnI0VUtLd3BmdFdDVU9SaWJBcWdBNktHSldMMmlv?=
 =?utf-8?B?WGxTQlk0QzdGd3FsbU1pdlBNbWpsbFdBb3BvcHkrWUFOM290SytuQ3Vka2Fx?=
 =?utf-8?B?VFFIVzF3ZHduOGM1VURnVFd4ZFJSOXZsZTU5ZnA4aHdtT0lZWTNKa1BVMjJu?=
 =?utf-8?B?Z2NxMGR0RFJTcTMxRU15eGNUeWZjcGZ6VFVwYlVQd3pORDdkRXl3cWpPNnJa?=
 =?utf-8?B?QkNJYU9iTlRSSFM4d1pDNXVOeGQvU3QrVFdTVnQ2L0g3OTF3cjZTcEt6SW1C?=
 =?utf-8?B?Yy9ZNXZJUXo1b3hWODl5bXpVanF1UUJLajdjaFU1VHJWUDhXQ3h3L2hKNjhi?=
 =?utf-8?B?S1RvTDgyako5a3JCK0hmYjlWbnpkNGdUZXpOcjVIL0V1RTdwNGxDbWM5aER4?=
 =?utf-8?B?a25RS1pKSzA4WE9wbTRNMnNmdS9RTTErS2JmaVRXa2hIUXl3SWxsUEYyY01F?=
 =?utf-8?B?WVhoSHBTd1RTT1o4RXZPTThJbzhDMFJsOWlBRDZGdUkwWmRxb0lBTS9Ld2FM?=
 =?utf-8?B?NmJpSzA5KzN1L3ZOcy9PRGwyVVNjdkQ4UE0vdys1aXM1WW9SSVlYR0FhWnZ0?=
 =?utf-8?B?RzlHY3dEZlF2dXJGTGZKMGs1YW0ybG8zNjRRVEpYUmV5ajZEVE14aXNhZVJt?=
 =?utf-8?B?dnA3S3JtN09VN0c2cWplbDBnb2RzS0pSTm53OWhyZnNXR1gzSVl6TUtIdm9M?=
 =?utf-8?B?ajNZa0NFb2lJRzQrNWVMOXdYRkdDZEdCRjZ0YlNscTNQdEloYW04TnF6TGk4?=
 =?utf-8?B?T3EweXVpbDQ1UFo0MFNxajE3RisyQWJNSlQweUpqTTlNVkovVktFRjJ1UWpU?=
 =?utf-8?B?azNSb0dnbmVFS1p5YSt6K243d01yZmF0ZHhoeVFhdkgrQkZjU1J6S0UrOGVH?=
 =?utf-8?B?dDBXQUYxZmtvci8vOUZqYXA0dnQ5Z2F2eDMwdGZ3WEZ2SDlnbEE5TmFaKzAx?=
 =?utf-8?B?dmlCbWZwU3I3bzM1WDM3TmRDR2s1TzFOLy9ZemE3ZW5KWkFJQVZCWWpzNVN2?=
 =?utf-8?B?TFMxQWNjaVJ1aFBkVEoxbXRxODFNVytqczVLUzVKZVhUVjRsSUx6Z3JkRjBa?=
 =?utf-8?B?cHZVSzhFNHNtZGVnd1d4ZDFVTUI4eGhQZUlUeGpWODZEQzdvZldkMDVreTRi?=
 =?utf-8?B?WnhHd2dRMVlCSXBNdzZNd2s0RHlESUJRVHR5SVhrODF2SWlRUGwrbVdReklo?=
 =?utf-8?B?by8xK3dHclR2czY5bytVeUdEWGIveU4rVFdDRXkrdHk5UWtndy9ocG9EMFR1?=
 =?utf-8?B?TUV4T1U1MkVoUC9IYThrZnlkZ3RTenlDcitIVVZ1bkplUmtPVWluME94aXVS?=
 =?utf-8?B?dURvTFhrbVkzY1YrVkRLUERMSkF1Y2ZYR0djZVk2VWpJSUtmWkJRQWx2c2FC?=
 =?utf-8?B?TnhJN2dnY2FBZFVoNk1JUTk3aVRjTDlQRFczdWowZEtjTW1HVGM1VVoxaURx?=
 =?utf-8?B?RTUvUnZZeXJUcGVtNG52ci9kd0t5QUZJMUsyb1dIT25rU2h1Q05JNlEzSjJ3?=
 =?utf-8?B?aCtwWEdNT2R4ZXZsMHgyT0UzcUd6SEF4Mm9jYVQ4UlhkSzU0V1dsSTUva3hR?=
 =?utf-8?B?SFdpWXBJa1M4eVZ2SFgxMHFZTDZybXgxcU9DRk1qMjA2L0dFeUF1OWVYNnVJ?=
 =?utf-8?B?bkZ0S1RMOGc5Z2tHQ1NOVEYxbWp5WUVFN1l2ekU5QWtZWStHTEo3SWhQdzZI?=
 =?utf-8?B?T1NPWnVYSDVRekZXT2tNWDZsY2c0ZXYzeGRNZ0VCUUkrMFQrendpN1V1TW90?=
 =?utf-8?B?Nlh5WW80b1NnTWsvamFKRUd1S3FrNHFvZ0V4RlZSa0VmbFRJTFh5bnlKaGFn?=
 =?utf-8?B?Z0NoVkZGZkxrMEg3dDZDYlMrc0pmeFIrY0NQMVFIcDErOW1YdWhqVUp3WUtU?=
 =?utf-8?B?Q3Yva1BJTlhRMVpvVEw2aDJueFAxTUl6emh2MjVkRFlHdTFGM3pjYjVJMEFw?=
 =?utf-8?B?dTB6cnVnWVF0d0ZTeHpWbGdrK1hHSWtsZ3RKc3U2dmFYUW85cXVEQT09?=
X-Exchange-RoutingPolicyChecked: GgADPdQD2dU9KapAW4B5Wc0wCCL2I8TnkqxHGT+OLlQH7u56xSDIDZuJU/Uzd9OA/6Ok1g21Zy9f3Ymp6cyT0QS6zZ125KgNt9VQHSI8qf3H2Ime0ws2rJzC+aX1gO/3/X/dhsVlPKjDW9G5PdeYbtjTSyLskoEq4A5pBm9+jkqVUXl+8gsa7n+PAucQnv0MKV0AIF20diPl2tRvZSv71fsA7wypzDotlNzeRwsdtu9n/UCIVWbmMpJGuNhxSXqFX9Pr+h3EaZUcZKZNvUpM5wshFF2XY0dEi4pYox0DIh45j1iaWJSqxWTs9AxV+WbcNPQBdFJhod2PcQyhlw71LQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e3226f99-f9cf-4d34-ea24-08de81166115
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:37:05.4570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiiO8nwoZKuQLT8SmabStIGFMv6kKu88uOvsyKSWrf174wkd5LZ9Zqcb1H04cnw8Vxt8Bqj1WBt+k+FkZnTsgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7945
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



On 2026-03-08 9:55 a.m., Raag Jadav wrote:
> In preparation of usecases which require cancelling submission before
> PCIe FLR, introduce xe_guc_submit_cancel() helper. This cancels and
> frees any in-flight jobs on the scheduler.

Could you put more info on why add new cancel functions rather than call 
existing xe_sched_submission_stop?
 From commit message, it looks very similar to stop, which also do stop 
+ free action.

Regards,
Zhanjun Dong
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v3: Cancel in-flight jobs before FLR
> ---
>   drivers/gpu/drm/xe/xe_gpu_scheduler.c | 11 +++++++++++
>   drivers/gpu/drm/xe/xe_gpu_scheduler.h |  1 +
>   drivers/gpu/drm/xe/xe_guc_submit.c    | 24 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.h    |  1 +
>   4 files changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> index 9c8004d5dd91..c012dbe84540 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -90,6 +90,17 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched)
>   	drm_sched_fini(&sched->base);
>   }
>   
> +void xe_sched_submission_cancel(struct xe_gpu_scheduler *sched)
> +{
> +	struct drm_gpu_scheduler *base = &sched->base;
> +	struct drm_sched_job *job, *tmp;
> +
> +	list_for_each_entry_safe_reverse(job, tmp, &base->pending_list, list) {
> +		list_del(&job->list);
> +		base->ops->free_job(job);
> +	}
> +}
> +
>   void xe_sched_submission_start(struct xe_gpu_scheduler *sched)
>   {
>   	drm_sched_wqueue_start(&sched->base);
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index 664c2db56af3..ba7892db8428 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -19,6 +19,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
>   		  struct device *dev);
>   void xe_sched_fini(struct xe_gpu_scheduler *sched);
>   
> +void xe_sched_submission_cancel(struct xe_gpu_scheduler *sched);
>   void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
>   void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index de716c1fb18e..cba544cc185c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2399,6 +2399,30 @@ void xe_guc_submit_stop(struct xe_guc *guc)
>   
>   }
>   
> +/**
> + * xe_guc_submit_cancel - Cancel all runs of submission tasks on given GuC.
> + * @guc: the &xe_guc struct instance whose scheduler is to be cancelled
> + */
> +void xe_guc_submit_cancel(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	mutex_lock(&guc->submission_state.lock);
> +
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		struct xe_gpu_scheduler *sched = &q->guc->sched;
> +
> +		/* Prevent redundant attempts to cancel parallel queues */
> +		if (q->guc->id != index)
> +			continue;
> +
> +		xe_sched_submission_cancel(sched);
> +	}
> +
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> +
>   static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
>   						       struct xe_exec_queue *q)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index b3839a90c142..f361a6d32fd3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -16,6 +16,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
>   int xe_guc_submit_enable(struct xe_guc *guc);
>   void xe_guc_submit_disable(struct xe_guc *guc);
>   
> +void xe_guc_submit_cancel(struct xe_guc *guc);
>   int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>   void xe_guc_submit_reset_wait(struct xe_guc *guc);
>   void xe_guc_submit_stop(struct xe_guc *guc);

