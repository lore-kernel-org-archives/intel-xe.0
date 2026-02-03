Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED8EE83065
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 08:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B81B10E5A0;
	Tue,  3 Feb 2026 08:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lsc+FAAo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B28610E269;
 Tue,  3 Feb 2026 08:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770109188; x=1801645188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fZJTAk6ONYMGxtJJPWNn51FFDN5MQIQ9rPrNZ7TvoXI=;
 b=Lsc+FAAoi7Qz8x6YW3KXB+N9L7HD+aiKTo63hrJsSe4gRcWekvJNXxJW
 nL/W+aufHKLe0Bk4yEZuD0TNdd44ftee8R+NyNUHRcf+WVAisB3MiNd9Q
 5kvPphkpGp7PDEmqfdnGn4GzR/EdZSDz93lsjemNIMXs+xkfkoupN4hDV
 yzJ24oml4LU3IpBCvB5LikrwzfGbL3gT6ElZ5H6D/DPCZTeVg2FYsA/0a
 8s6IaYW5QLxOnRSH00IhPT8lo1Lg0bMBD5bTtQrv/QuSX1e0fOa9Inq2x
 t3X0PwzituNNecLRkNI9tsZhcyybabRLC0Ng0CEabzavIwSr5K2/ORJIP w==;
X-CSE-ConnectionGUID: Db7ipG7FSVOSx+uwWTDYgA==
X-CSE-MsgGUID: BqRmL9c5RqeXhq3Y4Qn3cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="88695987"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="88695987"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 00:59:48 -0800
X-CSE-ConnectionGUID: bcoWI2zJRtOCSnH4vl4NLg==
X-CSE-MsgGUID: PDqZAMUWSHagTMJqy0xpTg==
X-ExtLoop1: 1
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa003.fm.intel.com with ESMTP; 03 Feb 2026 00:59:47 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com
Subject: [PATCH v3 1/1] drm/i915/display: Implement Wa_16024710867
Date: Tue,  3 Feb 2026 14:19:37 +0530
Message-ID: <20260203084937.1447834-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260203084937.1447834-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260203084937.1447834-1-mitulkumar.ajitkumar.golani@intel.com>
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

Defeature port sync feature for xe3lpd onwards.

--v1:
- Use xe3lpd naming (Suraj)
- Use IS_DISPLAY_VER (Suraj)

--v2:
- Comments update and Adding Bspec link (Suraj)

Bspec: 69965
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index d8739e2bb004..f92323664162 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4588,8 +4588,10 @@ intel_ddi_port_sync_transcoders(const struct intel_crtc_state *ref_crtc_state,
 	/*
 	 * We don't enable port sync on BDW due to missing w/as and
 	 * due to not having adjusted the modeset sequence appropriately.
+	 * From, xe3lpd onwards we have defeatured this with reference to
+	 * Wa_16024710867
 	 */
-	if (DISPLAY_VER(display) < 9)
+	if (!IS_DISPLAY_VER(display, 9, 20))
 		return 0;
 
 	if (!intel_crtc_has_type(ref_crtc_state, INTEL_OUTPUT_DP))
-- 
2.48.1

