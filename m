Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1BFEEB570
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 22:52:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E725610E002;
	Fri,  8 Sep 2023 22:52:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF6210E002
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 22:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694213551; x=1725749551;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ubgygn3EJtrDvYd+8wLx+o1xfg3+dRyYdrSjTZuHK+M=;
 b=kxxSXvV84aXpLlcUzHaa7y6MAjNRFkn7Yqb9Fbkg+Y18XqidFaBm0i3W
 IHqkrU1+6NYLmv3qAVICN1nHkcqTCBeS/CoA5mSqNB6gDm5Bm7/8APFhR
 5eqeyLRlRq8tDLqDASYSraQcIE8pwncnUBm4IZYWibCfdO0GgrUBmpLrD
 BskTcjSSzl1zAIzw8B2r2H5ha7xCNpQVvHlAY8kGFjHKU4+bZaMJfaFm/
 KPztt3Xi9MT8bTfs5xMOVhIo26JcGSBdlbYwphrdTB7OBR3621pwiMW9q
 yNipWn3rceNLCA8AikeID2M23h6bV3vIq6gaO1sjGAv1SSvCBeugMsTe5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="368027283"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; d="scan'208";a="368027283"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 15:52:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="857571676"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; d="scan'208";a="857571676"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 15:52:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  8 Sep 2023 15:52:27 -0700
Message-Id: <20230908225227.1276610-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/mmio: Account for GSI offset when
 checking ranges
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

Change xe_mmio_in_range() to use the same logic to account for the GT's
adj_offset as the read and write functions. This is needed when checking
ranges for the MCR registers if the GT has an offset to adjust.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 4 ++--
 drivers/gpu/drm/xe/xe_mmio.h   | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index e74d3c5743c8..77925b35cf8d 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -448,7 +448,7 @@ static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
 			continue;
 
 		for (int i = 0; gt->steering[type].ranges[i].end > 0; i++) {
-			if (xe_mmio_in_range(&gt->steering[type].ranges[i], reg)) {
+			if (xe_mmio_in_range(gt, &gt->steering[type].ranges[i], reg)) {
 				*group = gt->steering[type].group_target;
 				*instance = gt->steering[type].instance_target;
 				return true;
@@ -459,7 +459,7 @@ static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
 	implicit_ranges = gt->steering[IMPLICIT_STEERING].ranges;
 	if (implicit_ranges)
 		for (int i = 0; implicit_ranges[i].end > 0; i++)
-			if (xe_mmio_in_range(&implicit_ranges[i], reg))
+			if (xe_mmio_in_range(gt, &implicit_ranges[i], reg))
 				return false;
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index cd9fe08ccf4a..9e0fd4a6fb29 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -127,9 +127,13 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
 int xe_mmio_ioctl(struct drm_device *dev, void *data,
 		  struct drm_file *file);
 
-static inline bool xe_mmio_in_range(const struct xe_mmio_range *range,
+static inline bool xe_mmio_in_range(const struct xe_gt *gt,
+				    const struct xe_mmio_range *range,
 				    struct xe_reg reg)
 {
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
 	return range && reg.addr >= range->start && reg.addr <= range->end;
 }
 
-- 
2.40.1

