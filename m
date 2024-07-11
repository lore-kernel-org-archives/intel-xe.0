Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2FBC3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 20:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF63210EACF;
	Thu, 11 Jul 2024 20:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YeA+n4zJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9B410E2AC
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 20:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720729049; x=1752265049;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=I65p5Z1yViHKnef6mYhfUNXd6ARhm6vn0nu9QYmB0bs=;
 b=YeA+n4zJpbr2Tu45+S+Z0eL1uozmHv65FClV6C7Xz4QD9KeAR7h11FzT
 0LKsrcnNcZwittA44+ig3HuEzN5sy+YcXgcda9y/vE0uAvmj80FohWKCl
 M46K+BTYCUwNBpkDFxBorgFf3NkInvmXrIdsxMzbBFH5hlRMEMsdHoemx
 T6AHRuiUEiyvWRW2whXyyLx/gURw8kPehNrIDjXaxrmMc6gSrQQV28YGv
 VXGTyvTgoCvdur08GxigYWCElcx3NxqYxcpwcbmwXoA9bmSdurjeMNvMe
 aoemb0uGYTC7XypAgjYnLJHnZm3BJ+EI1R/dWfHxzXkUrYA6nKYshImF4 A==;
X-CSE-ConnectionGUID: +iKYEgJIR22QuwlhDhxXPg==
X-CSE-MsgGUID: OnLh+1WLREGi9f3fRC7mfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="35687603"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="35687603"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 13:17:29 -0700
X-CSE-ConnectionGUID: /2Yd2CapTn+zfhjUXH4sBg==
X-CSE-MsgGUID: goQtXLLgQ4WkSbdPh1Tspg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="53067516"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 11 Jul 2024 13:17:27 -0700
Received: from [10.246.49.75] (mwajdecz-MOBL.ger.corp.intel.com [10.246.49.75])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id DD9762879A;
 Thu, 11 Jul 2024 21:17:25 +0100 (IST)
Message-ID: <72b8f83b-72e7-4b78-93fa-aa56f17c4177@intel.com>
Date: Thu, 11 Jul 2024 22:17:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] drm/xe: Rename xe_ggtt balloon functions to make
 the node clear
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
 <20240711171155.173717-10-rodrigo.vivi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240711171155.173717-10-rodrigo.vivi@intel.com>
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



On 11.07.2024 19:11, Rodrigo Vivi wrote:
> These operations are related to node. Convert them to the
> new appropriate name space xe_ggtt_node.

hmm, actually these operations were meant to be GGTT related [1], but it
was suggested that it would be better to keep required nodes on the
client side

[1] https://patchwork.freedesktop.org/patch/341977/?series=69844&rev=1

but maybe we can return to this idea and on the Xe driver lets hide
balloon nodes inside the xe_ggtt ?

and later on we may want to add xe_ggtt_reballoon() to shift the range

> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c        | 12 ++++++------
>  drivers/gpu/drm/xe/xe_ggtt.h        |  4 ++--
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 +++++-----
>  3 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 5b51753fe1ba..928c01f9e212 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -347,17 +347,17 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
>  }
>  
>  /**
> - * xe_ggtt_balloon - prevent allocation of specified GGTT addresses
> + * xe_ggtt_node_balloon - prevent allocation of specified GGTT addresses
>   * @ggtt: the &xe_ggtt where we want to make reservation
>   * @start: the starting GGTT address of the reserved region
>   * @end: then end GGTT address of the reserved region
>   * @node: the &xe_ggtt_node to hold reserved GGTT node
>   *
> - * Use xe_ggtt_deballoon() to release a reserved GGTT node.
> + * Use xe_ggtt_node_deballoon() to release a reserved GGTT node.
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)
> +int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)
>  {
>  	int err;
>  
> @@ -384,13 +384,13 @@ int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_nod
>  }
>  
>  /**
> - * xe_ggtt_deballoon - release a reserved GGTT region
> + * xe_ggtt_node_deballoon - release a reserved GGTT region
>   * @ggtt: the &xe_ggtt where reserved node belongs
>   * @node: the &xe_ggtt_node with reserved GGTT region
>   *
> - * See xe_ggtt_balloon() for details.
> + * See xe_ggtt_node_balloon() for details.
>   */
> -void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
> +void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
>  {
>  	if (!drm_mm_node_allocated(&node->base))
>  		return;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 67ae5f1602a3..e68cede2e6b5 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -13,8 +13,8 @@ struct drm_printer;
>  int xe_ggtt_init_early(struct xe_ggtt *ggtt);
>  int xe_ggtt_init(struct xe_ggtt *ggtt);
>  
> -int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
> -void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
> +int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
> +void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
>  
>  int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>  			u32 size, u32 align);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 41e46a00c01e..a478e6e1b20e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -528,7 +528,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
>  	start = xe_wopcm_size(xe);
>  	end = config->ggtt_base;
>  	if (end != start) {
> -		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
> +		err = xe_ggtt_node_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
>  		if (err)
>  			goto failed;
>  	}
> @@ -536,7 +536,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
>  	start = config->ggtt_base + config->ggtt_size;
>  	end = GUC_GGTT_TOP;
>  	if (end != start) {
> -		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
> +		err = xe_ggtt_node_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
>  		if (err)
>  			goto deballoon;
>  	}
> @@ -544,7 +544,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
>  	return 0;
>  
>  deballoon:
> -	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
> +	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
>  failed:
>  	return err;
>  }
> @@ -555,8 +555,8 @@ static void deballoon_ggtt(struct drm_device *drm, void *arg)
>  	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  
>  	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
> -	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
> +	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
> +	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
>  }
>  
>  /**
