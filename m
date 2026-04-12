Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81216E937E0
	for <intel-xe@archiver.kernel.org>; Sun, 12 Apr 2026 11:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B98610E2B8;
	Sun, 12 Apr 2026 11:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kRxeIwU4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C416210E2B7;
 Sun, 12 Apr 2026 11:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775992099; x=1807528099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kEIau+R6G0jGe8LpKwThuXzCvZkG9r6W5TqjTHM4yrI=;
 b=kRxeIwU4ZDhVqS1KmtVzduZfm5BznaOxZQy3sNB8512+/JUssS6fDCS4
 Hf+ChVtCVGJBBMK/0QlYuU2HXemfZwAQ23Sdy+j0mQ8bZLpV0QD9O7I1F
 CBmDxwpA0iW6PyboQ4b39C4enXKD0sDU2SzBWOgHXhdmeeE4dYsjAQ9O4
 9roCeQDoUJs+KZa3Ft+XMwy/iFNIQZVuBWtlurVyEUvyFGe0EW+3An84E
 lYJLc1NC7TeenzOYwvSo6BoEe3MkQcOHCMjLaLzURo+oM06pbr35hbnA6
 f38iAxPsoG4xGO8YaZJy7EkbgPGXgh28EIkS+XiBXtUm3wzm7r5xChZXi A==;
X-CSE-ConnectionGUID: LM58igl+R3S16EjcpVudaA==
X-CSE-MsgGUID: OGiYhQNtR4qI3J0IIXYDtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76115140"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; d="scan'208";a="76115140"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 04:08:19 -0700
X-CSE-ConnectionGUID: AYdLbG+IRLysZIMKGjoq7w==
X-CSE-MsgGUID: eAPe7jIaT4yTExqRGwqhIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; d="scan'208";a="267507753"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa001.jf.intel.com with ESMTP; 12 Apr 2026 04:08:17 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 jani.nikula@intel.com, Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v4 12/13] drm/i915/cmtg: Disable CMTG if dc3co is not allowed
Date: Sun, 12 Apr 2026 16:07:11 +0530
Message-Id: <20260412103712.4021213-13-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260412103712.4021213-1-animesh.manna@intel.com>
References: <20260412103712.4021213-1-animesh.manna@intel.com>
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

DC3co entry condition can change dymamically and disable
CMTG if entry condition is not met for DC3co.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 3d683d290fa6..9c5985ae89e0 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6874,7 +6874,8 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 	    old_crtc_state->inherited)
 		intel_crtc_arm_fifo_underrun(crtc, new_crtc_state);
 
-	if (crtc->cmtg.enabled && intel_crtc_vrr_enabling(state, crtc)) {
+	if (crtc->cmtg.enabled && (intel_crtc_vrr_enabling(state, crtc) ||
+				   !intel_cmtg_is_allowed(new_crtc_state))) {
 		intel_cmtg_disable(new_crtc_state);
 		intel_cmtg_disable_interrupt(new_crtc_state);
 	}
-- 
2.29.0

