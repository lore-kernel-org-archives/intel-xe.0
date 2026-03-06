Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A36F513F5
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 04:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B1610E0B1;
	Fri,  6 Mar 2026 04:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ayfo05xt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD7C10E0B1
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 04:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772772578; x=1804308578;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=u7ntv00bry5EVp5/dMKXPXRz7UCvL5FkS3nfx6WZF3c=;
 b=Ayfo05xtOknOwroIBXLkKZadBOBKXCHmm+lqPXdlNxUQlRlzVb7bA63i
 4YleylUdA+jhk5pnbv8R9+pscL5CZWv1Gg4N6BvBCiKMogAg3OKJcdCGR
 iLkIOd8yZQuysb0zcfSZRaR2iMli7MlocAznQ5hM8M0mZaHJxiMVsawWk
 rG2ipk7hTP9TOqOGLa4B7Kb8uWxrPPVvp+3bwpjd9jqSKKezquksW6gTU
 hyL8hg2bFOc/Xwtd0wCxPp9O5RNhdwr3GCP8vrNhFn7lDFL38vL//9rgL
 cQIumZ5RunSbBeZXHl4o/JH/UVCHtLOnvi0Md15Pl+L+eKerjFqYTjfm/ w==;
X-CSE-ConnectionGUID: 8XOeGMgPQPSr1cdQn5NYzg==
X-CSE-MsgGUID: hSHyhdpUT66Sll6j6XcHYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73951963"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73951963"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 20:49:37 -0800
X-CSE-ConnectionGUID: ZeGB699DRYCQS6QRQXyjfg==
X-CSE-MsgGUID: 92orzAIVRRWBz+RnHkK/FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="218853378"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 20:49:36 -0800
Date: Fri, 6 Mar 2026 05:49:32 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe/lrc: Fix IS_ERR check on wrong pointer in
 xe_lrc_init()
Message-ID: <aapc3HCFwwy2tSIY@black.igk.intel.com>
References: <20260305184519.155060-1-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305184519.155060-1-shuicheng.lin@intel.com>
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

On Thu, Mar 05, 2026 at 06:45:19PM +0000, Shuicheng Lin wrote:
> The result of xe_bo_create_pin_map_novm() is stored in local variable
> 'bo', but the error check mistakenly used IS_ERR(lrc->bo) instead of
> IS_ERR(bo).
> Fix by checking and dereferencing 'bo' directly.
> 
> Fixes: 89340099c6a4 ("drm/xe/lrc: Refactor context init into xe_lrc_ctx_init()")
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Missed it. Thanks for the fix.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index ebab5d78f7cc..4ac566d4234d 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1598,8 +1598,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
>  	bo = xe_bo_create_pin_map_novm(xe, tile, bo_size,
>  				       ttm_bo_type_kernel,
>  				       bo_flags, false);
> -	if (IS_ERR(lrc->bo))
> -		return PTR_ERR(lrc->bo);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
>  
>  	lrc->bo = bo;
>  
> -- 
> 2.34.1
> 
