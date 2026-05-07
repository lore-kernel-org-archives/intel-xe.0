Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74965CD3439
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 00:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238CD10EF16;
	Thu,  7 May 2026 00:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNWmB12O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2FB10EF16
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 00:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778114784; x=1809650784;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bj14TROQp+NepNgm6kZkRxdG8XxjgiWsVHki+TbUUVA=;
 b=SNWmB12OksfHb5AOA1Gpn+Chpl5skHipCkjV2W26a3DuqqiOSEdxUAJj
 jlwm79FS/bH2hdLbfXUeucMhqk1SxCEryOfVHpxz1O3uwk3w5srx/GY+c
 nvvMJED+M7xnem6qir7BNBi3Fm58SarXJ73+d2jpAAJ2DPE9hBIYKk4/u
 I+YgmI85AlvkTn2syxPqP7fDE49Mw4yRLkghim4KM/EkzreAL3AKxMsPN
 Bg7sxL7rjmQXzOmJhoVfC2mdo7dgodjB2qFRUxx7TUUF+Obb2Euyf5ZD+
 kcJAlCiAYjZ8jMXUZUqoH8kttoy4Sr/rqDgJ+R/Dlmada6KyAF7ihBGRy g==;
X-CSE-ConnectionGUID: A1JyPS9MTReQwI++RgdZWw==
X-CSE-MsgGUID: qpCNEhqyQdWsNgjxBCvF4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90515499"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="90515499"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 17:46:24 -0700
X-CSE-ConnectionGUID: ITF01z9KRwiDAQsveADa8Q==
X-CSE-MsgGUID: Vv2+IkI5Q9GOBVmnc5h9mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="241308050"
Received: from nex-dev-jx.fm.intel.com ([10.105.128.1])
 by orviesa005.jf.intel.com with ESMTP; 06 May 2026 17:46:24 -0700
From: James Xiong <james.xiong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: James Xiong <james.xiong@intel.com>
Subject: [PATCH 1/1] drm/i915/dmc: fix assert_dmc_loaded WARN during async
 firmware load
Date: Wed,  6 May 2026 17:46:31 -0700
Message-Id: <20260507004631.574300-1-james.xiong@intel.com>
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
intel_dmc_enable_pipe() -> assert_dmc_loaded() in this window, it sees
parsed payload but stale HW registers, triggering a ~20% intermittent
WARNING on ADL-N warm boot.

Fix this by adding a 'loaded' flag to struct intel_dmc, set with
WRITE_ONCE() after intel_dmc_load_program() completes. Check it with
READ_ONCE() in intel_dmc_enable_pipe() and intel_dmc_disable_pipe()
as an additional guard before has_dmc_id_fw().

Signed-off-by: James Xiong <james.xiong@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 0df4f42ba3e3..c51103515820 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -79,6 +79,7 @@ struct intel_dmc {
 		u32 *payload;
 		bool present;
 	} dmc_info[DMC_FW_MAX];
+	bool loaded;
 };
 
 /* Note: This may be NULL. */
@@ -417,6 +418,13 @@ bool intel_dmc_has_payload(struct intel_display *display)
 	return has_dmc_id_fw(display, DMC_FW_MAIN);
 }
 
+static bool intel_dmc_loaded(struct intel_display *display)
+{
+	struct intel_dmc *dmc = display_to_dmc(display);
+
+	return dmc && READ_ONCE(dmc->loaded);
+}
+
 static void initialize_stepping_info(struct intel_display *display, struct stepping_info *si)
 {
 	const char *step_name = DISPLAY_RUNTIME_INFO(display)->step_name;
@@ -786,7 +794,8 @@ void intel_dmc_enable_pipe(const struct intel_crtc_state *crtc_state)
 	enum pipe pipe = crtc->pipe;
 	enum intel_dmc_id dmc_id = PIPE_TO_DMC_ID(pipe);
 
-	if (!is_valid_dmc_id(dmc_id) || !has_dmc_id_fw(display, dmc_id))
+	if (!is_valid_dmc_id(dmc_id) || !intel_dmc_loaded(display) ||
+	    !has_dmc_id_fw(display, dmc_id))
 		return;
 
 	if (!can_enable_pipedmc(crtc_state)) {
@@ -821,7 +830,8 @@ void intel_dmc_disable_pipe(const struct intel_crtc_state *crtc_state)
 	enum pipe pipe = crtc->pipe;
 	enum intel_dmc_id dmc_id = PIPE_TO_DMC_ID(pipe);
 
-	if (!is_valid_dmc_id(dmc_id) || !has_dmc_id_fw(display, dmc_id))
+	if (!is_valid_dmc_id(dmc_id) || !intel_dmc_loaded(display) ||
+	    !has_dmc_id_fw(display, dmc_id))
 		return;
 
 	if (DISPLAY_VER(display) >= 14)
@@ -942,6 +952,8 @@ void intel_dmc_load_program(struct intel_display *display)
 	gen9_set_dc_state_debugmask(display);
 
 	pipedmc_clock_gating_wa(display, false);
+
+	WRITE_ONCE(display_to_dmc(display)->loaded, true);
 }
 
 /**
-- 
2.34.1

