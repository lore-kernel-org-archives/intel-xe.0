Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5B6C46CD4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C37A10E3FB;
	Mon, 18 Dec 2023 19:01:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA02410E39F
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 19:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702926047; x=1734462047;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hArR9AKPvWIDS9gZMe5xInYRMm+BUhMaYsd3D1rOE4I=;
 b=lVpZrSSGae+HV6h9e20+beRFlKsmKzrzTtGsiQX9PQ1nGVTJSr0sWGPz
 5WfuOfYdOFIIKd4kZf/oFT6mpO9iwnKPmCry4ikDEOq7RDSFeQRc/qOuq
 hWaL7xENg3Zu/PgOwM6aPeoF9dld/L5twJIhDIqlgjxqmlSbte1yPCptW
 fnD5T4nYeW6S5fa6CH62hqHszwnUBUYYberAMKPPmQx0Ai6Nzxq0O9mAC
 q6NhIlpdN/mpmR3DZdrDhgGAxgdOJgxlqfdR0fQcX/vhd9nEU+tuxgBGm
 LwfklQKIO/vO40AjhIadXqQY9v+MwX5q94TbtDuMOR2XrrNiKKSsja2yh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="461984330"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="461984330"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:53:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="779157434"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="779157434"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.130.107])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:53:54 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 04/10] drm/xe: Update definition of GT_INTR_DW
Date: Mon, 18 Dec 2023 17:53:38 +0100
Message-Id: <20231218165344.458-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231218165344.458-1-michal.wajdeczko@intel.com>
References: <20231218165344.458-1-michal.wajdeczko@intel.com>
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

Add bits definitions that we will be using in upcoming patch.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Link: https://lore.kernel.org/r/20231214185955.1791-5-michal.wajdeczko@intel.com
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 1dd361046b5d..6aaaf1f63c72 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -430,6 +430,15 @@
 #define   VOLTAGE_MASK				REG_GENMASK(10, 0)
 
 #define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
+#define   INTR_GSC				REG_BIT(31)
+#define   INTR_GUC				REG_BIT(25)
+#define   INTR_MGUC				REG_BIT(24)
+#define   INTR_BCS8				REG_BIT(23)
+#define   INTR_BCS(x)				REG_BIT(15 - (x))
+#define   INTR_CCS(x)				REG_BIT(4 + (x))
+#define   INTR_RCS0				REG_BIT(0)
+#define   INTR_VECS(x)				REG_BIT(31 - (x))
+#define   INTR_VCS(x)				REG_BIT(x)
 
 #define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
 #define VCS_VECS_INTR_ENABLE			XE_REG(0x190034)
-- 
2.25.1

