Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AECC4451C
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 14:35:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B42510F592;
	Fri, 17 Jul 2026 14:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NmUVOSko";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F047110E46E;
 Fri, 17 Jul 2026 14:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784298930; x=1815834930;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Sxo86iHk6JhyoiJuHjZoc4dKFxinrJN0cVm+TyfHmNY=;
 b=NmUVOSkou9NNPtOaxRNzXpuz/HirqbMAIhCKTODkCDAnMd5ahm8zQtDM
 z5k5JC8eWWIlwsfsR8xGMIdSF2zMJ68o5c0s2CPIQO+dvwLYT3MnECXwc
 Vx9wiv2S91i6XkhApvH6JegESH6dVQzn0AyDbqYqF8h8gJRb1x94Xc8Ge
 PYCJLhnMgcbcfG15y5LHA89cRDJYhRFKALlfUp/tl3wSjHh7U4D+1D2SF
 oJbkZQQQrszFBhg/xchzfsiyQR5KXvbtQzKfrUBt3onY/2a/bfp1mbK3E
 R2g+3yubbKiNLWT1Ysy96bKamh8/zh4j+m5HuK6VG2gnAZjKOFn/Ik/03 g==;
X-CSE-ConnectionGUID: tacaVYAMQUylMi4Xo7UQKg==
X-CSE-MsgGUID: d6cZN1FOQNSvtz9lHm+9lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88792711"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="88792711"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 07:35:30 -0700
X-CSE-ConnectionGUID: o0soWMmYR0KLa6Jgwu34Fg==
X-CSE-MsgGUID: S2ShWQubRka5b5G8qlnakg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="252408212"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.241])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 07:35:28 -0700
Date: Fri, 17 Jul 2026 17:35:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 2/6] drm/xe/ggtt: Add xe_ggtt_node_remove_noclear
Message-ID: <alo9rv15d-xtG85X@intel.com>
References: <20260715110557.2172095-1-dev@lankhorst.se>
 <20260715110557.2172095-3-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715110557.2172095-3-dev@lankhorst.se>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Jul 15, 2026 at 01:05:53PM +0200, Maarten Lankhorst wrote:
> The last bit required for handling fb takeover is
> ensuring we can release the old live framebuffer
> without keeping track. The display code can then
> safely perform the flip.
> 
> It's unfortunately a workaround for how display
> is structured through callbacks instead of being
> a midlayer.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 30 +++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_ggtt.h |  1 +
>  2 files changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index c9f84db3bfecd..ff479e0a9f3b3 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -470,24 +470,40 @@ static void ggtt_node_fini(struct xe_ggtt_node *node)
>  	kfree(node);
>  }
>  
> -static void ggtt_node_remove(struct xe_ggtt_node *node)
> +static void ggtt_node_remove(struct xe_ggtt_node *node, bool clear)
>  {
>  	struct xe_ggtt *ggtt = node->ggtt;
> -	bool bound;
>  
>  	mutex_lock(&ggtt->lock);
> -	bound = ggtt->flags & XE_GGTT_FLAGS_ONLINE;
> -	if (bound)
> +	if (clear)
> +		clear = ggtt->flags & XE_GGTT_FLAGS_ONLINE;
> +	if (clear)
>  		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
>  	drm_mm_remove_node(&node->base);
>  	node->base.size = 0;
> -	if (bound && node->invalidate_on_remove)
> +	if (clear && node->invalidate_on_remove)
>  		xe_ggtt_invalidate(ggtt);
>  	mutex_unlock(&ggtt->lock);
>  
>  	ggtt_node_fini(node);
>  }
>  
> +/**
> + * xe_ggtt_node_remove_noclear - Remove a &xe_ggtt_node from the GGTT without clearing entries
> + * @node: the &xe_ggtt_node to be removed
> + *
> + * This function is similar to xe_ggtt_node_remove(), but doesn't clear
> + * the entries. It's used to release the live FB mapping without
> + * clearing it.
> + *
> + * This function should only be called before xe_ggtt_init() in
> + * the bios FB takeover code.
> + */
> +void xe_ggtt_node_remove_noclear(struct xe_ggtt_node *node)
> +{
> +	ggtt_node_remove(node, false);
> +}
> +
>  static void ggtt_node_remove_work_func(struct work_struct *work)
>  {
>  	struct xe_ggtt_node *node = container_of(work, typeof(*node),
> @@ -495,7 +511,7 @@ static void ggtt_node_remove_work_func(struct work_struct *work)
>  	struct xe_device *xe = tile_to_xe(node->ggtt->tile);
>  
>  	guard(xe_pm_runtime)(xe);
> -	ggtt_node_remove(node);
> +	ggtt_node_remove(node, true);
>  }
>  
>  /**
> @@ -517,7 +533,7 @@ void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
>  	node->invalidate_on_remove = invalidate;
>  
>  	if (xe_pm_runtime_get_if_active(xe)) {
> -		ggtt_node_remove(node);
> +		ggtt_node_remove(node, true);
>  		xe_pm_runtime_put(xe);
>  	} else {
>  		queue_work(ggtt->wq, &node->delayed_removal_work);
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 69974da523f74..83654544feb6d 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -32,6 +32,7 @@ xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
>  			      u64 size, u32 align,
>  			      xe_ggtt_transform_cb transform, void *arg);
>  void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
> +void xe_ggtt_node_remove_noclear(struct xe_ggtt_node *node);
>  size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node);
>  void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo, struct drm_exec *exec);
> -- 
> 2.53.0

-- 
Ville Syrjälä
Intel
