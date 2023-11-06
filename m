Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDC5C4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD9810E2CE;
	Mon,  6 Nov 2023 11:22:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F4110E2CE
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269753; x=1730805753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hQnwzaF7GMF5KK/uHhaUf2UstjOKWKZydPe80dKoW6Y=;
 b=Yf/OsBfLMdjhGjFca1xBRkdMha9BxuwhBRq87STMZV9eLCMYwIpzpqBM
 cjn3Une4RzWgmqxBjZIanrs92ct4uThHSaYC85xVQseh59cxVxng94xLl
 OjPicDJgSzQRwHliGdhlvEZ/OIelgFS748JHLFjeeJWKmkRr2piHjGNfI
 h5YxtlrRGa6zNo6TH0a6sP9zVi4pLtSHWyTvZgRGOAh/DO5/tAueMCiJP
 /sUmYBJPPCXS9NimZgA3ZkV6j+KLCIU2r75GZLsIKxA/dbsOL8H7shDCF
 leP1Ap6hoRLxIv8d4QM/loKlk5nYe1as8GcOp3l7n+vcq+NuLUVziWHMM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646779"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646779"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411557"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411557"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:18 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:25 +0200
Message-Id: <20231106111845.2333093-6-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 05/25] drm/xe: define XE_MAX_[DSS|EU]_FUSE_BITS
 globally
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Move XE_MAX_[DSS|EU]_FUSE_BITS definitions to header.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 3 ---
 drivers/gpu/drm/xe/xe_gt_types.h    | 6 ++++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index a8d7f272c30a..e973eeaac7f1 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -11,9 +11,6 @@
 #include "xe_gt.h"
 #include "xe_mmio.h"
 
-#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
-#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
-
 static void
 load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d3f2793684e2..26cacacb63c9 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -25,10 +25,12 @@ enum xe_gt_type {
 };
 
 #define XE_MAX_DSS_FUSE_REGS	3
+#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
 #define XE_MAX_EU_FUSE_REGS	1
+#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
 
-typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
-typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
+typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
+typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(XE_MAX_EU_FUSE_BITS)];
 
 struct xe_mmio_range {
 	u32 start;
-- 
2.34.1

