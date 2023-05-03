Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16D8C77B78
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 14:02:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D3210E16F;
	Wed,  3 May 2023 14:02:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F2210E16F
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 14:02:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CE8C660C8A;
 Wed,  3 May 2023 14:02:37 +0000 (UTC)
Received: from rdvivi-mobl4 (fmdmzpr02-ext.fm.intel.com [192.55.54.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 9DF9CC433D2;
 Wed,  3 May 2023 14:02:35 +0000 (UTC)
Date: Wed, 3 May 2023 10:02:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZFJpdO7WW5miOo3s@rdvivi-mobl4>
References: <20230503131005.1602412-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503131005.1602412-1-jani.nikula@intel.com>
Subject: Re: [Intel-xe] [PATCH 00/18] xe&i915 display integration: add
 uncore and pcode compat layers
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

On Wed, May 03, 2023 at 04:09:47PM +0300, Jani Nikula wrote:
> Add intel_uncore.h and intel_pcode.h compat layers to direct the calls
> in i915 display code properly, without needing to change a lot of call
> sites in i915 display.
> 
> The main trick or hack here is adding a fake uncore member to struct
> xe_device, which lets all the call sites use &i915->uncore as before,
> which we can use in the glue layers to get at the struct xe_device
> pointer.
> 
> The fake uncore is intentionally struct fake_uncore in xe, so you can't
> really start passing around uncore pointers in display code, only do
> &i915->uncore, and it'll be the correct, but different type for each
> driver.
> 
> IMO the trick and the compat layers are cleaner than what we've had
> before, and doesn't force using intel_de_* accessors for non-de
> registers in i915 display code.

Nice clean-up.

Couple comments:

1. I believe the fake uncore you created is better than convert entire xe
to match i915 uncore.

2. Does the fixup! as revert works well on autosquash? if so this is really
neat... I was manually removing the revert and reverted patches on the
clean-up rebases...

> 
> BR,
> Jani.
> 
> 
> Jani Nikula (18):
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Rename intel_de.h to xe_de.h
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/i915/display: Remaining changes to make xe compile
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/i915/display: Add more macros to remove all direct calls to
>     uncore
>   fixup! drm/i915/display: Remove all uncore mmio accesses in favor of
>     intel_de
>   fixup! drm/i915/display: Remaining changes to make xe compile
>   fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/i915/display: Remaining changes to make xe compile
>   fixup! drm/i915/display: Remaining changes to make xe compile
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
> 
>  drivers/gpu/drm/i915/display/hsw_ips.c        |   7 +-
>  drivers/gpu/drm/i915/display/intel_bios.c     |  19 +-
>  drivers/gpu/drm/i915/display/intel_bw.c       |  34 ++--
>  drivers/gpu/drm/i915/display/intel_cdclk.c    |  45 ++---
>  drivers/gpu/drm/i915/display/intel_de.h       |  54 ------
>  drivers/gpu/drm/i915/display/intel_display.c  |   1 +
>  .../drm/i915/display/intel_display_power.c    |   3 +-
>  .../i915/display/intel_display_power_well.c   |   7 +-
>  drivers/gpu/drm/i915/display/intel_dpio_phy.c |   9 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     |   9 +-
>  drivers/gpu/drm/i915/display/skl_watermark.c  |  23 +--
>  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   1 +
>  .../drm/xe/compat-i915-headers/intel_pcode.h  |  42 +++++
>  .../drm/xe/compat-i915-headers/intel_uncore.h |  99 +++++++++++
>  drivers/gpu/drm/xe/display/ext/i915_irq.c     | 134 +++++++-------
>  .../drm/xe/display/ext/intel_clock_gating.c   |   1 +
>  .../drm/xe/display/ext/intel_device_info.c    |   1 +
>  drivers/gpu/drm/xe/display/ext/intel_dram.c   |   3 +-
>  drivers/gpu/drm/xe/display/xe_de.h            | 163 ------------------
>  drivers/gpu/drm/xe/xe_device_types.h          |   4 +
>  drivers/gpu/drm/xe/xe_display.c               |   3 +
>  drivers/gpu/drm/xe/xe_mmio.h                  |   8 +
>  22 files changed, 307 insertions(+), 363 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>  delete mode 100644 drivers/gpu/drm/xe/display/xe_de.h
> 
> -- 
> 2.39.2
> 
