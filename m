Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A4AC77B7A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 18:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171D610E61C;
	Fri,  2 Jun 2023 18:52:18 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0EF610E61C;
 Fri,  2 Jun 2023 18:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685731936; x=1717267936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0YJQbFFN1TXRkH2uyffi/68HSsMzSFimf0mb6Va2RYY=;
 b=J+YdBzFYt8Vgxn4/IQ3+kPBtd1N8GbQrAo/tdqqRmt+XZVkCyiE3Y5yi
 2Yehh9VG7BbiUtNi1WbAzulbfjJrUxC1PpV6oqJw1vkCysLeHpg1De42Z
 Xdp/M2RQ+k+2H6+KDwtn2VVHbQ13JIMDEQ7COkPiqCVVje3iDErBiu+26
 dmzwuCxNNOtuWDYFmgaEosKuGtzY2n2D8wU8AHdGuRbZxhSVPxY+hIG7a
 vHxa7hbNLj+U8mAjgQHHTGe1gkoRrb2KilfRZhD7GBCMhEvW8mUy1Vr2H
 JTgfciUK4wzbWazrTKtkJK0aX9Vih+DIzEY6FJZSPmsSmeKRgEKP2xwdE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="442316801"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="442316801"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 11:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="707953995"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="707953995"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga002.jf.intel.com with ESMTP; 02 Jun 2023 11:52:14 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 11:52:13 -0700
Message-Id: <20230602185213.2635921-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1] drm/xe/guc: Fix h2g_write usage of
 GUC_CTB_MSG_MAX_LEN
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
Cc: dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In the ABI header, GUC_CTB_MSG_MIN_LEN is '1' because
GUC_CTB_HDR_LEN is 1. This aligns with H2G/G2H CTB specification
where all command formats are defined in units of dwords so that '1'
is a dword. Accordingly, GUC_CTB_MSG_MAX_LEN is 256-1 (i.e. 255
dwords). However, h2g_write was incorrectly assuming that
GUC_CTB_MSG_MAX_LEN was in bytes. Fix this.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 137c184df487..8e9df6052b02 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -401,7 +401,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct guc_ctb *h2g = &ct->ctbs.h2g;
-	u32 cmd[GUC_CTB_MSG_MAX_LEN / sizeof(u32)];
+	u32 cmd[GUC_CTB_MSG_MAX_LEN];
 	u32 cmd_len = len + GUC_CTB_HDR_LEN;
 	u32 cmd_idx = 0, i;
 	u32 tail = h2g->info.tail;
@@ -409,7 +409,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 							 tail * sizeof(u32));
 
 	lockdep_assert_held(&ct->lock);
-	XE_BUG_ON(len * sizeof(u32) > GUC_CTB_MSG_MAX_LEN);
+	XE_BUG_ON(len > GUC_CTB_MSG_MAX_LEN - 1);
 	XE_BUG_ON(tail > h2g->info.size);
 
 	/* Command will wrap, zero fill (NOPs), return and check credits again */

base-commit: 9f49c413b187c00f223eaf1e8dbe2c1a97c9954b
-- 
2.39.0

