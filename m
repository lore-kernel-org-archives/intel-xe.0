Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01EFCD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 20:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38FC112376;
	Wed,  3 Jun 2026 20:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ht6ojpBD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5D7112374;
 Wed,  3 Jun 2026 20:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780518442; x=1812054442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QMD/Yb8sF7vh0iqFC4L7jb6xqp90nnxo+Iepe8psl+k=;
 b=Ht6ojpBDy3AfxU6mzRZmKp/fGrFCTcUOadb9YAl3UZWsENzilQM2HVZm
 wIs9uf0fFNLInVC4tpFoi1VzUTkMCHDipIXkMEpLmnTe7ndjFZHkyUe2d
 Rhyv2qJr8QM2cBdDy2D53bnt6a3hLeWmNXTPIX4mQMVbUmgdiRff6TAB+
 Hh0o5hSi8iIFtcHPD+us+h8ATY4mr0FtCEbctGsm3fMwsiae3v5CWp/UV
 eRKLuuv7I3iXBLHX6utNGN1LkI4+b2H4JJa5YwspuhggTKPXYfzYyrUEz
 rH4OzGtklB7fpRamRkISa6TjBX58F9496C4+B2O6f88ZhjXDVA15C6cCn Q==;
X-CSE-ConnectionGUID: WXwd62METSiIF4XyfuScug==
X-CSE-MsgGUID: xh2iUawiTRGj4J9+SK86wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81337483"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81337483"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 13:27:22 -0700
X-CSE-ConnectionGUID: 5Kam8QbjQWa8k7LJ0ZILjw==
X-CSE-MsgGUID: OmpxN/ujShG/UoPzLizoRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="244424982"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa009.jf.intel.com with ESMTP; 03 Jun 2026 13:27:20 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v8 20/20] Debug patch
Date: Thu,  4 Jun 2026 01:24:16 +0530
Message-Id: <20260603195416.91639-21-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260603195416.91639-1-animesh.manna@intel.com>
References: <20260603195416.91639-1-animesh.manna@intel.com>
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

Debug patch. Not for review.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index 8be6f7f28e35..3b23d4517e5e 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -239,6 +239,12 @@ bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state)
 	struct intel_display *display = to_intel_display(crtc_state);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
+	/*
+	 * Currently Dc3co patches are not merged so returning false for
+	 * continuing cmtg patch review
+	 */
+	return false;
+
 	if ((cpu_transcoder == TRANSCODER_A || cpu_transcoder == TRANSCODER_B) &&
 	    DISPLAY_VER(display) == 35 && intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP))
 		return true;
-- 
2.29.0

