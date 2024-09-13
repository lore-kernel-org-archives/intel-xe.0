Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48422FA375B
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 15:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E37C10ED3D;
	Fri, 13 Sep 2024 15:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FRqpap0L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBE910ED3D
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 15:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726242404; x=1757778404;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bZNt8Mf5wxrHqTShvc4n6+p6237Aro3oGQiNu7OSN0A=;
 b=FRqpap0LEwHAT8hSgEpLG19oAU42XKPtcyUTWgNpkeUK/CPCMMvmdFkg
 RdQwOdSPAeFyB3DBgI57ad6EvMFg3v7y+5DJc37q1JQ4jezZSuDTN9W7M
 V/Gust/7XBHSG9WzaR6nhMGYZGuGsj7KBmSU32NqjWnVXI7dvxIUSwJtA
 evzaSLwDps/DDLaoWtu4l/008q+MwDd33b6VsKeK9wRf4ODe+g3Px3G0n
 Y/RrwcSHHERe+fwJDrQYGb5v6qRX08jeJED1rk9+BINOkAXtuuv+GLDL1
 RbywEGhY15LDOGF2prN/s3uvlYBGdCa4apxl6g3basfvV0UzmlvUXIcSw Q==;
X-CSE-ConnectionGUID: zrofyP3/Q9qheIj19v26Lg==
X-CSE-MsgGUID: Bh4DyPRjSH2BEMvBiR5IUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25300606"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="25300606"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 08:46:44 -0700
X-CSE-ConnectionGUID: PS3UQ2OfTvqYNH+dZQFTPw==
X-CSE-MsgGUID: UjuhWq4NQYeEZ0Wsex3jMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="68028421"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 13 Sep 2024 08:46:41 -0700
Received: from [10.245.84.117] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.117])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 84F842FC5D;
 Fri, 13 Sep 2024 16:46:39 +0100 (IST)
Message-ID: <f1e97677-0d0a-410c-a911-43a9fb692412@intel.com>
Date: Fri, 13 Sep 2024 17:46:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe: Add driver load error injection
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240913140139.2257069-1-francois.dugast@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240913140139.2257069-1-francois.dugast@intel.com>
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



On 13.09.2024 16:01, Francois Dugast wrote:
> Those new macros inject errors by overriding return codes. They must
> manually be called, preferably at the very beginning of the function

hmm, "at the very beginning of the function" there is nothing to
override, so likely we need other wording here

> that will fault, otherwise if not possible by turning this pattern:
> 
>     err = foo();
>     if (err)
>         return err;
> 
> into:
> 
>     err = foo();
>     err = xe_device_inject_driver_probe_error(xe, err);
>     if (err)
>         return err;

as already highlighted few times, this may introduce errors, as
successful foo() may expect that there will be foo_fini() that your
example will completely ignore

> 
> When CONFIG_DRM_XE_DEBUG is not set, this has no effect.
> 
> When CONFIG_DRM_XE_DEBUG is set, the error code at checkpoint X will
> be overridden when the module argument inject_driver_load_error is
> set to value X. By doing so, it is possible to test proper error
> handling and improve robustness for current and future code. A few
> injection points are added in this patch but more need to be added.
> One way to use this error injection at driver probe is:
> 
>     for i in {1..200}; do
>         echo "Run $i"
>         modprobe xe inject_driver_probe_error=$i;
>         rmmod xe;
>     done
> 
> In the future this is expected to be replaced by the infrastructure
> provided by fault-inject.h
> 
> v2: Fix style and build errors, modparam to 0 after probe, rename to
>     xe_device_inject_driver_probe_error, check type when compiled out,
>     add _return macro, move some uses to the beginning of the function
> v3: Rebase
> v4: Improve commit message and comments, keep if/return rather than
>     change the flow inside the macro (Lucas De Marchi)
> v5: Rebase, add comments, keep existing return points (Lucas De Marchi)
>     Add finish wrapper, move to function beginning for all xe functions
>     (Michal Wajdeczko) Bolt into i915 error injection (Jani Nikula)
> v6: Fix documentation of __xe_device_inject_driver_probe_error, fix
>     checkpatch warning (Rodrigo Vivi)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/ext/i915_utils.c |  4 +-
>  drivers/gpu/drm/xe/xe_device.c              | 49 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.h              | 30 +++++++++++++
>  drivers/gpu/drm/xe/xe_device_types.h        |  5 +++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c |  5 +++
>  drivers/gpu/drm/xe/xe_guc.c                 |  1 +
>  drivers/gpu/drm/xe/xe_guc_ct.c              |  1 +
>  drivers/gpu/drm/xe/xe_guc_pc.c              |  4 ++
>  drivers/gpu/drm/xe/xe_mmio.c                |  5 +++
>  drivers/gpu/drm/xe/xe_module.c              | 18 ++++++++
>  drivers/gpu/drm/xe/xe_module.h              |  3 ++
>  drivers/gpu/drm/xe/xe_pci.c                 |  5 +++
>  drivers/gpu/drm/xe/xe_pm.c                  |  5 +++
>  drivers/gpu/drm/xe/xe_sriov.c               |  7 ++-
>  drivers/gpu/drm/xe/xe_sriov_pf.c            |  6 +++
>  drivers/gpu/drm/xe/xe_tile.c                | 13 ++++++
>  drivers/gpu/drm/xe/xe_uc.c                  |  4 ++
>  drivers/gpu/drm/xe/xe_wa.c                  |  8 +++-
>  drivers/gpu/drm/xe/xe_wopcm.c               |  7 ++-
>  19 files changed, 174 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/ext/i915_utils.c b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> index 43b10a2cc508..11d8377a125f 100644
> --- a/drivers/gpu/drm/xe/display/ext/i915_utils.c
> +++ b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "i915_drv.h"
> +#include "xe_device.h"
>  
>  bool i915_vtd_active(struct drm_i915_private *i915)
>  {
> @@ -16,11 +17,10 @@ bool i915_vtd_active(struct drm_i915_private *i915)
>  
>  #if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
>  
> -/* i915 specific, just put here for shutting it up */
>  int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
>  			      const char *func, int line)
>  {
> -	return 0;
> +	return __xe_device_inject_driver_probe_error(i915, err, 0, func, line);
>  }
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4d3c794f134c..5ea78477c51f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -319,6 +319,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
>  			      xe->drm.anon_inode->i_mapping,
>  			      xe->drm.vma_offset_manager, false, false);
> +	err = xe_device_inject_driver_probe_error_override(xe, err);

by doing this you're leaking ttm_device_fini()

>  	if (WARN_ON(err))
>  		goto err;
>  
> @@ -487,6 +488,7 @@ static int xe_set_dma_info(struct xe_device *xe)
>  		goto mask_err;
>  
>  	err = dma_set_coherent_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
> +	err = xe_device_inject_driver_probe_error_override(xe, err);
>  	if (err)
>  		goto mask_err;
>  
> @@ -507,6 +509,11 @@ static bool verify_lmem_ready(struct xe_device *xe)
>  static int wait_for_lmem_ready(struct xe_device *xe)
>  {
>  	unsigned long timeout, start;
> +	int err;
> +
> +	err = xe_device_inject_driver_probe_error(xe);
> +	if (err)
> +		return err;
>  
>  	if (!IS_DGFX(xe))
>  		return 0;
> @@ -759,6 +766,8 @@ int xe_device_probe(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_sanitize_freq(gt);
>  
> +	xe_device_inject_driver_probe_error_finish();
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_fini_display:
> @@ -1025,3 +1034,43 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_declare_wedged(gt);
>  }
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)

I know that it's easier to add code to the existing .c file but maybe
this error injection code could be placed in its own files?

xe-$(CONFIG_DRM_XE_DEBUG) += xe_error_injection.o

> +/**
> + * __xe_device_inject_driver_probe_error - Inject an error during device probe
> + * @xe: xe device instance
> + * @err_injected: the error to inject
> + * @err_real: the error returned by the actual function
> + * @func: the name of the function where this is called from
> + * @line: the line where this is called from
> + *
> + * This is not meant to be called directly, only through xe_device_inject_driver_probe_error.
> + *
> + * Return: err_real if != 0, 0 if this is not the Nth iteration of the requested iterations from
> + * modparam.inject_driver_probe_error, err_injected if in the Nth iteration
> + */
> +int __xe_device_inject_driver_probe_error(struct xe_device *xe, int err_injected, int err_real,
> +					  const char *func, int line)

IMO this error override variant is too error-prone and may introduce
more fake problems to the flow, can't we just use explicit inserts?

> +{
> +	if (err_real != 0)
> +		return err_real;
> +
> +	if (xe->inject_driver_probe_error >= xe_modparam.inject_driver_probe_error)
> +		return 0;
> +
> +	if (++xe->inject_driver_probe_error < xe_modparam.inject_driver_probe_error)
> +		return 0;
> +
> +	drm_info(&xe->drm, "Injecting failure %d at checkpoint %u [%s:%d]\n",
> +		 err_injected, xe->inject_driver_probe_error, func, line);
> +
> +	xe_modparam.inject_driver_probe_error = 0;
> +	return err_injected;
> +}
> +
> +void __xe_device_inject_driver_probe_error_finish(void)
> +{
> +	/* After probe finishes, stop checking for error injection */
> +	xe_modparam.inject_driver_probe_error = 0;
> +}
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index ca8d8ef6342b..96882ba18890 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -179,4 +179,34 @@ void xe_device_declare_wedged(struct xe_device *xe);
>  struct xe_file *xe_file_get(struct xe_file *xef);
>  void xe_file_put(struct xe_file *xef);
>  
> +#define XE_DEVICE_INJECTED_ERR -ENODEV
> +#define xe_device_inject_driver_probe_error(__xe) \
> +	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, 0, __func__, __LINE__)

nit: can we have a xe_gt/xe_tile variants of error injection functions?

> +#define xe_device_inject_driver_probe_error_override(__xe, __err_real) \
> +	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, __err_real, __func__, \
> +					      __LINE__)
> +#define xe_device_inject_driver_probe_error_finish()	\
> +	__xe_device_inject_driver_probe_error_finish()

this looks like a overkill, can't we just have two variants of the
xe_device_inject_driver_probe_error_finish() below?

> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +
> +int __xe_device_inject_driver_probe_error(struct xe_device *xe,
> +					  int err_injected, int err_real,
> +					  const char *func, int line);
> +
> +void __xe_device_inject_driver_probe_error_finish(void);
> +
> +#else
> +
> +static inline int __xe_device_inject_driver_probe_error(struct xe_device *xe,
> +							int err_injected, int err_real,
> +							const char *func, int line)
> +{
> +	return 0;
> +}
> +
> +static inline void __xe_device_inject_driver_probe_error_finish(void) {};
> +
> +#endif
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index c92df0a2423f..49dd81e8a63e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -513,6 +513,11 @@ struct xe_device {
>  		int mode;
>  	} wedged;
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +	/** @inject_driver_probe_error: Counter used for error injection during probe */
> +	int inject_driver_probe_error;
> +#endif
> +
>  #ifdef TEST_VM_OPS_ERROR
>  	/**
>  	 * @vm_inject_error_position: inject errors at different places in VM
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> index 924e75b94aec..719695ed4681 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> @@ -12,6 +12,7 @@
>  #include "regs/xe_guc_regs.h"
>  #include "regs/xe_regs.h"
>  
> +#include "xe_device.h"
>  #include "xe_mmio.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_pf_helpers.h"
> @@ -275,6 +276,10 @@ int xe_gt_sriov_pf_service_init(struct xe_gt *gt)
>  {
>  	int err;
>  
> +	err = xe_device_inject_driver_probe_error(gt_to_xe(gt));
> +	if (err)
> +		return err;
> +
>  	pf_init_versions(gt);
>  
>  	err = pf_alloc_runtime_info(gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1eb5bb7e8771..a03df396129b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -353,6 +353,7 @@ int xe_guc_init(struct xe_guc *guc)
>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
>  
>  	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
> +	ret = xe_device_inject_driver_probe_error_override(guc_to_xe(guc), ret);

why here?
better to insert errors in
- xe_uc_fw_init
- xe_guc_log_init
- xe_guc_ads_init
- xe_guc_ct_init
- xe_guc_relay_init

or if you want just minimum changes, move to:
- xe_uc_init

>  	if (ret)
>  		goto out;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 4b95f75b1546..51ffb05605bb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -202,6 +202,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	ct->bo = bo;
>  
>  	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
> +	err = xe_device_inject_driver_probe_error_override(xe, err);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 2b654f820ae2..08bf9e8182b4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1064,6 +1064,10 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
>  	int err;
>  
> +	err = xe_device_inject_driver_probe_error(xe);
> +	if (err)
> +		return err;
> +
>  	if (xe->info.skip_guc_pc)
>  		return 0;
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index a48f239cad1c..807b366e2d96 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -144,6 +144,11 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>  {
>  	size_t tile_mmio_size = SZ_16M;
>  	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
> +	int err;
> +
> +	err = xe_device_inject_driver_probe_error(xe);
> +	if (err)
> +		return err;
>  
>  	mmio_multi_tile_setup(xe, tile_mmio_size);
>  	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 77ce9f9ca7a5..dc964b450e49 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -56,6 +56,24 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
>  MODULE_PARM_DESC(force_probe,
>  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +/*
> + * The error code at checkpoint X will be overridden when the module argument
> + * inject_driver_load_error is set to value X. By doing so, it is possible to
> + * test proper error handling and improve robustness for current and future
> + * code. One way to test multiple error injection points:
> + *
> + * for i in {1..200}; do
> + *     echo "Run $i"
> + *     modprobe xe inject_driver_probe_error=$i;
> + *     rmmod xe;
> + * done
> + */
> +module_param_named_unsafe(inject_driver_probe_error, xe_modparam.inject_driver_probe_error, int,
> +			  0600);
> +MODULE_PARM_DESC(inject_driver_probe_error, "Inject driver probe error");
> +#endif
> +
>  #ifdef CONFIG_PCI_IOV
>  module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
>  MODULE_PARM_DESC(max_vfs,
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 161a5e6f717f..47cefaf8d79b 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -20,6 +20,9 @@ struct xe_modparam {
>  	char *force_probe;
>  #ifdef CONFIG_PCI_IOV
>  	unsigned int max_vfs;
> +#endif
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +	int inject_driver_probe_error;
>  #endif
>  	int wedged_mode;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 5ba4ec229494..0c5109e9573e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -649,8 +649,13 @@ static int xe_info_init(struct xe_device *xe,
>  	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
>  	struct xe_tile *tile;
>  	struct xe_gt *gt;
> +	int err;
>  	u8 id;
>  
> +	err = xe_device_inject_driver_probe_error(xe);
> +	if (err)
> +		return err;
> +
>  	/*
>  	 * If this platform supports GMD_ID, we'll detect the proper IP
>  	 * descriptor to use from hardware registers. desc->graphics will only
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 33eb039053e4..d975524cb4e9 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -258,6 +258,7 @@ int xe_pm_init_early(struct xe_device *xe)
>  		return err;
>  
>  	err = drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
> +	err = xe_device_inject_driver_probe_error_override(xe, err);

can't we just insert error at the begin of xe_pm_init_early() ?

>  	if (err)
>  		return err;
>  
> @@ -276,6 +277,10 @@ int xe_pm_init(struct xe_device *xe)
>  {
>  	int err;
>  
> +	err = xe_device_inject_driver_probe_error(xe);
> +	if (err)
> +		return err;
> +
>  	/* For now suspend/resume is only allowed with GuC */
>  	if (!xe_device_uc_enabled(xe))
>  		return 0;
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index 69a066ef20c0..efb0692c9956 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -102,11 +102,13 @@ static void fini_sriov(struct drm_device *drm, void *arg)
>   */
>  int xe_sriov_init(struct xe_device *xe)
>  {
> +	int err;
> +
>  	if (!IS_SRIOV(xe))
>  		return 0;
>  
>  	if (IS_SRIOV_PF(xe)) {
> -		int err = xe_sriov_pf_init_early(xe);
> +		err = xe_sriov_pf_init_early(xe);
>  
>  		if (err)
>  			return err;
> @@ -114,7 +116,8 @@ int xe_sriov_init(struct xe_device *xe)
>  
>  	xe_assert(xe, !xe->sriov.wq);
>  	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
> -	if (!xe->sriov.wq)
> +	err = xe_device_inject_driver_probe_error(xe);
> +	if (!xe->sriov.wq || err)
>  		return -ENOMEM;

this is wrong!

by doing this you're leaking WQ as it won't be released by fini_sriov
that we're registering below

>  
>  	return drmm_add_action_or_reset(&xe->drm, fini_sriov, xe);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index 0f721ae17b26..8d75bb6570f0 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -80,8 +80,14 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
>   */
>  int xe_sriov_pf_init_early(struct xe_device *xe)
>  {
> +	int err;
> +
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
> +	err = xe_device_inject_driver_probe_error(xe);
> +	if (err)
> +		return err;
> +
>  	return drmm_mutex_init(&xe->drm, &xe->sriov.pf.master_lock);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index dda5268507d8..774668ac67b4 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -114,6 +114,10 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
>  {
>  	int err;
>  
> +	err = xe_device_inject_driver_probe_error(xe);
> +	if (err)
> +		return err;
> +
>  	tile->xe = xe;
>  	tile->id = id;
>  
> @@ -127,6 +131,15 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
>  
>  	xe_pcode_init(tile);
>  
> +	/*
> +	 * xe_tile_alloc() and xe_gt_alloc() only fail with -ENOMEM.
> +	 * drmm_zalloc() is used so resources will be freed even if
> +	 * an error is injected.
> +	 */

why do we need this comment?
what's special in drmm_zalloc vs drmm_mutex?

> +	err = xe_device_inject_driver_probe_error(xe);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 0d073a9987c2..6eaef7a3c58e 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -135,6 +135,10 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
>  {
>  	int ret;
>  
> +	ret = xe_device_inject_driver_probe_error(uc_to_xe(uc));
> +	if (ret)
> +		return ret;
> +
>  	/* GuC submission not enabled, nothing to do */
>  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>  		return 0;
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 22c148b1e996..660bacaf66e4 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -829,6 +829,11 @@ int xe_wa_init(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	size_t n_oob, n_lrc, n_engine, n_gt, total;
>  	unsigned long *p;
> +	int err;
> +
> +	err = xe_device_inject_driver_probe_error(xe);
> +	if (err)
> +		return err;
>  
>  	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
>  	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
> @@ -837,7 +842,8 @@ int xe_wa_init(struct xe_gt *gt)
>  	total = n_gt + n_engine + n_lrc + n_oob;
>  
>  	p = drmm_kzalloc(&xe->drm, sizeof(*p) * total, GFP_KERNEL);
> -	if (!p)
> +	err = xe_device_inject_driver_probe_error(xe);
> +	if (!p || err)
>  		return -ENOMEM;

can't we just inject error _before_ calling the drmm_kzalloc?

>  
>  	gt->wa_active.gt = p;
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> index 93c82825d896..c59376b45bab 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> @@ -206,6 +206,10 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
>  	bool locked;
>  	int ret = 0;
>  
> +	ret = xe_device_inject_driver_probe_error(xe);
> +	if (ret)
> +		return ret;
> +
>  	if (!guc_fw_size)
>  		return -EINVAL;
>  
> @@ -252,8 +256,9 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
>  		guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
>  
>  check:
> +	ret = xe_device_inject_driver_probe_error_override(xe, ret);
>  	if (__check_layout(xe, wopcm->size, guc_wopcm_base, guc_wopcm_size,
> -			   guc_fw_size, huc_fw_size)) {
> +			   guc_fw_size, huc_fw_size) && !ret) {

do we have to make this condition even less readable?
can't we just have single injected error at the begin of the function?

or at least move injection to __check_layout()

>  		wopcm->guc.base = guc_wopcm_base;
>  		wopcm->guc.size = guc_wopcm_size;
>  		XE_WARN_ON(!wopcm->guc.base);
