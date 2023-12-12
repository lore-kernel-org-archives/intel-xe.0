Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24412C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 21:01:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A1A10E685;
	Tue, 12 Dec 2023 21:01:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CF210E69D
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 21:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702414885; x=1733950885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IvR290jebQ0OyoNi6VK9VQlYVZq0BMeZ8h7ulEBuVWI=;
 b=BgpXyjmGCkdc49vCnzOUo2Eblzp9ioYHQ6Vcps9vN8A/KsZxzZH2jvU8
 j8LGrVspq6MsOem2NVRYNCohYQ/FnLdnHxjLW73sUC8buaIRZLwiXAKR7
 9WhHTLiUrbu5RRreSn9O6znIkstND8O/q9lKYUmZCTUSLabpqkxGDJjSQ
 7WWMesAdZgMqxVpNiwctXcxnXyKvYPhcOAIzIbzlQQqYfZN74yW8F79g4
 jjzdLLisIEZ+du7MoW7tthZlT7F4Y+Fhlfj6JigYFrJZBEmepN6cG2Y1v
 e4S4hRLiqVVgGbqhfPOIVyY4JxeP0r7fjKw4CJFMBKBJqI0miwmKj2+jP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="397654595"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="397654595"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:01:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="917417176"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="917417176"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.218])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:01:18 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 05/10] drm/xe: Update definition of GT_INTR_DW
Date: Tue, 12 Dec 2023 22:00:49 +0100
Message-Id: <20231212210054.1747-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231212210054.1747-1-michal.wajdeczko@intel.com>
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
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

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 5f5a72e9d0d8..f2562834ca59 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -437,6 +437,15 @@
 #define   VOLTAGE_MASK				REG_GENMASK(10, 0)
 
 #define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
+#define   INTR_GSC				REG_BIT(31)
+#define   INTR_GUC				REG_BIT(25)
+#define   MTL_INTR_MGUC				REG_BIT(24)
+#define   XEHPC_INTR_BCS8			REG_BIT(23)
+#define   INTR_BCS(x)				REG_BIT(15 - (x))
+#define   INTR_CCS(x)				REG_BIT(4 + (x))
+#define   INTR_RCS0				REG_BIT(0)
+#define   INTR_VECS(x)				REG_BIT(31 - (x))
+#define   INTR_VCS(x)				REG_BIT(x)
 
 #define GUC_SG_INTR_ENABLE			XE_REG(0x190038)
 #define   ENGINE1_MASK				REG_GENMASK(31, 16)
-- 
2.25.1

