Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C69C001DF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 00:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E20F10E38C;
	Thu, 27 Jul 2023 00:33:54 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF68C10E38C
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 00:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690418031; x=1721954031;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bgxos8heLCKRjlrCSuNN9NfPZixQceHmwtC7rQW+20M=;
 b=mlNvbmLOUd6LwdcjOpd6qsRwlCYmeQJZpZ1kDMGErMZTOlxb7t3qwKb/
 x+dY3fmzcFPxboGls1DDUVPJloJj3i9qAMQxMaiyP9YCZtSWrrsDDuSgq
 WfjSXDCdgi3BV4YgR9TvFZ9dB0KiW6jdGf48mKp1+bXyLMa/qZuZjB/GT
 CcvljSY+1wtPI4JzjJSaEM/jKngKCPXKw4XrtEPfkwK3wuw6QplIew6BI
 DeafHPQUvfy8iHCskohRo6WAuf2I+uREAloYT+7tgX/sylg/hRJxx8m6X
 lhSYZLOkJu3vT+FwfHjBteaWm9RF5LUoMgxNH8psVAYXrov580Tw9qxWE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="348447363"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="348447363"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 17:33:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="816901527"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="816901527"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2023 17:33:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 17:33:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 17:33:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 17:33:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 17:33:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkKpuuaZsFPTUg9VDdk6pyMCnTZdhX968tLIqaNlKApqfpI4582QikWApNN5eY42HeBW7CRXoIv1XuYugXhd0Z5/l10PgfqYKRnuP8IVpUH/zIu3RAMnfKbS5sSrTmttZ9g3yCYh4JSMWHLMvjx7/fhOXYIXBY0tiAiEMg65dqv28zaMPmb6IvOCQ4nrZk/ET/kBNnC1LrBo69RnrCVdRk1WWDauFFQJb5A6ScyJFWgvS3TVU2bYLZIenpQla6xmh0mjSGDmaZQkqziqC7a29IRNL/Q1PqZ52BD/3MPeYKtw5MBSh9oDvZqnbM/Oj929AjZ8Pi6ftiR7km4epJbV/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXdDH37R0ioPr6mGnYex/5mi7uOKEGTUTv+QaQxK1Mk=;
 b=bc5pOHV5Wmup4pEaYfRlOJSE4sCG8a57vtE8TJimnfhJ+TjlIdBA1lD/WIV6Xx+Fz4C0a2/XS9guKT49b+agOineYytXF2KNDsHOLWsbGaVWXdISIlMQ5XEYV2du6cjn31uZ+bc0fV2G5Vr/9TLPHMvYEMm12w/mT1py1jXZreicTpFteEGwvcKAaSOArwVlKhJgBTCwK93DmlPTKzHxa5yB3ywbxRI/RwB0G6TUYZFUE91myCebEHzefDkr+5sKg1EjIJ2zxswjXz1FvnuHUwI6MJCZymh1mk8EDWXqTZs4S4zWu6YJD+xk0yA3eKTaf8Df3IMvQWadJ1AOC7B/+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by CH3PR11MB8589.namprd11.prod.outlook.com (2603:10b6:610:1ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 00:33:43 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::32cf:820f:a18b:422d]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::32cf:820f:a18b:422d%7]) with mapi id 15.20.6609.032; Thu, 27 Jul 2023
 00:33:43 +0000
Message-ID: <2f3f378a-dbbd-84de-f147-ec68e6dc7c90@intel.com>
Date: Wed, 26 Jul 2023 17:33:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230726074300.13066-1-nirmoy.das@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20230726074300.13066-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0193.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::18) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|CH3PR11MB8589:EE_
X-MS-Office365-Filtering-Correlation-Id: e0486659-946c-40f1-4144-08db8e39212b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sa0M4L/D2SaHJycXYFc5tprUew79+z/CK7/ADfV6Ro5ta74sPGZh6e0sqvmhGsBTEhCJjbVQHFBJdSWzP0cvp6zMxl6TIUvWklmMydmHckUi3gXroyiXD4sjNTQTJDBI9qewg8BcTUkwyPs1MEVHyEQ3VqOzdGTPuxeFkyjM+i+JiISeC1/KBMr8zjiwgtlf9tQUCqiqv3XWTbJIUPpslddxXlhyCR+0fipGXNnKd4NB1djJCPuH5AkDQLba2q930VX5aebhliHLrOe2kgMH9KaJWANLB8h13ooUrs+YvslK1AoWEArwnmKal/0bC43nnvBpHHA1KOtdF/w/mVYDiv981Y9/+v4xiL/Q+4l+Ygh9s0zYvO9fAq6iJ0IEoHq86NXm7sKhEo3GQi053mB9FMVyrlPKHZIbEDUD3ayEiiAFmd6W5/shX1NBFD5fV9n8WEmxPmf0I/vksNCyqBItFmgwGfGWZuzWFkUcstzwDHapk6bEtku0IzE/LseJQE7kE4IIxrzGn8x1O/6ZD5YbWKZI3TNGL6e5ix5nC69rEM+uHcU//1rDshymmyZSSd5FlliIE50oPV17bPJN0W1oyiCZLcaTtMXTsbseLOCtGM4nl9WPY5quL8nUyjhfloZWvWfB4MhTKDTucirlQZFQWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(39860400002)(366004)(376002)(136003)(451199021)(6512007)(478600001)(38100700002)(6486002)(82960400001)(316002)(41300700001)(5660300002)(8676002)(8936002)(66946007)(66556008)(4326008)(66476007)(2616005)(186003)(83380400001)(53546011)(26005)(6506007)(31696002)(86362001)(2906002)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3ViK2pWdVhONy9hZzNZREdqMk9SM2FpRlI1V3l0TDR6TXB3WEFuSEtJVVY2?=
 =?utf-8?B?bjJXSWRKL2RXUHU5NVNLS3JqSGdwZjQ4UmdxNjFGNVBQd0tHd0FDRTBUeHlK?=
 =?utf-8?B?UHpQMXE5R1ROYUZmMTF3Zm4wMTh4ZEpUK1JPRGpoUHNPYUJqMEFYTlA0amRJ?=
 =?utf-8?B?OFVQcUNMMVdRVDdraXVsay94dHdNeW5ETFZuMHdSV29UQXRLVE1INUtIK2Ew?=
 =?utf-8?B?cnRMYXhOeC9ITDBEczh3RmliSis1U2lkd2lxcldYU0NkN0tuTWt4ekMvUFhp?=
 =?utf-8?B?RUNKTUh1Si9yejNRS0NRSkVQejNQY1VKMnc3Vmh2S0hkQ3BJRnhoYzdTSFpp?=
 =?utf-8?B?R2xKVlVycGNxa1pvcFc4T1U2NlhrdzV0NURQY2w1aFQwUHJaVlJwcHhYamNl?=
 =?utf-8?B?a0szVWdZL0tzZTRiZHpNVDJtRjRya0hCVHF1QS9YUlU1TUdhZ1d1Z0ZJaVBv?=
 =?utf-8?B?RHZXUzl0ZkxvV213ZnNEU0xyWWtUVlhMU2ZWdHZMOW5oNlBiaG9Gd3gyWC94?=
 =?utf-8?B?TU5HblpPbVp4MXY2YUpzUkgwaVE3Y2N6TGlHblpzZzl1S1VubHNYeFJsQ0RW?=
 =?utf-8?B?SmpJcDJwTklYc1VaNU10elVhaDRBNkNjODhkcUh5SGkzVzNNSC9HODFHUFBG?=
 =?utf-8?B?Y3cwRXN4ck9oME9XR0VQeVZrQ3pLQVJhVnpyVUJucXVUbGxKdmJ5U2hsSEVE?=
 =?utf-8?B?TGFzRHlDTTIyelJnZUdQZkFZZnNKL3R5ak1HU25KaHN5eVFUZ1liUERIN3dm?=
 =?utf-8?B?Y3dWS0YxWEpVZUNsSHZ2dm1JMmxPM1ZRRnJRNHo5NG9lR21wNVl1NGtoVXRJ?=
 =?utf-8?B?elhHeE1mUnh4K2dlVGZoMTMvbzlscGg5VDl6aHp0S28vUGsrVkl1dXlnMGtk?=
 =?utf-8?B?OXQ3YS9UcmllcjNiaEhWM2xtSnBoaUZTeGxMMExhaTR3alJUQkpDUlFGNnlz?=
 =?utf-8?B?Sy9PRHZORk9maDNZY1IwR0FIS0pLZnV1a0JDYlQrUEp3Mmhkak0zQjBmWlFJ?=
 =?utf-8?B?RXNNNmNoYjdsU0VvOVZ3ME9ZZ05zOXhFQlZuUnYxVzBYNUxJTGhWVnBEdFdN?=
 =?utf-8?B?OXhNdHpLekcrS0svUnpIcHVZa015Rk9UNlErZGpBdTNEN1R2WUlyenEwNUMw?=
 =?utf-8?B?anNyTTM2eUZLRFE4NnV6QWRuazFEblhIeDk1Uk5MZXlZdnFsek1hWFVmNUx0?=
 =?utf-8?B?U0R5ZElkclR6VktXVXEyQ2h3Q1lOa2ZwNFVock0wL0diMHloTDRINU0zSERJ?=
 =?utf-8?B?NkU0cEY0WHdadmNEMDY5Nk9XMmxEOXJmcmdFclgxT1dzQ1pkTWtuY3VOTTN3?=
 =?utf-8?B?ZjAvelZkQzhJekFtK1pjOWNlemJpN2hyNHF3U2hMQWN4eUkwSzJ2aWQ1NEFn?=
 =?utf-8?B?T2dud2VxUExIK0pib3R0dlNNRUZBMDkvYWo1eE5rKzZhQmdFNjhDZnJVdDls?=
 =?utf-8?B?YWhRdkdGZS9CSk80ektJTnR1ald2MHVHRE1FaW9nek1ObDFRckxoenF2RE5X?=
 =?utf-8?B?T1lGVDZpWW1ybHQ0RTh5N3IyVkQydXYrbENJVmtqNUYrSjdHWFAwMmlwQWdx?=
 =?utf-8?B?OHVsYXRvQnArYmZ2MEV1RFd0K2xuTjNZdFFMTEtQVjdJZXpKZWNxZFNmRTg3?=
 =?utf-8?B?M1kvV3lDcnI2K2t6dXpqMWdwN2VrWVRmNXNQL2g1a0dwMjgvaFBvWmE0YTAz?=
 =?utf-8?B?SUF0VlFMUUo4Ry9GMVhqVjd3QUF0VkRrQ3hRclhsckdjTDA4bGxWWStGMmVl?=
 =?utf-8?B?QVZBckM3dTVDNGU1OFdtVEpoWU5TSW4ralZWVHdzZGZ5bHhCcTBKR1NxS2l0?=
 =?utf-8?B?UlhPclIwYmkxTE96eGNzaUNJWU9BUEpMUENPUThUaWlKOFU2TmFSeDdyaEc3?=
 =?utf-8?B?ZVlTdjNPU0E2RnE0eG5SMTl5UkRlU3hJcitmWnUzaWRkTEtVeUY0K1BmdjAv?=
 =?utf-8?B?MzhzanVSS2pyV3BFL0hmOFFCb1BvYXAwemE1cTM5V3FhVTNsN1J6YW5PVXdC?=
 =?utf-8?B?cS9adEpZamxmZ29HcE5iYzA2WS9GSk51S21XaW1qY2RxTnZ1aC8vdjVxQ1hj?=
 =?utf-8?B?ZHpHK2hHWnpLMnFnVllsU1YrdzZaS3Y5VEE0Uk0reXNjWXBYajVFQXg5R0dX?=
 =?utf-8?Q?uqhEO8Kh+3343juw6vSVJvypw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0486659-946c-40f1-4144-08db8e39212b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 00:33:42.6071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9ocjvirANMcPRXcPG3zxGAsMXKOzjCyUUiEKjAfuDjpHBJDGzMWvHr+4dzzC5Sg1Pc3x9Ut2pDl5L3czcWczg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8589
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Enable atomics on smem
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
Cc: joonas.lahtinen@linux.intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 7/26/2023 12:42 AM, Nirmoy Das wrote:
> Atomics works on smem as well on supported platforms so
> set AE PTE bit on smem as well if XE_VMA_ATOMIC_PTE_BIT
> flag is set.
> 
> v2: Remove platform check(Lucas)
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index d4660520ac2c..3bd6dd048305 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -768,10 +768,11 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,

Why only changing this function and change is not also needed in 
xe_pte_encode() ?


>   	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>   	int ret;
>   

You need a xe_walk.default_pte = 0 upfront with way code is structured 
now....


> +	if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
> +		xe_walk.default_pte = XE_USM_PPGTT_PTE_AE;
> +

How is this supposed to be enable on non-PVC platform?
Meaning when is XE_VMA_ATOMIC_PTE_BIT set in the xe_vma.gpuva.flags ?
Are you wanting it to be controlled by the xe_vm_madvise ioctl?
At least on i915, those were intended to only be used on platforms with 
pagefault support as the intent was just to influence migration policy.


I think this breaks PVC?  We do still want AE bit clear on PVC when 
backing store is !vram.  I don't see how you can do this right way
here without a platform check.   Possibly you could restore the code 
below.   And then the new code above is only executed on platforms 
without VRAM.   Not sure.


>   	if (is_vram) {
> -		xe_walk.default_pte = XE_PPGTT_PTE_LM;
> -		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
> -			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
> +		xe_walk.default_pte |= XE_PPGTT_PTE_LM;
>   		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
>   		xe_walk.cache = XE_CACHE_WB;
>   	} else {
