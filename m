Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E10BC46CD8
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6021910E3AF;
	Mon, 18 Dec 2023 19:00:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00D310E39A
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 19:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702926047; x=1734462047;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=l353Dsh3pCpy6rnxgI2l41I0MlTlWdyIWdK7KRSXJVk=;
 b=dARx0qW4+45cUiXeWICVRBWGO0tuHS2MT/ZnLwqQqyh2rg9vSYgjWHBi
 4CzVzEehKh8QMqahvytpq/YDrIKorq6rYEuV1Ntm/fV30QJ50RAp1QCwT
 SG+6Ti3MIEt7TR72P8eWwqtsPHGbWkkYJQQVW9O9TjCvV9/Eh2k0ybXDO
 oZfVbmJ4Z5IdwlfQZxHjn3gcvd0O9OojsH16k0tbBGu0B2gAewZoFMgLH
 5efjbzn3qfGNRnJmhMcXDGbrkZa4VAHgwYPyVutRQP3TUVzTiiuptT9eW
 l61pfOPNq/DtDUAdjjhNqRvzkjfwzaR9Ndq1V0x1D2iDVtRHh+K0hanOq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="461984327"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="461984327"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:53:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="779157430"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="779157430"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.130.107])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:53:53 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 03/10] drm/xe: Update LRC context layout definitions
Date: Mon, 18 Dec 2023 17:53:37 +0100
Message-Id: <20231218165344.458-4-michal.wajdeczko@intel.com>
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

The new memory based interrupt processing uses additional entries
in the context.  Add required definitions.

Bspec: 45585, 60184
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Link: https://lore.kernel.org/r/20231214185955.1791-4-michal.wajdeczko@intel.com
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

