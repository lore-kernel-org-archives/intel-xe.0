Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2CBFF8861
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 08:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C0710E5FB;
	Mon, 27 Apr 2026 08:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zio144N1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A9310E5FB
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 08:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777278070; x=1808814070;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bTyYKzkegciszLrELP2LY3VPNGLvxCXuQnZo/Trkf0I=;
 b=Zio144N1wJyc+NaffHvgBLN6yORHlYWZlj+f9Iw5rDQbvJ1Bl//uYTaQ
 TYnbQlqLBN9HQG9IhNO3NUD1grSnkuYZ9QN4fqAQm1RLsizofhatOmAv2
 ia9Yu23HszyOSMcGQYeseI5IDuWby5mTKwHKMit+j7xF1LkpylnuG/WY1
 SVxOsfC1PJzx1KxK2Yv8iL6arXf10Ok9viOli/lNfBzYII/CxFnIUADqI
 C6yrEtE/l+r6EB8tTxHxyBhdyLsfZ7vi2y5Dyp4XsH/G8lYl20B4KyZOB
 7WxhXAvP8aRTFDU0D12kMKzvr51r9r8G/8VsaaKdKMZXNYRuLs/Li3vB3 Q==;
X-CSE-ConnectionGUID: D+H8MRWARF2lQs2JvPWfww==
X-CSE-MsgGUID: T7Yg3Q1XSVm/MTJOpMWuPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77864320"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="77864320"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 01:21:09 -0700
X-CSE-ConnectionGUID: WMLASeNQQJu6Jd4ls3L5gw==
X-CSE-MsgGUID: uZES0moNSp2UgV8iVst8HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="229253498"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 01:21:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 01:21:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 01:21:08 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 01:21:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asyptBX+ABr5ckdPpB3i/qaefOZva66+XNwx/NRqu+UVqjFZQsLtrA4kG4M2fdo1Y1mh6rC5+WVkfYAn7xWXdEz6lwmREbed0RSCV/zgCSC15GFYcv33aHZMRhCDtbyAgSZO2rVWRaZ9OZhIwoS3VkQ0yjPVvnUm7QVavZk85BshWEY9AprNKPH4m0yLCeaAhvYeMq0WQK7XBYj7mFI9UOZKocE4uU0C6pTjD3hJRoSspqeURxQzDt6NIsZDzZB8fiy1JHUJp/zMkFypuYYKrOWn19Ce9zp46gy01oKXYdbBJ/QV8WP4md/gfQghfdvcTQTW1Iv0KbM4AIe/RUTgPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nkCsqYvu6gRCtKsud8EG1dUvEHYABSEJDtpaaS85eM=;
 b=iC2O3DyU/9EdQ0iYE8qu/RqNrAEcRutRbyk9fYbs7eGw2UDpBJuQiMNRRgzAH0Q4dL4Fpn0ZVhJnEOAbhoXaShDU08mdd9xEmwxe92ADeGvdloK7UU8xSROF6mgu++2ZFJn3gmQJvo1iqwvSyOGMazQdHLmzkLeV2fgauRGAYj59zptyUPH7C6hYtiHBB7hu8reoJmb2iRwiMsrm2jrK3TI6khzTC/5JafB+SiD1Ix7+B680l+eQZwA5MYXamG8+U1jv+cMfsZBTYnNLdGYOxPbPs3+2nj+SstcLKFcOLgTNqh9/w7iojpP9DwahtoIoT/2VGVH6ALAt0p9/vaKwqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB5168.namprd11.prod.outlook.com (2603:10b6:a03:2dc::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.21; Mon, 27 Apr 2026 08:21:01 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 08:21:01 +0000
Message-ID: <4b73f2c7-d52a-4654-8559-befae2ad0263@intel.com>
Date: Mon, 27 Apr 2026 13:50:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/xe/hw_error: Allow debugging hardware errors
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260402174229.1062874-1-raag.jadav@intel.com>
 <20260402174229.1062874-4-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260402174229.1062874-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0112.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB5168:EE_
X-MS-Office365-Filtering-Correlation-Id: 86097916-4d4f-4d41-4546-08dea435ea8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: rTy6yMSijnEFibP97wQbwwU5NKRD9PwNmBYakUzuOMO6HO4fgQJP9Yhh8dKeC8MQvFQJZMQ4m05A998m2yYCwrjFyAnEl9jPLi0BPN57LYFpbm/MgP8jTsnIwewRRPYzSxdxRFqcEt93kLQ/Gt2yN3QSWswHF2d2Z+Z6FsrDSROGf5EmKQ3ubzjghzBG+9t6K0gt2EBzsxXhAGCGfQSVZ0ZSJTo7PL6B7hSqK9+1d32zFn5ZjDUK55lxR89vivA3evd4uckorZx/Jr0YH/SE11gofz25fCWjp8Sbd4LvzJT6QUSM/CvoT3tmk6NtEjieqIbldzh6egzDMVUqm+uSOSAzHcmUFpHRyoYv2j85x11kgacM8WiwYO8W9Peu+apz2gZXmqdxbfI6sjc9TJ+mDcxPktfeSiw6hlkxxwI+sPfZPac8gAkoXip1+/TWN+vd5OyJwIkjn3PNZpprPn97oagCxRJ7P+NlPYbNeVc1FMF9SYB9GfPb7WYK6HpxTudYOy2GY3iz0pIEyUGQaBVmETninuKOZ7v3Q2EIMDpoaxHbkYXYqzgOO7FzRIYy+cf/5mIGi1V9SjCY8NAMb/XZlryzH0KvVmexOy5Z3Hmfz1fRRni8rjmWGqumwYogkvo7i6BWSAxJB3rIlznppIdS4y6u3R7Sb/KJR8HdUi7BGP4MUknrxv7c49umI7gxojde6UajWpECvZMnI2i3imeHJKGJHsQxg1W5Mp8N6V+D7AA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0Z4TnJGMUdPY0h1Z0Vxb2RVcjJIYWJaRWQ3eVhNMXNaZkR6eHFORVBOZ1V6?=
 =?utf-8?B?SGhWSCsxNzk5OUEyRjQrckpqZ2JpNEtQQklsa1B4eFhYVkU1S3F0cUdKbmpT?=
 =?utf-8?B?bEVyVWZQS2RPS3dTS3dhcW44amU5ZThMZEtCVUVxcHZxNzBPZlU5empWdStw?=
 =?utf-8?B?ZGs0OFRGZUVxYjIyNkRHOEF0d2xIQ09kNXZ5Vzg0WDgyTXJyeTRLVkd6SEV0?=
 =?utf-8?B?K3ArMTJUWWszQzZBV1Bqa1FTZ2twRi9TeUtiMUljeGh4cHVxb2Rmb2I3MlBX?=
 =?utf-8?B?YTh1VDdvczBRcy9FZGNTSjlRbXhyQmt3bnpoYXNhdHJmbFNrQ0VzQ3VEbUZy?=
 =?utf-8?B?Qk5YOW1WRVZUS0tFTXcxQXl4MXZ5dGdYWVhqcU1mSUpqT0dobXRsYktvNzlD?=
 =?utf-8?B?bmtYdDRBWlU3cUtxMmRqblFoaDVMaVhKbUdndVJvaFB3VHNkUVFFVjN2cHBC?=
 =?utf-8?B?RGszQ01wMnhUbUp4WVR6Y1JpbG1nZGhtQ2xVc1NnMUVnR3h3Tm05dWpiSFRF?=
 =?utf-8?B?ZkhUa2VJMi9tQW9MaWo5anNsZ2dTYVEzVkl3bmlFamhDM2l4L1o1WWNCRE5L?=
 =?utf-8?B?ZHlrRS9nWDRNY1N3ZXRjb3pRTGkzTVdWRmVUaGthdHZwTDh0cGZSTHE0czU0?=
 =?utf-8?B?ajRQelF3S3ozdUkvRGJLbE13T0FQcXFJOFk2T0dUZFo2c0tJNVRhOUJOYVc1?=
 =?utf-8?B?WGFlZGlKSVlzbUFJR29nckEvR0taU2ExRmkrVENQckpPVTM4QVJqc0NDNm15?=
 =?utf-8?B?eC9MUGRVVUVyTzdGSEU3cVorWVFYaGtXcG1UN1VYbnEwQTUzWGxYUlVqakhL?=
 =?utf-8?B?TTAyVVVqcFdMK2gxR2ZmWlBtdHJqVWROR215eWlOcXRIL0JzMkNSaFZVWFc0?=
 =?utf-8?B?clBPNFFBcWt6RktRaGpVcmhvRmsvZHhVRkRmYTJzbEdpcmY4WWIvcG9hNE9F?=
 =?utf-8?B?M1hISldGeWNCODFoS0dGOTc5UTc3bElySW51cjZENHA1cEptN3k1TlI4SmVj?=
 =?utf-8?B?bG5HOGZEWGpMMFZhclp1WmdaQWd1T0V3Z1AvTk1qenpoZkpweEEwOEF2eGgv?=
 =?utf-8?B?TWJOYU1GQkVSSEp4Y3B6ZjA3dzJ1Uy85aVJ1dFFudXNnZUJJbkN1bG1HWDdN?=
 =?utf-8?B?cUZhRVRkOExtdUhzL25OMklPMW1QRFg2VmtCTlNSZkJtWkdGSFdJOCsvSENi?=
 =?utf-8?B?ZnpjUFBST1JSOVIzaGdURkFwNjZZWFROQ0g3cWt1VUhFSzBrQU0xZ21QMk8w?=
 =?utf-8?B?TTcvV0FMYzlWMFJMZG9adHdGb1BMT3VDQVA2YzNoaklNczl0Mm9ETkVSU29k?=
 =?utf-8?B?cjAzQ2JoTkEvWnFrNzBHc1UvVHVZeWphWGlKWnhTcFdYdFBSbEF6WGtDYVlZ?=
 =?utf-8?B?dkpXWUkzSDZYUmJsMzJDRVpYbURsejUvRTYvcjRwSXpsR0Q0bTRHZHI3OHNM?=
 =?utf-8?B?Q0psdzRtd2JIL0ZocmFGeisvQ0NUcHkyUkN2SC9VQU1Pd2ozdHBEcDlsTHNR?=
 =?utf-8?B?T2FuMGNIU2xpV21QNnZsYWpsSVBnMXp4WEhXc202MjZyVzRBZEhLeUJpMVR1?=
 =?utf-8?B?VFhwWGFzdXVKOVNkeml1V3B3djF6a3Y0Y3g4bEVXUHJsSm5rM3kwMXVEN1BW?=
 =?utf-8?B?eVdHdndVdUU3bFUvNU50Wm1GdCtyWmc4eUNEdHZTV1luV2V6ZHk1MmNsUWZq?=
 =?utf-8?B?REZ3MXBNbXAwK2pxczJ6ZUF6VjgyN1dhQ3RIYVNKN1lsOTZoWlBjd2RNL3hF?=
 =?utf-8?B?Uno0Z042Rjk0M0psQTgvdHpxQTA4ZVdnVzZoRE82aGNLcTVMdDR0MnN0K2Qz?=
 =?utf-8?B?dlRGa2s0NHp0Z3FqYitrZExMemhlaFFPV2t2NGpFak85RSt1bXZOUUF5NFU0?=
 =?utf-8?B?U2hpaDdXS04rM1AzdDA2eVpLM1FiV1pxUUtKRTNFTHJrSE52TFdpcWFiRWsx?=
 =?utf-8?B?NVlSRXVnWUJQVkpJUUhtSUpkclNPSGdqakZGNTk2bEk1YVVhY0Z0UGRrTzZD?=
 =?utf-8?B?MHhLMGsxeitGRXlDYnNnei9Ga1dNQWFBcVlpZmI5em5jcEZSUVk2VHJ0VTZ4?=
 =?utf-8?B?OGxqb0tFM0dyZXhqaVFad0tRZitpVVRrY25nUVR5aURBZUZLS3paN2lIZ3NZ?=
 =?utf-8?B?eDVLTTlRalhwOUhTbDdwek9SZXBhWkFqTzAraEI2U2NkbjA4SmNtSnplbkFT?=
 =?utf-8?B?YUdEcTNPcWRITlVTSVFzZDZVajlLeEpwNDdLTE9ybVJwQkJQNnB2ZEMybWRv?=
 =?utf-8?B?SWxYSUNmSjBpTlZCTEtVMVQzSFNMczdxbFY4aFNVaDRXelk2MVV1WHo5OThZ?=
 =?utf-8?B?VjV6VENiWGpscnBDT0tUVU5HbVdPMHhYU29VUFhrUTJaNzh0T3hNUT09?=
X-Exchange-RoutingPolicyChecked: QwnDtN+ZQ1geznu0Q5CBqII9hKdofzuRCYkoS/4YSPxs9YMoYTQKpEIHMuHTAy1Vtz2zT7kzGxWxzH+caC1y6SBLSLZ3va6dS2+4pvEQGA4YLrvv/1upIf/eahg73sT0NYxvK60/hvKkM4v2ARP0HLq5jKRLZJF61yNk4mbUFwNiC3Axl7Z4LUAPGxltWfKL3RvDh2RqJlr0PgU7fuppvRwqyWFzSQtWupiojG7fXgYlkNetahjoi6Mc691N51sMsKN9MTl58YC/ZLWdG1tEsgqU4k7740VBGfLx/GpQBb30SIRkAyc1a1oNnbJp8eSO1AZG1eRAaRp5gLQwXqWoHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 86097916-4d4f-4d41-4546-08dea435ea8a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:21:01.1548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEXBILDZI4PKr9/SKjioRD9xebiW1KLeDVoYFS/QGQ4cim4pS/u0GoGQ6E3QY84GoCuwk/IJmvEuG02EHGWDHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5168
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


On 4/2/2026 11:12 PM, Raag Jadav wrote:
> Hardware errors are reported through System Controller on the platforms
> that support it, and never routed as direct IRQ to SGUnit other than
> debug cases. Wedge the device on XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
> so that the hardware errors are available to the user for debugging.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: Explain the usecase (Matt Roper)
> ---
>   drivers/gpu/drm/xe/xe_hw_error.c | 24 ++++++++++++++++++++----
>   1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index c7b720ba5a4f..79a85925a02f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -169,11 +169,14 @@ static void hw_error_work(struct work_struct *work)
>   {
>   	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
>   	struct xe_device *xe = tile_to_xe(tile);
> -	int ret;
> +	bool wedge = xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET;
>   
> -	ret = xe_survivability_mode_runtime_enable(xe);
> -	if (ret)
> -		drm_err(&xe->drm, "Failed to enable runtime survivability mode\n");
> +	if (wedge) {

A fault_inject_csc_hw_error check should also be added here.
There could be a condition where fault injection is enabled along with 
XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET. Thanks Riana
> +		xe_device_declare_wedged(xe);
> +		return;
> +	}
> +
> +	xe_survivability_mode_runtime_enable(xe);
>   }
>   
>   static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
> @@ -433,6 +436,19 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>   	if (!IS_DGFX(xe))
>   		return;
>   
> +	if (xe->info.has_sysctrl) {
> +		/*
> +		 * Hardware errors are reported through System Controller on the platforms that
> +		 * support it, so we should never be here other than debug cases. Retain the
> +		 * hardware state and bail without clearing error registers, so that they are
> +		 * available to the user for debugging.
> +		 */
> +		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported %s error\n",
> +				    tile->id, severity_str);
> +		schedule_work(&tile->hw_error_work);
> +		return;
> +	}
> +
>   	spin_lock_irqsave(&xe->irq.lock, flags);
>   	err_src = xe_mmio_read32(&tile->mmio, DEV_ERR_STAT_REG(hw_err));
>   	if (!err_src) {
