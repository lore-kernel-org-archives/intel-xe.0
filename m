Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A206C6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 16:54:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E652210E0C8;
	Fri, 17 Mar 2023 16:54:10 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D5110E0C8
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 16:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679072049; x=1710608049;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q8W+gISrVBGXzGYUBBqUel8cQOPLouEazU58nBWqMDM=;
 b=mU/JOVUbPNHSzeTiWF4w44+ghb9o4GsXpxvM+qOQB9Wv679/k3t5p5wy
 qUm8395b1YhKCAOYWYDKCXmrcr+EvLyYQ8yARcve2swXUT6iSEP2Tql2Y
 t5ux0dq6iskoUPDhJqLUm1ULJcrE5eXyKhbWqaRFKCxargxcXOE3Kbje4
 8yX4GDxdxDOTo+YXrHXsXIr4LtOE/N3liNbSnlFFMSMWeqkeF02NQ78/a
 AJTLFgJV0eYY6ekGr+VWHPkaDMMKPD8NB6bii9jcI+lE70xXH51mpptTe
 rRjK4W/DGEovU85aOmyyXg882Yj5Mv1BIzwF2dZAlhV2ZocBGBVoBly7A w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="322159224"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="322159224"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 09:54:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="657618872"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="657618872"
Received: from ambatirx-mobl2.gar.corp.intel.com (HELO
 bvivekan-mobl.fritz.box) ([10.215.117.35])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 09:54:07 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Mar 2023 22:23:35 +0530
Message-Id: <20230317165335.1014314-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Use max wopcm size when validating the
 preset GuC wopcm size
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

When the GuC wopcm base and size registers are populated by BIOS/IFWI,
validate the parameters against the maximum allowed wopcm size.

Bpsec: 44982

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_wopcm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index 0f2485d9d9af..d55469e941bf 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -54,6 +54,8 @@
 						   for MTL, do a proper probe
 						   sooner or later */
 #define GEN11_WOPCM_SIZE		SZ_2M
+
+#define GEN12_MAX_WOPCM_SIZE            SZ_8M
 /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
 #define WOPCM_RESERVED_SIZE		SZ_16K
 
@@ -226,6 +228,13 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
 	if (locked) {
 		drm_dbg(&xe->drm, "GuC WOPCM is already locked [%uK, %uK)\n",
 			guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
+		/*
+		 * When the GuC wopcm base and size are preprogrammed by
+		 * BIOS/IFWI, check against the max allowed wopcm size to
+		 * validate if the programmed values align to the wopcm layout.
+		 */
+		wopcm->size = GEN12_MAX_WOPCM_SIZE;
+
 		goto check;
 	}
 
-- 
2.34.1

