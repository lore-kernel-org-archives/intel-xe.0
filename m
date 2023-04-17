Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEDFC77B70
	for <intel-xe@archiver.kernel.org>; Mon, 17 Apr 2023 10:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6340010E04D;
	Mon, 17 Apr 2023 10:53:31 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE3E10E04D
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Apr 2023 10:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681728809; x=1713264809;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=fpZ4lM8CjWq+E8CImmMJCdo3VxAFWaA+PxA37hnVvBg=;
 b=Wveql2xr3D+MtglrPX3bLw7orBKcZ22197aRtHfu1ytOyndXNUIn2ZSF
 eQh6g2agD75sZ/j93xdWZOGnBdphcFO6MPPpWlhw1S3BZW8/YJpTx+ON4
 NiCLBOr7pWeQt/q4Js6+pv6IDSpdJ9/vtD6HMl7zKRxHUEukLXAvmGpXW
 ShhobkJywpe0hokFGL/iUhMpodDDWM4dA9WRGlEfCm7Er/6ARkC3jEeOu
 u+5VC/sVsPtNDrZBWIlEr8ivCxOZwacL1Ko2bVfNxB5tR5vNn4df0YEDx
 /CMDRNoofVtFJccd67kXIIou0L6LwV725/5l8rKFNcQ9f8HO7bk6i9j6y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="346707079"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="346707079"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 03:53:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="640918126"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="640918126"
Received: from habramov-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.252.47.83])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 03:53:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <20230412181622.ulh6apdxumv3mxfy@ldmartin-desk2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230412142006.877109-1-jani.nikula@intel.com>
 <20230412181622.ulh6apdxumv3mxfy@ldmartin-desk2.lan>
Date: Mon, 17 Apr 2023 13:53:23 +0300
Message-ID: <87edoieq58.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 00/41] xe & i915 display integration ifdef
 cleanups, part 2
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 12 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Wed, Apr 12, 2023 at 05:19:25PM +0300, Jani Nikula wrote:
>>This continues the ifdef cleanups [1].
>>
>>BR,
>>Jani.
>
> I went  through each commit and it all seems reasonable to me and good
> riddance of the ifdefs. I left a comment in just one of the patches that
> we may need to re-think, but it's not a blocker.
>
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks, pushed to drm-xe-next.

BR,
Jani.

>
> thanks
> Lucas De Marchi
>
>>
>>[1] https://lore.kernel.org/r/20230405153920.926583-1-jani.nikula@intel.com
>>
>>Jani Nikula (41):
>>  drm/i915/display: add I915 conditional build to g4x_dp.h
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  drm/i915/display: add I915 conditional build to intel_dpio_phy.h
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/xe/display: Implement display support
>>  fixup! drm/xe/display: Implement display support
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/xe/display: Implement display support
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  drm/i915/display: add I915 conditional build to intel_crt.h
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  drm/i915/display: add I915 conditional build to vlv_dsi.h
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/xe/display: Implement display support
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/xe/display: Implement display support
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/xe/display: Implement display support
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/xe/display: Implement display support
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/i915/display: Remove all uncore mmio accesses in favor of
>>    intel_de
>>  drm/i915/display: remove unnecessary i915_debugfs.h includes
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/xe/display: Implement display support
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/xe/display: Implement display support
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>  fixup! drm/i915/display: Remaining changes to make xe compile
>>
>> drivers/gpu/drm/i915/display/g4x_dp.h         |  26 ++++
>> .../gpu/drm/i915/display/intel_atomic_plane.c |   5 +-
>> drivers/gpu/drm/i915/display/intel_cdclk.c    |  15 --
>> drivers/gpu/drm/i915/display/intel_crt.h      |  14 ++
>> drivers/gpu/drm/i915/display/intel_crtc.c     |   4 -
>> drivers/gpu/drm/i915/display/intel_display.c  |  55 ++------
>> .../gpu/drm/i915/display/intel_display_core.h |   4 -
>> .../drm/i915/display/intel_display_debugfs.c  |   9 +-
>> .../drm/i915/display/intel_display_power.c    |  10 --
>> .../i915/display/intel_display_power_map.c    |   8 --
>> .../i915/display/intel_display_power_well.c   |  17 +--
>> .../drm/i915/display/intel_display_trace.h    |   2 -
>> .../drm/i915/display/intel_display_types.h    |   9 +-
>> drivers/gpu/drm/i915/display/intel_dp.c       |  10 --
>> drivers/gpu/drm/i915/display/intel_dp_aux.c   |   4 -
>> drivers/gpu/drm/i915/display/intel_dpio_phy.h | 104 ++++++++++++--
>> drivers/gpu/drm/i915/display/intel_dpll.c     |   7 -
>> drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   4 -
>> drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  20 +--
>> drivers/gpu/drm/i915/display/intel_fbc.c      |   3 +-
>> drivers/gpu/drm/i915/display/intel_pps.c      |  13 +-
>> drivers/gpu/drm/i915/display/intel_sprite.c   |   4 -
>> drivers/gpu/drm/i915/display/skl_scaler.c     |   2 -
>> .../drm/i915/display/skl_universal_plane.c    |  30 +---
>> drivers/gpu/drm/i915/display/vlv_dsi.h        |  13 ++
>> .../drm/xe/compat-i915-headers/i915_debugfs.h |  14 ++
>> .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   4 -
>> .../drm/xe/compat-i915-headers/i915_trace.h   |   6 +
>> .../drm/xe/compat-i915-headers/i915_vgpu.h    |  44 ++++++
>> .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   1 +
>> .../drm/xe/compat-i915-headers/vlv_sideband.h | 132 ++++++++++++++++++
>> .../xe/compat-i915-headers/vlv_sideband_reg.h |   1 +
>> drivers/gpu/drm/xe/display/ext/i915_irq.h     |   8 +-
>> drivers/gpu/drm/xe/xe_device_types.h          |   6 +
>> 34 files changed, 383 insertions(+), 225 deletions(-)
>> create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_debugfs.h
>> create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_trace.h
>> create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h
>> create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband.h
>> create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h
>>
>>-- 
>>2.39.2
>>

-- 
Jani Nikula, Intel Open Source Graphics Center
