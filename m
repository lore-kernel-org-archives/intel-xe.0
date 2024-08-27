Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6860BC5320E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 08:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350A310E29B;
	Tue, 27 Aug 2024 08:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAv0h6uz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF7710E29B
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 08:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724748501; x=1756284501;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3U6UBnhR4ovqoBxdAWo2TDFcVsH0lnmlFCScTThPCkI=;
 b=hAv0h6uzb414C4BjrSyxz8IpgtSxW4Yyt1Yw8m5WMx+Zgm8tUtS7rJ6y
 MqFbjplVTbi5RYgdW3mGewKzjzoDgAxg+ygL4vez9sIPHtfapne2Ani/Q
 CE1L45+i8AiqPmFXBjxiwVJzamIuQ+ES+NJ8w4y693Ngm4jeqkxwQXa57
 swZ3j2x1bg7DzXbkeyNxoDHYlyCkyyyxcVTDgoQgo/vhc5F3Hh+TI0+qE
 d0jpLuOvZnXXlMC9ohBiRoqljWM3aVivJJTB31fOADU2mevIeDXyQoUsj
 25yFt6VJSF3OkHlI0CEdKszaMFjAyTV3H3Q0e9gzvddmZovVJrRBSCyX1 Q==;
X-CSE-ConnectionGUID: ghfk4LIpSGuMgAJsRR6LfQ==
X-CSE-MsgGUID: TmQ7p4uURwq/mIS0IlIKbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22803713"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="22803713"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 01:48:21 -0700
X-CSE-ConnectionGUID: X+VWduqTSQmELZjGKV/hrQ==
X-CSE-MsgGUID: OmNTadKIThGVut69jhEU8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="67129169"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.244.45])
 ([10.245.244.45])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 01:48:19 -0700
Message-ID: <e722739d-10f4-403d-be67-42a54509e3df@intel.com>
Date: Tue, 27 Aug 2024 09:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Fix memory leak on xe_alloc_pf_queue failure
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
References: <20240826162035.20462-1-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240826162035.20462-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 26/08/2024 17:20, Nirmoy Das wrote:
> Simplify memory unwinding on error also fixing current memory
> leak that can happen on error.
> 
> v2: use devm_kcalloc(Matt A)
> 
> Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 0be4687bfc20..91810d0a9afc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -388,7 +388,6 @@ static void pagefault_fini(void *arg)
>   {
>   	struct xe_gt *gt = arg;
>   	struct xe_device *xe = gt_to_xe(gt);
> -	int i;
>   
>   	if (!xe->info.has_usm)
>   		return;
> @@ -396,12 +395,11 @@ static void pagefault_fini(void *arg)
>   	destroy_workqueue(gt->usm.acc_wq);
>   	destroy_workqueue(gt->usm.pf_wq);
>   

No need for the new line here?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> -	for (i = 0; i < NUM_PF_QUEUE; ++i)
> -		kfree(gt->usm.pf_queue[i].data);
>   }
>   
>   static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
>   {
> +	struct xe_device *xe = gt_to_xe(gt);
>   	xe_dss_mask_t all_dss;
>   	int num_dss, num_eus;
>   
> @@ -417,7 +415,8 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
>   		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW;
>   
>   	pf_queue->gt = gt;
> -	pf_queue->data = kcalloc(pf_queue->num_dw, sizeof(u32), GFP_KERNEL);
> +	pf_queue->data = devm_kcalloc(xe->drm.dev, pf_queue->num_dw,
> +				      sizeof(u32), GFP_KERNEL);
>   	if (!pf_queue->data)
>   		return -ENOMEM;
>   
