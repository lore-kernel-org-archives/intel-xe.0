Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA187CA5FCB
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 13:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6538C10E37D;
	Thu,  1 Oct 2026 13:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bItVCBXu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FBC10E37D
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 13:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790862351; x=1822398351;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1Ordv6z12B2AUiqbsPsx/XBF1GZSCzGrxwxi2rbT3SI=;
 b=bItVCBXubuJ5A8Heb/lqD48+nzj4f4ObEA9OiMBaX6r7jN5NOHFFj3je
 HdakSZYEUiRgeNY7MOefQbrG9DTnPN5UtGkwkGjiqX6i50sYa9yOkP2Ys
 3p964n0LWGzJpD5pXKLZmgpHiWcOSX45EtQ/EQum/M7zPLQpvWpSbcHlX
 fT9fNF81fnBsRV7Zd9V3KPUcXqn5exdrpnDqGGhLJ7jO72MUTwdDvEJJE
 db6FrnWC2jCe2EQbSLh6W/9Xi/1aTVeUAcD8a6UcSYpfyviZmvxI7Boxt
 GyodfEsORhSVX6IzCKFpjI1dmgu+MaxoMlbAV/E6/k/jU70Zs7Bl/gQQ1 A==;
X-CSE-ConnectionGUID: qrUKQjwnR9OfRTHA0Imy/g==
X-CSE-MsgGUID: WFLaCC63SnusvAph7mLFrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="100953025"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="100953025"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 06:45:51 -0700
X-CSE-ConnectionGUID: o0hICD7tR06/BKELTy2Gfg==
X-CSE-MsgGUID: Mz1rHsRgQfOFERvtgUohuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="274080683"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 06:45:50 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe/cri: Add new PCI ID
Date: Thu,  1 Oct 2026 19:25:16 +0530
Message-ID: <20261001135515.74225-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
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

New PCI ID added for CRI.

Bspec: 77979
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 include/drm/intel/pciids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index 32c88a690ad82..a2160920781d4 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -904,7 +904,8 @@
 	MACRO__(0x674D, ## __VA_ARGS__), \
 	MACRO__(0x674E, ## __VA_ARGS__), \
 	MACRO__(0x674F, ## __VA_ARGS__), \
-	MACRO__(0x6750, ## __VA_ARGS__)
+	MACRO__(0x6750, ## __VA_ARGS__), \
+	MACRO__(0x6751, ## __VA_ARGS__)
 
 /* NVL-P */
 #define INTEL_NVLP_IDS(MACRO__, ...) \
-- 
2.43.0

