Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC60CC25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 16:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B1E10E5BF;
	Fri, 10 May 2024 16:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HW/wgKgs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B1E10E5BF;
 Fri, 10 May 2024 16:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715356945; x=1746892945;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZGGztV8XYCEDhTNRmsDKCGVoioHNaSQtbfERqM0W+G0=;
 b=HW/wgKgsLcvKMNUKf4SAToQrkXi79dCZMtLgO9RIGBerS5Q8Pe4XNpGI
 0WRhC5cVQuBQOZsXntWbtXsN5B+V72hTKiorzgxJEh29Lq+XG8D/zNgL/
 DbDFe7BhtiE/ayvfRNT3s93geMAlHnpUCeoEoRFIBbU2dD4rcl6bWSGhf
 vFHiu7h7JiXauk+JdMjL21Uk1OAGghrSw99AG/ehmklg31+e60twdF+g1
 eQdPVkOkBkTThYwQpVBmn9iDXVBRLF1UpHEQlyUrGsmAOEAHto+Q9D+/D
 rAmdcUj5FlYKIZFWy3G9Aru2MqWOzHyGS0LII5LIRfwm8IXh+npEdb+Bn w==;
X-CSE-ConnectionGUID: FYMvph2dR+GAsc+coylIdg==
X-CSE-MsgGUID: FtzUxDGwRxahRO8Hv9XIbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="28829894"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28829894"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 09:02:25 -0700
X-CSE-ConnectionGUID: FklmY0NvR4anw5VvPRJhrQ==
X-CSE-MsgGUID: XVK/NEjiQgGLUHzaSNS0rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60500122"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 09:02:24 -0700
Date: Fri, 10 May 2024 18:02:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/4] tests/intel/xe_pm: Update runtime pm conditions
Message-ID: <20240510160221.q3gzjngvl6ukgzzg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240510122230.724229-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240510122230.724229-1-rodrigo.vivi@intel.com>
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

Hi Rodrigo,
On 2024-05-10 at 08:22:27 -0400, Rodrigo Vivi wrote:
> Xe is no longer holding a runtime pm reference for the life
> of a VM or exec_queue.
> 
> Also, IGT changes autosuspend time to a minimal time, so we
> cannot guarantee that rpm is still suspended after the execution
> has finished.
> 
> So, the reference usage is not a reliable reference.
> 
> Hence, start using runtime_active_time as the indicator
> that runtime_pm resumed upon our actions.
> 
> v2: Usage of runtime_active_pm and inclusion of mmap tests.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  lib/igt_pm.c        | 18 +++++++++++
>  lib/igt_pm.h        |  1 +
>  tests/intel/xe_pm.c | 77 +++++++++++++++++----------------------------
>  3 files changed, 47 insertions(+), 49 deletions(-)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index fe7692960..98cc8d969 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1412,6 +1412,24 @@ int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
>  	return -1;
>  }
>  

Please describe each new public library function.

Regards,
Kamil

> +int igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
> +{
> +	char time_str[64];
> +	int time, time_fd;
> +
> +	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_active_time");
> +	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
> +		igt_assert(sscanf(time_str, "%d", &time) > 0);
> +
> +		igt_debug("runtime active time for PCI '%04x:%02x:%02x.%01x' = %d\n",
> +			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
> +
> +		return time;
> +	}
> +
> +	return -1;
> +}
> +
>  /**
>   * igt_pm_get_runtime_usage:
>   * @pci_dev: pci device
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index 91ee05cd1..b71f7c440 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -94,6 +94,7 @@ void igt_pm_print_pci_card_runtime_status(void);
>  bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
>  bool i915_is_slpc_enabled(int drm_fd);
>  int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
> +int igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
>  int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
>  void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
>  
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index e81a75d88..3f963bd9b 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -184,34 +184,6 @@ static bool in_d3(device_t device, enum igt_acpi_d_state state)
>  	return true;
>  }
>  
> -static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
> -{
> -	uint16_t val;
> -
> -	/* Runtime resume needs to be immediate action without any wait */
> -	if (runtime_usage_available(device.pci_xe) &&
> -	    igt_pm_get_runtime_usage(device.pci_xe) <= 0)
> -		return false;
> -
> -	if (igt_get_runtime_pm_status() != IGT_RUNTIME_PM_STATUS_ACTIVE)
> -		return false;
> -
> -	switch (state) {
> -	case IGT_ACPI_D3Hot:
> -		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
> -						      &val, 0xd4), 0);
> -		return (val & 0x3) == 0;
> -	case IGT_ACPI_D3Cold:
> -		return igt_pm_get_acpi_real_d_state(device.pci_root) ==
> -			IGT_ACPI_D0;
> -	default:
> -		igt_info("Invalid D3 State\n");
> -		igt_assert(0);
> -	}
> -
> -	return true;
> -}
> -
>  static void close_fw_handle(int sig)
>  {
>  	if (fw_handle < 0)
> @@ -326,27 +298,27 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		uint64_t pad;
>  		uint32_t data;
>  	} *data;
> -	int i, b, rpm_usage;
> +	int i, b, active_time;
>  	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
>  			  d_state == IGT_ACPI_D3Cold);
>  
>  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
>  	igt_assert(n_execs > 0);
>  
> -	if (check_rpm)
> +	if (check_rpm) {
>  		igt_assert(in_d3(device, d_state));
> +		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> +	}
>  
>  	vm = xe_vm_create(device.fd_xe, 0, 0);
>  
>  	if (check_rpm)
> -		igt_assert(out_of_d3(device, d_state));
> +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +			   active_time);
>  
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = xe_bb_size(device.fd_xe, bo_size);
>  
> -	if (check_rpm && runtime_usage_available(device.pci_xe))
> -		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
> -
>  	if (flags & USERPTR) {
>  		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
>  		memset(data, 0, bo_size);
> @@ -384,8 +356,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
>  				     bo_size, sync, 1, 0);
>  
> -	if (check_rpm && runtime_usage_available(device.pci_xe))
> -		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
> +	if (check_rpm) {
> +		igt_assert(in_d3(device, d_state));
> +		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> +	}
>  
>  	for (i = 0; i < n_execs; i++) {
>  		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> @@ -429,9 +403,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
>  				NULL));
>  
> -	if (check_rpm && runtime_usage_available(device.pci_xe))
> -		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
> -
>  	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>  	if (n_vmas > 1)
>  		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
> @@ -459,15 +430,13 @@ NULL));
>  		free(data);
>  	}
>  
> -	if (check_rpm && runtime_usage_available(device.pci_xe))
> -		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
> -	if (check_rpm)
> -		igt_assert(out_of_d3(device, d_state));
> -
>  	xe_vm_destroy(device.fd_xe, vm);
>  
> -	if (check_rpm)
> +	if (check_rpm) {
> +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +			   active_time);
>  		igt_assert(in_d3(device, d_state));
> +	}
>  }
>  
>  /**
> @@ -561,10 +530,13 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>  	size_t bo_size = 8192;
>  	uint32_t *map = NULL;
>  	uint32_t bo;
> -	int i;
> +	int i, active_time;
>  
>  	igt_require_f(placement, "Device doesn't support such memory region\n");
>  
> +	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> +
>  	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
>  
>  	bo = xe_bo_create(device.fd_xe, 0, bo_size, placement, flags);
> @@ -575,7 +547,8 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>  	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
>  
>  	igt_assert(fw_handle >= 0);
> -	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +	igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +		   active_time);
>  
>  	for (i = 0; i < bo_size / sizeof(*map); i++)
>  		map[i] = MAGIC_1;
> @@ -585,22 +558,28 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>  
>  	/* Runtime suspend and validate the pattern and changed the pattern */
>  	close(fw_handle);
> +	sleep(1);
> +
>  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>  
>  	for (i = 0; i < bo_size / sizeof(*map); i++)
>  		igt_assert(map[i] == MAGIC_1);
>  
>  	/* dgfx page-fault on mmaping should wake the gpu */
>  	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
> -		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +			   active_time);
>  
>  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>  
>  	for (i = 0; i < bo_size / sizeof(*map); i++)
>  		map[i] = MAGIC_2;
>  
>  	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
> -		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +			   active_time);
>  
>  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
>  
> -- 
> 2.44.0
> 
