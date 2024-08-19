Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C70C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 19:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FEF10E342;
	Mon, 19 Aug 2024 19:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ww6cEI94";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D0410E342
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 19:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724095505; x=1755631505;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lCey8VJrk+/HEj7e5JgM7+582zUma6Pm/Le3gs8cCts=;
 b=Ww6cEI94GOXHaOmL5Uupim7aec1gQI+/VQxcmkpGZzE0AC/41qq8HfwO
 LYy0XBwaDH9qUgnEMqSwisrJxXfLjdHYp9mhu1GGInEypZCGHdeazpf+n
 fW3BGVW5d1Vz0CxgQgc/EIvabAAIU4RnAkaLxENLmST+Hepq13YQocHjX
 8YCxJGR/10YH7uiLiZgIBhB5Xo4yyQInkNus9sjV9HEWl0IkvT1qD3x7r
 nRnRRbMUKiyajavUV1INjFVUupKrDgL7z1+S/tH8LqLe3wW7TDVD6/QgI
 a0j6rsGwyMh5pLniPS4hbu+OSaTSZSyxZY4WRac7Rr/SfeJaqVrBZZnpQ A==;
X-CSE-ConnectionGUID: HI6OxpTIQDSNvO98/sLazQ==
X-CSE-MsgGUID: R7/RpB4/S1GSuY6cJUBxtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22541558"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="22541558"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 12:25:04 -0700
X-CSE-ConnectionGUID: Co+g/dNIRPW2h6pJ8vtZLQ==
X-CSE-MsgGUID: AaS8Oio/S0akQUNj1gegDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="60131102"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 19 Aug 2024 12:25:03 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E283F2FC67;
 Mon, 19 Aug 2024 20:25:01 +0100 (IST)
Message-ID: <b223a09d-c469-43eb-8fd8-23219bfb3123@intel.com>
Date: Mon, 19 Aug 2024 21:25:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] drm/xe: Refactor xe_ggtt balloon functions to make
 the node clear
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, jose.souza@intel.com
References: <20240817103556.163783-1-rodrigo.vivi@intel.com>
 <20240817103556.163783-10-rodrigo.vivi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240817103556.163783-10-rodrigo.vivi@intel.com>
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



On 17.08.2024 12:35, Rodrigo Vivi wrote:
> These operations are related to node. Convert them to the
> new appropriate name space xe_ggtt_node.
> 
> v2: Also move arguments around for consistency (Lucas).
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c        | 15 ++++++++-------
>  drivers/gpu/drm/xe/xe_ggtt.h        |  4 ++--
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 +++++-----
>  3 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 960f5a28b7ed..a359d94a979e 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -347,17 +347,18 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
>  }
>  
>  /**
> - * xe_ggtt_balloon - prevent allocation of specified GGTT addresses
> + * xe_ggtt_node_balloon - prevent allocation of specified GGTT addresses

 * xe_ggtt_node_balloon() - prevent allocation of specified GGTT addresses

>   * @ggtt: the &xe_ggtt where we want to make reservation
> +
> + * @node: the &xe_ggtt_node to hold reserved GGTT node
>   * @start: the starting GGTT address of the reserved region
>   * @end: then end GGTT address of the reserved region
> - * @node: the &xe_ggtt_node to hold reserved GGTT node
>   *
> - * Use xe_ggtt_deballoon() to release a reserved GGTT node.
> + * Use xe_ggtt_node_deballoon() to release a reserved GGTT node.
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)
> +int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node, u64 start, u64 end)

maybe it should be now:

int xe_ggtt_node_insert_balloon(struct xe_ggtt *ggtt,
				struct xe_ggtt_node *node,
				u64 start, u64 end)

and:

void xe_ggtt_node_remove_balloon(struct xe_ggtt *ggtt,
				struct xe_ggtt_node *node)


and maybe some day later, if we decide to move balloon nodes into ggtt,
we can convert that into:

int xe_ggtt_balloon(struct xe_ggtt *ggtt,
		u64 lower_start, u64 lower_end,
		u64 upper_start, u64 upper_end)

and:

int xe_ggtt_deballoon(struct xe_ggtt *ggtt)

as ballooning is a 'xe_ggtt' thing that could fully implemented there

>  {
>  	int err;
>  
> @@ -384,13 +385,13 @@ int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_nod
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
> index 67ae5f1602a3..d61f4f976a5a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -13,8 +13,8 @@ struct drm_printer;
>  int xe_ggtt_init_early(struct xe_ggtt *ggtt);
>  int xe_ggtt_init(struct xe_ggtt *ggtt);
>  
> -int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
> -void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
> +int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node, u64 start, u64 size);
> +void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
>  
>  int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>  			u32 size, u32 align);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 47222bd9988d..db9761a68ce0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -528,7 +528,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
>  	start = xe_wopcm_size(xe);
>  	end = config->ggtt_base;
>  	if (end != start) {
> -		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
> +		err = xe_ggtt_node_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[0], start, end);
>  		if (err)
>  			goto failed;
>  	}
> @@ -536,7 +536,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
>  	start = config->ggtt_base + config->ggtt_size;
>  	end = GUC_GGTT_TOP;
>  	if (end != start) {
> -		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
> +		err = xe_ggtt_node_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[1], start, end);
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
