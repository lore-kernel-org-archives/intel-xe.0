Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33390C43327
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 18:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD56E10E0E2;
	Mon, 29 Jun 2026 18:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dY+w4n4m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A6710E0E2;
 Mon, 29 Jun 2026 18:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782758100; x=1814294100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8GYbZxGzyAh/L8lIUsJG9NWV1lf3TmstGfv0C5LnCMk=;
 b=dY+w4n4mTqP05D+sG314hkP6kjzUKfDxBqk/Xhs1RN7dz6WFRpRcP1Ky
 EQpvy7cDkiTibamnOHTMoAvB9e/nZLvjx22xHtmrs2c5+fV4RhBUEDuH6
 O/TsvZ2ASBUU17YrTnaBulAz8v4RJ7KJThjgu18quOiBHalAlucEXNxpG
 NfMcouEhVwUepsR1kPPBliJn8v1IauFZkgcOAvHwrujsRJxud8ZT5F/GT
 f+v+0j44PFnQWa+uuLT/MpaSw9GIObhxyTBw4Di3lPDdAiXYtdCCUd9Ji
 3av5OUBGCCHnJjS274jyzDEE+w9v6QDC0b51BJuoQ0P9OYiyMypxzi228 Q==;
X-CSE-ConnectionGUID: 8VOlQ+FJRCWGtMRiy8iHJQ==
X-CSE-MsgGUID: tlybe6UKTfu4klTcBQhVpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="86010634"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="86010634"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 11:35:00 -0700
X-CSE-ConnectionGUID: cBtZ0DEZS2CrIDkG5v8KDQ==
X-CSE-MsgGUID: oAn1/XsBQeOSPzwiuzZFBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="256956691"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.190.238.88])
 by fmviesa005.fm.intel.com with ESMTP; 29 Jun 2026 11:34:58 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 suraj.kandpal@intel.com, Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v2 2/2] drm/i915/cmtg: Warn on invalid CMTG transcoder in
 intel_cmtg_disable()
Date: Mon, 29 Jun 2026 23:32:36 +0530
Message-Id: <20260629180236.1353704-3-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260629180236.1353704-1-animesh.manna@intel.com>
References: <20260629180236.1353704-1-animesh.manna@intel.com>
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

intel_cmtg_disable() indexes the per-transcoder register array using the
CMTG transcoder returned by to_cmtg_transcoder(), which is only valid for
TRANSCODER_A/B. The callers are now gated by intel_cmtg_is_allowed(), so
reaching this function with an invalid CMTG transcoder should never
happen.

Add a drm_WARN_ON() that bails out early in that case, both to document
the invariant and to guard against the out-of-bounds register access
(trans_offsets[-1]) should a future caller get it wrong.

v2:
- Add an in-function INVALID_TRANSCODER drm_WARN_ON check. (Suraj)

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index 6da28c185080..c8e0f90af910 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -183,6 +183,9 @@ void intel_cmtg_disable(const struct intel_crtc_state *crtc_state)
 	if (!crtc->cmtg.enabled)
 		return;
 
+	if (drm_WARN_ON(display->drm, cmtg_transcoder == INVALID_TRANSCODER))
+		return;
+
 	crtc->cmtg.enabled = false;
 	intel_de_rmw(display, TRANS_VRR_CTL(display, cmtg_transcoder),
 		     VRR_CTL_VRR_ENABLE | VRR_CTL_FLIP_LINE_EN, 0);
-- 
2.29.0

