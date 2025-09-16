Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486B8CAC599
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 13:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C70810E7D3;
	Tue, 16 Sep 2025 13:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mKMxzv2Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACA210E7D3
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 13:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758027813; x=1789563813;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PCrpYGBp7y1JMaIPklpa0DytX0azC/2Q32vX4RzRb5k=;
 b=mKMxzv2ZC9ZG643JI9w8nj5kAWDm0627YLFpUBVtpi+jTCodzsHtzZLZ
 uiKqC+ngFOLsa9yJIylVwG3dqZQl1G/fjj7I+AtCi6MGeNqXjZfNXjPit
 dBstkx9sD2+o0j7yLHnVzprSRaTxfNnGb1AD7r2RBCcpq0L28PvdfjcLl
 QRc5aALY6/zHuZVyD1x3q47ryTnCZrv+V+HqBT5Ug7LIQ5Z9hFwEfU9JU
 UMpnBoBB+IXXybQNUG5sz5tCO39yH88LHaXDOWg8tK2tpopd9zhFkJlxN
 ex47Wx1Qjen1Ga2UZwCocfP/ASxX1u9J9IEkAC4QIkYzV5rnpK0teGNuE A==;
X-CSE-ConnectionGUID: 8EP2sD1ISBGyiYYnxW8yMw==
X-CSE-MsgGUID: mDs5ZpV0QniRThhxa7/Lkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="70928412"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="70928412"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 06:03:33 -0700
X-CSE-ConnectionGUID: BnwxnEbjRreiI9HhBSnCcQ==
X-CSE-MsgGUID: LS6yIRNKQVGqHcbbxc7WMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="174225419"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.199])
 ([10.245.245.199])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 06:03:30 -0700
Message-ID: <53d50dff-89eb-4de0-befc-4bb2552c5e21@intel.com>
Date: Tue, 16 Sep 2025 14:03:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/xe/dma-buf: Allow pinning of p2p dma-buf
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250916115322.23293-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250916115322.23293-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 16/09/2025 12:53, Thomas Hellström wrote:
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
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_dma_buf.c | 13 +++++++++
>   drivers/gpu/drm/xe/xe_dma_buf.c       | 41 +++++++++++++++++----------
>   2 files changed, 39 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index a7e548a2bdfb..1f88ca71820c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -31,6 +31,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>   			    struct drm_exec *exec)
>   {
>   	struct dma_buf_test_params *params = to_dma_buf_test_params(test->priv);
> +	struct dma_buf_attachment *attach;
>   	u32 mem_type;
>   	int ret;
>   
> @@ -88,6 +89,18 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>   
>   	KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, mem_type));
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
>   	if (params->force_different_devices)
>   		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(imported, XE_PL_TT));
>   	else
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index a7d67725c3ee..54e42960daad 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -48,32 +48,43 @@ static void xe_dma_buf_detach(struct dma_buf *dmabuf,
>   
>   static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
>   {
> -	struct drm_gem_object *obj = attach->dmabuf->priv;
> +	struct dma_buf *dmabuf = attach->dmabuf;
> +	struct drm_gem_object *obj = dmabuf->priv;
>   	struct xe_bo *bo = gem_to_xe_bo(obj);
>   	struct xe_device *xe = xe_bo_device(bo);
>   	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
> +	bool allow_vram = true;
>   	int ret;
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
>   		drm_dbg(&xe->drm, "Can't migrate pinned bo for dma-buf pin.\n");
>   		return -EINVAL;
>   	}
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
>   	}
>   
> -	ret = xe_bo_pin_external(bo, true, exec);
> +	ret = xe_bo_pin_external(bo, !allow_vram, exec);

Are we also missing save/restore support for such objects? Or at least I 
can't see where the save flow is happening for externally pinned VRAM?

>   	xe_assert(xe, !ret);
>   
>   	return 0;

