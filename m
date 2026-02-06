Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AF3EE2084
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 12:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D87010E76E;
	Fri,  6 Feb 2026 12:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3+MiTm1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E9310E76E;
 Fri,  6 Feb 2026 12:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770380050; x=1801916050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NNNSajEvGg2pubf8DAPXz6YMAQl7CSKztCiI5qUmaEY=;
 b=m3+MiTm1y59Ttrq1P8H3FGorCnkaMPC2OnCnUhDifSWEL5e4lep/bFSE
 fAbyRj/qG9uNJyVDG+f4eJhfSPfxGNnlhlm9LUPsETu7wsJpifzppEVA+
 g0EHOmX10wZxJdJBTDsxec9GfsDYNygd4sp2GIBiKl74QDdj4m2/+YGZN
 pbVkoTBpc1JLJn8mEXfAg65d3LlFKoE68tkhZOGfja3b0Cd0TXc7LmcC+
 rzEkzMeOaIHgu7tVjAE+h+YNqI7hvb+Ow3dgvKPza2Xdyb50s09O+cFdu
 T7zd/kBD2EZJGHxz2wJhlPm8CpK54EfqqEP/s0iwNx/QjvdiEouJ89esK g==;
X-CSE-ConnectionGUID: abNmUnvERQeAj173Bz7d4Q==
X-CSE-MsgGUID: H98YG05nQvWlN4zkcI6WjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82220481"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="82220481"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 04:14:09 -0800
X-CSE-ConnectionGUID: dm0RUC6ySO6YtRQV5I0XPA==
X-CSE-MsgGUID: 2KPn4dtcQBuccCitnaGnWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="215027789"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 04:14:08 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 07/10] drm/i915/dpt: switch to i915 runtime pm calls
Date: Fri,  6 Feb 2026 14:13:28 +0200
Message-ID: <b44d3f8dcf9f3bcbeae2f1152f26a3c806da6e75.1770379986.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770379986.git.jani.nikula@intel.com>
References: <cover.1770379986.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
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

The i915 specific code doesn't need to, and should not, call the display
runtime pm functions. Just call the i915 functions directly.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_dpt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_dpt.c b/drivers/gpu/drm/i915/i915_dpt.c
index 597890649285..5669cefd0fe7 100644
--- a/drivers/gpu/drm/i915/i915_dpt.c
+++ b/drivers/gpu/drm/i915/i915_dpt.c
@@ -7,7 +7,6 @@
 #include <drm/intel/display_parent_interface.h>
 
 #include "display/intel_display_core.h"
-#include "display/intel_display_rpm.h"
 #include "gem/i915_gem_domain.h"
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_lmem.h"
@@ -138,7 +137,7 @@ struct i915_vma *intel_dpt_pin_to_ggtt(struct i915_address_space *vm,
 	if (i915_gem_object_is_stolen(dpt->obj))
 		pin_flags |= PIN_MAPPABLE;
 
-	wakeref = intel_display_rpm_get(display);
+	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
 	atomic_inc(&display->restore.pending_fb_pin);
 
 	for_i915_gem_ww(&ww, err, true) {
@@ -170,7 +169,7 @@ struct i915_vma *intel_dpt_pin_to_ggtt(struct i915_address_space *vm,
 	dpt->obj->mm.dirty = true;
 
 	atomic_dec(&display->restore.pending_fb_pin);
-	intel_display_rpm_put(display, wakeref);
+	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
 
 	return err ? ERR_PTR(err) : vma;
 }
-- 
2.47.3

