Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD85DC4451B
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 08:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8385E10E7F7;
	Mon, 20 Jul 2026 08:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bHwXWLp5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5FB10E7F7;
 Mon, 20 Jul 2026 08:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784536514; x=1816072514;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fAWGP0EaxyVCXTUTPP0w/Jl6a29Dqywd96CdnlFKDww=;
 b=bHwXWLp5anC+jfthdh4stVaYFqE7I27mZQmMXsD//bf9+dJhBTr4UQI4
 ZidhkVKW8JAEkGrYDPsTPvSWeEyymWrhAc55NVRtPPX2wN/yk9IcY/AVZ
 tj8ylHT+rrxRBE1ItQNVmVMAZv3eDomZYeQO3W/+XCWJvvy0R472NtVfi
 0UQ4c4nQTiY5NtVxpBVSMAw0RPMuw8fsaUympFVuqsR+kyagIpDyayXwV
 h7tgoSDu0PteIYEAKkh6/YBf+Vk/uyQ8+1dRoHRy1QiNFdEUS6kHBRRNu
 KXzubaMxeLq4WdeX/XLU9BOExZXRJdqZNXJs7m6fc4iMHNxlneEAp1MkT w==;
X-CSE-ConnectionGUID: VdBBk3HNTXqv6Ab2ET6uPQ==
X-CSE-MsgGUID: uwmZtq5KSHWHqwHj131mjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="110658302"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
 d="scan'208,223";a="110658302"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 01:35:13 -0700
X-CSE-ConnectionGUID: qgOCpcc1TlCWP/VdjhpzpQ==
X-CSE-MsgGUID: boBWXO3FSsqgSwxwgoftYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
 d="scan'208,223";a="257462180"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 01:35:11 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, chaitanya.kumar.borah@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH] drm/i915/display: Ensure a non-zero safe window from PTL
 onwards
Date: Mon, 20 Jul 2026 13:48:03 +0530
Message-ID: <20260720081803.1123264-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From PTL onwards the DSB waits on the VRR safe window instead of vblank
(chicken bit 14 selects the safe window signal from the DPT unit to
start the DMA engine). The safe window starts at (undelayed vblank
start - set context latency) and ends at the delayed vblank start.

With modes that have a smaller vblank region, the computed guardband is
clamped to the vblank length, which makes the undelayed and delayed
vblank coincide. If the set context latency (SCL) is also 0, the safe
window collapses to 0. The DSB, configured to wait for the safe window,
then stalls forever since the hardware never signals it, leading to:

  *ERROR* [CRTC:159:pipe A] flip_done timed out
  *ERROR* [CRTC:159:pipe A] DSB 0 timed out waiting for idle

Clamp the set context latency to a minimum of 1 from PTL onwards so the
safe window always keeps a non-zero width.

Fixes: 4a68c7516c57 ("drm/i915/dsb: Use safe window path when VRR TG is used")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Assisted-by: GitHub-Copilot:Claude-Opus-4.8
---
 drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 38763a6802c5..0822a2194c7f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2459,6 +2459,19 @@ static int intel_crtc_set_context_latency(struct intel_crtc_state *crtc_state)
 	set_context_latency = max(set_context_latency,
 				  intel_psr_min_set_context_latency(crtc_state));
 
+	/*
+	 * From PTL onwards, the set context latency can be in the vactive
+	 * region, letting the safe window start some lines before the vblank
+	 * start. With modes that have a smaller vblank region, the computed
+	 * guardband is clamped to the vblank length, making the undelayed and
+	 * delayed vblank coincide. If the SCL is also 0, the 'safe window'
+	 * becomes effectively 0, and the DSB configured to wait for it gets
+	 * stalled, since the hardware never signals the safe window. Keep the
+	 * set context latency at a minimum of 1 to avoid this.
+	 */
+	if (DISPLAY_VER(display) >= 30)
+		set_context_latency = max(1, set_context_latency);
+
 	return set_context_latency;
 }
 
-- 
2.50.1

