Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF96DF9D0D1
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 14:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7433810E5AF;
	Tue, 14 Apr 2026 14:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2VbuY4u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8376510E278;
 Tue, 14 Apr 2026 14:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776176589; x=1807712589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nFF+YT8G4d5ofUKL+n32oiFve/DWJGPgt+ca1e9axT8=;
 b=F2VbuY4u1V8v1jqHGg3NGYb/DRJrQPjNotKB+Dn5TbcZdCpveX4rPIhv
 puBSuGhZVPsxPStMaeVubpDU2I5J7gRGSNyi5VGZU9azSf1KkoRbbkjcN
 WwErtVlQK2Wotj/LZ3Q7ZaO3f7ccLupdXSrA9uyEKxy709/lKPhquJ6UJ
 0edQXaCwXmlMAlH1pBuiskClBNEL4Rj4F8N1TzKoHl8cr87jm0pWiXy62
 118E7K7wqOorGgpT6p37pPsnq+YRAH9acChRCnwSZ+R5XSNuSIjMGU383
 EovcYRUVa9i6NcKyc+VLWHKGeFDzwktJuOhQrRGpEbJmHQd5rRjqeqjNl Q==;
X-CSE-ConnectionGUID: JOwfoPA4QR6jcKcjYFxU1g==
X-CSE-MsgGUID: JIihQZTySjC3lwbat/XOfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76297598"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="76297598"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 07:23:08 -0700
X-CSE-ConnectionGUID: BfBUnUVrRXO9wcDo2xFALQ==
X-CSE-MsgGUID: ST11tRUcQ9SkJ8ejBClIUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234149876"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 07:23:07 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 3/5] drm/xe/display: Add init_clock_gating.h stubs
Date: Tue, 14 Apr 2026 17:22:45 +0300
Message-ID: <20260414142247.651-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260414142247.651-1-ville.syrjala@linux.intel.com>
References: <20260414142247.651-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add static inline stubs for init_clock_gating.h functions
so that we don't need ifdefs in the actual code. We already
have one in intel_display_power.c, and now I need to bring
over intel_display_reset.c.

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c     |  2 --
 .../drm/xe/compat-i915-headers/intel_clock_gating.h    | 10 +++++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 8a7afe2a94bc..80ecf373fb19 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -1420,9 +1420,7 @@ static void hsw_disable_pc8(struct intel_display *display)
 	intel_init_pch_refclk(display);
 
 	/* Many display registers don't survive PC8+ */
-#ifdef I915 /* FIXME */
 	intel_clock_gating_init(display->drm);
-#endif
 }
 
 static void intel_pch_reset_handshake(struct intel_display *display,
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
index ce986f0e8f38..552975a30ba2 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
@@ -3,4 +3,12 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#include "../../i915/intel_clock_gating.h"
+#ifndef __INTEL_CLOCK_GATING_H__
+#define __INTEL_CLOCK_GATING_H__
+
+struct drm_device;
+
+static inline void intel_clock_gating_init(struct drm_device *drm) {}
+static inline void intel_clock_gating_hooks_init(struct drm_device *drm) {}
+
+#endif /* __INTEL_CLOCK_GATING_H__ */
-- 
2.52.0

