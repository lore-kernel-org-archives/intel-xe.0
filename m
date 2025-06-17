Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68814C71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 16:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2727410E0F4;
	Tue, 17 Jun 2025 16:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mssmpYOK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C079610E0F4
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 16:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750177613; x=1781713613;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=05w2d9pQn49GBKjN5vG4Maoa4OIgXqw2oKlhjzh22uM=;
 b=mssmpYOKRVP0ceaqHhAiMROODBi6A99MapFC4vSAeYPBtr4GaQswn9qA
 4HNYOIg4AdmELNaKzH7mWojeZsxeseqZxnjlL9xq5wZNLDfTQFRS8vZLI
 uYbT9ATYe1QfatGkttEdOF/7NEEzipEG34t1UwoLSdM/ijqh7pYm7HMo9
 31oKjPbQW/V6/KxvdJHFd7tkXFqYX5GKu+AU+fC6y91EObC6QWMgB9sRK
 JG+UU6kJ+eCx9krPzKakC8DiXD6GdCst6uvSfdtlohFV/umV2imsre6WL
 7wsJGir/tJ8qEIQwj4ceW4/V3tdiEa1B6+M5bX/Rg092UhX9AeexWt1Cs Q==;
X-CSE-ConnectionGUID: ykN+Sy8CQmeupTZW+T6kig==
X-CSE-MsgGUID: CdeW2s6yQhOj3CZjZzhGKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52503690"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="52503690"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 09:26:52 -0700
X-CSE-ConnectionGUID: pLaZZmXJQDOKinGY7kfs8w==
X-CSE-MsgGUID: 22sXZ1wHS6mFvTT8VvsYGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="154124500"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.184])
 by orviesa005.jf.intel.com with SMTP; 17 Jun 2025 09:26:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 17 Jun 2025 19:26:48 +0300
Date: Tue, 17 Jun 2025 19:26:48 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/xe: Move DSB l2 flush to a more sensible place
Message-ID: <aFGXSPmrDiB8MNrG@intel.com>
References: <20250606104546.1996818-3-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606104546.1996818-3-matthew.auld@intel.com>
X-Patchwork-Hint: comment
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

On Fri, Jun 06, 2025 at 11:45:47AM +0100, Matthew Auld wrote:
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> Flushing l2 is only needed after all data has been written.
> 
> Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: <stable@vger.kernel.org> # v6.12+
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>

Looks reasonable.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_dsb_buffer.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> index f95375451e2f..9f941fc2e36b 100644
> --- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> +++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> @@ -17,10 +17,7 @@ u32 intel_dsb_buffer_ggtt_offset(struct intel_dsb_buffer *dsb_buf)
>  
>  void intel_dsb_buffer_write(struct intel_dsb_buffer *dsb_buf, u32 idx, u32 val)
>  {
> -	struct xe_device *xe = dsb_buf->vma->bo->tile->xe;
> -
>  	iosys_map_wr(&dsb_buf->vma->bo->vmap, idx * 4, u32, val);
> -	xe_device_l2_flush(xe);
>  }
>  
>  u32 intel_dsb_buffer_read(struct intel_dsb_buffer *dsb_buf, u32 idx)
> @@ -30,12 +27,9 @@ u32 intel_dsb_buffer_read(struct intel_dsb_buffer *dsb_buf, u32 idx)
>  
>  void intel_dsb_buffer_memset(struct intel_dsb_buffer *dsb_buf, u32 idx, u32 val, size_t size)
>  {
> -	struct xe_device *xe = dsb_buf->vma->bo->tile->xe;
> -
>  	WARN_ON(idx > (dsb_buf->buf_size - size) / sizeof(*dsb_buf->cmd_buf));
>  
>  	iosys_map_memset(&dsb_buf->vma->bo->vmap, idx * 4, val, size);
> -	xe_device_l2_flush(xe);
>  }
>  
>  bool intel_dsb_buffer_create(struct intel_crtc *crtc, struct intel_dsb_buffer *dsb_buf, size_t size)
> @@ -74,9 +68,12 @@ void intel_dsb_buffer_cleanup(struct intel_dsb_buffer *dsb_buf)
>  
>  void intel_dsb_buffer_flush_map(struct intel_dsb_buffer *dsb_buf)
>  {
> +	struct xe_device *xe = dsb_buf->vma->bo->tile->xe;
> +
>  	/*
>  	 * The memory barrier here is to ensure coherency of DSB vs MMIO,
>  	 * both for weak ordering archs and discrete cards.
>  	 */
> -	xe_device_wmb(dsb_buf->vma->bo->tile->xe);
> +	xe_device_wmb(xe);
> +	xe_device_l2_flush(xe);
>  }
> -- 
> 2.49.0

-- 
Ville Syrjälä
Intel
