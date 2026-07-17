Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5062C4451B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 14:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED1010E46E;
	Fri, 17 Jul 2026 14:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d02Ef1bf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D888210E46E;
 Fri, 17 Jul 2026 14:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784298877; x=1815834877;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WIovFHgFjlHdJOKgs9eMtq3nDnDYX37wHiHljsbDEU4=;
 b=d02Ef1bfev3VzL6gJTf1x4KVS4tm+GpXXNhzPNs459uv5c7icXHp4G+f
 g44kGJHUwnHAUuMYtD2/RUuf9cYvV7fBlO88VZMwKtmXC4wqlKlb1Uwid
 dprRKCbosU7dtAUQvyDfBoO44704JDLVBUt1l5RwFzn8nP49AiyBns2uQ
 D7+QhzV18TcGl/qLPyKEye85NdkETlKPNpyjlhHabo6ImB7DaMapCaVUl
 QW4DHScRLpIKucyMivulp2G3iPATgbhdvLH2iK8L09Yzl/cC5spu3Hvaa
 wUvUFMhovnHWHH18SjGfHPacAxDfYe8CZTiad3OPi/A5s2lx8ICj4d3cZ A==;
X-CSE-ConnectionGUID: aOL96XILT4ymI2tid2yV9w==
X-CSE-MsgGUID: RVW7SstEQCa2jtwhK+phiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="102523149"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="102523149"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 07:34:36 -0700
X-CSE-ConnectionGUID: Jf2WZ5yXSKqnn2B1CyFb1w==
X-CSE-MsgGUID: EsLiiC1wSHSpkqN2dHgp5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="260612372"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.241])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 07:34:35 -0700
Date: Fri, 17 Jul 2026 17:34:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 6/6] drm/xe/ggtt: Remove xe_ggtt_insert_bo_at
Message-ID: <alo9eJuFkgqhOpHF@intel.com>
References: <20260715110557.2172095-1-dev@lankhorst.se>
 <20260715110557.2172095-7-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715110557.2172095-7-dev@lankhorst.se>
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

On Wed, Jul 15, 2026 at 01:05:57PM +0200, Maarten Lankhorst wrote:
> This code was created specifically for the display handover,
> and can be removed now that we temporarily reserve the area
> of GGTT that contains the original framebuffer contents.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_bo.c   |  8 +-------
>  drivers/gpu/drm/xe/xe_ggtt.c | 16 ----------------
>  drivers/gpu/drm/xe/xe_ggtt.h |  2 --
>  3 files changed, 1 insertion(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c266fa6bade1b..5d7d91444dce3 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2560,13 +2560,7 @@ __xe_bo_create_locked(struct xe_device *xe,
>  			if (t != tile && !(bo->flags & XE_BO_FLAG_GGTTx(t)))
>  				continue;
>  
> -			if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
> -				err = xe_ggtt_insert_bo_at(t->mem.ggtt, bo,
> -							   start + xe_bo_size(bo), U64_MAX,
> -							   exec);

The commit message should probable mention that this
ggtt_start==phys_start assumption was nonsense to begin
with.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> -			} else {
> -				err = xe_ggtt_insert_bo(t->mem.ggtt, bo, exec);
> -			}
> +			err = xe_ggtt_insert_bo(t->mem.ggtt, bo, exec);
>  			if (err)
>  				goto err_unlock_put_bo;
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index ff479e0a9f3b3..017e7eeeb2c50 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -900,22 +900,6 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  	return err;
>  }
>  
> -/**
> - * xe_ggtt_insert_bo_at - Insert BO at a specific GGTT space
> - * @ggtt: the &xe_ggtt where bo will be inserted
> - * @bo: the &xe_bo to be inserted
> - * @start: address where it will be inserted
> - * @end: end of the range where it will be inserted
> - * @exec: The drm_exec transaction to use for exhaustive eviction.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> -			 u64 start, u64 end, struct drm_exec *exec)
> -{
> -	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end, exec);
> -}
> -
>  /**
>   * xe_ggtt_insert_bo - Insert BO into GGTT
>   * @ggtt: the &xe_ggtt where bo will be inserted
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 83654544feb6d..02e72dbae0e58 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -36,8 +36,6 @@ void xe_ggtt_node_remove_noclear(struct xe_ggtt_node *node);
>  size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node);
>  void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo, struct drm_exec *exec);
> -int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> -			 u64 start, u64 end, struct drm_exec *exec);
>  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
>  
> -- 
> 2.53.0

-- 
Ville Syrjälä
Intel
