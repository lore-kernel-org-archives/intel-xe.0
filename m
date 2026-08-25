Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F79C5DF9C
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F6B10E8E9;
	Tue, 25 Aug 2026 06:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QwkLBNJx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B1A10E8ED;
 Tue, 25 Aug 2026 06:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787639169; x=1819175169;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8PYR+FWDHt8vRBtW80TS3s5VxLZN26r2Rc6e5OIUDKw=;
 b=QwkLBNJx+b3Tmxd4TMAwymek0Ug21RvQsh/DVPu4l06j3tTOeQ1FMDvc
 cSfDByhTW6/Cwsay5D7Xff4WogZbpVBGmUsPddZV9miJssmlKk1XaK2gY
 LnyCN/RdZs7jcZbvBI+mDUokSDl33OgmjES3RWHtE9O4k9GLrDjqWIkmC
 4Gp8pOd83RhgD+H2m4y8MqdpaLPlXRmXxX6UdbwKK7nl9ClY2yHS1IFsO
 zMcXriSC27YBPj5b3v4wCG6b0J9BEvkwO2HOqmpZV696mUKwWvYEMZkph
 QvfkckLnwra+G9g/1LHVSnEnkCyVQPpQLDPWJl3XoZxG8Q04CICSWO4xx A==;
X-CSE-ConnectionGUID: nbc1mH8ZSGGh0ke3DzKnBA==
X-CSE-MsgGUID: 4+MwGoMwRV2eLxPit85AlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="105478219"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="105478219"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:26:09 -0700
X-CSE-ConnectionGUID: H/nr0X5USry0WtT6SBnmQw==
X-CSE-MsgGUID: 0O+txTz8SzWxFJXqDrIXNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263466881"
Received: from unknown (HELO SRR4-3-Linux-101-amanna.iind.intel.com)
 ([10.190.238.88])
 by fmviesa010.fm.intel.com with ESMTP; 24 Aug 2026 23:26:07 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, ankit.k.nautiyal@intel.com,
 Animesh Manna <animesh.manna@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/i915/alpm: Fix swapped wake lines in LOBF late config
Date: Tue, 25 Aug 2026 11:22:39 +0530
Message-Id: <20260825055239.3455987-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
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

intel_alpm_lobf_compute_config_late() selected the main-link wake time
with the two cases inverted: when aux-less wake was supported it used the
aux-wake io_wake_lines, and otherwise the aux_less_wake_lines. This is the
opposite of the mapping used in intel_psr_compute_config_late() and of the
underlying meaning of the two values.

As a result the LOBF enable decision (scl + guardband > first_sdp_position
+ waketime_in_lines) was computed against the wrong wake time, so LOBF
could be enabled or rejected incorrectly.

Use aux_less_wake_lines when aux-less wake is supported and io_wake_lines
otherwise, matching the PSR path.

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com
Cc: stable@vger.kernel.org
Fixes: 9090fa44a6d45 ("drm/i915/alpm: Compute LOBF late after guardband is already determined")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index f1383764b702..559fe6d14c01 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -314,9 +314,9 @@ void intel_alpm_lobf_compute_config_late(struct intel_dp *intel_dp,
 	 */
 	first_sdp_position = adjusted_mode->crtc_vtotal - adjusted_mode->crtc_vsync_start;
 	if (intel_alpm_aux_less_wake_supported(intel_dp))
-		waketime_in_lines = crtc_state->alpm_state.io_wake_lines;
-	else
 		waketime_in_lines = crtc_state->alpm_state.aux_less_wake_lines;
+	else
+		waketime_in_lines = crtc_state->alpm_state.io_wake_lines;
 
 	crtc_state->has_lobf = (crtc_state->set_context_latency + crtc_state->vrr.guardband) >
 			       (first_sdp_position + waketime_in_lines);
-- 
2.29.0

