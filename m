Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095C0C55184
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 09:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46D710E939;
	Tue,  4 Aug 2026 09:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bP5W+i+o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC4910E94F;
 Tue,  4 Aug 2026 09:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785835786; x=1817371786;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=bb2/7QDp0Q3hqTXE9zXEOpYNFCRv+Yj0c+HKl1iXmYo=;
 b=bP5W+i+o2BnVmEMmp/2kYpfow9guF6WnCwBIYg6DGraQ/sDKvcBAdN7r
 msYfhxNEUksTKeDkR+hJpwLhWFOr7nj1CgH/pF3UC98aopHDwsg4B1pJN
 pkW3tfuoQ2y8UZOr1E0qsgOnXOsh8HS35xZMcNxailm9tjBkoHiRWhPzp
 35j2cLIxHi++7oTZ5nQnCBKZqonvzGQ6RWBH2MEthzvuz4lIlpE0IjEFT
 QuDn7QBqWpzyxorD1Tvxyns/Sm51TZPDpjNjNYnAjCLBIkCC5feQJfY5E
 prtcTX+nQ1Ws7+347wc/U/MxDKM1mdWm/NfOfWcMgm5PNr+U/w78nwAoA Q==;
X-CSE-ConnectionGUID: +Vz32sQBRqmJCuoe5v5O+w==
X-CSE-MsgGUID: ukSki85bQxSZpCAvCT4p0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97034049"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="97034049"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 02:29:45 -0700
X-CSE-ConnectionGUID: mGbgW/7NSKa+KdsDsp5QfA==
X-CSE-MsgGUID: lAOiSggbQsSfpqJDbEL31A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="259669123"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa006.jf.intel.com with ESMTP; 04 Aug 2026 02:29:44 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 04 Aug 2026 14:58:30 +0530
Subject: [PATCH 1/2] drm/i915/display: Seed skl_cdclk_init_hw() with
 SKU-max, not zero
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260804-cdclk-v1-1-484864b1aafd@intel.com>
References: <20260804-cdclk-v1-0-484864b1aafd@intel.com>
In-Reply-To: <20260804-cdclk-v1-0-484864b1aafd@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Arun R Murthy <arun.r.murthy@intel.com>, 
 =?utf-8?q?Polo-Fran=C3=A7ois_Poli?= <polo.code.dev@gmail.com>
X-Mailer: b4 0.15-dev
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

skl_cdclk_init_hw() has a recovery path that runs when skl_sanitize_cdclk()
has decided the pre-OS CDCLK state is not usable and zeroes
display->cdclk.hw.

Seed with the SKU-permitted maximum instead (as read from SKL_DFSM), so
the recovery path lands on a cdclk that satisfies every pipe on the SKU.
The very first atomic commit that follows will dial cdclk down to what
active pipes actually need via the normal skl_modeset_calc_cdclk() path.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16595
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Tested-by: Polo-François Poli <polo.code.dev@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 65 +++++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index a53d887271778193fd400b9199ad841d5d9730fe..19f3ef8adfcded378428924539db9336834278ea 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -1288,6 +1288,31 @@ static void skl_sanitize_cdclk(struct intel_display *display)
 	display->cdclk.hw.vco = ~0;
 }
 
+/*
+ * Seed cdclk from the SKU-permitted maximum. Used by skl_cdclk_init_hw()'s
+ * recovery path when skl_sanitize_cdclk() has decided the pre-OS CDCLK state
+ * is not usable and has zeroed display->cdclk.hw.
+ * Seed with the SKU top instead: it is guaranteed to satisfy every pipe on
+ * the platform, and the very first atomic commit will dial cdclk down via
+ * skl_modeset_calc_cdclk() once per-pipe min_cdclk is known.
+ */
+static int skl_cdclk_init_hw_seed(struct intel_display *display, int vco)
+{
+	u32 limit = intel_de_read(display, SKL_DFSM) & SKL_DFSM_CDCLK_LIMIT_MASK;
+	int max_cdclk;
+
+	if (limit == SKL_DFSM_CDCLK_LIMIT_675)
+		max_cdclk = 617143;
+	else if (limit == SKL_DFSM_CDCLK_LIMIT_540)
+		max_cdclk = 540000;
+	else if (limit == SKL_DFSM_CDCLK_LIMIT_450)
+		max_cdclk = 432000;
+	else
+		max_cdclk = 308571;
+
+	return skl_calc_cdclk(max_cdclk, vco);
+}
+
 static void skl_cdclk_init_hw(struct intel_display *display)
 {
 	struct intel_cdclk_config cdclk_config;
@@ -1311,9 +1336,14 @@ static void skl_cdclk_init_hw(struct intel_display *display)
 	cdclk_config.vco = display->cdclk.skl_preferred_vco_freq;
 	if (cdclk_config.vco == 0)
 		cdclk_config.vco = 8100000;
-	cdclk_config.cdclk = skl_calc_cdclk(0, cdclk_config.vco);
+
+	cdclk_config.cdclk = skl_cdclk_init_hw_seed(display, cdclk_config.vco);
 	cdclk_config.voltage_level = skl_calc_voltage_level(cdclk_config.cdclk);
 
+	drm_dbg_kms(display->drm,
+		    "cdclk: init seed cdclk=%d vco=%d volt=%d (SKU-max, no per-pipe min_cdclk yet)\n",
+		    cdclk_config.cdclk, cdclk_config.vco, cdclk_config.voltage_level);
+
 	skl_set_cdclk(display, &cdclk_config, INVALID_PIPE);
 }
 
@@ -4231,6 +4261,39 @@ void intel_cdclk_read_hw(struct intel_display *display)
 	cdclk_state->logical = display->cdclk.hw;
 }
 
+/**
+ * intel_cdclk_sync_hw_state - Adopt the HW-asserted cdclk into SW state.
+ * @display: display instance
+ * @hw_config: the cdclk configuration as currently read back from HW
+ *
+ * This helper reconciles the SW state to match what HW is currently asserting.
+ * It updates display->cdclk.hw and the committed cdclk_state's actual/logical
+ * so that any following atomic commit sees a truthful baseline and will
+ * naturally attach a cdclk_state (via intel_cdclk_atomic_check()) to raise
+ * cdclk when the workload demands it.
+ */
+void intel_cdclk_sync_hw_state(struct intel_display *display,
+			       const struct intel_cdclk_config *hw_config)
+{
+	struct intel_cdclk_state *cdclk_state =
+		to_intel_cdclk_state(display->cdclk.obj.state);
+
+	if (!intel_cdclk_clock_changed(&display->cdclk.hw, hw_config))
+		return;
+
+	drm_dbg_kms(display->drm,
+		    "cdclk: syncing SW state to HW after drift (sw %d/vco %d/ref %d -> hw %d/vco %d/ref %d)\n",
+		    display->cdclk.hw.cdclk, display->cdclk.hw.vco, display->cdclk.hw.ref,
+		    hw_config->cdclk, hw_config->vco, hw_config->ref);
+
+	display->cdclk.hw.cdclk = hw_config->cdclk;
+	display->cdclk.hw.vco = hw_config->vco;
+	display->cdclk.hw.ref = hw_config->ref;
+
+	cdclk_state->actual = display->cdclk.hw;
+	cdclk_state->logical = display->cdclk.hw;
+}
+
 static int calc_cdclk(const struct intel_crtc_state *crtc_state, int min_cdclk)
 {
 	struct intel_display *display = to_intel_display(crtc_state);

-- 
2.25.1

