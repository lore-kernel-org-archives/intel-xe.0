Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9946C6FA8E
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 15:46:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741E110E108;
	Thu,  2 Mar 2023 15:46:23 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E761F10E108
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 15:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677771981; x=1709307981;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=joJsSYBvNoSopVg6x6tdY5uw6bDgC6H+f2wgPMWrrR4=;
 b=OqeNcAKKNtfeFRDraqjJ+4AaSZT3rU0I9uMViQqsMawiyZndPaAxmFcc
 e0avK1Eq+QrFe5zD8gQEXZLjrg8iUHxN1erVgi8WFyssW8aCaLfJkdl2E
 qRasQFNcjM4bKAN9nogBPIv0swZa9EUhb1ZGR0++ipfLl6zn8/6SNtuJo
 jHak2LHZgXP7VofVY84lR87rwztwBBxNckJ9F1/yYl6/ZQ85PL8GnzrDS
 v7+fUvW41dKfmu2sKKhKFC1jtXtV6SXEbDSA9xniZsFV6O8+mTGN7p5bG
 TccDk4iRCOTPNi/1NtyubfXX0cnMyn64ymicemSGfAVxWg2QYsY3IAk7e A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="362348169"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="362348169"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 07:46:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="624998464"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="624998464"
Received: from martamon-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.129])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 07:46:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <20230302152837.5lpnbzwciupdbkoa@ldmartin-desk2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230302141230.2804699-1-jani.nikula@intel.com>
 <20230302141230.2804699-2-jani.nikula@intel.com>
 <20230302152837.5lpnbzwciupdbkoa@ldmartin-desk2.lan>
Date: Thu, 02 Mar 2023 17:45:57 +0200
Message-ID: <87ilfjupfu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/8] drm/i915/display: don't use relative
 ../i915 includes
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

On Thu, 02 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Thu, Mar 02, 2023 at 04:12:23PM +0200, Jani Nikula wrote:
>>We can't have this in upstream i915, so don't try that here either.
>>
>>Note: This should be squashed to the commit adding the relative
>>includes.
>
> is this a requirement?  I think squashing this is not very problematic,
> but it may not work as the build infra with the different -I also
> changes in the tree.
>
> I'm also wondering why we have these changes at all in the xe side. Was
> it maybe a temporary solution not needed anymore due to the -I added to
> the build system?
>
> Another idea would be not to squash it now, but only at the end
> with all the i915 changes together.

Basically we don't want to have the back and forth when submitting xe.

BR,
Jani.


>
>>
>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> thanks
> Lucas De Marchi
>
>>---
>> drivers/gpu/drm/i915/display/intel_backlight.c     | 2 +-
>> drivers/gpu/drm/i915/display/intel_bw.c            | 2 +-
>> drivers/gpu/drm/i915/display/intel_cdclk.c         | 4 ++--
>> drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
>> drivers/gpu/drm/i915/display/intel_gmbus.c         | 2 +-
>> drivers/gpu/drm/i915/display/intel_opregion.c      | 2 +-
>> drivers/gpu/drm/i915/display/skl_watermark.c       | 2 +-
>> 7 files changed, 8 insertions(+), 8 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
>>index e63eb43622e0..5b7da72c95b8 100644
>>--- a/drivers/gpu/drm/i915/display/intel_backlight.c
>>+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
>>@@ -19,7 +19,7 @@
>> #include "intel_dp_aux_backlight.h"
>> #include "intel_dsi_dcs_backlight.h"
>> #include "intel_panel.h"
>>-#include "../i915/intel_pci_config.h"
>>+#include "intel_pci_config.h"
>> #include "intel_pps.h"
>> #include "intel_quirks.h"
>>
>>diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
>>index 67b4e947589c..54e03a3eaa0f 100644
>>--- a/drivers/gpu/drm/i915/display/intel_bw.c
>>+++ b/drivers/gpu/drm/i915/display/intel_bw.c
>>@@ -15,7 +15,7 @@
>> #include "intel_display_core.h"
>> #include "intel_display_types.h"
>> #include "skl_watermark.h"
>>-#include "../i915/intel_mchbar_regs.h"
>>+#include "intel_mchbar_regs.h"
>>
>> /* Parameters for Qclk Geyserville (QGV) */
>> struct intel_qgv_point {
>>diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
>>index 3b6a37403f25..ecb87542ebb6 100644
>>--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
>>+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
>>@@ -32,8 +32,8 @@
>> #include "intel_crtc.h"
>> #include "intel_de.h"
>> #include "intel_display_types.h"
>>-#include "../i915/intel_mchbar_regs.h"
>>-#include "../i915/intel_pci_config.h"
>>+#include "intel_mchbar_regs.h"
>>+#include "intel_pci_config.h"
>> #include "intel_psr.h"
>>
>> #ifdef I915
>>diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
>>index 00e32a423708..3315d2bbebc7 100644
>>--- a/drivers/gpu/drm/i915/display/intel_display_power.c
>>+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
>>@@ -16,7 +16,7 @@
>> #include "intel_display_power_well.h"
>> #include "intel_display_types.h"
>> #include "intel_dmc.h"
>>-#include "../i915/intel_mchbar_regs.h"
>>+#include "intel_mchbar_regs.h"
>> #include "intel_pch_refclk.h"
>> #include "intel_snps_phy.h"
>> #include "skl_watermark.h"
>>diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
>>index 2d099f4c52cd..0bc4f6b48e80 100644
>>--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
>>+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
>>@@ -39,7 +39,7 @@
>> #include "intel_de.h"
>> #include "intel_display_types.h"
>> #include "intel_gmbus.h"
>>-#include "../i915/display/intel_gmbus_regs.h"
>>+#include "intel_gmbus_regs.h"
>>
>> struct intel_gmbus {
>> 	struct i2c_adapter adapter;
>>diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
>>index 057a68237efe..e0184745632c 100644
>>--- a/drivers/gpu/drm/i915/display/intel_opregion.c
>>+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
>>@@ -37,7 +37,7 @@
>> #include "intel_backlight.h"
>> #include "intel_display_types.h"
>> #include "intel_opregion.h"
>>-#include "../i915/intel_pci_config.h"
>>+#include "intel_pci_config.h"
>>
>> #define OPREGION_HEADER_OFFSET 0
>> #define OPREGION_ACPI_OFFSET   0x100
>>diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
>>index 381d4f75e7c8..e254fb21b47f 100644
>>--- a/drivers/gpu/drm/i915/display/skl_watermark.c
>>+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
>>@@ -16,7 +16,7 @@
>> #include "skl_watermark.h"
>>
>> #include "i915_drv.h"
>>-#include "../i915/i915_fixed.h"
>>+#include "i915_fixed.h"
>> #include "i915_reg.h"
>> #include "intel_pm.h"
>>
>>-- 
>>2.39.1
>>

-- 
Jani Nikula, Intel Open Source Graphics Center
