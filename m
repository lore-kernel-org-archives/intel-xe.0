Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CC2C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 19:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C78E10E552;
	Tue, 16 Jan 2024 19:50:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9C310E552
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 19:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705434621; x=1736970621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y4EY5eJ/2SMbrYFcmS5c4ajsYJBsMgCaznrEWDgZzO4=;
 b=aFSrt66OE+/5BQVFtStLibFvVMJvxXQ13z2G9dSoL61exkSrJRUGtTRW
 iSsuGR/u9xaphiaJMwDTpzbKyrBXnzWPJr0jEs7GyqS6cG9RkZsjqmnuN
 8XR6w9mIHgstLDp15uO7ZG0buEz88Pk/qAFfi2BKBwEXYGN1UJElA+y2o
 liDIhxPZrGNIoeids+nKsGbcZ8lVumUHoxLlStbmLEs45BbJHUiSqUM/G
 m9az7okNDpuqIdWlYjqzk1YcjRtb2QO1fj0M0CI9jvFZuyisFq6CvE3es
 MKH17ixTVpebqIt++PtCbwjqKRn01qTECOEKAiBtBLbcqeEqM3oadHUFy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="403718298"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="403718298"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 11:50:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="760298414"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="760298414"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 11:50:19 -0800
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/1] drm/xe: correct the calculation of remaining size
Date: Tue, 16 Jan 2024 11:52:51 -0800
Message-Id: <20240116195251.651321-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240116195251.651321-1-fei.yang@intel.com>
References: <20240116195251.651321-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

In function write_pgtable, the calculation of chunk in the do-while
loop is wrong, we should always compare against remaining size instead
of the total size update->qwords.
Also, when performing dword writes, dword length can be any value
from 2 to 3fe, always adding 1 is wrong.

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index c74ceb550dce..8058eb090e5d 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -36,7 +36,7 @@
 #define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
 #define   MI_SDI_GGTT			REG_BIT(22)
 #define   MI_SDI_LEN_DW			GENMASK(9, 0)
-#define   MI_SDI_NUM_DW(x)		REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
+#define   MI_SDI_NUM_DW(x)		REG_FIELD_PREP(MI_SDI_LEN_DW, (x > 1)? x : 2)
 #define   MI_SDI_NUM_QW(x)		(REG_FIELD_PREP(MI_SDI_LEN_DW, 2 * (x) + 3 - 2) | \
 					 REG_BIT(21))
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 44725f978f3e..d5392cbbdb49 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1116,7 +1116,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 	do {
 		u64 addr = ppgtt_ofs + ofs * 8;
 
-		chunk = min(update->qwords, MAX_PTE_PER_SDI);
+		chunk = min(size, MAX_PTE_PER_SDI);
 
 		/* Ensure populatefn can do memset64 by aligning bb->cs */
 		if (!(bb->len & 1))
-- 
2.25.1

