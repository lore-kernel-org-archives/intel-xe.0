Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADF3C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 22:18:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFA110EB1A;
	Mon, 13 Jul 2026 22:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5Yxt+BG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0CD10EB1A
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 22:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783981093; x=1815517093;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iya78qfpywUlXWeNlwsS20fSyI/06VTJl17DBNv3bqU=;
 b=h5Yxt+BGuHO0wOw5vA51C2kEehePuqcQbQLHz+JUdDgNJpeLcRmE2vjb
 8XxzFJ2A851Tj1FMg1LPyBDpSKRei+8uOvfbQwdfWxU1SAY6h4mqge2V9
 rDTGD89n8Aw51fIX5wOF41iFlt87T3XDrLF0MG6x0rnu3UhR4F2Yel+Yg
 3hHQQrYk9ovErz6tIQfZ8NKEclcS52YfRkPIAsDsfyn21VcBKM/3Pcw1L
 yEtbW9phw51CmiRF7Zl2ZAl3U5u8PDTK4rrbXnfJzZZrPz9cUsc4R4soQ
 q+jWGk6O8eLgPQ4buPQB5JqOsZpt4pqtccmiJGMP8Jbq1H+q8o9isaBOk A==;
X-CSE-ConnectionGUID: a871OMOAQUKZ8z6Pq5LUMQ==
X-CSE-MsgGUID: T50qGUqjQM6ViEBkkSWJrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84453517"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84453517"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 15:18:13 -0700
X-CSE-ConnectionGUID: asUHXeuMRbWqgImHSB8XFg==
X-CSE-MsgGUID: uy4YLnmzTjaTEsghos+SQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="249311068"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 15:18:09 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/wopcm: fix WOPCM size for LNL+
Date: Mon, 13 Jul 2026 15:17:59 -0700
Message-ID: <20260713221758.3285744-2-daniele.ceraolospurio@intel.com>
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

Starting on LNL the WOPCM size is 8MB instead of 4, so we need to avoid
using the [0, 8MB) range of the GGTT as that can be unaccessible from
the microcontrollers.

Note that the proper long-term fix here is to read the WOPCM size from
the HW, but that is a more serious rework that would be difficult to
backport, so we can do that as a follow-up.

Fixes: 9c57bc08652a ("drm/xe/lnl: Drop force_probe requirement")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
I am planning to follow with the proper rework, but I'm still trying to
figure out some complexities that come in with multi-tile, so I'm
sending this on its own in the meantime to fix the bug.
---
 drivers/gpu/drm/xe/xe_wopcm.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index 900daf1d1b1b..fe65ed246775 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -49,9 +49,9 @@
  */
 
 /* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
-/* FIXME: Larger size require for 2 tile PVC, do a proper probe sooner or later */
+/* FIXME: Larger size require for some platforms, do a proper probe sooner or later */
 #define DGFX_WOPCM_SIZE			SZ_4M
-/* FIXME: Larger size require for MTL, do a proper probe sooner or later */
+#define LNL_WOPCM_SIZE			SZ_8M
 #define MTL_WOPCM_SIZE			SZ_4M
 #define WOPCM_SIZE			SZ_2M
 
@@ -179,9 +179,14 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
 
 u32 xe_wopcm_size(struct xe_device *xe)
 {
-	return IS_DGFX(xe) ? DGFX_WOPCM_SIZE :
-		xe->info.platform == XE_METEORLAKE ? MTL_WOPCM_SIZE :
-		WOPCM_SIZE;
+	if (xe->info.platform >= XE_LUNARLAKE)
+		return LNL_WOPCM_SIZE;
+	else if (IS_DGFX(xe))
+		return DGFX_WOPCM_SIZE;
+	else if (xe->info.platform == XE_METEORLAKE)
+		return MTL_WOPCM_SIZE;
+	else
+		return WOPCM_SIZE;
 }
 
 static u32 max_wopcm_size(struct xe_device *xe)
-- 
2.43.0

