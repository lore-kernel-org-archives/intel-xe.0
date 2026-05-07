Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED15CD3442
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 16:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8501910E598;
	Thu,  7 May 2026 16:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xdw/Inhj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7353A10E299;
 Thu,  7 May 2026 16:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778172357; x=1809708357;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9fxCYMgC1JMR7siARxbn13JLvR+mCO3pGX0rRdBE8+A=;
 b=Xdw/InhjFrMckJorznYf7lvb7PfipGhgUtINhi5CvquRfc9zeMxMQmNN
 5QHcrv3wZ+V4MiBQpd1HBYPhFx7qDgpge4QcyngYkkrcX/pdGf+DGAJb5
 QAkR76+yT6leC8Q3zd9WEyLRdGQgImnmRXcxCJyYMAh91w3BqgbQrrqlt
 q1K/xDlWOHuE4sX1ykMilA+XdZMLp0HKgVWvw7yID30hKZhirMNSBvmY/
 0gumxgKNor7M0q5Nzm7SWEzgvcZyUow4oyVxJityT5wK/f6HZcF9AGekZ
 5D0xyc89/DodR/STAHnrXGZ2MVI6JQmMcK2vT/gQeaBd0CXn6egA5qSER g==;
X-CSE-ConnectionGUID: 0248NAxoRpmpMakjsuCN1A==
X-CSE-MsgGUID: krdqbxTzRxKqIVt9Zstgbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="104590320"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="104590320"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:45:57 -0700
X-CSE-ConnectionGUID: lfOXXFamS+69UYZlLtnGOQ==
X-CSE-MsgGUID: roV1aWMASdmgKZs0TOYhFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="240849211"
Received: from nex-dev-jx.fm.intel.com ([10.105.128.1])
 by orviesa004.jf.intel.com with ESMTP; 07 May 2026 09:45:57 -0700
From: James Xiong <james.xiong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com, jani.saarinen@intel.com,
 James Xiong <james.xiong@intel.com>
Subject: [PATCH v2] drm/i915/dmc: fix assert_dmc_loaded WARN during async
 firmware load
Date: Thu,  7 May 2026 09:46:05 -0700
Message-Id: <20260507164605.608368-1-james.xiong@intel.com>
X-Mailer: git-send-email 2.34.1
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

During driver probe, DMC firmware is loaded asynchronously via a
workqueue. There is a race between parse_dmc_fw() setting the payload
pointer (making has_dmc_id_fw() return true) and intel_dmc_load_program()
writing the firmware to hardware registers. If the probe thread calls
intel_dmc_enable_pipe() -> assert_dmc_loaded() in this window via
intel_modeset_setup_hw_state(), it sees parsed payload but stale HW
registers, triggering a ~20% intermittent WARNING on ADL-N warm boot.

v2: Fix by calling intel_dmc_wait_fw_load() in
    intel_modeset_setup_hw_state() before iterating the CRTCs (Gustavo
    Sousa).

Signed-off-by: James Xiong <james.xiong@intel.com>
---
 drivers/gpu/drm/i915/display/intel_modeset_setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
index e88082c8caac..277e56848470 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
@@ -961,6 +961,8 @@ void intel_modeset_setup_hw_state(struct intel_display *display,
 	 * intel_sanitize_plane_mapping() may need to do vblank
 	 * waits, so we need vblank interrupts restored beforehand.
 	 */
+	intel_dmc_wait_fw_load(display);
+
 	for_each_intel_crtc(display->drm, crtc) {
 		struct intel_crtc_state *crtc_state =
 			to_intel_crtc_state(crtc->base.state);
-- 
2.34.1

