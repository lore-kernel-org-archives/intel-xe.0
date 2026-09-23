Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB47C982FA
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 12:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD40D10F008;
	Wed, 23 Sep 2026 12:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+4/SN5m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2390710F001;
 Wed, 23 Sep 2026 12:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790164826; x=1821700826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9taAEMp8lGuRgsXm76iiYtxMQ80G/30pmgRUSssgYDU=;
 b=k+4/SN5m1ckdpFiaL3ZMFpa9Cpuyw9ZTb+mQquc5+APpdE5Q2Xm/EckJ
 tSNU4U86RKDZMnN0LdPczHBlhg/AoB3uGv+vmQh9pcbo/bjGe44EhXJv9
 9jsWLkum77CKXdXE9H9gEEVBAmqaMFMRMLTZgaFAz5X54m/cAf7GulpqL
 dyVhPkXPQAPyEdNBA52oPkh/kTJZ16cmdvC4AN+ApdCqMcTJYYhtxqLkK
 Z0I3opoe4PmD7bArgnzCPpB4OVkyU2Q+aya0rIHhTBAu0VnAJ2JbVfRO3
 o+Ktp5+hhA7Ruh839OGswGTp1geYuRM0iS9uZY0vwmmMjWOY59RT8uwpN Q==;
X-CSE-ConnectionGUID: kXz6lXW/QfG+03HQwByTVA==
X-CSE-MsgGUID: 9QKZsX0xRouWkbMDI03+yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90965128"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="90965128"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 04:59:47 -0700
X-CSE-ConnectionGUID: xPVAKSFVRiegXk8ymWG68A==
X-CSE-MsgGUID: oEi/VNzUS/2iobjEX9L69g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4665827"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa012.fm.intel.com with ESMTP; 23 Sep 2026 04:59:46 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH] drm/i915/psr: Take the selective fetch area from pipe_src
Date: Wed, 23 Sep 2026 11:59:38 +0000
Message-ID: <20260923115941.746934-3-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923115941.746934-1-mika.kahola@intel.com>
References: <20260923115941.746934-1-mika.kahola@intel.com>
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

The adjusted mode spans all the joined pipes, so it is the wrong
reference for a per-pipe area. pipe_src is this pipe's own share.

No functional change, the two are the same without a joiner.

Assisted-by: Copilot:claude-opus-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 76260ceb49cb..c1994da38567 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2912,8 +2912,8 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 	struct drm_rect display_area = {
 		.x1 = 0,
 		.y1 = 0,
-		.x2 = crtc_state->hw.adjusted_mode.crtc_hdisplay,
-		.y2 = crtc_state->hw.adjusted_mode.crtc_vdisplay,
+		.x2 = drm_rect_width(&crtc_state->pipe_src),
+		.y2 = drm_rect_height(&crtc_state->pipe_src),
 	};
 	bool full_update = false, su_area_changed;
 	int i, ret;
