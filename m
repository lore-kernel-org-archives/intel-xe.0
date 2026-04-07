Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58339FF5110
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 16:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA85210E466;
	Tue,  7 Apr 2026 16:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iil5+HPf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8EE10E08E;
 Tue,  7 Apr 2026 16:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775578328; x=1807114328;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=e6I/JxeZ/KjbSnsR9Zbkyk76kyHSDYjMNHLP5S2noOM=;
 b=iil5+HPfAhlqK2ntlxzjPNSqVAf3oWwjuHRP+zUcFk48hdxwrG1RBJ/H
 mvePgBxRNVLuMhk7r41PvQav6FqTSjfHRcA9LyI+D8ECxwf5PpunOGzZM
 BIpokkIYHvegoGf3RIyNEfFvVEu5d51+lmWOJAphY3IaZxtVEAH+4hyCM
 qGjcph4NCaGCrRG+kR9rEWRFnSXGSCnoBa9Td7Otgf0RnHwumjxm8mRk3
 RSEmiyD5NJPzaRzXjUudDWQQkG+liDAxKObqA6pB1OCEfwfQcyw2hb68x
 VH+hu/QZZBaTqqwnkqeb0UM/Qt7TXQzj4pCXaTTX4kUgDQAgI6LaakntT A==;
X-CSE-ConnectionGUID: axyHopapR22jTimMSMpZYg==
X-CSE-MsgGUID: pW9ZKQWvRW2ul4cXc22GCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76667465"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76667465"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 09:12:07 -0700
X-CSE-ConnectionGUID: JK42QNwZSGCipK/jBTgwdw==
X-CSE-MsgGUID: jVbrJVrXQpyItX+++/veuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="228477496"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 09:12:06 -0700
Date: Tue, 7 Apr 2026 19:12:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 0/3] drm/i915: relocate mchbar and pci regs headers
Message-ID: <adUs0xU-zEoPZqwz@intel.com>
References: <cover.1775559414.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1775559414.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Tue, Apr 07, 2026 at 01:57:39PM +0300, Jani Nikula wrote:
> Move the MCHBAR and PCI regs headers under include/drm/intel.
> 
> Jani Nikula (3):
>   drm/i915/mchbar: include intel_mchbar_regs.h from intel_mchbar.h
>   drm/i915/mchbar: move intel_mchbar_regs.h under include/drm/intel
>   drm/i915/pci: move intel_pci_config.h under include/drm/intel

Spotted a few places that could drop the include entirely. Otherwise
looks fine.

Series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
>  drivers/gpu/drm/i915/display/i9xx_display_sr.c              | 2 +-
>  drivers/gpu/drm/i915/display/i9xx_wm.c                      | 1 -
>  drivers/gpu/drm/i915/display/intel_backlight.c              | 2 +-
>  drivers/gpu/drm/i915/display/intel_bw.c                     | 1 -
>  drivers/gpu/drm/i915/display/intel_cdclk.c                  | 3 +--
>  drivers/gpu/drm/i915/display/intel_display_power.c          | 1 -
>  drivers/gpu/drm/i915/display/intel_dram.c                   | 1 -
>  drivers/gpu/drm/i915/display/intel_lpe_audio.c              | 2 +-
>  drivers/gpu/drm/i915/display/intel_mchbar.c                 | 1 -
>  drivers/gpu/drm/i915/display/intel_mchbar.h                 | 2 ++
>  drivers/gpu/drm/i915/display/intel_opregion.c               | 2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c                  | 4 ++--
>  drivers/gpu/drm/i915/gt/intel_ggtt.c                        | 2 +-
>  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c                | 2 +-
>  drivers/gpu/drm/i915/gt/intel_gt.c                          | 2 +-
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c               | 2 +-
>  drivers/gpu/drm/i915/gt/intel_llc.c                         | 2 +-
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c                 | 2 +-
>  drivers/gpu/drm/i915/gt/intel_reset.c                       | 5 +++--
>  drivers/gpu/drm/i915/gt/intel_rps.c                         | 4 ++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c                 | 2 +-
>  drivers/gpu/drm/i915/gvt/cfg_space.c                        | 2 +-
>  drivers/gpu/drm/i915/gvt/handlers.c                         | 4 ++--
>  drivers/gpu/drm/i915/i915_debugfs.c                         | 2 +-
>  drivers/gpu/drm/i915/i915_driver.c                          | 2 +-
>  drivers/gpu/drm/i915/i915_freq.c                            | 2 +-
>  drivers/gpu/drm/i915/i915_gmch.c                            | 2 +-
>  drivers/gpu/drm/i915/i915_hwmon.c                           | 2 +-
>  drivers/gpu/drm/i915/i915_overlay.c                         | 2 +-
>  drivers/gpu/drm/i915/i915_pci.c                             | 2 +-
>  drivers/gpu/drm/i915/intel_clock_gating.c                   | 4 ++--
>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c                 | 2 +-
>  drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h  | 6 ------
>  drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h   | 6 ------
>  .../intel_mchbar_regs.h => include/drm/intel/mchbar_regs.h  | 0
>  .../intel_pci_config.h => include/drm/intel/pci_config.h    | 0
>  36 files changed, 34 insertions(+), 49 deletions(-)
>  delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h
>  delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h
>  rename drivers/gpu/drm/i915/intel_mchbar_regs.h => include/drm/intel/mchbar_regs.h (100%)
>  rename drivers/gpu/drm/i915/intel_pci_config.h => include/drm/intel/pci_config.h (100%)
> 
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
