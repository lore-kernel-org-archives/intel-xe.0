Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5547C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 05:21:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AB510E2ED;
	Wed,  1 Jul 2026 05:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iE5CJdIH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E9410E2ED
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 05:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782883310; x=1814419310;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UxSNLT/DXgRo7WBy+Oby+jI8+/pTl5Q5wasXAkJAajY=;
 b=iE5CJdIHViT/sCjEFe0MLNr7XZ6mtTCH8kdPge5xR6sz1w7ebi02iJ2S
 lP14oA2M2FpD6aFPk0geGMy/WqB+e0PMewosvj2Rq0YvDu2bG4zH6/D+9
 wXdOuT9c/1y3TSoFf09FUol8oeUOj/Sp0SMpMSNd/PVTILm6Y6VNCZSRt
 TVrKThufaAZN/XjGdfNOrfDW3413uclwgbZ4hZJu5QfjhMd+oFRF5Gbyd
 wX/L2g0DRwnUKXpu74gTAXgmDKf9E2/SHJ1pP1ce1P8yvLAikm0YkfU5z
 LFCWbDw3aL7IGEWwSsFoq3qR7PLV4wn6BlbyKEyTC5NEktxU2+hCRuXYn A==;
X-CSE-ConnectionGUID: W5+AQwPRRPmNtWluPLZQCQ==
X-CSE-MsgGUID: eCxnW+NqRhG8T9/PRz061w==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="95106643"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="95106643"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 22:21:50 -0700
X-CSE-ConnectionGUID: D7Y5hxV6QZe+CUJhP2HMfA==
X-CSE-MsgGUID: DS1QNBJmSoCDoTL2ltaDSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="249816356"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 22:21:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 22:21:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 30 Jun 2026 22:21:49 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 22:21:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtRuPB1nhwDQtwPvvTiYsZNYRb1Zu36mf6VG7bj6k80bitRWzxL3zlAaXY4eV3jpnvAjZDW6E7wMohI1vkfnVSNLLxwPGtjrDPoqRba8zZgYyt53f1YiU2Gb31+lckuiL6vvfgaZFxGBoalHDK6FWTakoQQ7k8wihJ1HXliBVIdGdxh8BbIZqcZlRIqoA9kyhEPI0dm1hF/4zDQqK8x5MQzyRoveV3v7DAmRnr5V+1QSv9vwaTt8XWkyy/0WybjglAeFMycGDxC6mL3w/aq2N63sEVAMeSU+DVJp+HeUJE9pBE1x33jC6w6Uots+XetOm7NIFIV1O2v5X6k1d4IeGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7CTRdps/Ou7SV4BM4axSyTUUVbhPSEZ8+JbDe16q+o=;
 b=WvX0YaMI5xFAwKo3k3cerXdOPM2jRqec2nmDFScMhvXr42JHGiHsrulX/2KQ17rlUAveXIxQDwogW0NRvmFmzST41h6KmgTwQA1a3oCPugTMBU252BpfwuMaMRClVSS3NVZTGrE1WWemEN3VN77Jn7mneUmeHQViX90ddCedGKVBHuoSv+YN0zfL/R98izxZCya7MOgbXSUgoOJ7dJDz0rK4Jad1PixcwHOi7aRXJHQm9kvgkBG10KZveoa/8XzGqKiLaS213N//mS1g0CMLw9aiXOOi6KLP2AW2XDDSHULXFjr1xJCRT05APrSyEeYbvTydNGZV96B2gk/XVhdYpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by CY8PR11MB7848.namprd11.prod.outlook.com (2603:10b6:930:6c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 05:21:47 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%7]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 05:21:47 +0000
Message-ID: <111c659c-04cc-493b-88b7-b261c3c91774@intel.com>
Date: Wed, 1 Jul 2026 10:51:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/10] drm/xe/bo_evict: Introduce xe_bo_restore_map()
To: <intel-xe@lists.freedesktop.org>
References: <20260603101814.916948-1-raag.jadav@intel.com>
 <20260603101814.916948-5-raag.jadav@intel.com>
Content-Language: en-US
CC: <raag.jadav@intel.com>
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <20260603101814.916948-5-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::18) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|CY8PR11MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: 880f4cba-5bec-4d0d-2ea0-08ded730a5ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: dMT1e4D8lgnACkDno5SDx00E3GbJyi/GFj0iBOLESZJnuBvo85RH66lKPXOE5KkrH0+A5jAIpV3SAvqrFCM0TK/khnzIQM2mHdKUC4lIi9zdiZltQT1IE3IqOg4KMp8bsrEQVfLDPLdynp0rkapOKrJHqZFOLXd1GrUjXkzAv5+uIzDqxcr/QgxxgIs4COBqCnFSnYV1i4LT+iR50U6a6eTDH3YDYBiSmB08U8DoWuX+6sfya4CiYpk6o8rldwCxpldUzW34vghp4h+nay9GKAvZ25JinFE2QjcGIt5yS6pbArLmRGlqWlYfISWNO6klbI1qGwLspeO4oSZoGnY10KEXk3nrI/3+TrmMIwRmsGUeJwA7nXnoXxIx4PRL1Rwxo72swM3TlABQu5ncqfhSWpUCzlnRiJ7H2T9WRpqbDjgMfB8o8LmGfDlKxBh3NKGWC0Xj/fXA6e3uMSAwGbO61iSQdjmcWE6ZLIFS0b4noBEowGlL+wtb6WD8WfxslAqqZIJK5lARZCt1LymBG2s55WEVV5RxpKddtx+QxkSAueCgD1vDT2vhyi5u+B4kZguJVP8nZbwEQzdiUwiDnV0cmlKVVuRLQaqJ7Rjh7gqHo3HvGShklAe9TF/5jZkPVOT212ynDBhAscRlB6kJdjdlQl4TWpe1NfCPiXkilr7OEi8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW8xYlhvUE95cFgrdzR0eDcweW5Jcm5pdTMyZm5uUUErTG9Rbld5LzU5UzlC?=
 =?utf-8?B?QzFzbGlsQml5UGROVFdmR0cvd1pDQ2dJWVliaXphYnhJYUNEdWtGeTQvTXlP?=
 =?utf-8?B?NVVLMi9SYnZpWFJ5TUZlRDBaS09ScitXR21Yc0cxSkVXTjgxbDI3WS9yUEV0?=
 =?utf-8?B?UGRVMzNxZmZveVNrWkd6WWQ5UFYvL2JLdm1aUnBpWE9Lcm14THJxVVM4MDMy?=
 =?utf-8?B?QWMxZUZJTXhGTXU1ZytWbWp2Z3cyWWFDNGROMVZSRDg3V3RTSExuTHNzUkkv?=
 =?utf-8?B?SFN3elRTL3I2Q3Q1U3BtNHFpNEZiOHM0UTRxczJDUjB1SXphOE9vZmRvVUpL?=
 =?utf-8?B?bkRvb1RNeFNKRW0wOVlNMXdWQVdnWUZuMGtUeDBHbUZhOUg2WFd4eEpmaUJC?=
 =?utf-8?B?RXJGSW1MejlsR01telNWUEdIZFdVOUliQlBDc1JNdmN2VC9uQTlwR2RTTThN?=
 =?utf-8?B?MVBibHRyY2NwZHhacXJPTG9NRS9XQnZOQVZhbFdrdFpqa0pZTUlpVFZBT1I4?=
 =?utf-8?B?dDVhRmhmYkYzMDRheDFoWUsvZWRua1lPNHlFcXdhc3dPK0Z6b3V3d3p2c3N4?=
 =?utf-8?B?V1MvOU40RTJlclNSencwY3VidWNsaitzQnBJdFYvRWV4dWFya1RWUkMxcVBj?=
 =?utf-8?B?ZktTSG9Dd3hLd0FNbmZzUEl3TU1abm9Xckl0N3BQZjFRL3ltL0N4K3dMY2k1?=
 =?utf-8?B?TCtZVDlMaTZGWW5uVlVPT25KUTlNMS95bExmY2Qva00yV2NuYTF6TkQwUFJz?=
 =?utf-8?B?UXE2MTcvZTFLVTlBWnZQR1BYZENnTTMyendXY0xySkpVcDJHem5WeFE0R3RC?=
 =?utf-8?B?WWJRdEpqLzVMYU1pZjVzY3FkSGp5N2FJZlZUUnVySk5KMGRQdDYwbUJKcXow?=
 =?utf-8?B?WWVHZmI1YUNGbngza3dqQmRHaW11STZ5MkdIZzhUK2d0d0trdzdXNzZBdml5?=
 =?utf-8?B?SVBCU1paRDJEbEErMkRVcXpwa3JXUkxncjA0bHNqTEFiN0xxWjRLY09nTlhV?=
 =?utf-8?B?RHg2U1lnWUFEMlVseUUxbVRxWnQ5bXVVM0tuNURLWWVKcFphMUNJMTI4VUVC?=
 =?utf-8?B?MVc2cHRmTklEUG5EZDF2cG9EU1pGMUd2NzNOcEhVVnFKNkk5YlVsZk5tYU1o?=
 =?utf-8?B?a0FpNGlsYzdRR2FiOUI3RVowT1RIYkNJMklVMVppNDVJRkhUaGRseUNXUlZT?=
 =?utf-8?B?TWlUaXBwN1JkcVdBenZmMDZGQ1pUZXVlc1EzNldUaEhYNlFJemtKaFVXeEhB?=
 =?utf-8?B?RGlja2pvbGhHbjFndzZhelRNbThjNTNQQVJmWUNvT1N1ejNuMTNXazRIajlP?=
 =?utf-8?B?dUZvbnA1MENNN3Z0amtoVU4yM21EUFhta1NVRWxFM0JoSDBUVzgvWG1VOW9s?=
 =?utf-8?B?ZW5Hb3VyZk5QOVZOYTNwM3FubUpSR3pMYW40TDJDRi9VQm9aeTBMYXJEQ1pk?=
 =?utf-8?B?RjErR3FqWlFxREtpaDF2eXJsZHQ2Q1JXclhGMXJSRUxQNmpnWXZ5YkVUcGZx?=
 =?utf-8?B?cUp2TnJpMGV6cURpc2pBaER2NXhzbTMvUGlxUmZGdXlpWWRRMllHa2NsNjY2?=
 =?utf-8?B?dEVGSHFoZ2RwNmx4dVFkYkMzM05icFpNRUVONlI2MlZyeUt2Q3lyQWZyczk2?=
 =?utf-8?B?dHNsdERGU2c4eG94ZURpS3dac0N5RExobUo1eUxOdVZIekVkYlJYSWVPSUVG?=
 =?utf-8?B?QkxQOVpveG56YnU1NHExd3YzeHBZcjhpUmJPSlVoaWUzMjJOT3h3Wk1rWlM2?=
 =?utf-8?B?KzFBL2VieUFNdW9mNGNvcVk4dTV4dzlISXJwVW9uUUJxdnc3L0VpSmFQajlK?=
 =?utf-8?B?MHRTdWgwcmt1Nm53YTdnQzQ0Y25wdmVQdE1SSUxFMXFpeFFlbXFJM3BXYVlT?=
 =?utf-8?B?MGVTMVlpaVdwYTYrZ2EzVzR3eWJ2RzArRXlXZDlYZ0REQmFjWldMU2tjcUFO?=
 =?utf-8?B?MzFQai9BK2pKZVR4Q1RuandCQ0xHZTdlMnIvTm02YkhEUHZScG9SRE9nU2dx?=
 =?utf-8?B?dlpFaGMzcHU5UFV5dW5zaVVpYUtPK2llWlZCTHJUTkRSMUo2eGJYQm9ja0Jr?=
 =?utf-8?B?cllxdEZQYnR0clg3UjNlMVA4Ti9pR1FEaVBWcmZFTzhDczgwZGVNNEV5Unp5?=
 =?utf-8?B?emJVZkg4NGJpZ3ZiWTZZUW90ckxGYUNaaUtFZHo0R1hNODBkelNkQlVUZWpM?=
 =?utf-8?B?cnh4Z1BTd2FVV0wySXhGaTJZeWNjVWRTSUZrQy9MRkZxbnJRZHBDWUhXTjFX?=
 =?utf-8?B?QXRNNGhZd2NLNDBMRFg0cE5aZjhnRU5DQzhLU3dwOXgrZW94OE9kaG9BY1RR?=
 =?utf-8?B?UTRtQ2E0em40RkRUS2RjZHVHNTgyQ2dkMzVqYytYWnFoZUZ2Qmp1QT09?=
X-Exchange-RoutingPolicyChecked: RvtF34PTrYdO8og6p4eyod9gb2wQYEBSpkiA8bm84A0mdy48brKZaOxNRRsk6U/uC8thDD6/dEVjwfCis0LnjUjsL9WTedv5OG03iddKXq4GUY0XIM3yA+ITDP7Ym4yATb7i8eKwPqWObBsAPfPSKAQ2ohn4G7XOYV4UHE4ozTDvDWsiFb5/j3tG7XxlXNoE/0KbidhH9bTwAQnOoFaBYDkr+N7/UQyeF7ZfwX970OPqHmKEG/qdsb/wk23U4zDFf3RolC/Xk6Umrs8cVEgrUD/KD3fWr5B0iLKrkD6L/nKgsgRVXAsUDUe0AfxE/no1i+J9+3ahDssdFf7l1aoPWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 880f4cba-5bec-4d0d-2ea0-08ded730a5ba
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 05:21:47.5766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Anp3D+8UPxSDa4cISAFu8OI5Qw2JJNgoINAmiy7sEa1PYJL3oa4b8Nn2Id4WrFXeoYxaokRxOMVnM8lQZ9Wnog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7848
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


On 03-Jun-26 3:47 PM, Raag Jadav wrote:
> PCIe FLR clears all hardware state along with GGTT mappings of all
> existing bos. Iterate over early and late kernel bo list and restore
> their GGTT mappings in hardware, so that driver can make use of them
> during re-initialization after PCIe FLR.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v2: Add kernel doc (Matthew Brost)
> ---
>   drivers/gpu/drm/xe/xe_bo_evict.c | 51 +++++++++++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_bo_evict.h |  2 ++
>   2 files changed, 45 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 7661fca7f278..fa75140c88fe 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -189,14 +189,8 @@ int xe_bo_evict_all(struct xe_device *xe)
>   				     xe_bo_evict_pinned);
>   }
>   
> -static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
> +static int xe_bo_map_ggtt(struct xe_bo *bo)
>   {
> -	int ret;
> -
> -	ret = xe_bo_restore_pinned(bo);
> -	if (ret)
> -		return ret;
> -
>   	if (bo->flags & XE_BO_FLAG_GGTT) {
>   		struct xe_tile *tile;
>   		u8 id;
> @@ -212,6 +206,41 @@ static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
>   	return 0;
>   }
>   
> +/**
> + * xe_bo_restore_map() - Restore GGTT mappings of kernel bos
> + * @xe: xe device
> + *
> + * PCIe FLR clears all hardware state along with GGTT mappings of all
> + * existing bos. Iterate over early and late kernel bo list and restore
> + * their GGTT mappings in hardware, so that driver can make use of them
> + * during re-initialization after PCIe FLR.
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_bo_restore_map(struct xe_device *xe)
> +{
> +	int ret;
> +
> +	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.early.kernel_bo_present,
> +				    &xe->pinned.early.kernel_bo_present, xe_bo_map_ggtt);
> +	if (!ret)
> +		ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.kernel_bo_present,
> +					    &xe->pinned.late.kernel_bo_present, xe_bo_map_ggtt);
> +
> +	return ret;
> +}
> +
> +static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
> +{
> +	int ret;
> +
> +	ret = xe_bo_restore_pinned(bo);
> +	if (ret)
> +		return ret;
> +
> +	return xe_bo_map_ggtt(bo);
> +}
> +
>   /**
>    * xe_bo_restore_early - restore early phase kernel BOs to VRAM
>    *
> @@ -270,7 +299,13 @@ int xe_bo_restore_late(struct xe_device *xe)
>   	return ret;
>   }
>   
> -static void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
> +/**
> + * xe_bo_pci_dev_remove_pinned() - Unmap external bos
> + * @xe: xe device
> + *
> + * Drop dma mappings of all external pinned bos.
> + */
> +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
>   {
>   	struct xe_tile *tile;
>   	unsigned int id;
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h b/drivers/gpu/drm/xe/xe_bo_evict.h
> index e8385cb7f5e9..d4f5b87243e7 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.h
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.h
> @@ -14,7 +14,9 @@ int xe_bo_notifier_prepare_all_pinned(struct xe_device *xe);
>   void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe);
>   int xe_bo_restore_early(struct xe_device *xe);
>   int xe_bo_restore_late(struct xe_device *xe);
> +int xe_bo_restore_map(struct xe_device *xe);
>   
> +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe);
>   void xe_bo_pci_dev_remove_all(struct xe_device *xe);
>   
>   int xe_bo_pinned_init(struct xe_device *xe);

LGTM,
Reviewed-By: Varun Gupta <varun.gupta@intel.com>

