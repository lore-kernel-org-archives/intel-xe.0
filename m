Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44355CDB46F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 09:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BCB10EA38;
	Tue, 23 Jun 2026 09:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AKYxyiH+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787D410EA38;
 Tue, 23 Jun 2026 09:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782206756; x=1813742756;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uLuOK48xqu+zAtJr4AKDAMU+RdVdq8xUKpcrbis2GAg=;
 b=AKYxyiH+ARbSYa9V9uIM6NlimQ0w7D65g4YbnAI8eZvDrpu5j8z44DM7
 MGcz07hkNl1XGoN3hMAmuFUMWNNzEzO/d8pGw/j0SN8gQK2VuFgipazsp
 2PGroij5BS4xzHCYE/PUhet5qslZd1+VzHEs7X8ALzD9szYnVbMyDY0wv
 L9uIfAwTsdC1VdEwxWQddUANmN6EZplgbHm/f0zvcQWsAGeylp0TAOuZb
 1Ar7xfy9rdyptjrLhMnqdbpFOt2fvvOiXG2iwF87wbX9lPnOPrySFLC5I
 ZESIMP6gDKAyDDfWxe5j0zWEDIYBfwm40GKQ5uX+LtIT5qm0DpWfMsUpE w==;
X-CSE-ConnectionGUID: +SEf6MHIT4GN4OBA4bH6fQ==
X-CSE-MsgGUID: hJ+Vrv97QEmHafaaFnTMzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93534319"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="93534319"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 02:25:56 -0700
X-CSE-ConnectionGUID: OdpwExXmS7adpaoazca6Pg==
X-CSE-MsgGUID: wWJ+vXyEQwO6PuH0nmUeFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="245105379"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.190.238.88])
 by fmviesa006.fm.intel.com with ESMTP; 23 Jun 2026 02:25:54 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH] drm/i915/cmtg: Fix array-index-out-of-bounds in
 intel_cmtg_disable
Date: Tue, 23 Jun 2026 14:23:34 +0530
Message-Id: <20260623085334.1297520-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
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

to_cmtg_transcoder() returns INVALID_TRANSCODER (-1) for any
cpu_transcoder other than TRANSCODER_A/B. intel_cmtg_disable() then uses
the resulting cmtg_transcoder to index the per-transcoder register array
via TRANS_VRR_CTL(), but unlike the other CMTG helpers it does not check
for INVALID_TRANSCODER first. The only guard is crtc->cmtg.enabled, which
is a sticky flag on struct intel_crtc and can be set while the crtc_state
being disabled has a cpu_transcoder that does not map to a CMTG
transcoder (e.g. during a big-joiner reconfiguration that moves the eDP
across pipes).

This results in a negative array index (trans_offsets[-1]) and a UBSAN
splat:

  UBSAN: array-index-out-of-bounds in .../display/intel_cmtg.c:187:24
  intel_cmtg_disable+0x395/0x3d0 [xe]
  intel_old_crtc_state_disables+0xfb/0x1f0 [xe]
  intel_atomic_commit_tail+0xca6/0x2040 [xe]

Bail out early when cmtg_transcoder is INVALID_TRANSCODER, matching the
guard already used by the other CMTG helpers.

Fixes: 3bb44e8d421a ("drm/i915/cmtg: Modify existing hook to disable CMTG")
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index 6da28c185080..dcd29ebdb432 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -183,6 +183,9 @@ void intel_cmtg_disable(const struct intel_crtc_state *crtc_state)
 	if (!crtc->cmtg.enabled)
 		return;
 
+	if (cmtg_transcoder == INVALID_TRANSCODER)
+		return;
+
 	crtc->cmtg.enabled = false;
 	intel_de_rmw(display, TRANS_VRR_CTL(display, cmtg_transcoder),
 		     VRR_CTL_VRR_ENABLE | VRR_CTL_FLIP_LINE_EN, 0);
-- 
2.29.0

