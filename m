Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F8ACCD195
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 09:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E28510E725;
	Wed, 22 Oct 2025 09:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWGf8UEx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89FC10E725
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761126849; x=1792662849;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=eqmyfdiN9+3jL4GpRhkyPC986QttdaaB4JVEJk3MfOw=;
 b=NWGf8UExKbepaNclU4rrmbH8+dKjwRugJ+g1k6MXsQ2kHrcX4hM3hVJr
 wLZ0kmnn771skBg1Ia8bZBYmgQ2ECICtY+SxIdX9JdReM8Mp6wvify/wX
 NWKCHCPw41Mi1FB7oZR1tjD0TKUzavFANf0MF0BlXoMfit5e59znp8Ki7
 BQb0jKrHFPnIb2OllccOmWgcZ982oDJR8hfR4OvqtxaixeZBZAQ3CcxGZ
 Aj460FfnzsCREafGKPfw1L2YHHd7bWY941JbVss4lQ9fPUrSTN2FoioLD
 C8fe25eAy5bjRRdBmq6eXJuwt+mzx7ASrHNmR7z4G6MVOfm+mrIlDp7WI w==;
X-CSE-ConnectionGUID: 1drIXSDSSrayrt9HGB4d7Q==
X-CSE-MsgGUID: RoNytudXQx2dZ3MjmkizIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74388551"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="74388551"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 02:54:09 -0700
X-CSE-ConnectionGUID: af9h+CFfQCahm55rPBefOQ==
X-CSE-MsgGUID: GeKzlLkQSfKkdeMVXGF/sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="187869187"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.244.63])
 ([10.245.244.63])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 02:54:08 -0700
Message-ID: <8b1b8d13-581e-4692-a1b1-7e77b1c73a89@intel.com>
Date: Wed, 22 Oct 2025 10:54:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Check return value of GGTT workqueue
 allocation
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20251022005538.828980-1-matthew.brost@intel.com>
 <20251022005538.828980-2-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251022005538.828980-2-matthew.brost@intel.com>
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

On 22/10/2025 01:55, Matthew Brost wrote:
> Workqueue allocation can fail, so check the return value of the GGTT
> workqueue allocation and fail driver initialization if the allocation
> fails.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_ggtt.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 40680f0c49a1..20d226d90c50 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -312,6 +312,9 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>   		ggtt->pt_ops = &xelp_pt_ops;
>   
>   	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
> +	if (!ggtt->wq)
> +		return -ENOMEM;
> +
>   	__xe_ggtt_init_early(ggtt, xe_wopcm_size(xe));
>   
>   	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);

