Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E262C3DA7A
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 19:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42E110E28D;
	Thu, 14 Dec 2023 19:02:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786DD10E0EB
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 19:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702580449; x=1734116449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YTKgVpjZl6e1Jx1RvTiR+G8GYYsL5Hh6tlI1IfiqCFk=;
 b=IU/sESsDhK5onVfHBKfYIezkVfqXV0RXcd4OevSI6YMWnEmQ/SOivLqx
 9sQwbQ37QzCd+lj5eFDqZ2ZVrJb7nPow5FeTwJbmebru4TLvmAE1uGF7B
 nMqAKPoch9zO1N4SwB6CVMIFQHhbRZGNN/yjelobblrgsOnJVyeuW1Rva
 UkbWjxHHdU9CRsdGPgfXxA7W7rob9eyi3ueIiZ7P2TbUTrFG8KTGqohwS
 BgevIVB557tkB+R184uBAZCZuLJhpDVyVfk3fKyVqqA0eVLh3Rf30ExII
 E3JoeXW2j7t94Wtj34fFLWDZe/NVeccrUBbnZDorQD5nGQMhg81cA7ePe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="399006389"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="399006389"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:00:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="15964781"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.198])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:00:21 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 04/10] drm/xe: Update definition of GT_INTR_DW
Date: Thu, 14 Dec 2023 19:59:49 +0100
Message-Id: <20231214185955.1791-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231214185955.1791-1-michal.wajdeczko@intel.com>
References: <20231214185955.1791-1-michal.wajdeczko@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add bits definitions that we will be using in upcoming patch.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: drop MTL/XEHPC prefixes (Matt)
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index f5bf4c6d1761..cf7e4fb5837d 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -440,6 +440,15 @@
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
 
 #define GUC_SG_INTR_ENABLE			XE_REG(0x190038)
 #define   ENGINE1_MASK				REG_GENMASK(31, 16)
-- 
2.25.1

