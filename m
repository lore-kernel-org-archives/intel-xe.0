Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD44C636CC
	for <intel-xe@archiver.kernel.org>; Wed, 15 Feb 2023 14:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB1C10E120;
	Wed, 15 Feb 2023 14:03:47 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6960310E120
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Feb 2023 14:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676469824; x=1708005824;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VbAWOfYZP97EjEviLPFa8/6TBDHz2Peg9e6L22SnaRA=;
 b=fZQIyvpZu2CPngJoIaK0GKZOvPUGNvBZ1PrngLkQzhg0VCPN4h8Qr2HE
 bkBfP4B1fNUv/omI1XFDyjhP9Z7wMOA9eaW6Z1iOtK0HJyBIFvjLGaowU
 dnJcgEc/15UdYwsg4CrnEVXPyuM1e6YxGIiR++lrMO7fTwO02w8N+jrLW
 mCbt5Sn3L6odMHqYvF7v7keAgpBYL4w2Katf5vBDyAqKda0rDx/MIO98d
 byZiqb+ZS7sopPP322L6sF/PP9baO8UQZ/UXd+6IGH6KVzUhEGaA6UGnn
 V9xTnTdKGroFVETmw62BUFdrs8Z/5knHS00r7icVWW/SWlsi4p2ao7gda Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="311061424"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="311061424"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 06:03:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="647178648"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="647178648"
Received: from anjanasu-mobl1.gar.corp.intel.com (HELO
 bvivekan-mobl.fritz.box) ([10.215.119.202])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 06:03:41 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Feb 2023 19:33:29 +0530
Message-Id: <20230215140329.402916-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix wopcm size
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The wopcm size returned by xe_wopcm_size function is used in calculating
the GuC wopcm base offset and the GuC wopcm size. It is also used to
find the size of the wopcm space to be reserved at the bottom of the
GGTT address space. So it is the per-GT wopcm size and not the total
wopcm area used by all GTs.
Fix the wopcm size to 2MB which is the wopcm size per-GT for platforms
above Gen11.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_wopcm.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index 8fe182afa06c..a88d02357cb6 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -46,12 +46,6 @@
  */
 
 /* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
-#define DGFX_WOPCM_SIZE			SZ_4M	/* FIXME: Larger size require
-						   for 2 tile PVC, do a proper
-						   probe sooner or later */
-#define MTL_WOPCM_SIZE			SZ_4M	/* FIXME: Larger size require
-						   for MTL, do a proper probe
-						   sooner or later */
 #define GEN11_WOPCM_SIZE		SZ_2M
 /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
 #define WOPCM_RESERVED_SIZE		SZ_16K
@@ -178,9 +172,7 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
 
 u32 xe_wopcm_size(struct xe_device *xe)
 {
-	return IS_DGFX(xe) ? DGFX_WOPCM_SIZE :
-		xe->info.platform == XE_METEORLAKE ? MTL_WOPCM_SIZE :
-		GEN11_WOPCM_SIZE;
+	return GEN11_WOPCM_SIZE;
 }
 
 /**
-- 
2.34.1

