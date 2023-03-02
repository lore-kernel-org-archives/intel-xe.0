Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A29FC7EE2F
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 15:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163B010E508;
	Thu,  2 Mar 2023 15:05:47 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86A110E508
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 15:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677769544; x=1709305544;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WaX+o7+0gW8K3BUv5DVcwVljqF74njotie/FyBAWg5U=;
 b=kx7caN1OiiSSYZ9wBrb98DolNBo33iJW7wlUAejHJCho6t5uZTATx1B5
 gLc7acmTGCMotedAOi9SbsCDTIV4uM1z1p10VYF6iPHKQlAQPTdraFQTy
 +GB6aSbBDaG3YyYpOWFXXlquHTCnQ4ZB3AJLmayDLkb/n967VESh/iKRI
 nrVtybaKb0ddLp4GA+Tj+50yo9C15HyZOCtLh2UIrvW6HEj5Q/5JQSc6T
 yuhtk8JbP7EDt+gP+BbqqtSNkh967DAaHiqt5BXHi4eo80Zhr9mA+zGCe
 F0XAh3JcUk8pulsp5KtWmC0J7zHTntI69RtERsBne6BKS5ORdd158Y1Tv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="337053154"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="337053154"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:57:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="920721857"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="920721857"
Received: from martamon-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.129])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:57:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Patchwork <patchwork@emeril.freedesktop.org>
In-Reply-To: <167776742886.20549.10799986570067282660@emeril.freedesktop.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230302141230.2804699-1-jani.nikula@intel.com>
 <167776742886.20549.10799986570067282660@emeril.freedesktop.org>
Date: Thu, 02 Mar 2023 16:57:02 +0200
Message-ID: <87sfenurpd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_series_?=
 =?utf-8?q?starting_with_=5B1/8=5D_drm/i915/display=3A_don=27t_use_relativ?=
 =?utf-8?q?e_=2E=2E/i915_includes?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 02 Mar 2023, Patchwork <patchwork@emeril.freedesktop.org> wrote:
> == Series Details ==
>
> Series: series starting with [1/8] drm/i915/display: don't use relative ../i915 includes
> URL   : https://patchwork.freedesktop.org/series/114573/
> State : failure
>
> == Summary ==
>
> + trap cleanup EXIT
> + cd /kernel
> + git clone https://gitlab.freedesktop.org/drm/xe/ci.git .ci
> Cloning into '.ci'...
> ++ date +%s
> + echo -e '\e[0Ksection_start:1677767287:build_x86_64[collapsed=true]\r\e[0KBuild x86-64'
> + mkdir -p build64
> [0Ksection_start:1677767287:build_x86_64[collapsed=true]
> [0KBuild x86-64
> + cat .ci/kernel/kconfig
> + make O=build64 olddefconfig
> make[1]: Entering directory '/kernel/build64'
>   GEN     Makefile
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/kconfig/conf.o
>   HOSTCC  scripts/kconfig/confdata.o
>   HOSTCC  scripts/kconfig/expr.o
>   LEX     scripts/kconfig/lexer.lex.c
>   YACC    scripts/kconfig/parser.tab.[ch]
>   HOSTCC  scripts/kconfig/lexer.lex.o
>   HOSTCC  scripts/kconfig/menu.o
>   HOSTCC  scripts/kconfig/parser.tab.o
>   HOSTCC  scripts/kconfig/preprocess.o
>   HOSTCC  scripts/kconfig/symbol.o
>   HOSTCC  scripts/kconfig/util.o
>   HOSTLD  scripts/kconfig/conf
> #
> # configuration written to .config
> #
> make[1]: Leaving directory '/kernel/build64'
> ++ nproc
> + make O=build64 -j48
> make[1]: Entering directory '/kernel/build64'

...

>   HDRTEST drivers/gpu/drm/xe/compat-headers/intel_pm_types.h
>   CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_log.o
> In file included from <command-line>:
> ./../drivers/gpu/drm/xe/compat-headers/intel_pm_types.h:11:10: fatal error: display/intel_display.h: No such file or directory
>    11 | #include "display/intel_display.h"

Err what?!

Patch 3 removes the include.

Patch 6 moves the file under compat-headers. There's no #include
"display/intel_display.h" there.


>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[6]: *** [../drivers/gpu/drm/xe/Makefile:235: drivers/gpu/drm/xe/compat-headers/intel_pm_types.hdrtest] Error 1
> make[6]: *** Waiting for unfinished jobs....
>   CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.o
>   CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.o
> In file included from <command-line>:
> ./../drivers/gpu/drm/xe/compat-headers/i915_drv.h:182:10: fatal error: display/intel_wakeref.h: No such file or directory
>   182 | #include "display/intel_wakeref.h"
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~


Patch 4 removes the display/ prefix.

Patch 6 moves the file under compat-headers. That include does not exist
as such.

What's going on?!

BR,
Jani.


> compilation terminated.
> make[6]: *** [../drivers/gpu/drm/xe/Makefile:235: drivers/gpu/drm/xe/compat-headers/i915_drv.hdrtest] Error 1
>   CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp100.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.o
>   CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.o
>   CC [M]  drivers/gpu/drm/i915/gt/uc/intel_huc.o
>   CC [M]  drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/vce_v4_0.o
>   CC [M]  drivers/gpu/drm/i915/gt/uc/intel_huc_fw.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.o
>   CC [M]  drivers/gpu/drm/i915/gt/uc/intel_uc.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_sw_ring.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v2_0.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v2_5.o
>   CC [M]  drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv04.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv10.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v3_0.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv1a.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv20.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv25.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v4_0.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.o
>   CC [M]  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv30.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv35.o
>   CC [M]  drivers/gpu/drm/i915/gt/intel_gsc.o
>   CC [M]  drivers/gpu/drm/i915/i915_hwmon.o
>   CC [M]  drivers/gpu/drm/i915/display/hsw_ips.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_atomic.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_atomic_plane.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_audio.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv36.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv40.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_bios.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_bw.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v1_0.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_cdclk.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_color.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv41.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_combo_phy.o
> make[5]: *** [../scripts/Makefile.build:500: drivers/gpu/drm/xe] Error 2
> make[5]: *** Waiting for unfinished jobs....
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv44.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv46.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v2_0.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v2_1.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v3_0.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_connector.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv47.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv49.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv4e.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_crtc.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v9_0.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_crtc_state_dump.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v11_0.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/g84.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gt215.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v11_0_6.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_cursor.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_display.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/mcp77.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_display_power.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/mcp89.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v13_0.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_display_power_map.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_display_power_well.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v13_0_6.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/mca_v3_0.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_module.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_dmc.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk20a.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm200.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_pasid.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_dpio_phy.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm20b.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp100.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_dpll.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp10b.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_dpll_mgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_doorbell.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_dpt.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_drrs.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_flat_memory.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv04.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_dsb.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_fb.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv10.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_fb_pin.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_fbc.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_cik.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv1a.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv20.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_vi.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv40.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv41.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv44.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv49.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v9.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv4e.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv50.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_fdi.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v10.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_fifo_underrun.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v11.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_frontbuffer.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/rammcp77.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_kernel_queue.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager_vi.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager_v9.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process_queue_manager.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_global_state.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_hdcp.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_hotplug.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_hti.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramga102.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr2.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_cik.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_lpe_audio.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_vi.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_modeset_verify.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_modeset_setup.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_v9.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_overlay.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_v10.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_v11.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_interrupt.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr3.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_events.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/cik_event_interrupt.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_pch_display.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr3.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr5.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_smi_events.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debugfs.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_pch_refclk.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_plane_initial.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/base.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/nv50.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gf100.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_psr.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_quirks.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_sprite.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_tc.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gm107.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_vga.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.o
>   CC [M]  drivers/gpu/drm/i915/display/i9xx_plane.o
>   CC [M]  drivers/gpu/drm/i915/display/skl_scaler.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/nv10.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/nv50.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/g94.o
>   CC [M]  drivers/gpu/drm/i915/display/skl_universal_plane.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gf119.o
>   CC [M]  drivers/gpu/drm/i915/display/skl_watermark.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_acpi.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_opregion.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gk104.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_job.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/ga102.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_acp.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../acp/acp_hw.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ioc32.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_fbdev.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.o
>   CC [M]  drivers/gpu/drm/i915/display/dvo_ch7017.o
>   CC [M]  drivers/gpu/drm/i915/display/dvo_ch7xxx.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arcturus_ppt.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.o
>   CC [M]  drivers/gpu/drm/i915/display/dvo_ivch.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv04.o
>   CC [M]  drivers/gpu/drm/i915/display/dvo_ns2501.o
>   CC [M]  drivers/gpu/drm/i915/display/dvo_sil164.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv4e.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/navi10_ppt.o
>   CC [M]  drivers/gpu/drm/i915/display/dvo_tfp410.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/cyan_skillfish_ppt.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu12/renoir_ppt.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu12/smu_v12_0.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv50.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/g94.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gf117.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gf119.o
>   CC [M]  drivers/gpu/drm/i915/display/g4x_dp.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gk104.o
>   CC [M]  drivers/gpu/drm/i915/display/g4x_hdmi.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/aldebaran_ppt.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/yellow_carp_ppt.o
>   CC [M]  drivers/gpu/drm/i915/display/icl_dsi.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_4_ppt.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_backlight.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gk110.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_5_ppt.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/pad.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_crt.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_ddi.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smumgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padnv04.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_ddi_buf_trans.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu8_smumgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padnv4e.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padnv50.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_display_trace.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_dkl_phy.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_dp.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_dp_aux.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/tonga_smumgr.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/fiji_smumgr.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_dp_hdcp.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv4e.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vega10_smumgr.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_dp_link_training.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv50.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu10_smumgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bit.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/ci_smumgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vega12_smumgr.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vegam_smumgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu9_smumgr.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vega20_smumgr.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/hwmgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_dp_mst.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/processpptables.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_dsi.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/hardwaremanager.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu8_hwmgr.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_dsi_vbt.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_dvo.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_gmbus.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/pppcielanes.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/process_pptables_v1_0.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/gf100.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_hdmi.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv04.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv40.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_lspcon.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_lvds.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_panel.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/base.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gf100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomfwctrl.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gk104.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_pps.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_qp_tables.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_powertune.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gm107.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gm200.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_sdvo.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_thermal.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_clockpowergating.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp100.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_snps_phy.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp102.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_tv.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_vdsc.o
>   CC [M]  drivers/gpu/drm/i915/display/intel_vrr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_powertune.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/ga102.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_thermal.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.o
>   CC [M]  drivers/gpu/drm/i915/display/vlv_dsi.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv04.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv11.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv17.o
>   CC [M]  drivers/gpu/drm/i915/display/vlv_dsi_pll.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv44.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu10_hwmgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv50.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/pp_psm.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_processpptables.o
>   CC [M]  drivers/gpu/drm/i915/i915_perf.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_hwmgr.o
>   CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp.o
>   CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_tee.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/g84.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_thermal.o
>   CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_huc.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/g98.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gt215.o
>   CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_cmd.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/pp_overdriver.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu_helper.o
>   CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gf100.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gk104.o
>   CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_irq.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_processpptables.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gk20a.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_hwmgr.o
>   CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_pm.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp100.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp10b.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv04.o
>   CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_session.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_powertune.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv41.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_thermal.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/common_baco.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv44.o
>   CC [M]  drivers/gpu/drm/i915/i915_gpu_error.o
>   CC [M]  drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv50.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/g84.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mcp77.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_baco.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_baco.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.o
>   CC [M]  drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_baco.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk104.o
>   CC [M]  drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.o
>   CC [M]  drivers/gpu/drm/i915/selftests/i915_random.o
>   CC [M]  drivers/gpu/drm/i915/selftests/i915_selftest.o
>   CC [M]  drivers/gpu/drm/i915/selftests/igt_atomic.o
>   CC [M]  drivers/gpu/drm/i915/selftests/igt_flush_test.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.o
>   CC [M]  drivers/gpu/drm/i915/selftests/igt_live_test.o
>   CC [M]  drivers/gpu/drm/i915/selftests/igt_mmap.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu9_baco.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm200.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/tonga_baco.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm20b.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp100.o
>   CC [M]  drivers/gpu/drm/i915/selftests/igt_reset.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp10b.o
>   CC [M]  drivers/gpu/drm/i915/selftests/igt_spinner.o
>   CC [M]  drivers/gpu/drm/i915/selftests/librapl.o
>   CC [M]  drivers/gpu/drm/i915/i915_vgpu.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_dkl_phy_regs.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_crtc_state_dump.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/polaris_baco.o
>   HDRTEST drivers/gpu/drm/i915/display/hsw_ips.h
>   HDRTEST drivers/gpu/drm/i915/display/g4x_hdmi.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_hdcp_regs.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/fiji_baco.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gv100.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ci_baco.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mem.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv04.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_baco.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv50.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memgf100.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_overlay.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/amd_powerplay.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_display.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/legacy_dpm.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_dmc.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv04.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv41.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_vga.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_audio.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_lvds.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv44.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_modeset_setup.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_cdclk.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_hotplug.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_dkl_phy.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_atomic.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_dpll.h
>   HDRTEST drivers/gpu/drm/i915/display/vlv_dsi_pll_regs.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_dp_mst.h
>   HDRTEST drivers/gpu/drm/i915/display/g4x_dp.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_tc.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_frontbuffer.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_smc.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_dsi_vbt.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmmcp77.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_smc.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_psr.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk104.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_crt.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_opregion.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_snps_phy_regs.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_global_state.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_lpe_audio.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_drrs.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm_internal.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm200.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_fbdev.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_hdmi.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_fdi.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_fb.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_qp_tables.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_vdsc.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_snps_phy.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_display_core.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.o
>   HDRTEST drivers/gpu/drm/i915/display/vlv_dsi_pll.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_dvo_dev.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_hdcp.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgv100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_sdvo_regs.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_pch_refclk.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_display_trace.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_display_power.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_services.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_pp_smu.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_psr.o
>   HDRTEST drivers/gpu/drm/i915/display/i9xx_plane.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_dp_aux_backlight.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_dpll_mgr.h
>   HDRTEST drivers/gpu/drm/i915/display/vlv_dsi.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_plane_initial.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mxm/mxms.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_fifo_underrun.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_cursor.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.o
>   HDRTEST drivers/gpu/drm/i915/display/vlv_dsi_regs.h
>   HDRTEST drivers/gpu/drm/i915/display/skl_scaler.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/agp.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_hti.h
>   HDRTEST drivers/gpu/drm/i915/display/icl_dsi_regs.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_atomic_plane.h
>   HDRTEST drivers/gpu/drm/i915/display/skl_watermark.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_fbc.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_display_reg_defs.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_acpi.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_connector.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_hdcp.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv04.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_dpt.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv40.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv46.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_quirks.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_dp_link_training.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv4c.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/g84.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/conversion.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/fixpt31_32.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/vector.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_color.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/g92.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf100.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf106.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_crtc.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser_interface.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser_helper.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_display_debugfs.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_modeset_verify.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gp100.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/memx.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table_helper.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser_common.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gt215.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gf100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table_helper2.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gf119.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk104.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce60/command_table_helper_dce60.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce80/command_table_helper_dce80.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_display_power_well.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk110.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_pipe_crc.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk208.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk20a.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce110/command_table_helper_dce110.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm107.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_audio_regs.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce112/command_table_helper_dce112.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_panel.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_sprite.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm200.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce112/command_table_helper2_dce112.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_tv.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_hti_regs.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_vrr.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dce_calcs.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.o
>   HDRTEST drivers/gpu/drm/i915/display/skl_universal_plane.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/custom_float.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_mg_phy_regs.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/bw_fixed.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gf100.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_bw.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_de.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gf117.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gk104.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gk20a.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gm200.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn10/dcn10_fpu.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_gmbus_regs.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gp10b.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_dvo.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_sdvo.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_vba.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_dp_aux.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_combo_phy.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_dvo_regs.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fannil.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_gmbus.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_dsi.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_dmc_regs.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fantog.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_ddi.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/dcn30_fpu.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_dsb.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/ic.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_bios.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_pch_display.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_display_types.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv40.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/g84.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gt215.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gm107.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gm200.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_backlight.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_dp.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/base.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_backlight_regs.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_combo_phy_regs.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv04.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_32.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/dcn31_fpu.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv40.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv41.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/gk20a.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn321/dcn321_fpu.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/top/base.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn301/dcn301_fpu.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_display_power_map.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/base.o
>   HDRTEST drivers/gpu/drm/i915/display/icl_dsi.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn302/dcn302_fpu.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/gv100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn303/dcn303_fpu.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_lspcon.h
>   HDRTEST drivers/gpu/drm/i915/display/intel_dpio_phy.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/tu102.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/ga100.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_dp_hdcp.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_fb_pin.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gpio.o
>   HDRTEST drivers/gpu/drm/i915/display/intel_pps.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/nv40.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gf100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/dcn314_fpu.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gf117.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calcs.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.o
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_ttm.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_math.o
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_region.h
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gm20b.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/clk_mgr.o
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_lmem.h
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_mman.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/falcon.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_clk_mgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/xtensa.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/bsp/g84.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gf100.o
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce100/dce_clk_mgr.o
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_context.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce110/dce110_clk_mgr.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce112/dce112_clk_mgr.o
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_clflush.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gk104.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce120/dce120_clk_mgr.o
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_tiling.h
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_stolen.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn10/rv1_clk_mgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gm107.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gm200.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gp100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn10/rv2_clk_mgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gp102.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn20/dcn20_clk_mgr.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn201/dcn201_clk_mgr.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gv100.o
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.h
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_create.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.o
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_domain.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.o
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_internal.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.o
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_dmabuf.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/cipher/g84.o
>   HDRTEST drivers/gpu/drm/i915/gem/selftests/mock_context.h
>   HDRTEST drivers/gpu/drm/i915/gem/selftests/huge_gem_object.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/acpi.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/base.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.o
>   HDRTEST drivers/gpu/drm/i915/gem/selftests/mock_gem_object.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/pci.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/user.o
>   HDRTEST drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/base.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/dcn301_smu.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.o
>   HDRTEST drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn31/dcn31_smu.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.o
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_userptr.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn31/dcn31_clk_mgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.o
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_pm.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn314/dcn314_smu.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn314/dcn314_clk_mgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmi.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_smu.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_clk_mgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/head.o
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_shrinker.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn316/dcn316_smu.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.o
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gemfs.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.o
>   HDRTEST drivers/gpu/drm/i915/gem/i915_gem_object.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/vga.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/nv04.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn316/dcn316_clk_mgr.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_timeline_types.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.o
>   HDRTEST drivers/gpu/drm/i915/gt/selftest_engine.h
>   HDRTEST drivers/gpu/drm/i915/gt/intel_breadcrumbs.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_audio.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_stream_encoder.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gt200.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_link_encoder.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_context_types.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_execlists_submission.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_hwseq.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_clock_source.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gt_pm.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.o
>   HDRTEST drivers/gpu/drm/i915/gt/selftest_rc6.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gk110.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_scl_filters.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_llc_types.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_transform.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gt.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_opp.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gp102.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_region_lmem.h
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gt_requests.h
>   HDRTEST drivers/gpu/drm/i915/gt/intel_ggtt_gmch.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_dmcu.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_abm.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_ipp.o
>   HDRTEST drivers/gpu/drm/i915/gt/gen8_ppgtt.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gt_mcr.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/base.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_timeline.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/nv04.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/nv50.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.o
>   HDRTEST drivers/gpu/drm/i915/gt/gen6_engine_cs.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/gf100.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/gf119.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_workarounds_types.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_panel_cntl.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/gv100.o
>   HDRTEST drivers/gpu/drm/i915/gt/selftest_rps.h
>   HDRTEST drivers/gpu/drm/i915/gt/intel_sa_media.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_hw_lock_mgr.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/user.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv04.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_outbox.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv50.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_base.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf119.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gt_clock_utils.h
>   HDRTEST drivers/gpu/drm/i915/gt/intel_rps_types.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usergv100.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_factory.o
>   HDRTEST drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/cgrp.o
>   HDRTEST drivers/gpu/drm/i915/gt/sysfs_engines.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/chid.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_gpio.o
>   HDRTEST drivers/gpu/drm/i915/gt/gen7_renderclear.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_hpd.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_context.h
>   HDRTEST drivers/gpu/drm/i915/gt/intel_wopcm.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_mocs.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_ddc.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_generic.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/runq.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_translate.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv10.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_engine_pm.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce60/hw_translate_dce60.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce60/hw_factory_dce60.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv17.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv40.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce80/hw_translate_dce80.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv50.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/g84.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce80/hw_factory_dce80.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce110/hw_translate_dce110.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce110/hw_factory_dce110.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/g98.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce120/hw_translate_dce120.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk110.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce120/hw_factory_dce120.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk208.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn10/hw_translate_dcn10.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk20a.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gm107.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gm200.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gp100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn10/hw_factory_dcn10.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn20/hw_translate_dcn20.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn20/hw_factory_dcn20.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gt_sysfs.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_rc6.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_ring_types.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn21/hw_translate_dcn21.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn21/hw_factory_dcn21.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn30/hw_translate_dcn30.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_workarounds.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/base.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn30/hw_factory_dcn30.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn315/hw_translate_dcn315.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_engine_regs.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn315/hw_factory_dcn315.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gt_pm_irq.h
>   HDRTEST drivers/gpu/drm/i915/gt/shmem_utils.h
>   HDRTEST drivers/gpu/drm/i915/gt/intel_engine.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv15.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn32/hw_translate_dcn32.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn32/hw_factory_dcn32.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv17.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/irq_service.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv25.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce60/irq_service_dce60.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_reset_types.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce80/irq_service_dce80.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce110/irq_service_dce110.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv2a.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv30.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv34.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv35.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gt_regs.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv44.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_reset.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce120/irq_service_dce120.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn10/irq_service_dcn10.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn20/irq_service_dcn20.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/g84.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gt200.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/mcp79.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn30/irq_service_dcn30.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gt215.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn302/irq_service_dcn302.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/mcp89.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn303/irq_service_dcn303.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn31/irq_service_dcn31.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn314/irq_service_dcn314.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn315/irq_service_dcn315.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_uc.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf104.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn32/irq_service_dcn32.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_hwss_dio.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf110.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf117.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf119.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_hwss_dpia.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_fw.h
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_hwss_hpo_dp.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_trace.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk104.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
>   HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>   HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk110.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/virtual/virtual_link_encoder.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk110b.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/virtual/virtual_stream_encoder.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/virtual/virtual_link_hwss.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk208.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_huc.h
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gm200.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gm20b.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp102.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_init.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dpp.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp104.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dpp_cm.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp107.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp108.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_mpc.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gv100.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_opp.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubbub.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv40.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_optc.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf104.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_mmhubbub.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_stream_encoder.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf108.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf110.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_link_encoder.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf117.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf119.o
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.h
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h
>   HDRTEST drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dccg.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_vmid.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_hwconfig.h
>   HDRTEST drivers/gpu/drm/i915/gt/intel_llc.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dwb.o
>   HDRTEST drivers/gpu/drm/i915/gt/gen8_engine_cs.h
>   HDRTEST drivers/gpu/drm/i915/gt/intel_sseu_debugfs.h
>   HDRTEST drivers/gpu/drm/i915/gt/intel_rc6_types.h
>   HDRTEST drivers/gpu/drm/i915/gt/intel_context_param.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk104.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110b.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gpu_commands.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dwb_scl.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dsc.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_engine_user.h
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gt_irq.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk208.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gsc.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk20a.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_rps.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dc_dsc.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm200.o
>   HDRTEST drivers/gpu/drm/i915/gt/selftest_llc.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/rc_calc.o
>   HDRTEST drivers/gpu/drm/i915/gt/gen6_ppgtt.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm20b.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_ggtt_fencing.h
>   HDRTEST drivers/gpu/drm/i915/gt/intel_migrate_types.h
>   HDRTEST drivers/gpu/drm/i915/gt/selftests/mock_timeline.h
>   HDRTEST drivers/gpu/drm/i915/gt/intel_lrc.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp100.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_lrc_reg.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/rc_calc_dpi.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp102.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp104.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp107.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_init.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgv100.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_migrate.h
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxtu102.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxga102.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv40.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_resource.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_ipp.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer_debug.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_dpp.o
>   HDRTEST drivers/gpu/drm/i915/gt/mock_engine.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv50.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/g84.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_opp.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mspdec/base.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mspdec/g98.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_engine_stats.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mspdec/gt215.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mspdec/gf100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gtt.h
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gt_buffer_pool_types.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mspdec/gk104.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_ring.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hubp.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msppp/base.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msppp/g98.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msppp/gt215.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_mpc.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_dpp_dscl.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msppp/gf100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_dpp_cm.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msvld/base.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msvld/g98.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gt_types.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_cm_common.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msvld/gt215.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_renderstate.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hubbub.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msvld/mcp89.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msvld/gf100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_stream_encoder.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msvld/gk104.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_link_encoder.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_init.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hubp.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_sseu.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hubbub.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_resource.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.o
>   HDRTEST drivers/gpu/drm/i915/gt/intel_engine_types.h
>   HDRTEST drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvenc/gm107.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvdec/base.o
>   HDRTEST drivers/gpu/drm/i915/gt/gen2_engine_cs.h
>   HDRTEST drivers/gpu/drm/i915/gvt/gvt.h
>   HDRTEST drivers/gpu/drm/i915/gvt/trace.h
>   HDRTEST drivers/gpu/drm/i915/gvt/debug.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvdec/gm107.o
>   HDRTEST drivers/gpu/drm/i915/gvt/edid.h
>   HDRTEST drivers/gpu/drm/i915/gvt/page_track.h
>   HDRTEST drivers/gpu/drm/i915/gvt/mmio.h
>   HDRTEST drivers/gpu/drm/i915/gvt/sched_policy.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/base.o
>   HDRTEST drivers/gpu/drm/i915/gvt/fb_decoder.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.o
>   HDRTEST drivers/gpu/drm/i915/gvt/cmd_parser.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.o
>   HDRTEST drivers/gpu/drm/i915/gvt/dmabuf.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_link_encoder.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_dccg.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/gt200.o
>   HDRTEST drivers/gpu/drm/i915/gvt/mmio_context.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/gt215.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_init.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_resource.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/gf117.o
>   HDRTEST drivers/gpu/drm/i915/gvt/display.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_hwseq.o
>   HDRTEST drivers/gpu/drm/i915/gvt/gtt.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/gk104.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec/g98.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec2/base.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec2/gp102.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec2/gp108.o
>   HDRTEST drivers/gpu/drm/i915/gvt/scheduler.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_hubbub.o
>   HDRTEST drivers/gpu/drm/i915/gvt/reg.h
>   HDRTEST drivers/gpu/drm/i915/gvt/execlist.h
>   HDRTEST drivers/gpu/drm/i915/gvt/interrupt.h
>   HDRTEST drivers/gpu/drm/i915/i915_active.h
>   HDRTEST drivers/gpu/drm/i915/i915_active_types.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_mpc.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_hubp.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec2/tu102.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec2/ga102.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/base.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_opp.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/nv04.o
>   HDRTEST drivers/gpu/drm/i915/i915_cmd_parser.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/nv10.o
>   HDRTEST drivers/gpu/drm/i915/i915_debugfs.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_optc.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_dpp.o
>   HDRTEST drivers/gpu/drm/i915/i915_debugfs_params.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_dccg.o
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/nvsw.o
>   HDRTEST drivers/gpu/drm/i915/i915_deps.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_link_encoder.o
>   HDRTEST drivers/gpu/drm/i915/i915_driver.h
>   HDRTEST drivers/gpu/drm/i915/i915_drm_client.h
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/vp/g84.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_init.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubbub.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_acpi.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubp.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_debugfs.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_drm.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_hwmon.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.o
>   HDRTEST drivers/gpu/drm/i915/i915_drv.h
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_ioc32.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dccg.o
>   HDRTEST drivers/gpu/drm/i915/i915_file_private.h
>   HDRTEST drivers/gpu/drm/i915/i915_fixed.h
>   HDRTEST drivers/gpu/drm/i915/i915_gem.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hwseq.o
>   HDRTEST drivers/gpu/drm/i915/i915_gem_evict.h
>   HDRTEST drivers/gpu/drm/i915/i915_gem_gtt.h
>   HDRTEST drivers/gpu/drm/i915/i915_gem_ww.h
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_led.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_mpc.o
>   HDRTEST drivers/gpu/drm/i915/i915_getparam.h
>   HDRTEST drivers/gpu/drm/i915/i915_gpu_error.h
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_nvif.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_vpg.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_usif.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_vga.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_afmt.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_bo.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_bo0039.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.o
>   HDRTEST drivers/gpu/drm/i915/i915_hwmon.h
>   HDRTEST drivers/gpu/drm/i915/i915_ioc32.h
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_bo5039.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_bo74c1.o
>   HDRTEST drivers/gpu/drm/i915/i915_ioctl.h
>   HDRTEST drivers/gpu/drm/i915/i915_iosf_mbi.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dwb.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_bo85b5.o
>   HDRTEST drivers/gpu/drm/i915/i915_irq.h
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_bo9039.o
>   HDRTEST drivers/gpu/drm/i915/i915_memcpy.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp_cm.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_bo90b5.o
>   HDRTEST drivers/gpu/drm/i915/i915_mitigations.h
>   HDRTEST drivers/gpu/drm/i915/i915_mm.h
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_boa0b5.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_gem.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_svm.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_dmem.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dwb_cm.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_mem.o
>   HDRTEST drivers/gpu/drm/i915/i915_params.h
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_prime.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_cm_common.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_mmhubbub.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_sgdma.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_link_encoder.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_ttm.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_init.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_dccg.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_vmm.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_backlight.o
>   HDRTEST drivers/gpu/drm/i915/i915_pci.h
>   HDRTEST drivers/gpu/drm/i915/i915_perf.h
>   HDRTEST drivers/gpu/drm/i915/i915_perf_oa_regs.h
>   HDRTEST drivers/gpu/drm/i915/i915_perf_types.h
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_bios.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_dio_link_encoder.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_hwseq.o
>   HDRTEST drivers/gpu/drm/i915/i915_pmu.h
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_connector.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_panel_cntl.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_display.o
>   CC [M]  drivers/gpu/drm/nouveau/nouveau_dp.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_hubbub.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn302/dcn302_init.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv04/arb.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv04/crtc.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn302/dcn302_hwseq.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv04/cursor.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn302/dcn302_resource.o
>   HDRTEST drivers/gpu/drm/i915/i915_priolist_types.h
>   CC [M]  drivers/gpu/drm/nouveau/dispnv04/dac.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv04/dfp.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv04/disp.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv04/hw.o
>   HDRTEST drivers/gpu/drm/i915/i915_pvinfo.h
>   CC [M]  drivers/gpu/drm/nouveau/dispnv04/overlay.o
>   HDRTEST drivers/gpu/drm/i915/i915_query.h
>   HDRTEST drivers/gpu/drm/i915/i915_reg.h
>   HDRTEST drivers/gpu/drm/i915/i915_reg_defs.h
>   HDRTEST drivers/gpu/drm/i915/i915_request.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_init.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.o
>   HDRTEST drivers/gpu/drm/i915/i915_scatterlist.h
>   CC [M]  drivers/gpu/drm/nouveau/dispnv04/tvnv04.o
>   HDRTEST drivers/gpu/drm/i915/i915_scheduler.h
>   CC [M]  drivers/gpu/drm/nouveau/dispnv04/tvnv17.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_hwseq.o
>   HDRTEST drivers/gpu/drm/i915/i915_scheduler_types.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.o
>   HDRTEST drivers/gpu/drm/i915/i915_selftest.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hubbub.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hwseq.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_init.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv50/disp.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hubp.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv50/lut.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_dccg.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_optc.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_dio_link_encoder.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv50/core.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv50/core507d.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv50/core827d.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_panel_cntl.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_apg.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.o
>   HDRTEST drivers/gpu/drm/i915/i915_suspend.h
>   HDRTEST drivers/gpu/drm/i915/i915_sw_fence.h
>   CC [M]  drivers/gpu/drm/nouveau/dispnv50/core907d.o
>   HDRTEST drivers/gpu/drm/i915/i915_sw_fence_work.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hpo_dp_link_encoder.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_afmt.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_vpg.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv50/core917d.o
>   HDRTEST drivers/gpu/drm/i915/i915_switcheroo.h
>   HDRTEST drivers/gpu/drm/i915/i915_syncmap.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_resource.o
>   HDRTEST drivers/gpu/drm/i915/i915_sysfs.h
>   CC [M]  drivers/gpu/drm/nouveau/dispnv50/corec37d.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_hwseq.o
>   HDRTEST drivers/gpu/drm/i915/i915_tasklet.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_init.o
>   HDRTEST drivers/gpu/drm/i915/i915_trace.h
>   CC [M]  drivers/gpu/drm/nouveau/dispnv50/corec57d.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_dio_stream_encoder.o
>   HDRTEST drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_dccg.o
>   HDRTEST drivers/gpu/drm/i915/i915_user_extensions.h
>   HDRTEST drivers/gpu/drm/i915/i915_utils.h
>   CC [M]  drivers/gpu/drm/nouveau/dispnv50/crc.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv50/crc907d.o
>   HDRTEST drivers/gpu/drm/i915/i915_vgpu.h
>   HDRTEST drivers/gpu/drm/i915/i915_vma.h
>   CC [M]  drivers/gpu/drm/nouveau/dispnv50/crcc37d.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_optc.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv50/crcc57d.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv50/dac507d.o
>   HDRTEST drivers/gpu/drm/i915/i915_vma_resource.h
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv50/dac907d.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv50/pior507d.o
>   CC [M]  drivers/gpu/drm/nouveau/dispnv50/sor507d.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubbub.o
>   HDRTEST drivers/gpu/drm/i915/i915_vma_types.h
>   CC [M]  drivers/gpu/drm/nouveau/dispnv50/sor907d.o
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/
>
>

-- 
Jani Nikula, Intel Open Source Graphics Center
