Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BF6C71155
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 11:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF45810EB43;
	Fri, 20 Jun 2025 11:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RTNY3bIB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA86D10EB43
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Jun 2025 11:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750417273; x=1781953273;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JRfim6V5NazgMbWoDqhgdbdhooC1TmOLE4sYlYTxI4w=;
 b=RTNY3bIByqzzKY9R9lOXUwej3Uueq3pkMlDTVfBQamn/Kj3PgmWiF9ZK
 AmqITAwstml4n9n94ZwrTaYfXe8j7W2QPc1QYIKYejrHP3mS+QAXt8BnS
 YzVUvGQ7MefmMZ5iYuiPM53xVV+q1MnpeioJv01hoDPn5fSYexs5ajAjw
 9Hn3aIwSORRyXraBDJNxw8KqtH767PZUouPzd+egOkn+crUBCqwGy/2uu
 mz1kFW1OLfkKPThBcWLGOoS4oq6FA5U17OXcWv6JdNN0gVD0AXDdT7yOo
 wng3OhkkZBxSmhveaSiNcE/P95xX5+dLx0Rvsesbjn/ZjncT1r+vmU4NI Q==;
X-CSE-ConnectionGUID: phe4VkyURUeJ92aqsyXu8g==
X-CSE-MsgGUID: fXB7sJ+OSveWV0KNFF5feQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52608595"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="52608595"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 04:01:12 -0700
X-CSE-ConnectionGUID: XymCL3vJTYupdX3LX4Q/pg==
X-CSE-MsgGUID: 64gCv07RTei6R3D8RdyNIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="151183588"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.64])
 ([10.245.245.64])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 04:01:11 -0700
Message-ID: <c6f0b60a-2e70-405f-9be5-e5f270c1ffbe@intel.com>
Date: Fri, 20 Jun 2025 12:01:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drm/xe: Split xe_device_td_flush()
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
References: <20250618-wa-22019338487-v5-0-b888388477f2@intel.com>
 <20250618-wa-22019338487-v5-3-b888388477f2@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250618-wa-22019338487-v5-3-b888388477f2@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 18/06/2025 19:50, Lucas De Marchi wrote:
> xe_device_td_flush() has 2 possible implementations: an entire L2 flush
> or a transient flush, depending on WA 16023588340. Make this clear by
> splitting the function so it calls each of them.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_device.c | 68 +++++++++++++++++++++++++-----------------
>   1 file changed, 40 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8cfcfff250ca5..8396612b68d4b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -981,38 +981,15 @@ void xe_device_wmb(struct xe_device *xe)
>   		xe_mmio_write32(xe_root_tile_mmio(xe), VF_CAP_REG, 0);
>   }
>   
> -/**
> - * xe_device_td_flush() - Flush transient L3 cache entries
> - * @xe: The device
> - *
> - * Display engine has direct access to memory and is never coherent with L3/L4
> - * caches (or CPU caches), however KMD is responsible for specifically flushing
> - * transient L3 GPU cache entries prior to the flip sequence to ensure scanout
> - * can happen from such a surface without seeing corruption.
> - *
> - * Display surfaces can be tagged as transient by mapping it using one of the
> - * various L3:XD PAT index modes on Xe2.
> - *
> - * Note: On non-discrete xe2 platforms, like LNL, the entire L3 cache is flushed
> - * at the end of each submission via PIPE_CONTROL for compute/render, since SA
> - * Media is not coherent with L3 and we want to support render-vs-media
> - * usescases. For other engines like copy/blt the HW internally forces uncached
> - * behaviour, hence why we can skip the TDF on such platforms.
> +/*
> + * Issue a TRANSIENT_FLUSH_REQUEST and wait for completion on each gt.
>    */
> -void xe_device_td_flush(struct xe_device *xe)
> +static void tdf_request_sync(struct xe_device *xe)
>   {
> -	struct xe_gt *gt;
>   	unsigned int fw_ref;
> +	struct xe_gt *gt;
>   	u8 id;
>   
> -	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
> -		return;
> -
> -	if (XE_WA(xe_root_mmio_gt(xe), 16023588340)) {
> -		xe_device_l2_flush(xe);
> -		return;
> -	}
> -
>   	for_each_gt(gt, xe, id) {
>   		if (xe_gt_is_media_type(gt))
>   			continue;
> @@ -1022,6 +999,7 @@ void xe_device_td_flush(struct xe_device *xe)
>   			return;
>   
>   		xe_mmio_write32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST);
> +
>   		/*
>   		 * FIXME: We can likely do better here with our choice of
>   		 * timeout. Currently we just assume the worst case, i.e. 150us,
> @@ -1052,15 +1030,49 @@ void xe_device_l2_flush(struct xe_device *xe)
>   		return;
>   
>   	spin_lock(&gt->global_invl_lock);
> -	xe_mmio_write32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1);
>   
> +	xe_mmio_write32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1);
>   	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 500, NULL, true))
>   		xe_gt_err_once(gt, "Global invalidation timeout\n");
> +
>   	spin_unlock(&gt->global_invl_lock);
>   
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
> +/**
> + * xe_device_td_flush() - Flush transient L3 cache entries
> + * @xe: The device
> + *
> + * Display engine has direct access to memory and is never coherent with L3/L4
> + * caches (or CPU caches), however KMD is responsible for specifically flushing
> + * transient L3 GPU cache entries prior to the flip sequence to ensure scanout
> + * can happen from such a surface without seeing corruption.
> + *
> + * Display surfaces can be tagged as transient by mapping it using one of the
> + * various L3:XD PAT index modes on Xe2.
> + *
> + * Note: On non-discrete xe2 platforms, like LNL, the entire L3 cache is flushed
> + * at the end of each submission via PIPE_CONTROL for compute/render, since SA
> + * Media is not coherent with L3 and we want to support render-vs-media
> + * usescases. For other engines like copy/blt the HW internally forces uncached
> + * behaviour, hence why we can skip the TDF on such platforms.
> + */
> +void xe_device_td_flush(struct xe_device *xe)
> +{
> +	struct xe_gt *root_gt;
> +
> +	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
> +		return;
> +
> +	root_gt = xe_root_mmio_gt(xe);
> +	if (XE_WA(root_gt, 16023588340))
> +		/* A transient flush is not sufficient: flush the L2 */
> +		xe_device_l2_flush(xe);
> +	else
> +		tdf_request_sync(xe);
> +}
> +
>   u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>   {
>   	return xe_device_has_flat_ccs(xe) ?
> 

