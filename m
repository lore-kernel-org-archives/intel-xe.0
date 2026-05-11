Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABC2CD484D
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 17:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A5710E84A;
	Mon, 11 May 2026 17:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lc1HfDnF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4818A10E819;
 Mon, 11 May 2026 17:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778520654; x=1810056654;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=97OQtpNQoP7iQEP2LUt9gZUJw6PgfvSWs80lzrTSV3M=;
 b=lc1HfDnF+PrcmznQbaQmFwCR3dHpGikqN7Osi4qmCFXOp0MTW67yNKB+
 pBH7U+gdIGeGtxsiYkTZfYSjTNhZcBpbDnY3IpqB93Ejj+wsbF7NsMqvq
 lxKAwnJy4qFd2aEHwxBi7OeYSclhgMjPDaYBY5B1oUdfcAqN5zCX740+/
 vzq60yprFfdKWos9e7P81o8ywL3LqdFA5X5JSEOFyQw457XcDIXMFtASp
 jxsQ9sIhOgU9XK1DoLQhyCWsgeivnCBpZi+gNg5k7ZSsbyRrMJnEI2eSR
 EheNoMYHyEbZ3006DjFSPbu4hh0ekrB8r7OoNoAwAvMfYUifDheEsLMz7 g==;
X-CSE-ConnectionGUID: qmfAddFTTCe/uUm8qDETRg==
X-CSE-MsgGUID: mdHkg+99QHK1Ea+12JifzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="102080573"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="102080573"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 10:30:54 -0700
X-CSE-ConnectionGUID: O6y/S6nPT6GjL2IwlkEcJQ==
X-CSE-MsgGUID: urE4A2i1SgWaTH0TQ66ZJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="233035871"
Received: from nex-dev-jx.fm.intel.com ([10.105.128.1])
 by fmviesa006.fm.intel.com with ESMTP; 11 May 2026 10:30:53 -0700
From: James Xiong <james.xiong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com, jani.nikula@linux.intel.com, imre.deak@intel.com,
 James Xiong <james.xiong@intel.com>
Subject: [PATCH v4] drm/i915/dmc: fix assert_dmc_loaded WARN during async
 firmware load
Date: Mon, 11 May 2026 10:31:01 -0700
Message-Id: <20260511173101.723421-1-james.xiong@intel.com>
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

v3: Move intel_dmc_wait_fw_load() into intel_dmc_enable_pipe() itself
    so the function is self-contained (Jani Nikula, Gustavo Sousa).

Fixes: 3af2ff0840be ("drm/i915: Enable a PIPEDMC whenever its corresponding pipe is enabled")
Signed-off-by: James Xiong <james.xiong@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 0df4f42ba3e3..4151eae92744 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -786,7 +786,12 @@ void intel_dmc_enable_pipe(const struct intel_crtc_state *crtc_state)
 	enum pipe pipe = crtc->pipe;
 	enum intel_dmc_id dmc_id = PIPE_TO_DMC_ID(pipe);
 
-	if (!is_valid_dmc_id(dmc_id) || !has_dmc_id_fw(display, dmc_id))
+	if (!is_valid_dmc_id(dmc_id))
+		return;
+
+	intel_dmc_wait_fw_load(display);
+
+	if (!has_dmc_id_fw(display, dmc_id))
 		return;
 
 	if (!can_enable_pipedmc(crtc_state)) {
-- 
2.34.1

