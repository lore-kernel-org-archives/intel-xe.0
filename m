Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38EB606A339
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 20:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QSYEVQl0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2F610E81B;
	Wed, 18 Nov 2026 20:13:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C9010E81B
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 20:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795032798; x=1826568798;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qeKExVTagRgQbPuW/viD/1o66DDzXrtG7ON9TLzTvao=;
 b=QSYEVQl0pTOMJ8zS+UUAMWtW7x/Svu3q7eWYmlgW6WBuPLavCZQucOtH
 Lz/UI1SZ2Gq4/6dftP+QZqrN80J/a4Q8bA2ywfTilnmPxXON2x5pkQr6t
 MhtJHT3qAk8dXOas0EA7qyxKK69K+WZaWt/DsBq5+SWPNWLh14eT6SDtt
 2BMqwZdKBcwBHXVH26n6hpCKSUei+U23FTEcKTxRI0PbhtSMoDAL0M3PX
 AC+PhGtMOrU90BIWAIY2kXm87wdQdrlpmTBdaVHSUwNtyHcl11jm1KLl0
 22TNLa5IjFUb3otJzwp/k12g+BFUU7wTDepbOo9ClosAqRG3m7qgQu881 A==;
X-CSE-ConnectionGUID: b62qc/NKTWWczygwWMh/Fg==
X-CSE-MsgGUID: hMcqEzLBSqyzSkurckSCAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3755919"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3755919"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 12:13:17 -0800
X-CSE-ConnectionGUID: bCROj0YQSKqk7I8HvgSnxg==
X-CSE-MsgGUID: fj0UZ/DTSTq59nV7qiqdOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10278309"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 12:13:16 -0800
Date: Wed, 18 Nov 2026 22:13:12 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v4 6/6] drm/xe/ggtt: Remove xe_ggtt_insert_bo_at
Message-ID: <av4G2Mpesx625Syi@intel.com>
References: <20261116122828.266113-8-dev@lankhorst.se>
 <20261116122828.266113-14-dev@lankhorst.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261116122828.266113-14-dev@lankhorst.se>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 01:28:35PM +0100, Maarten Lankhorst wrote:
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
> index 42a6aa1a2e4a0..a8b047a553e13 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2733,13 +2733,7 @@ __xe_bo_create_locked(struct xe_device *xe,
>  			if (t != tile && !(bo->flags & XE_BO_FLAG_GGTTx(t)))
>  				continue;
>  
> -			if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
> -				err = xe_ggtt_insert_bo_at(t->mem.ggtt, bo,
> -							   start + xe_bo_size(bo), U64_MAX,
> -							   exec);
> -			} else {
> -				err = xe_ggtt_insert_bo(t->mem.ggtt, bo, exec);
> -			}

I guess this was the code I was complaining about at some point that
confuses GGTT address and the physical/etc address. Now I guess we'll
just insert based on whatever policy xe_ggtt_insert_bo() implements.
With the old PTEs protected from being overwritten that is fine.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +			err = xe_ggtt_insert_bo(t->mem.ggtt, bo, exec);
>  			if (err)
>  				goto err_unlock_put_bo;
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index d7486dd545a26..2bdcd37da23a3 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -979,22 +979,6 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
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
> index 7cd8b45ed5cd8..ac2bc7f7b9a66 100644
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
> 2.55.0

-- 
Ville Syrjälä
Intel
