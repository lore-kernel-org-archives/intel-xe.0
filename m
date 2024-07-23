Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1397EC3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 12:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52ED510E37B;
	Tue, 23 Jul 2024 12:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VafWbnl3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64CD10E5A1
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 12:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721736904; x=1753272904;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dvMXBhzaaNKyuVKmgXqatCEN/smNdoRar1ALkm7aqXI=;
 b=VafWbnl3qfOGL1SR86Mwuz6q7MZyIf/w4Wv8HtqqRQ3nee8ioQ0mue/8
 v3KujJCA12OgUMWukSp7lvs81FtS8q+1BU4u7Nj3FoPNWC9rVZ2pHjCK7
 4/cPy4BQi+q3BBvGfkO3cgxXuhhj5tJXnTe7++aXJ7Wdp6Rrym9GffDxa
 uR3dznJ5YnhuAQgwPbCc+AvxXWXJ4LMaIwBY1pDIs+J0zOsYLRCfdsF4E
 P0LkaXUPs3H2UNDMYzVe4EmC+Wthw7B1eMmSWaWGLqyaDmDB2Om3nBlhp
 Y1haAJKJ18K0EvUq5Axv82X8CaYidMtb4WtVCND5+lZFHAT5qPb+Rx3oz A==;
X-CSE-ConnectionGUID: VAwX9q87Qf6b3TQFe9uCdg==
X-CSE-MsgGUID: 0P5zSPqYR1KO97NVLjLUrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="36879600"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="36879600"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 05:15:03 -0700
X-CSE-ConnectionGUID: ZvLOMsaITQCYjTKicw2PzQ==
X-CSE-MsgGUID: X7WwL0TBR7GwYIaPgJgUog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="82846477"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 23 Jul 2024 05:15:00 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 5ABFD28774;
 Tue, 23 Jul 2024 13:14:59 +0100 (IST)
Message-ID: <95966c2f-45d2-43f4-a744-9b14fe05ba9d@intel.com>
Date: Tue, 23 Jul 2024 14:14:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Create debugfs for tlb inval stats
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
References: <20240723111610.21564-1-nirmoy.das@intel.com>
 <20240723111610.21564-3-nirmoy.das@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240723111610.21564-3-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 23.07.2024 13:16, Nirmoy Das wrote:
> Create debugfs file for each GT to dump tlb sent/receive
> stats.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c          | 9 +++++++++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 7 +++++++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h | 2 ++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 5e7fd937917a..959d979927dd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -17,6 +17,7 @@
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_sriov_pf_debugfs.h"
>  #include "xe_gt_sriov_vf_debugfs.h"
> +#include "xe_gt_tlb_invalidation.h"
>  #include "xe_gt_topology.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
> @@ -269,6 +270,13 @@ static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
>  	return 0;
>  }
>  
> +static int tlb_stats(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	xe_gt_tlb_dump(gt, p);
> +
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
>  	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
> @@ -286,6 +294,7 @@ static const struct drm_info_list debugfs_list[] = {
>  	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
>  	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
>  	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
> +	{"tlb_stats", .show = xe_gt_debugfs_simple_show, .data = tlb_stats},
>  };
>  
>  void xe_gt_debugfs_register(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index f84717c1aafa..62a6f42b6c60 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -540,3 +540,10 @@ void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fence *fenc
>  {
>  	xe_pm_runtime_put(gt_to_xe(fence->gt));
>  }
> +
> +void xe_gt_tlb_dump(struct xe_gt *gt, struct drm_printer *p)

if you make this function as returning "int" then you will be able to
plug it directly into debugfs_list without the tlb_stats() wrapper

> +{
> +	drm_printf(p, "GT%d, TLB Requests sent: %llu, received: %llu\n",
> +		   gt->info.id, atomic64_read(&gt->tlb_invalidation.sent_count),
> +		   atomic64_read(&gt->tlb_invalidation.received_count));

printing the GT identifier (GT%d) is redundant as path to this debugfs
entry already contains GT identifier:

$ sudo cat  /sys/kernel/debug/dri/0/gt1/tlb_stats
                                    ^^^

GT1, TLB Requests sent: 212, received: 212
^^^

btw, maybe 'last seqno' and 'default timeout' will be worth to be
included in debugfs ?

> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index a84065fa324c..f420029ec02d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -10,6 +10,7 @@
>  
>  #include "xe_gt_tlb_invalidation_types.h"
>  
> +struct drm_printer;
>  struct xe_gt;
>  struct xe_guc;
>  struct xe_vma;
> @@ -36,4 +37,5 @@ xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
>  	dma_fence_wait(&fence->base, false);
>  }
>  
> +void xe_gt_tlb_dump(struct xe_gt *gt, struct drm_printer *p);

missing empty separation line

>  #endif	/* _XE_GT_TLB_INVALIDATION_ */
