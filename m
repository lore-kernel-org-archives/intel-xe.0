Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0079CC3DA64
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 02:01:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CC510E8DA;
	Fri,  2 Aug 2024 02:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JZGmL1Ml";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AA910E8DA
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Aug 2024 02:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722564067; x=1754100067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DF/WCnrc25kqAVNyje9pmakI7SpcHsDmBASavNpWrP0=;
 b=JZGmL1MlpK0b8YRQ1LV5eC5SNGHzw3zNE6BPxkfP9SM1W773PUmMxuXj
 gjwN1DLNkR5LQBpI7KSZYTTTX9fYRiylxUEL0Z6+YDNvUdbTTXk+AF0xG
 mtXCXewMR7AHjusuVBQXtyrDo7nMY6rgrClUom1liNZBr7vbxS6IMEcqW
 qM8uWax+Oc5UvLHl6LOU8ZJrGNnyQln8ZOcx3A5qxN+doR90ATJcgFFBf
 bt2xt4JExF6Q4jGBmaZ1A4wIy9yVVmxHX01s+VZplOB68NH6scLC5yXXw
 PxVLsWhRtEmP6h3RKiqP3YP2K8wIxT3lrdVAW9BOOT/n20RAOsxeBHt7l w==;
X-CSE-ConnectionGUID: 9/2K7XY8RruVsuLP/W9Mvw==
X-CSE-MsgGUID: ElE8K4u5Q9G0C1uv7X/DLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24353853"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="24353853"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 19:01:06 -0700
X-CSE-ConnectionGUID: W04dzB/LRLGIXjg03M7Ypw==
X-CSE-MsgGUID: E7acVyhFRcG/m1fU6xqGdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="60083558"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.155])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 19:01:05 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, tejas.upadhyay@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH v3 1/1] drm/xe/xe2: Introduce performance changes
Date: Fri,  2 Aug 2024 07:12:03 -0700
Message-Id: <c2dd753fdc55df6a6432026f2df9c2684a0d25c1.1722607628.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722607628.git.akshata.jahagirdar@intel.com>
References: <cover.1722607628.git.akshata.jahagirdar@intel.com>
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

Add Compression Performance Improvement Changes in Xe2

v2: Rebase

v3: Rebase, updated as per latest changes on bspec,
    Removed unnecessary default actions (Matt)
    formatting nits (Tejas)

v4: Formatting nits, removed default set action for bit 14 (Matt)

Bspec: 72161
Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 3b87f95f9ecf..c50643ab4c84 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -367,6 +367,9 @@
 #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
 #define   XEHP_LNESPARE				REG_BIT(19)
 
+#define L3SQCREG2				XE_REG_MCR(0xb104)
+#define   COMPMEMRD256BOVRFETCHEN		REG_BIT(20)
+
 #define L3SQCREG3				XE_REG_MCR(0xb108)
 #define   COMPPWOVERFETCHEN			REG_BIT(28)
 
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 77d4eec0118d..3817b7743b0c 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -45,6 +45,11 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
 	},
+	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(SET(L3SQCREG2,
+			     COMPMEMRD256BOVRFETCHEN))
+	},
 	{}
 };
 
-- 
2.34.1

