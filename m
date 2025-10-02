Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E3ECAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 17:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E1D10E09C;
	Thu,  2 Oct 2025 17:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QPQwU4Ep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E289C10E09C
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 17:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759425200; x=1790961200;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XoNAbL4SCvki1WomuVnX6/lKfOWBxL1riH2FYNkukYg=;
 b=QPQwU4EpzyJHqga4X8SiQu9JnuGuAbzOyNoFV8BXViYaocIFMXl4ApiX
 m9zzJU9mrjSDaNlFV+3P3uuV8LbwrHJTU0zeX5sPqTy3kIgbNX5FInkzN
 1ifCsRpx2Vn0I80MLX+tMrogT5rQrJONi1ShObszBJQZKIc9Md7kjKyqX
 rIzZnje5Ofpuu9ByPtldOmSBSa4E2T4deFtB4uAEAJGTwIyucgHlu7n0V
 50ECHPd3qt13hTHjedkGNKCltmusG80mUPSa7ol7G6iFzX2V07/4IX6dZ
 gybyn4HhvrJ7ViRnSwT4kCHbCBhKkfHfUz9t7Zhml0F9+904yLLRgH4mw w==;
X-CSE-ConnectionGUID: fg300dPsSUa8D6BxXIekTA==
X-CSE-MsgGUID: P4CnHyg7Sv2Et3y8CpPt1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61675663"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61675663"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 10:13:19 -0700
X-CSE-ConnectionGUID: kn879ZP6T5ufbjBiy7vnlQ==
X-CSE-MsgGUID: R1zZLnM5S46py1ariXMNYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="209778315"
Received: from sachowdh-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 10:13:19 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe: Don't force DRM_XE_DEBUG_MEMIRQ for SR-IOV debug
Date: Thu,  2 Oct 2025 19:13:08 +0200
Message-ID: <20251002171308.203127-1-michal.wajdeczko@intel.com>
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

For pure SR-IOV debugging there is no need to select already
separated config for the debugging of the memory based interrupts,
as the latter is also very noisy on its own. Change config order
and use a weak reverse dependency instead.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 87902b4bd6d3..01227c77f6d7 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -40,6 +40,17 @@ config DRM_XE_DEBUG_VM
 
 	  If in doubt, say "N".
 
+config DRM_XE_DEBUG_SRIOV
+	bool "Enable extra SR-IOV debugging"
+	default n
+	imply DRM_XE_DEBUG_MEMIRQ
+	help
+	  Enable extra SR-IOV debugging info.
+
+	  Recommended for driver developers only.
+
+	  If in doubt, say "N".
+
 config DRM_XE_DEBUG_MEMIRQ
 	bool "Enable extra memirq debugging"
 	default n
@@ -51,17 +62,6 @@ config DRM_XE_DEBUG_MEMIRQ
 
 	  If in doubt, say "N".
 
-config DRM_XE_DEBUG_SRIOV
-	bool "Enable extra SR-IOV debugging"
-	default n
-	select DRM_XE_DEBUG_MEMIRQ
-	help
-	  Enable extra SR-IOV debugging info.
-
-	  Recommended for driver developers only.
-
-	  If in doubt, say "N".
-
 config DRM_XE_DEBUG_MEM
 	bool "Enable passing SYS/VRAM addresses to user space"
 	default n
-- 
2.47.1

