Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492A7C5CFEE
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 09:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E378910EF36;
	Wed, 12 Aug 2026 09:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ev1rnlWy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782FF10EF36;
 Wed, 12 Aug 2026 09:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786528146; x=1818064146;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fyGa/NyyelrVJpDXAJxEQCxk8Rb6sBKRcchkmoF20Mk=;
 b=Ev1rnlWyjPRUZ5qVnFv6HUBle7AkHVdgOoCf8sYANlyVrDRPEdFNOUQP
 Ujzx/DPHwq9Vkqc3Pguhkx9YFf8Cb8bZ7UcDStOURPB19CrjLLJ5acxCb
 FEMo51GXhJC5YMi6cPmxKrzkq7HGEkw1bDCxbEOhjRKo8j35V3ZY8gZ2Z
 SjTWNrzxeCmnAXUXYzr4l3WT8VPAC0W8tMOcFV7cahzc8mPkds6eQMYHj
 Nc4m0Y8bzfcc8dVtLEfAqatYAI4APht6AgIy4WmXVZ1GTtmgr0cD4CJth
 T3eG+l2WaQEdStEwbXNllJ397owzMxikVBatXZMB7WN9uG3kkNdKSWfYu Q==;
X-CSE-ConnectionGUID: QDbBasVPRYaa+fqFR28nxg==
X-CSE-MsgGUID: TMaf0uYUQqu2l85U+axZgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87098015"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="87098015"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:49:06 -0700
X-CSE-ConnectionGUID: 2Lyx3a6gTgWybHqjZqM0jg==
X-CSE-MsgGUID: HgVKjYLzRRKu6Bc3Z56F+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="267094276"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa003.jf.intel.com with ESMTP; 12 Aug 2026 02:49:05 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH] drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane disable
Date: Wed, 12 Aug 2026 15:15:47 +0530
Message-Id: <20260812094547.1808459-1-nemesa.garg@intel.com>
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

icl_plane_disable_sel_fetch_arm() wrote SEL_FETCH_PLANE_CTL = 0 only when
crtc_state->enable_psr2_sel_fetch was set.  If a plane was disabled after
selective fetch had been turned off, the guard fired early and left the
register's enable bit set in hardware.

The bit is harmless until selective fetch is re-enabled.  When it is, the
hardware resumes fetching for the now-disabled plane and keeps its old DDB
range reserved.

Fixes: b1f5279b5981 ("drm/i915/psr: Move plane sel fetch configuration into plane source files")
Closes:https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8739
Assisted-by: GitHub-Copilot:claude-opus-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 07a683293352..afc1df1b84a4 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -885,7 +885,13 @@ static void icl_plane_disable_sel_fetch_arm(struct intel_dsb *dsb,
 	struct intel_display *display = to_intel_display(plane);
 	enum pipe pipe = plane->pipe;
 
-	if (!crtc_state->enable_psr2_sel_fetch)
+	/*
+	 * Clear this whenever the hardware has selective fetch, not just when
+	 * the current state uses it. The plane may have been enabled with
+	 * selective fetch earlier and had its enable bit orphaned when the
+	 * feature was switched off.
+	 */
+	if (!HAS_PSR2_SEL_FETCH(display))
 		return;
 
 	intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe, plane->id), 0);
-- 
2.25.1

