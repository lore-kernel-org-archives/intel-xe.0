Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194D8F428EC
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 21:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDC510E758;
	Wed, 15 Apr 2026 21:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dn4V7IuK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0A610E758;
 Wed, 15 Apr 2026 21:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776287078; x=1807823078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nFF+YT8G4d5ofUKL+n32oiFve/DWJGPgt+ca1e9axT8=;
 b=Dn4V7IuKqFL0a5OHbMEfcfAzSa6RsCIvE3P9mBRZQNQDq8YwXKzou6Rp
 iX9PnBgo7Q/LcHudw+H5vELp1JbLG4AQUuvf75Q7eKl95V0Uxqkp1WHpq
 xGPTaeP7JmuU/nNUiNzSQydokA/4tw8FU8xqyvclT/RlOvIpiVE6T4G3V
 cRoLSrylOi/ErzECjLlmBGNVzWLQ1TrJl+G4/RXEDwJC3uLTM1qrnju7R
 GWsvuJdr/0XXv1HHx9WuAzoX1DAqXOMLp9XvnV/QGWA/iuCja3EzxHJzd
 1hFGrx/RWBzCViY05C3YZKdNiz1lp+XuJpNOTA7T6rpKS6PPdRKdQ9Vbo Q==;
X-CSE-ConnectionGUID: eKi6Ob0rSaOpsuzZ3v/mvg==
X-CSE-MsgGUID: zvPvJd3YTlSKYEj/qCQOxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="99926301"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="99926301"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 14:04:38 -0700
X-CSE-ConnectionGUID: HZ/zqShyQ+GUQ6lbd825hg==
X-CSE-MsgGUID: 0dBDVduiSrSO7VvSWBX2pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="234561905"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.108])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 14:04:38 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3 5/7] drm/xe/display: Add init_clock_gating.h stubs
Date: Thu, 16 Apr 2026 00:04:09 +0300
Message-ID: <20260415210411.24750-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260415210411.24750-1-ville.syrjala@linux.intel.com>
References: <20260415210411.24750-1-ville.syrjala@linux.intel.com>
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

