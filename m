Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F37E71D58
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 21:36:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0070110E13D;
	Fri, 29 Sep 2023 21:36:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E0910E144
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 21:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696023389; x=1727559389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6L1sBajXtMXKJkH2reUvlSbZeoRdJmiW0GDxpgvXOjk=;
 b=WOaDAfU1cRnntAfQeBw0ST8GoP5UeeMbNb6tJQGDgcEP5QnbeWsTf5wt
 KGtnXv4oXWXLgFHEWK9Bq37UxA5HdJdveQwNNtdQbbe8q6L6VdQllE9ru
 ch0wMgLH1hdhTOMJRrYJjEjzqCecACdMHvwr+Zixr0R3mH2z7aPLHW+Od
 rpL+cBRJ6ZOtgzzszhXnGCQ23CHXredZ4GOLRXTBAM78rj8dSNy15gEZt
 9sQiJQK/spOhL9AMooy5+5RJCcRlYyg6IBoqZlTSWGRuYWpbliwiHEY4U
 tWap9F6rkzS3eUGpic2iVHFIirIO/nYYaqePboqjCj/wnN1iuoh6lwqnx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="367440744"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="367440744"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 14:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="726709918"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="726709918"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 14:36:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Sep 2023 14:36:39 -0700
Message-Id: <20230929213640.3189912-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230929213640.3189912-1-lucas.demarchi@intel.com>
References: <20230929213640.3189912-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/4] drm/xe/xe2: Set tile y type in
 XY_FAST_COPY_BLT to Tile4
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Haridhar Kalvala <haridhar.kalvala@intel.com>

Set bits 30 and 31 of XY_FAST_COPY_BLT's dword1 for XeHP and above.

Destination or source being Y-Major is selected on dword0 and there's
nothing to set on dword1. According to the bspec for Xe2,
"Behavior is undefined when programmed the value 0". Also for XeHP,
the only value allowed in those bits is 0b11, not being possible to
select "Legacy Tile-Y" anymore, only the newer Tile4.

So, unconditionally set those bits for graphics IP 12.50 and above.

v2: Reword commit message and extend it to graphics version >= 12.50
    (Matt Roper)

Bspec: 57567
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 2 ++
 drivers/gpu/drm/xe/xe_migrate.c           | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 1fdf2e4f1c9f..cc7b56763f10 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -57,6 +57,8 @@
 
 #define XY_FAST_COPY_BLT_CMD		(2 << 29 | 0x42 << 22)
 #define   XY_FAST_COPY_BLT_DEPTH_32	(3<<24)
+#define   XY_FAST_COPY_BLT_D1_SRC_TILE4	REG_BIT(31)
+#define   XY_FAST_COPY_BLT_D1_DST_TILE4	REG_BIT(30)
 
 #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
 #define   PVC_MEM_SET_CMD_LEN_DW	7
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 2e6ce2daf414..316773e924e0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -543,12 +543,19 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
 		      u64 src_ofs, u64 dst_ofs, unsigned int size,
 		      unsigned int pitch)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+
 	xe_gt_assert(gt, size / pitch <= S16_MAX);
 	xe_gt_assert(gt, pitch / 4 <= S16_MAX);
 	xe_gt_assert(gt, pitch <= U16_MAX);
 
 	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
-	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch;
+	if (GRAPHICS_VERx100(xe) >= 1250)
+		bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch |
+				    XY_FAST_COPY_BLT_D1_SRC_TILE4 |
+				    XY_FAST_COPY_BLT_D1_DST_TILE4;
+	else
+		bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch;
 	bb->cs[bb->len++] = 0;
 	bb->cs[bb->len++] = (size / pitch) << 16 | pitch / 4;
 	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
-- 
2.40.1

