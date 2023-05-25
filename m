Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7CCC7EE2D
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 13:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23A010E160;
	Thu, 25 May 2023 13:16:31 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5113910E160
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 13:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685020590; x=1716556590;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9Xp3GIQTH8GjfvJuN59M3u1PzZ85nLRYe1sHGZub8/I=;
 b=dXkWrHD9bDt58L9667+j/kt2t+5xTvCLpGknpOa+aRiPyGNikHjuYkrt
 VGGaIqd7c3si93c190DjzohHgvxss+K1lkfwLZId7Q2vmyJIu0w50Uepc
 NJJFN2JYPRWS8oxhLCQR63JXKo3AlBguSACZPG3dG/4P0UZt+Ee6Ovx0Q
 Zs8e+7d45wr7+3bWs9iyn+/k4g0fKero1GZf4vDHDHgoJloZtLE9Xk9Em
 bUdM6k/p1GAL9jdbs24eId88Sx5hlUytP2K0EtUUkYRmzJm+GS+lYN19q
 OzJ6Qg+ibNAUSgNXJuMDt/kCZXf2E+CSPlRgHjftkfHlVglmfEAO0po+s Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="351390621"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="351390621"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 06:16:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="951435357"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="951435357"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 25 May 2023 06:16:17 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 06:16:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 06:16:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 06:16:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRVbVpaYuEbgCFcnsj+tn4dKnqcbUWgOFRZUmHbfOQ4InNTjDUdApUlLZPj3g81Icwk3+79JjorK3QQAWG5srvJIgd2zSDav+u0+iJeUmK8iYVJc6NdamCRs2Qg/tigL1c7twqn4kCj2TLnl790uYuJyYYAHgtHBUuToQKbZtaB3kIyvI0T69y6f0mL/3nL1LXxxrUT+J1NtfjuLH4j5EiKnz+tEOnKK2Y8oIgGHmMqJGnKLLE7kZqD+ytCGIV24WpX6dfnUBXQTTLoi0/dCst3DnuOEPCUh/7oZlklWRrzTlG8RZgmaFEOyzAoOD86pbAepRGgEQjDMlZi5gkUxpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7Enpah5dkJbebV6vjbYmegL+5FE6KTGaL7VNJf6q8E=;
 b=UWXm8vaKpTITSIpw3fxVrKaGPO0Dk1PW3M1YU8pogr3IC8sJtdONOfznjnXZ4+M5cFkoj9aau85IlBuz986O21VB8uFKxDMu2gQ/6ThTFfm78IH/ao3TbVqai3k+s8nw0124re+7ylsgj/p0HnDElgAQTr12T7FoV/sLb39JkZHtiTQ1EPvkQK+HHmJwEEiVr8SzQ8IPyV+R7TIQu5nOut48/+yrL3hQinYA9PVFCUquMEPzfF+MrPhSzbwcaSu3zrGMJCNeNSVqxpddXtRKfDPhm4H8ZY9W/ywXk/GsZ/gMT5Ztnase6PWYNT31MefpCeNlSqUNIuOtY58Gwv+J5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2907.namprd11.prod.outlook.com (2603:10b6:5:64::33) by
 SA3PR11MB7434.namprd11.prod.outlook.com (2603:10b6:806:306::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Thu, 25 May
 2023 13:16:13 +0000
Received: from DM6PR11MB2907.namprd11.prod.outlook.com
 ([fe80::f6a:a1de:83ec:b111]) by DM6PR11MB2907.namprd11.prod.outlook.com
 ([fe80::f6a:a1de:83ec:b111%7]) with mapi id 15.20.6411.023; Thu, 25 May 2023
 13:16:13 +0000
Message-ID: <f6192c01-5aa0-632a-5833-d4cccab949cf@intel.com>
Date: Thu, 25 May 2023 18:46:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230524192635.673293-1-matthew.d.roper@intel.com>
From: "Kalvala, Haridhar" <haridhar.kalvala@intel.com>
In-Reply-To: <20230524192635.673293-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::33) To DM6PR11MB2907.namprd11.prod.outlook.com
 (2603:10b6:5:64::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2907:EE_|SA3PR11MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: 64c9ba88-65a7-4076-aea1-08db5d22361b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k3SiwiY63ecGSE+rnbnePmP8alIonP/wikLa3W2ZQQ6z9nCuWfoWVQJpDmpcl+nxrHCJYiCQfFT7a2uAJZtsF5G8WOPId5LZsGlFAioZK4G7vDi4V0SBUnvcUZDP5z6U6nq0lxDQ3FX8fI/kf6+qAGWHMbpAsNzZJOOBtsn/w0wXLYDBdUGiyiLxQ36GdFtK8IYsyboAMdJ/X7AomNxZfqGpfLPXhFk4GIY94Yt6nppz/UJRKm0/h7ZVQleh9+xGb/qx/0eggppZp28DMNRbEQLtw2pGPNAoFlgyskJb9n0z7yqaUVxwbot7SHt4t8t9kDJ2MDc2zaNPwBH4IDlLgRAnvt077froKVs+oBfottQc4LrOR3ArnJzVWV43ddqsJ/c+CE5DmDghZbcVFF8RSPsjfbRqtTnmG75GSsnWVf8J6T/Rrk3lsQElF4JON7P+h0YtU0l+iUeb/rOGZzXi1NnKvfMyDvEjDbYQH4M1f/eoyBXMung+7QqanrfEJsQvXgtF4HLqs0zHmmQQSNxb5wPJTdgfuZ+zVeNp2yQZ8uXb+VTrwOZe0x3uVj7qUDLpKsVbRUKLl6WGQqEAVoEYASzkkxAcG9+Cy/KCJnoYrmxthm0dtNGznD+MXZsk7V+B87IBXbSTEDABVqIdKe/aVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2907.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(376002)(396003)(39860400002)(346002)(451199021)(8936002)(83380400001)(186003)(6486002)(2616005)(2906002)(6666004)(53546011)(66556008)(316002)(41300700001)(66476007)(66946007)(5660300002)(6512007)(6506007)(26005)(8676002)(478600001)(38100700002)(82960400001)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFI4blRiUExtUjRQc2w4M3NTWFE5TnVHdFZ0MWhreGRJT1pITFFCSW4rcTQy?=
 =?utf-8?B?clkzWWN6TVN6eG96RU0zK0g5ZzdFdkRWMXdVaGMvZU54OGhGWkVmSjFmRTNa?=
 =?utf-8?B?M2FRSkdITFpEcm0xZXRsTzNrUmJnUk9UWHBtRnltTi9ZaVR6TjFyREViaVJ6?=
 =?utf-8?B?UjQvK1BnV095Y205WTlwZi9JQnRuQy9rcWVGRkUrWWE5MmdEQlhEby9naXVF?=
 =?utf-8?B?NnFMRXRhRGNkQmdFVzVzV3RpdGd6eWVCZUVNWmlPTnBBNFQ4YUFDOElqK3Aw?=
 =?utf-8?B?T2JPa1JDRGl6QnRic0xVUlVPZWtoNDRuemk5MDljcXl4N2lIcFlBMmxWeHZS?=
 =?utf-8?B?SDJ4ek1KeC93MDlGTzcwM2RmbUQyTzFLUnE2NGJJM0FRY29zVmRCVndnMXZN?=
 =?utf-8?B?YXRMWlg1M1FvanVKWU9vS3NSUnZiSWRzYUVnR05SblRhNVNVZkpzamIwYm01?=
 =?utf-8?B?dUg1Y3JnMU5VRFUvRmM0WmRhS0ZLK1NXWlpGak94V3N5Szc3M29JS2xmdDRY?=
 =?utf-8?B?RTdDc2d3SnJlbWthbmVpWHBpMGFCQ05mM1NqK2p3ZG1ieVF3L0ZubTR3RUZl?=
 =?utf-8?B?TVFKZWw0UEVtSFhveUgya0MxRENTMXRmTlZnd1ltQmRPYlQwYUlRc01xcncy?=
 =?utf-8?B?NXlla1UzdVFwemZzMUo3VlBKK1dESGM0Z3dIWEVibjYwajU3ZXhmSFJGcU9a?=
 =?utf-8?B?SEEyYVJ3TUVKQzlGdW5aUDQ1TW9zNFpsTWF1UGJxUVlSNldZenNwZG5ybXpu?=
 =?utf-8?B?eXVXcklrOGN6aGdrQkp6MHZ5Y05LVThNTGpqcURPd3BrN25PUGdNdzJGK0tN?=
 =?utf-8?B?N253ZkZ0NW1Zc3NmSmNMQXJaL2xjMEZHMHBaZEc3b3NTQUlieXdjNmlNMk85?=
 =?utf-8?B?a2FOQ29OR21zazhiaG03MnNoM0tOdis1LzNFbmRBU1ZzK3NqUUxJeVBHbnlw?=
 =?utf-8?B?dEZtQVliRHRIYWJFendIcWR1cnVhRTd6eGwydVkvREk3b2tmUXVMaU9obVRC?=
 =?utf-8?B?QWMzWnVwczNYWEJ2dnJEek0yOVlvYVVtOHlwMlN0K3lFOEZweDQxZUtSTjJZ?=
 =?utf-8?B?T0xPME1EaGRGOVJSTWtQNy8vNm5PNlRyanl6ZmxxTnAwSjZuem55QVMzZ2Vq?=
 =?utf-8?B?YkpzZitzbmcwclRORHROYkRlYkM1Z21YeW5zV254OVlQVlNXU0RMcm9jTEFQ?=
 =?utf-8?B?bUQ4Uk5kaDRCT0VCcFdzc3N5L3djdkp2Rjl5ZGlQcVJTaUozeGgvY2N1QVlr?=
 =?utf-8?B?UVNJWmRDRU85b2NMWlFGODZ4MUFTd0E1Q1hYSzAySzlnMGV2eDEwZElBSGlm?=
 =?utf-8?B?LzdDLzVvRDcyaXNOdlZCSkV0bVJVWmZya3l4WnpVMTZYMWVtWi9jV1hIZm8y?=
 =?utf-8?B?ZlhuRVRhYWNuOWNTTHM2V1hONmxuSHFZUlVjOEJaandCWGZLNVdnTSt5djIr?=
 =?utf-8?B?OHZ4SGpsTnJNNlZxMVpPbkdZRXd0em1KazlZbjdSY1kzZTYvak9JcnZINE5K?=
 =?utf-8?B?NDM0SndvMWJyRGVkWE4xSSs4MjR3SGRtdjRlUkdRTWRYZTIzWjFjQ2VZb2FU?=
 =?utf-8?B?YWQvZmNodE5GZ1lMSXo0ME9JUVQ4Rm42L3NiRmljYkRZcy9UR2F2UGNWdnY3?=
 =?utf-8?B?N0h6RWF3SFZoSGpleEd6ZFBEU0U3aCtIMnBZTXgwLzdKNEhXaXRKcHBQNXIr?=
 =?utf-8?B?K3NYdmt6Z2sxNEVPMlNmN0lYNHEza2hhS0o3ZzJ5Mm5SSlhKeUgzQ0R1RjNX?=
 =?utf-8?B?c2ZzQWs1SjNuRmVKMkltT01QV2JxdllPMEw0VmYwc1lxQm5OU05HQU91d2ky?=
 =?utf-8?B?VkdmRTU0UUdqVUVGcHd1cEQwbGR5bWk2em1nOVR3b0l6MGNubUNhdGxxZWJp?=
 =?utf-8?B?U2RtVTF4RG9XZ3JEYXYxa3d3WVY1UUxyNEJQUUVhbmVvN0hvSHRreEx1bnh0?=
 =?utf-8?B?TTZXMU12N3pJemlnWjBod2JQbzFZbVJ6MkFUOFp3MnZIeEpBRkJaQ0ZUSWdB?=
 =?utf-8?B?WCtObnZ1b3h3Wi9PRzN4RDVLTlpDMWJ0ci9HSm00NzZTQmtzRWNXOUFNd2tM?=
 =?utf-8?B?NnBiYjVVSTBMTmFTNlBLVU9IeEFQei9pbktWY1ZyT0h1aUNIMWVYUlJFZVdr?=
 =?utf-8?B?cDNmQTFpQ0hFbEJYUm9yRnZqdHpBR1pxYTJRTXJUTW5kdWx0L2hVT0tFUnlM?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c9ba88-65a7-4076-aea1-08db5d22361b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2907.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 13:16:12.5920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oEdaNOxUsGTMns2Vin/RxFBPpgOaIy7vrfI3oaQ6HHsKHtFQCR05RW1q80Qp7Ry/pU9jdztEfVCR+5BuOgRaN3b+mmFTNAci2ccpOGyA8Aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7434
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/pvc: Don't try to invalidate AuxCCS
 TLB
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


On 5/25/2023 12:56 AM, Matt Roper wrote:
> Generally !has_flatccs implies that a platform has AuxCCS compression
> and thus needs to invalidate the AuxCCS TLB.  However PVC is a special
> case because it has no compression of either type (FlatCCS or AuxCCS)
> so we should avoid writing to non-existent AuxCCS registers.

Hi Matt,

Looks good to me.

Just a query, if their is no compression support, do we need to remove flag

".has_flat_ccs" from PVC description structure.

Regards,

Haridhar Kalvala

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ring_ops.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 74c1b5dfbaee..d2fa0b4c8bcc 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -190,6 +190,18 @@ static void __emit_job_gen12_copy(struct xe_sched_job *job, struct xe_lrc *lrc,
>   	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
>   }
>   
> +static bool has_aux_ccs(struct xe_device *xe)
> +{
> +	/*
> +	 * PVC is a special case that has no compression of either type
> +	 * (FlatCCS or AuxCCS).
> +	 */
> +	if (xe->info.platform == XE_PVC)
> +		return false;
> +
> +	return !xe->info.has_flat_ccs;
> +}
> +
>   static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>   				   u64 batch_addr, u32 seqno)
>   {
> @@ -202,7 +214,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>   	dw[i++] = preparser_disable(true);
>   
>   	/* hsdes: 1809175790 */
> -	if (!xe->info.has_flat_ccs) {
> +	if (has_aux_ccs(xe)) {
>   		if (decode)
>   			i = emit_aux_table_inv(gt, VD0_AUX_NV, dw, i);
>   		else
> @@ -248,7 +260,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>   	i = emit_pipe_invalidate(mask_flags, dw, i);
>   
>   	/* hsdes: 1809175790 */
> -	if (!xe->info.has_flat_ccs)
> +	if (has_aux_ccs(xe))
>   		i = emit_aux_table_inv(gt, GFX_CCS_AUX_NV, dw, i);
>   
>   	dw[i++] = preparser_disable(false);

-- 
Regards,
Haridhar Kalvala

