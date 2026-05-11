Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B1BCD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 21:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AF410E8F7;
	Mon, 11 May 2026 21:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYDFittw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81BC10E8EF;
 Mon, 11 May 2026 21:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778535724; x=1810071724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nsarxqYB0Yxt7W83AvNh53eZQUq+WzCG9d//n4Q28tE=;
 b=GYDFittwpwuyFxgacj/cIOJIsqMGxwTmSQOG1BloT937T6asZkKlemYc
 hb7YqFFTabFb1bQ2moDiBAJ91wB5wAdmlsr6SD0KtOEHhItAXiqb43Ekw
 bQZm2vfyg3goP328vrsDIINGxDmnPaitD6asKtYB3tHWWoe/+zZz4+k10
 WmKuSq7bpAx6ioe5kUY1cwGrkx0/47VvEAlpaMrnbwQMi1rvDrCOvhb3F
 a5vOAELqmszdgHcGhGyzySLL9MaQhwQJ0KaGBrdbXRXjghExNQ7iIfH9F
 WzvjMp07yg152mb2yooPmSNJDeXSGIhRkiSTmJcr2iUDkEXEmoSZvkGSS g==;
X-CSE-ConnectionGUID: S7RRKo6mTzaH6b5Myoq0JA==
X-CSE-MsgGUID: 3rVcuRgsRZirOSdS7nmoUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90816884"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90816884"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 14:42:04 -0700
X-CSE-ConnectionGUID: EPkZbFBXTMCNrvkYKtrzlA==
X-CSE-MsgGUID: MM2UzseBQImGuGg6BlGATg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="275702919"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 14:42:02 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 09/14] drm/xe: Abstract the initial FB PTE checks a bit
Date: Tue, 12 May 2026 00:41:17 +0300
Message-ID: <20260511214122.8468-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260511214122.8468-1-ville.syrjala@linux.intel.com>
References: <20260511214122.8468-1-ville.syrjala@linux.intel.com>
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

Add a few helpers that allow us to abstract the xe initial FB PTE
check a bit. Still very ad-hoc compared to the nicely abstracted
i915 counterpart, but whatever.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index b7e0685351bb..0dabc5709d01 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -18,8 +18,19 @@
 #include "xe_fb_pin.h"
 #include "xe_ggtt.h"
 #include "xe_mmio.h"
+#include "xe_ttm_stolen_mgr.h"
 #include "xe_vram_types.h"
 
+static bool is_pte_local(u64 pte)
+{
+	return pte & XE_GGTT_PTE_DM;
+}
+
+static bool need_pte_local(struct xe_device *xe)
+{
+	return IS_DGFX(xe);
+}
+
 static struct xe_bo *
 initial_plane_bo(struct xe_device *xe,
 		 struct intel_initial_plane_config *plane_config)
@@ -43,13 +54,13 @@ initial_plane_bo(struct xe_device *xe,
 	if (IS_DGFX(xe)) {
 		u64 pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
 
-		if (!(pte & XE_GGTT_PTE_DM)) {
-			drm_err(&xe->drm,
-				"Initial plane programming missing DM bit\n");
+		if (is_pte_local(pte) != need_pte_local(xe)) {
+			drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
 			return NULL;
 		}
 
 		phys_base = pte & ~(page_size - 1);
+
 		flags |= XE_BO_FLAG_VRAM0;
 
 		/*
-- 
2.52.0

