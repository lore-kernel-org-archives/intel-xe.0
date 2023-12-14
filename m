Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292BAC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 19:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AA210E218;
	Thu, 14 Dec 2023 19:02:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E2810E28D
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 19:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702580449; x=1734116449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YhVd4AwAU1vBwOazYy/N2L6xVP3f7nexCOgPyULlldM=;
 b=SlRtlqMkEh82V1K+1a3GXGxaDQQTStcH6GQXdQXC8zNjrx918HU9meK6
 bY6YCYhYxmpJvg95Ad92fD3j3CBFo4lhkGygsWxBRgLQyjVjNbO1N/1w7
 8O/Qw5Yt7H22aR8Sz2taEVb3jVV5seV0p2XAh0egND/91b9UrnsMklZqy
 xi3rz978r7ixccdKwxQe0Avywo7u7ffbyD8ZmT2rCvsC92lV/sEGdAXUS
 BXyThqbJOBmLmfhouUG2nva9v8nLKecUjVigFegv8PzFFLy4JT1ksTZWG
 5RV6NpGJTe5Ok5/TjRcbAeB5Y/pNTUGLVN/igk8o++R6A/zARgVMZgVos A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="399006381"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="399006381"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:00:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="15964777"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.198])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:00:19 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 03/10] drm/xe: Update LRC context layout definitions
Date: Thu, 14 Dec 2023 19:59:48 +0100
Message-Id: <20231214185955.1791-4-michal.wajdeczko@intel.com>
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

The new memory based interrupt processing uses additional entries
in the context.  Add required definitions.

Bspec: 45585, 60184
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 4be81abc86ad..1825d8f79db6 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -14,4 +14,13 @@
 #define CTX_PDP0_UDW			(0x30 + 1)
 #define CTX_PDP0_LDW			(0x32 + 1)
 
+#define CTX_LRM_INT_MASK_ENABLE		0x50
+#define CTX_INT_MASK_ENABLE_REG		(CTX_LRM_INT_MASK_ENABLE + 1)
+#define CTX_INT_MASK_ENABLE_PTR		(CTX_LRM_INT_MASK_ENABLE + 2)
+#define CTX_LRI_INT_REPORT_PTR		0x55
+#define CTX_INT_STATUS_REPORT_REG	(CTX_LRI_INT_REPORT_PTR + 1)
+#define CTX_INT_STATUS_REPORT_PTR	(CTX_LRI_INT_REPORT_PTR + 2)
+#define CTX_INT_SRC_REPORT_REG		(CTX_LRI_INT_REPORT_PTR + 3)
+#define CTX_INT_SRC_REPORT_PTR		(CTX_LRI_INT_REPORT_PTR + 4)
+
 #endif
-- 
2.25.1

