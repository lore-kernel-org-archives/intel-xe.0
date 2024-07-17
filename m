Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4DDC41513
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 05:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78B410E925;
	Wed, 17 Jul 2024 05:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iv3G8pxm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095EE10E91E
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 05:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721193719; x=1752729719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/iw/8P1zrApqeGbCeZyB1nLKxd4owRv50/2HvyqnhwA=;
 b=Iv3G8pxmrTWrP3RTBRkWBX9sosQ+tfijTfljKacFbV4mVyrH42CfIDsU
 v3e3tBObxGjvjFWQVwXIiT2d3kfmre1qMxxzl/nKICO/OZTTwYP2t0xBV
 GVGZ3LXdfvwzQAtNSylQqkFOLO9xT9HYVYpUTOSLeSyrcQnqQN/SZ9Ek5
 ELEkkVxqnNlbbSVeGLbnmaQ82M5oTe/DqMnfT+Mtt1y1oXRKNVObu6SeU
 Tp43L7bWwkwUWnvX/+th9+X/id8JW0h+IkRJjttcV2ybaG5v9vPDU7+Zn
 1l5bhy45wJnlTmx2cxuRSPJbGCPr8255ATj2uuA3369M11/SIJxKDwOed g==;
X-CSE-ConnectionGUID: 3/LcYbsSQ4uRWgOnKqvrng==
X-CSE-MsgGUID: WZkJYCOSR1uOaT5ZyrKpBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29281198"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="29281198"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:21:59 -0700
X-CSE-ConnectionGUID: OcbiXztVSGqZ5kJCQivgWA==
X-CSE-MsgGUID: RWj3IpIrT7anr7dIek6V2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="55124956"
Received: from dut1107bmgfrd.igk.intel.com ([10.211.177.88])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:21:53 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com, matthew.brost@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 7/8] drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx
Date: Wed, 17 Jul 2024 05:21:32 +0000
Message-Id: <a14aa73c0484bc7d7a2f725af48dc11094eeff22.1721193361.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721193361.git.akshata.jahagirdar@intel.com>
References: <cover.1721193361.git.akshata.jahagirdar@intel.com>
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

In xe2+ dgfx, we don't need to handle the copying of ccs
metadata during migration. This test validates the ccs data post
clear and copy during evict/restore operation. Thus, we can skip
this test on xe2+ dgfx.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 692e1b46b9cf..e2e0ea24757a 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -162,6 +162,12 @@ static int ccs_test_run_device(struct xe_device *xe)
 		return 0;
 	}
 
+	/* For xe2+ dgfx, we don't handle ccs metadata */
+	if (GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe)) {
+		kunit_info(test, "Skipping on xe2+ dgfx device.\n");
+		return 0;
+	}
+
 	xe_pm_runtime_get(xe);
 
 	for_each_tile(tile, xe, id) {
-- 
2.34.1

