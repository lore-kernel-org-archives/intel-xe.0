Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CEAC7618E
	for <intel-xe@archiver.kernel.org>; Thu, 20 Apr 2023 19:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5785A10E2C9;
	Thu, 20 Apr 2023 19:46:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B66810E2E8
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Apr 2023 19:30:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8396161843;
 Thu, 20 Apr 2023 19:30:47 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id E4DB0C433EF;
 Thu, 20 Apr 2023 19:30:44 +0000 (UTC)
Date: Thu, 20 Apr 2023 15:30:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZEGS4tA905pT3ZWQ@rdvivi-mobl4>
References: <20230419123947.543175-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419123947.543175-1-jani.nikula@intel.com>
X-Mailman-Approved-At: Thu, 20 Apr 2023 19:46:47 +0000
Subject: Re: [Intel-xe] [PATCH 0/9] xe & i915 display integration cleanups
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 03:39:38PM +0300, Jani Nikula wrote:
> Change the way i915 display gets built for xe. Additional cleanups and
> backports on top to make future changes simpler.

I tested this series on DG2 and worked well so I pushed it already
so I can do the in-place rebase --autosquash.

> 
> Jani Nikula (9):
>   fixup! drm/xe/display: Implement display support
>   drm/i915/wm: remove stale and unused ilk_wm_max_level() declaration
>   drm/i915/display: add I915 conditional build to i9xx_wm.h
>   fixup! drm/xe/display: Implement display support
>   drm/i915: rename intel_pm.[ch] to intel_clock_gating.[ch]
>   fixup! drm/xe/display: Implement display support
>   drm/i915: use explicit includes for i915_reg.h and i915_irq.h
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/i915/display: Remaining changes to make xe compile
> 
>  drivers/gpu/drm/i915/Makefile                 |   2 +-
>  drivers/gpu/drm/i915/display/i9xx_wm.c        |   1 +
>  drivers/gpu/drm/i915/display/i9xx_wm.h        |  18 +-
>  drivers/gpu/drm/i915/display/intel_display.c  |   4 +-
>  .../drm/i915/display/intel_display_power.c    |   1 +
>  .../i915/display/intel_display_power_well.c   |   1 +
>  .../drm/i915/display/intel_display_reg_defs.h |   4 -
>  .../drm/i915/display/intel_display_trace.h    |   1 -
>  drivers/gpu/drm/i915/display/intel_fbc.c      |   1 +
>  .../drm/i915/display/intel_fifo_underrun.c    |   2 +
>  drivers/gpu/drm/i915/gt/intel_gt_irq.c        |   1 +
>  drivers/gpu/drm/i915/gt/intel_reset.c         |   1 +
>  drivers/gpu/drm/i915/gt/intel_rps.c           |   1 +
>  drivers/gpu/drm/i915/gt/selftest_rps.c        |   1 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   1 +
>  drivers/gpu/drm/i915/i915_debugfs.c           |   1 +
>  drivers/gpu/drm/i915/i915_driver.c            |   8 +-
>  drivers/gpu/drm/i915/i915_gem.c               |   8 +-
>  drivers/gpu/drm/i915/i915_irq.c               |   1 +
>  drivers/gpu/drm/i915/i915_irq.h               |   2 +-
>  .../i915/{intel_pm.c => intel_clock_gating.c} |   9 +-
>  drivers/gpu/drm/i915/intel_clock_gating.h     |  14 ++
>  drivers/gpu/drm/i915/intel_pm.h               |  18 --
>  drivers/gpu/drm/i915/vlv_suspend.c            |   4 +-
>  drivers/gpu/drm/xe/Makefile                   | 170 +++++++++---------
>  .../compat-i915-headers/intel_clock_gating.h  |   1 +
>  drivers/gpu/drm/xe/display/ext/i915_irq.c     |   2 +-
>  drivers/gpu/drm/xe/display/ext/i9xx_wm.c      |  24 ---
>  drivers/gpu/drm/xe/display/ext/i9xx_wm.h      |  20 ---
>  .../ext/{intel_pm.c => intel_clock_gating.c}  |   4 +-
>  drivers/gpu/drm/xe/display/ext/intel_pm.h     |  29 ---
>  drivers/gpu/drm/xe/xe_device_types.h          |   3 +
>  drivers/gpu/drm/xe/xe_display.c               |   4 +-
>  33 files changed, 152 insertions(+), 210 deletions(-)
>  rename drivers/gpu/drm/i915/{intel_pm.c => intel_clock_gating.c} (99%)
>  create mode 100644 drivers/gpu/drm/i915/intel_clock_gating.h
>  delete mode 100644 drivers/gpu/drm/i915/intel_pm.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
>  delete mode 100644 drivers/gpu/drm/xe/display/ext/i9xx_wm.c
>  delete mode 100644 drivers/gpu/drm/xe/display/ext/i9xx_wm.h
>  rename drivers/gpu/drm/xe/display/ext/{intel_pm.c => intel_clock_gating.c} (97%)
>  delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pm.h
> 
> -- 
> 2.39.2
> 
