Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD64C61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 06:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0000F10E54C;
	Fri,  4 Sep 2026 06:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L9BlFXvK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8D510E54C;
 Fri,  4 Sep 2026 06:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788503421; x=1820039421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tTTxWOFq2RV2xE2uYsVhOPHa+Yg11FqFKDpqrdIT2qo=;
 b=L9BlFXvKCLNuuFtvLcz3AKa/it/1NtCtnSCHgnkdI+gAfKJKvYykUAnW
 kxNEULquP4w7tcWrouXLO9X2foSK3Pg2WwS+RDD8jMoDSciJUWXhk6DqC
 QkpN60SnfiXJPGeXAGnTP3+avd9KqIqGf4fuOoC0IkT6KOtdM1yN+fNci
 xUtXUUgt6UMAbQExEblFsQnvgwCVB5anLX++dILIr7CrovISWBY20OawJ
 zCig3bdv36ieCbEUofzrvdWEx8SuWo6oY2y0nkAJffUfMLB/oIRPwqbtv
 x7tu0qVk+hXhRmdw/X/bEAug7Fs3Fn5/79D/uNpMIojXj+kK3+DZ+lUa/ g==;
X-CSE-ConnectionGUID: NehsnqvDRk2ezN3F9Ndzvw==
X-CSE-MsgGUID: ynNu7rBiTVymztkLoQ7Z4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88763528"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="88763528"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 23:30:21 -0700
X-CSE-ConnectionGUID: ZPOu+iABQ1GkgRVBlFv3Xw==
X-CSE-MsgGUID: 7B8osUGxT2OR8Lg8wfSqog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="265608012"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa006.fm.intel.com with ESMTP; 03 Sep 2026 23:30:19 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH] drm/i915/display: Limit SEL_FETCH clear to supported pipes
Date: Fri,  4 Sep 2026 11:57:44 +0530
Message-Id: <20260904062744.3010375-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

Commit 7f1172a2ac0d ("drm/i915/display: Clear SEL_FETCH_PLANE_CTL
on plane disable") started clearing SEL_FETCH_PLANE_CTL and
SEL_FETCH_CUR_CTL on every plane and cursor disable.

Not all pipes implement these registers. Clearing them on a pipe
that does not have them leads to an unclaimed register access.

Skip the clear on pipes that do not implement the registers.

Fixes: 7f1172a2ac0d ("drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane disable")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16876
Assisted-by: GitHub-Copilot:claude-opus-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c        | 4 ++++
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 86bb96ac449b..3c06d5482691 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -544,6 +544,10 @@ static void i9xx_cursor_disable_sel_fetch_arm(struct intel_dsb *dsb,
 	if (!HAS_PSR2_SEL_FETCH(display))
 		return;
 
+	/* Display ver 12 only instantiates these registers for pipe A */
+	if (DISPLAY_VER(display) == 12 && pipe != PIPE_A)
+		return;
+
 	intel_de_write_dsb(display, dsb, SEL_FETCH_CUR_CTL(pipe), 0);
 }
 
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 5cda1ab90e40..252df30debc9 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -893,6 +893,10 @@ static void icl_plane_disable_sel_fetch_arm(struct intel_dsb *dsb,
 	if (!HAS_PSR2_SEL_FETCH(display))
 		return;
 
+	/* Display ver 12 only instantiates these registers for pipe A */
+	if (DISPLAY_VER(display) == 12 && pipe != PIPE_A)
+		return;
+
 	intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe, plane->id), 0);
 }
 
-- 
2.25.1

