Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA03EC25B47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 08:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A7210E051;
	Fri, 27 Oct 2023 08:47:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE30810E051
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698396472; x=1729932472;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=2ZonPI+fzOdtudGgco5nsal0lR99f/Qlvjdh2RvCW/k=;
 b=f0MW6md/9F78a3nLv2pVKnVddFQcFSza3TUHpgeasPmdgEI6IVBd4eLp
 ZcXyN6jC56uUB/huUb6d3wqR4w5IK4EEGT54+6MVJEj6mxU+1g34LawLU
 VVtcMuVclBY2cZPdb/Jl8yPCq8Du6EzGk6cFse6nxQZIPpWQ19Zm1CfPx
 QAaCKape23Od8T4F7AJaL9jej5e+JN/34r1fZoElHesCZWpLFClxAl/pt
 H7WTxeX+52Nq/gKX15297FgwlTT1kfgWpX8o6VMfySVt/K4j7HcedLN2m
 G27E5tNEO+XjIsmFjVZJpMloUYtXmle+C3cWb+IoEEBv9W2MtJ7/jGJeY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="6364481"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="6364481"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="876266821"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="876266821"
Received: from jhajducz-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.19])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:47:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20231027075918.2206862-1-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231027075918.2206862-1-jouni.hogander@intel.com>
Date: Fri, 27 Oct 2023 11:47:44 +0300
Message-ID: <871qdg78pb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 00/31] Backport display parameter patches
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
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 Luca Coelho <luciano.coelho@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 27 Oct 2023, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> This patch set is backporting display parameter patches from
> intel-drm-next. Also some dependencies are backported to avoid
> conflicts. This makes all display parameters available for Xe driver
> as well.
>
> dummy display parameters from xe_device struct are removed as they are
> unnecessary. Also one FIXME patch can be now reverted:
>
> "FIXME: drm/i915: xe doesn't have i915_modparams.verbose_state_checks"

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Luca Coelho <luciano.coelho@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
>
> Jani Nikula (3):
>   drm/i915: convert INTEL_DISPLAY_ENABLED() into a function
>   drm/i915: separate display runtime info init
>   drm/i915: separate subplatform init and runtime feature init
>
> Jouni H=C3=B6gander (28):
>   Revert "FIXME: drm/i915: xe doesn't have
>     i915_modparams.verbose_state_checks"
>   drm/i915/display: Add framework to add parameters specific to display
>   drm/i915/display: Dump also display parameters
>   drm/i915/display: Move enable_fbc module parameter under display
>   drm/i915/display: Move psr related module parameters under display
>   drm/i915/display: Move vbt_firmware module parameter under display
>   drm/i915/display: Move lvds_channel_mode module parameter under
>     display
>   drm/i915/display: Move panel_use_ssc module parameter under display
>   drm/i915/display: Move vbt_sdvo_panel_type module parameter under
>     display
>   drm/i915/display: Move enable_dc module parameter under display
>   drm/i915/display: Move enable_dpt module parameter under display
>   drm/i915/display: Move enable_sagv module parameter under display
>   drm/i915/display: Move disable_power_well module parameter under
>     display
>   drm/i915/display: Move enable_ips module parameter under display
>   drm/i915/display: Move invert_brightness module parameter under
>     display
>   drm/i915/display: Move edp_vswing module parameter under display
>   drm/i915/display: Move enable_dpcd_backlight module parameter under
>     display
>   drm/i915/display: Move load_detect_test parameter under display
>   drm/i915/display: Move force_reset_modeset_test parameter under
>     display
>   drm/i915/display: Move disable_display parameter under display
>   drm/i915/display: Use device parameters instead of module in
>     I915_STATE_WARN
>   drm/i915/display: Move verbose_state_checks under display
>   drm/i915/display: Move nuclear_pageflip under display
>   drm/i915/display: Move enable_dp_mst under display
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>
>  drivers/gpu/drm/i915/Makefile                 |   2 +
>  drivers/gpu/drm/i915/display/hsw_ips.c        |   4 +-
>  drivers/gpu/drm/i915/display/i9xx_wm.c        |   2 +-
>  .../gpu/drm/i915/display/intel_backlight.c    |   9 +-
>  drivers/gpu/drm/i915/display/intel_bios.c     |   6 +-
>  drivers/gpu/drm/i915/display/intel_crt.c      |   6 +-
>  drivers/gpu/drm/i915/display/intel_display.h  |   8 +-
>  .../gpu/drm/i915/display/intel_display_core.h |   2 +
>  .../drm/i915/display/intel_display_debugfs.c  |   2 +
>  .../display/intel_display_debugfs_params.c    | 176 ++++++++++++++
>  .../display/intel_display_debugfs_params.h    |  13 ++
>  .../drm/i915/display/intel_display_device.c   |  52 ++++-
>  .../drm/i915/display/intel_display_device.h   |   2 +
>  .../drm/i915/display/intel_display_params.c   | 217 ++++++++++++++++++
>  .../drm/i915/display/intel_display_params.h   |  61 +++++
>  .../drm/i915/display/intel_display_power.c    |  14 +-
>  .../drm/i915/display/intel_display_reset.c    |   2 +-
>  drivers/gpu/drm/i915/display/intel_dp.c       |   8 +-
>  .../drm/i915/display/intel_dp_aux_backlight.c |   4 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   2 +-
>  drivers/gpu/drm/i915/display/intel_dpt.c      |   6 +-
>  drivers/gpu/drm/i915/display/intel_dvo.c      |   2 +-
>  drivers/gpu/drm/i915/display/intel_fb.c       |   2 +-
>  drivers/gpu/drm/i915/display/intel_fbc.c      |  10 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |   2 +-
>  drivers/gpu/drm/i915/display/intel_hotplug.c  |   2 +-
>  drivers/gpu/drm/i915/display/intel_lvds.c     |   4 +-
>  drivers/gpu/drm/i915/display/intel_opregion.c |   2 +-
>  drivers/gpu/drm/i915/display/intel_panel.c    |   6 +-
>  drivers/gpu/drm/i915/display/intel_psr.c      |  14 +-
>  drivers/gpu/drm/i915/display/intel_sdvo.c     |   2 +-
>  drivers/gpu/drm/i915/display/intel_tv.c       |   2 +-
>  .../drm/i915/display/skl_universal_plane.c    |   2 +-
>  drivers/gpu/drm/i915/display/skl_watermark.c  |   5 +-
>  drivers/gpu/drm/i915/i915_debugfs.c           |   3 +
>  drivers/gpu/drm/i915/i915_driver.c            |   3 +
>  drivers/gpu/drm/i915/i915_drv.h               |   6 -
>  drivers/gpu/drm/i915/i915_gpu_error.c         |   3 +
>  drivers/gpu/drm/i915/i915_gpu_error.h         |   2 +
>  drivers/gpu/drm/i915/i915_params.c            |  89 -------
>  drivers/gpu/drm/i915/i915_params.h            |  22 --
>  drivers/gpu/drm/i915/intel_device_info.c      |  22 --
>  drivers/gpu/drm/xe/Makefile                   |   2 +
>  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   2 +
>  drivers/gpu/drm/xe/xe_device_types.h          |  22 --
>  drivers/gpu/drm/xe/xe_display.c               |  15 +-
>  46 files changed, 605 insertions(+), 239 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_debugfs_pa=
rams.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_debugfs_pa=
rams.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_params.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_params.h

--=20
Jani Nikula, Intel
