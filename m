Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8CBEDE98C
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 08:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197F810E25D;
	Thu, 14 Sep 2023 08:17:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5487610E25D
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 08:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694679463; x=1726215463;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WUcWhTAmVJdTh24rI4hNr9ytiXDqxbn4lraeUnf5URE=;
 b=UtZJV77NJlI7ZIDyNYvHs0lQAFi0AnRsBksgwlgskbo8VZPb7K90jGtr
 RIEG6swMzQ/3At+FzX/K4rSLvOmr7mhxTDEwo5EimQng90AzdRlT77xEJ
 eOtbBzDn9b1EK/SHsMJRAsxFRUOPnH7dbC8G8crhm7UVYIjlz55K8BNMu
 pR+ojzszonE6wBKc2qMXBQCnRULE9yiSaXbza6VXGT1s7dIB+CJaVVQcy
 3w5ARIWXn+/evTtjRg2p/r+W35GqTN/nNyJ+u3eY/5bjC3wk5Ptqt6beu
 ZgUSklkUqNVvBtSpD2b9hBkZIHbbysbwkN//FluHEUrmhYsAibOde0sDI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="363926240"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="363926240"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 01:17:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773807639"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="773807639"
Received: from haslam-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 01:17:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230913231411.291933-8-matthew.d.roper@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230913231411.291933-8-matthew.d.roper@intel.com>
Date: Thu, 14 Sep 2023 11:17:38 +0300
Message-ID: <87jzstw4m5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 0/6] Separate display and tile workarounds
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 13 Sep 2023, Matt Roper <matthew.d.roper@intel.com> wrote:
> i915's "clock gating" hooks were historically a bit of a dumping ground
> for assorted register programming (some of which wasn't actually related
> to clock gating in any way).  i915 has now moved display workarounds to
> their own area within the display-specific code, so cherry-picking those
> patches into the Xe kernel will ensure that the same display workarounds
> are applied automatically during Xe's display init.
>
> With display workarounds taken care of by the i915 cherry-picks, the
> remaining "clock gating" programming that Xe needs is more accurately
> described as "tile workarounds," i.e., workarounds that target
> sgunit/soc registers outside of the GTs and the display.  Such
> workarounds are very rare and if we disregard pre-production
> workarounds, there's only a single tile workaround needed on Xe today.
> Adding proper programming for tile workarounds to Xe and moving
> Wa_22010954014 to that new area allows us to drop
> ext/intel_clock_gating.c.

\o/

Acked-by: Jani Nikula <jani.nikula@intel.com>



>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>
> Matt Roper (6):
>   drm/i915: Stop forcing clock gating init for future platforms
>   drm/i915/adlp: Stop calling gen12lp_init_clock_gating()
>   drm/i915/display: Extract display workarounds from clock gating init
>   drm/i915/display: Apply workarounds during display init
>   drm/xe/wa: Apply tile workarounds at probe/resume
>   fixup! drm/xe/display: Implement display support
>
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  .../drm/i915/display/intel_display_driver.c   |   3 +
>  .../gpu/drm/i915/display/intel_display_wa.c   |  48 +++++++
>  .../gpu/drm/i915/display/intel_display_wa.h   |  13 ++
>  drivers/gpu/drm/i915/intel_clock_gating.c     |  52 +-------
>  drivers/gpu/drm/xe/Makefile                   |   4 +-
>  .../drm/xe/display/ext/intel_clock_gating.c   | 124 ------------------
>  drivers/gpu/drm/xe/regs/xe_regs.h             |   3 +
>  drivers/gpu/drm/xe/xe_display.c               |   2 -
>  drivers/gpu/drm/xe/xe_pm.c                    |   5 +
>  drivers/gpu/drm/xe/xe_tile.c                  |   3 +
>  drivers/gpu/drm/xe/xe_wa.c                    |  20 +++
>  drivers/gpu/drm/xe/xe_wa.h                    |   2 +
>  drivers/gpu/drm/xe/xe_wa_oob.rules            |   1 +
>  14 files changed, 103 insertions(+), 178 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_wa.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_wa.h
>  delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_clock_gating.c

-- 
Jani Nikula, Intel
