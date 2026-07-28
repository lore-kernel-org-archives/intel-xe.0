Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C234BC531F9
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 09:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC7910E85E;
	Tue, 28 Jul 2026 09:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="licS0vZW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C4610E861
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 09:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785232237; x=1816768237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NIunkl3upeciajwGihdRcnDZOpMr09r/VP45OerYkqg=;
 b=licS0vZWposbNvjz5sUsF57nqooxog+CjjL6iFmfxtSnakqqZcQD+ikn
 p91hjD+IUzO33/NV6vBv/DitTJuNTWFogOYTah3wTFr6uU5Fj61k2IIi8
 /hjT/M9t3Ro0f46qU5Vb7/AaAM17TBa5RByME0zvOOniPLGxqOPCiF8ib
 FX4wRvGfOJBAHfslSXr3u1gP/YvgTCU0AsozLG+vC90wHA6xx5ukMvGoV
 kAm1OmCJMFgnB3KHdl7Pfs2Vbmmo5F0HbZYTVXFVv3j0m0CCWD/fTY5cF
 5LD0dMEgldKawVi1O1I5I65Zmnt+tPkb7B7Tny+b8gRO1LOL9BeVTwdxL g==;
X-CSE-ConnectionGUID: dl5rA6CXSTC3AYusCpW9Lg==
X-CSE-MsgGUID: YV9zhAEWRci7Gar3VmZ7sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="111357401"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="111357401"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 02:50:37 -0700
X-CSE-ConnectionGUID: U6itgd8UTNi3eCxsI+iuJg==
X-CSE-MsgGUID: gT5HdUUNSNiLDI+ABMcfvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="258387259"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by orviesa010.jf.intel.com with ESMTP; 28 Jul 2026 02:50:35 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 3/4] drm/xe/vf: Add bounds checking for queried context and
 doorbell counts
Date: Tue, 28 Jul 2026 09:50:29 +0000
Message-ID: <20260728095026.2197333-9-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728095026.2197333-6-satyanarayana.k.v.p@intel.com>
References: <20260728095026.2197333-6-satyanarayana.k.v.p@intel.com>
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

Add explicit bounds checks for context and doorbells which can detect
and reject invalid configuration data from a misconfigured or
malfunctioning PF, preventing protocol violations and protecting VF
initialization.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V3 -> V4:
 - New commit
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index e96515766081..69e531be15ed 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -15,6 +15,7 @@
 #include "abi/guc_klvs_abi.h"
 #include "abi/guc_relay_actions_abi.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
 
 #include "xe_assert.h"
 #include "xe_device.h"
@@ -581,7 +582,10 @@ static int vf_get_ctxs_cfg(struct xe_gt *gt)
 	if (unlikely(err))
 		return err;
 
-	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
+	if (num_ctxs > GUC_ID_MAX) {
+		xe_gt_sriov_err(gt, "Out of bound CTXs %u received\n", num_ctxs);
+		return -EPROTO;
+	} else if (config->num_ctxs && config->num_ctxs != num_ctxs) {
 		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
 				num_ctxs, config->num_ctxs);
 		return -EREMCHG;
@@ -607,7 +611,10 @@ static int vf_get_dbs_cfg(struct xe_gt *gt)
 	if (unlikely(err))
 		return err;
 
-	if (config->num_dbs && config->num_dbs != num_dbs) {
+	if (num_dbs > GUC_NUM_DOORBELLS) {
+		xe_gt_sriov_err(gt, "Out of bound DBs %u received\n", num_dbs);
+		return -EPROTO;
+	} else if (config->num_dbs && config->num_dbs != num_dbs) {
 		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
 				num_dbs, config->num_dbs);
 		return -EREMCHG;
-- 
2.43.0

