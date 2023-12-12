Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1C6C38147
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 21:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F1A10E6AC;
	Tue, 12 Dec 2023 21:01:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99A510E69D
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 21:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702414884; x=1733950884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NR8tpqXZqAgrDKyi7cEw+ufkdGIYssXrCw+prHsUtT4=;
 b=XRUFnnudPREGTLov4O1VEyExGo4ctMvocO8lVwh2OYDbWnCckvQLKKdg
 mXiVRdVy8tieRbIoWtiXUSRImF62t3tzQj0HRyj2RVgJjYnx1HHPzY5la
 fH433Erdh2AvhbRbCVnrX5kFYrZQbdxK/tC6/9mart1oD/tUkDiHLecF5
 2lunNaaRH2ZamnCQ2GNU+eCYNKs9dWqfe55/dhaxo5gEEu6jDEdHA2qqx
 K4GANaCQpVZBD0mvUdI3GWNbLCMSU1olUMvjxWaS84x32+ZKOpSAiXsLL
 ++5gulEMircY1olRvXEZP0R9pCPJFsffbOyKlXshwRbuW3NRpyTGZnVve g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="397654591"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="397654591"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:01:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="917417164"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="917417164"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.218])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:01:16 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 04/10] drm/xe: Update LRC context layout definitions
Date: Tue, 12 Dec 2023 22:00:48 +0100
Message-Id: <20231212210054.1747-5-michal.wajdeczko@intel.com>
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

The new memory based interrupt processing uses additional entries
in the context.  Add required definitions.

Bspec: 45585
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

