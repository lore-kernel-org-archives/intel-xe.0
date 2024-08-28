Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB02C636EE
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 20:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F9910E5C8;
	Wed, 28 Aug 2024 20:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dryeynoX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3B710E5C8
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 20:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724875270; x=1756411270;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=78gVP/764QouRXkabx919/6oHdEQg38yf8ShEeN3epw=;
 b=dryeynoXxbzgSSYXXH8gcGVbTMs4x0Ag7RkcxZtNs0GZm335VAXGJ+9p
 hp5pt6UHiviMHdhCrKFjfG2E9PUdm2wEwM4r5W1MJ83SijjN7tsuYISJC
 4U+L9OpODGQQaBZ2RuEmyA6ydD8ENmQHT1HyKZsv2FGJ57f/BMtgrklVl
 EJ0SZb8iteDIQWhFAYvT+9m3ngQFtC8PlkQf5jdbDZhToCZyQkE/tL4Mg
 Hch/i2RslzitWBDDaQ5CWJii+MaIOX4qKpxKPx76jH0/pm2M5O9Z3BNMb
 nP96Ssq9KlMmLy1KzvuhUi4HvpiQQ6cCGTXSo54m+Wbqv1vF1oo07SDd+ Q==;
X-CSE-ConnectionGUID: RHX7fV90R92ODNL6+bXtLA==
X-CSE-MsgGUID: VJIq98E3Sy6REKDJZkda1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34004933"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="34004933"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 13:01:10 -0700
X-CSE-ConnectionGUID: PgLVar8pQvqhKx5i++sDJA==
X-CSE-MsgGUID: qQWR7MKiS4mRv+T0ylY96Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="100842493"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 28 Aug 2024 13:01:07 -0700
Received: from [10.245.82.99] (mwajdecz-MOBL.ger.corp.intel.com [10.245.82.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id EBD35312D4;
 Wed, 28 Aug 2024 21:01:05 +0100 (IST)
Message-ID: <343049d0-51c5-4fc1-aa55-069a20901861@intel.com>
Date: Wed, 28 Aug 2024 22:01:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm/xe: move memirq out of vf
To: Ilia Levi <ilia.levi@intel.com>, intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, koby.elbaz@intel.com, yaron.avizrat@intel.com
References: <20240828091841.1840086-1-ilia.levi@intel.com>
 <20240828091841.1840086-2-ilia.levi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240828091841.1840086-2-ilia.levi@intel.com>
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

please s/vf/VF in the title

On 28.08.2024 11:18, Ilia Levi wrote:
> Up until now only VF used Memory Based Interrupts (memirq).
> Moving it out of VF to cater for other usages.
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  2 +-
>  drivers/gpu/drm/xe/xe_device_types.h |  6 ++--
>  drivers/gpu/drm/xe/xe_guc.c          |  2 +-
>  drivers/gpu/drm/xe/xe_irq.c          |  6 ++--
>  drivers/gpu/drm/xe/xe_lrc.c          |  2 +-
>  drivers/gpu/drm/xe/xe_memirq.c       | 46 ++++++++++------------------
>  6 files changed, 26 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b6db7e082d88..623e4a977ba3 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -661,7 +661,7 @@ int xe_device_probe(struct xe_device *xe)
>  		if (err)
>  			return err;
>  		if (IS_SRIOV_VF(xe)) {

since this is now out of tile.sriov.vf then checking for VF mode is not
clear here and should be moved to xe_memirq_init()

> -			err = xe_memirq_init(&tile->sriov.vf.memirq);
> +			err = xe_memirq_init(&tile->memirq);
>  			if (err)
>  				return err;
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 4ecd620921a3..200c22f41de3 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -200,14 +200,14 @@ struct xe_tile {
>  			struct xe_lmtt lmtt;
>  		} pf;
>  		struct {
> -			/** @sriov.vf.memirq: Memory Based Interrupts. */
> -			struct xe_memirq memirq;
> -
>  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
>  			struct xe_ggtt_node *ggtt_balloon[2];
>  		} vf;
>  	} sriov;
>  
> +	/** @memirq: Memory Based Interrupts. */
> +	struct xe_memirq memirq;
> +
>  	/** @migrate: Migration helper for vram blits and clearing */
>  	struct xe_migrate *migrate;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 52df28032a6f..5fd14e387d79 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -863,7 +863,7 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>  		struct xe_gt *gt = guc_to_gt(guc);
>  		struct xe_tile *tile = gt_to_tile(gt);
>  
> -		err = xe_memirq_init_guc(&tile->sriov.vf.memirq, guc);
> +		err = xe_memirq_init_guc(&tile->memirq, guc);
>  		if (err)
>  			return err;
>  	} else {
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 5f2c368c35ad..18a5272d9bb0 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -566,7 +566,7 @@ static void vf_irq_reset(struct xe_device *xe)
>  
>  	for_each_tile(tile, xe, id) {
>  		if (xe_device_has_memirq(xe))
> -			xe_memirq_reset(&tile->sriov.vf.memirq);
> +			xe_memirq_reset(&tile->memirq);
>  		else
>  			gt_irq_reset(tile);
>  	}
> @@ -609,7 +609,7 @@ static void vf_irq_postinstall(struct xe_device *xe)
>  
>  	for_each_tile(tile, xe, id)
>  		if (xe_device_has_memirq(xe))
> -			xe_memirq_postinstall(&tile->sriov.vf.memirq);
> +			xe_memirq_postinstall(&tile->memirq);
>  
>  	if (GRAPHICS_VERx100(xe) < 1210)
>  		xelp_intr_enable(xe, true);
> @@ -652,7 +652,7 @@ static irqreturn_t vf_mem_irq_handler(int irq, void *arg)
>  	spin_unlock(&xe->irq.lock);
>  
>  	for_each_tile(tile, xe, id)
> -		xe_memirq_handler(&tile->sriov.vf.memirq);
> +		xe_memirq_handler(&tile->memirq);
>  
>  	return IRQ_HANDLED;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index aec7db39c061..e01d88899890 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -599,7 +599,7 @@ static void set_context_control(u32 *regs, struct xe_hw_engine *hwe)
>  
>  static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
>  {
> -	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->sriov.vf.memirq;
> +	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->memirq;
>  	struct xe_device *xe = gt_to_xe(hwe->gt);
>  
>  	if (!IS_SRIOV_VF(xe) || !xe_device_has_memirq(xe))
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 95b6e9d7b7db..0db0726b76f3 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -19,15 +19,13 @@
>  #include "xe_hw_engine.h"
>  #include "xe_map.h"
>  #include "xe_memirq.h"
> -#include "xe_sriov.h"
> -#include "xe_sriov_printk.h"
>  
>  #define memirq_assert(m, condition)	xe_tile_assert(memirq_to_tile(m), condition)
> -#define memirq_debug(m, msg...)		xe_sriov_dbg_verbose(memirq_to_xe(m), "MEMIRQ: " msg)
> +#define memirq_debug(m, msg...)		drm_dbg(&memirq_to_xe(m)->drm, "MEMIRQ: " msg)

maybe it's time to also add memirq_err(m, ...) to simplify code below?

>  
>  static struct xe_tile *memirq_to_tile(struct xe_memirq *memirq)
>  {
> -	return container_of(memirq, struct xe_tile, sriov.vf.memirq);
> +	return container_of(memirq, struct xe_tile, memirq);
>  }
>  
>  static struct xe_device *memirq_to_xe(struct xe_memirq *memirq)
> @@ -157,8 +155,8 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
>  	return drmm_add_action_or_reset(&xe->drm, __release_xe_bo, memirq->bo);
>  
>  out:
> -	xe_sriov_err(memirq_to_xe(memirq),
> -		     "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
> +	drm_err(&memirq_to_xe(memirq)->drm,
> +		"Failed to allocate memirq page (%pe)\n", ERR_PTR(err));

memirq_err ?

>  	return err;
>  }
>  
> @@ -178,9 +176,7 @@ static void memirq_set_enable(struct xe_memirq *memirq, bool enable)
>   *
>   * These allocations are managed and will be implicitly released on unload.
>   *
> - * Note: This function shall be called only by the VF driver.
> - *
> - * If this function fails then VF driver won't be able to operate correctly.
> + * If this function fails then the driver won't be able to operate correctly.
>   * If `Memory Based Interrupts`_ are not used this function will return 0.
>   *
>   * Return: 0 on success or a negative error code on failure.
> @@ -190,8 +186,6 @@ int xe_memirq_init(struct xe_memirq *memirq)
>  	struct xe_device *xe = memirq_to_xe(memirq);
>  	int err;
>  
> -	memirq_assert(memirq, IS_SRIOV_VF(xe));
> -

now IS_SRIOV_VF check should be in the 'if' below, and then we can
update this single place once MSIX are enabled

or maybe it's time to introduce xe_device_uses_memirq() where we will
put all conditions/requirements ?

>  	if (!xe_device_has_memirq(xe))
>  		return 0;
>  
> @@ -209,14 +203,13 @@ int xe_memirq_init(struct xe_memirq *memirq)
>   * xe_memirq_source_ptr - Get GGTT's offset of the `Interrupt Source Report Page`_.
>   * @memirq: the &xe_memirq to query
>   *
> - * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
> + * Shall be called when `Memory Based Interrupts`_ are used
>   * and xe_memirq_init() didn't fail.
>   *
>   * Return: GGTT's offset of the `Interrupt Source Report Page`_.
>   */
>  u32 xe_memirq_source_ptr(struct xe_memirq *memirq)
>  {
> -	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));

uses_memirq() ? and same for all places below

>  	memirq_assert(memirq, memirq->bo);
>  
> @@ -227,14 +220,13 @@ u32 xe_memirq_source_ptr(struct xe_memirq *memirq)
>   * xe_memirq_status_ptr - Get GGTT's offset of the `Interrupt Status Report Page`_.
>   * @memirq: the &xe_memirq to query
>   *
> - * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
> + * Shall be called when `Memory Based Interrupts`_ are used
>   * and xe_memirq_init() didn't fail.
>   *
>   * Return: GGTT's offset of the `Interrupt Status Report Page`_.
>   */
>  u32 xe_memirq_status_ptr(struct xe_memirq *memirq)
>  {
> -	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, memirq->bo);
>  
> @@ -245,14 +237,13 @@ u32 xe_memirq_status_ptr(struct xe_memirq *memirq)
>   * xe_memirq_enable_ptr - Get GGTT's offset of the Interrupt Enable Mask.
>   * @memirq: the &xe_memirq to query
>   *
> - * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
> + * Shall be called when `Memory Based Interrupts`_ are used
>   * and xe_memirq_init() didn't fail.
>   *
>   * Return: GGTT's offset of the Interrupt Enable Mask.
>   */
>  u32 xe_memirq_enable_ptr(struct xe_memirq *memirq)
>  {
> -	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, memirq->bo);
>  
> @@ -267,7 +258,7 @@ u32 xe_memirq_enable_ptr(struct xe_memirq *memirq)
>   * Register `Interrupt Source Report Page`_ and `Interrupt Status Report Page`_
>   * to be used by the GuC when `Memory Based Interrupts`_ are required.
>   *
> - * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
> + * Shall be called when `Memory Based Interrupts`_ are used
>   * and xe_memirq_init() didn't fail.
>   *
>   * Return: 0 on success or a negative error code on failure.
> @@ -279,7 +270,6 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
>  	u32 source, status;
>  	int err;
>  
> -	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, memirq->bo);
>  
> @@ -299,9 +289,9 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
>  	return 0;
>  
>  failed:
> -	xe_sriov_err(memirq_to_xe(memirq),
> -		     "Failed to setup report pages in %s (%pe)\n",
> -		     guc_name(guc), ERR_PTR(err));
> +	drm_err(&memirq_to_xe(memirq)->drm,
> +		"Failed to setup report pages in %s (%pe)\n",
> +		guc_name(guc), ERR_PTR(err));

memirq_err ?

>  	return err;
>  }
>  
> @@ -311,12 +301,11 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
>   *
>   * This is part of the driver IRQ setup flow.
>   *
> - * This function shall only be used by the VF driver on platforms that use
> + * This function shall only be used on platforms that use
>   * `Memory Based Interrupts`_.
>   */
>  void xe_memirq_reset(struct xe_memirq *memirq)
>  {
> -	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
>  
>  	if (memirq->bo)
> @@ -329,12 +318,11 @@ void xe_memirq_reset(struct xe_memirq *memirq)
>   *
>   * This is part of the driver IRQ setup flow.
>   *
> - * This function shall only be used by the VF driver on platforms that use
> + * This function shall only be used on platforms that use
>   * `Memory Based Interrupts`_.
>   */
>  void xe_memirq_postinstall(struct xe_memirq *memirq)
>  {
> -	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
>  
>  	if (memirq->bo)
> @@ -349,9 +337,9 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
>  	value = iosys_map_rd(vector, offset, u8);
>  	if (value) {
>  		if (value != 0xff)
> -			xe_sriov_err_ratelimited(memirq_to_xe(memirq),
> -						 "Unexpected memirq value %#x from %s at %u\n",
> -						 value, name, offset);
> +			drm_err_ratelimited(&memirq_to_xe(memirq)->drm,
> +					    "Unexpected memirq value %#x from %s at %u\n",
> +					    value, name, offset);
>  		iosys_map_wr(vector, offset, u8, 0x00);
>  	}
>  
