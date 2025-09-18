Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAD5CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 16:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC9510E078;
	Thu, 18 Sep 2025 16:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="VpPCW6Bi";
	dkim-atps=neutral
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB0A10E078
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 16:11:06 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b04b55d5a2cso207724366b.2
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 09:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1758211865; x=1758816665; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qYYNR2VG8S2sFusvV1337bU8O9dt2Shk498SK3+QM+Q=;
 b=VpPCW6Bieo3PyTj4nfnoK+64lzRJTAST8g/OdNFhmzg4ZBM8jAy4/5WuQvvxN/uTlG
 7KuqR4odbAcRBmfRqZzzpQUQLHjVgFuDtR7ZZcxrwNxz6aBhLwTBFz2gNOfZm75ISYKL
 /Bkt3RXAlHp8zrDOwfjf2EIok1LiZbtsslijs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758211865; x=1758816665;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qYYNR2VG8S2sFusvV1337bU8O9dt2Shk498SK3+QM+Q=;
 b=f9ZaRI3oNFC4Pb/mfr2Xxk9hKvnWiYPIKlEl4P2tiQOARp5lPaMcPsTeLNlV6ZLkE9
 ywnCEHKbfoBZcPnuY/2YvCa9H93mmcuC+tMHvPWcAtnTbk1rpbSkoXRp7bPHcaTkIBY7
 ERV3rDPnOnSIzw/Q8vEwvNgv9MAmjWBwVSOEKrkmQ0owSKsLv6eWlsJuRfLGnjKn0kVp
 K8XAy1jZesjxKY9FN/LhAu4/nf9WwSc1s2m9kXK13nLRzCw9z/7Fig/mzklW7SL5brH5
 2fXvBqHBPNHFl1u4FLgz2xV1q17OX/6lnJsooNBNRCxjsFkoCS7WBqjGgSTofZx2cfg9
 5y+Q==
X-Gm-Message-State: AOJu0YzluI+qzb0qGmt+lwRJowzzNngc7hIW9ROAdcU7SyCnVREua1cC
 Usp1oS9JgyeZE8iJ1Glonn/y1Z3H9tSWUUd2OVYxGMlQgnBnJ/O1xXTRVhfK5ogtiYE=
X-Gm-Gg: ASbGncu8He5hCPIDco7yO2DztsSJufKwr3Y6K4vteGF6/tpmYMxgjrEk/B0fzZd/hCK
 N6repyzwqaVvQNmGPr5H0uMVSuziUCzEWSnI6umx0BX8BDCzbLTiEUwshOkzwOwqBp2JmaZI8C4
 njPbYMsR9nUYLvGh1mY8iX4sfnHw/4Wkj6GBhoR1V/9vLbqAxKX1pyzpGwX40TL7kn5JE5vpyB8
 i0GOEoQpCvM2c8Ns/q8+AKveEkei+upgnO/Z7tjZAqKM2JVJr1jSSPUmyd5pAefpA6fSOvXx79B
 Ou5/0bvPG5A1xkUwi/5RxgUNU78xG51TJAFXDIL66AADekHJf1AefN/2VhETZ9nsqs7ODhpFXS9
 lEWbb72iVQvqRBwJpN6FHJN8Rua4I2fMOwc5vt8Y1Lgb9woNW4hpE
X-Google-Smtp-Source: AGHT+IHX8LDBk/Ad8V/yyp2J+P3JQogBDOWtsWnCNmIsxWirJQ/9aoWyg4PVdoNzpYA9AMZ5IvnK+A==
X-Received: by 2002:a17:907:1c94:b0:b04:80c5:685c with SMTP id
 a640c23a62f3a-b1bbfa2cc78mr694454866b.35.1758211864364; 
 Thu, 18 Sep 2025 09:11:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b1fc5f382c6sm225275066b.4.2025.09.18.09.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 09:11:02 -0700 (PDT)
Date: Thu, 18 Sep 2025 18:10:59 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe/dma-buf: Allow pinning of p2p dma-buf
Message-ID: <aMwvE0SypYShDqsv@phenom.ffwll.local>
References: <20250918092207.54472-1-thomas.hellstrom@linux.intel.com>
 <20250918092207.54472-4-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918092207.54472-4-thomas.hellstrom@linux.intel.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Thu, Sep 18, 2025 at 11:22:07AM +0200, Thomas Hellström wrote:
> RDMA NICs typically requires the VRAM dma-bufs to be pinned in
> VRAM for pcie-p2p communication, since they don't fully support
> the move_notify() scheme. We would like to support that.
> 
> However allowing unaccounted pinning of VRAM creates a DOS vector
> so up until now we haven't allowed it.
> 
> However with cgroups support in TTM, the amount of VRAM allocated
> to a cgroup can be limited, and since also the pinned memory is
> accounted as allocated VRAM we should be safe.
> 
> An analogy with system memory can be made if we observe the
> similarity with kernel system memory that is allocated as the
> result of user-space action and that is accounted using __GFP_ACCOUNT.
> 
> Ideally, to be more flexible, we would add a "pinned_memory",
> or possibly "kernel_memory" limit to the dmem cgroups controller,
> that would additionally limit the memory that is pinned in this way.
> If we let that limit default to the dmem::max limit we can
> introduce that without needing to care about regressions.
> 
> Considering that we already pin VRAM in this way for at least
> page-table memory and LRC memory, and the above path to greater
> flexibility, allow this also for dma-bufs.
> 
> v2:
> - Update comments about pinning in the dma-buf kunit test
>   (Niranjana Vishwanathapura)
> 
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

For the same reasons I've acked the amd version of this - vram/gpu memory
accounting is really complex, there's way too many pieces to land them all
perfectly in one big step. Which means the prudent choice is pragmatically
merging useful things without painting ourselves too badly into a corner.
And I think with basic vram cgroup accounting we have that now to land
cross-driver pinning. Of course, there's still a lot of work left to do.

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Cheers, Sima

> ---
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c | 17 +++++++++--
>  drivers/gpu/drm/xe/xe_dma_buf.c       | 41 +++++++++++++++++----------
>  2 files changed, 41 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index a7e548a2bdfb..5df98de5ba3c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -31,6 +31,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>  			    struct drm_exec *exec)
>  {
>  	struct dma_buf_test_params *params = to_dma_buf_test_params(test->priv);
> +	struct dma_buf_attachment *attach;
>  	u32 mem_type;
>  	int ret;
>  
> @@ -46,7 +47,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>  		mem_type = XE_PL_TT;
>  	else if (params->force_different_devices && !is_dynamic(params) &&
>  		 (params->mem_mask & XE_BO_FLAG_SYSTEM))
> -		/* Pin migrated to TT */
> +		/* Pin migrated to TT on non-dynamic attachments. */
>  		mem_type = XE_PL_TT;
>  
>  	if (!xe_bo_is_mem_type(exported, mem_type)) {
> @@ -88,6 +89,18 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>  
>  	KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, mem_type));
>  
> +	/* Check that we can pin without migrating. */
> +	attach = list_first_entry_or_null(&dmabuf->attachments, typeof(*attach), node);
> +	if (attach) {
> +		int err = dma_buf_pin(attach);
> +
> +		if (!err) {
> +			KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, mem_type));
> +			dma_buf_unpin(attach);
> +		}
> +		KUNIT_EXPECT_EQ(test, err, 0);
> +	}
> +
>  	if (params->force_different_devices)
>  		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(imported, XE_PL_TT));
>  	else
> @@ -150,7 +163,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
>  			xe_bo_lock(import_bo, false);
>  			err = xe_bo_validate(import_bo, NULL, false, exec);
>  
> -			/* Pinning in VRAM is not allowed. */
> +			/* Pinning in VRAM is not allowed for non-dynamic attachments */
>  			if (!is_dynamic(params) &&
>  			    params->force_different_devices &&
>  			    !(params->mem_mask & XE_BO_FLAG_SYSTEM))
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index a7d67725c3ee..54e42960daad 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -48,32 +48,43 @@ static void xe_dma_buf_detach(struct dma_buf *dmabuf,
>  
>  static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
>  {
> -	struct drm_gem_object *obj = attach->dmabuf->priv;
> +	struct dma_buf *dmabuf = attach->dmabuf;
> +	struct drm_gem_object *obj = dmabuf->priv;
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
>  	struct xe_device *xe = xe_bo_device(bo);
>  	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
> +	bool allow_vram = true;
>  	int ret;
>  
> -	/*
> -	 * For now only support pinning in TT memory, for two reasons:
> -	 * 1) Avoid pinning in a placement not accessible to some importers.
> -	 * 2) Pinning in VRAM requires PIN accounting which is a to-do.
> -	 */
> -	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo, XE_PL_TT)) {
> +	if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
> +		allow_vram = false;
> +	} else {
> +		list_for_each_entry(attach, &dmabuf->attachments, node) {
> +			if (!attach->peer2peer) {
> +				allow_vram = false;
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo, XE_PL_TT) &&
> +	    !(xe_bo_is_vram(bo) && allow_vram)) {
>  		drm_dbg(&xe->drm, "Can't migrate pinned bo for dma-buf pin.\n");
>  		return -EINVAL;
>  	}
>  
> -	ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
> -	if (ret) {
> -		if (ret != -EINTR && ret != -ERESTARTSYS)
> -			drm_dbg(&xe->drm,
> -				"Failed migrating dma-buf to TT memory: %pe\n",
> -				ERR_PTR(ret));
> -		return ret;
> +	if (!allow_vram) {
> +		ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
> +		if (ret) {
> +			if (ret != -EINTR && ret != -ERESTARTSYS)
> +				drm_dbg(&xe->drm,
> +					"Failed migrating dma-buf to TT memory: %pe\n",
> +					ERR_PTR(ret));
> +			return ret;
> +		}
>  	}
>  
> -	ret = xe_bo_pin_external(bo, true, exec);
> +	ret = xe_bo_pin_external(bo, !allow_vram, exec);
>  	xe_assert(xe, !ret);
>  
>  	return 0;
> -- 
> 2.51.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
