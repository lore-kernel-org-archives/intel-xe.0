Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B150CD128A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 21:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C81112F02;
	Wed,  3 Apr 2024 21:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsXwGKJz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9508D112F02
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 21:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712178134; x=1743714134;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6TzGfLgAQIPv5dUVw54w9HPKoCNf0qR/jaebdcNSEZE=;
 b=RsXwGKJzCU15sv0cGt+IbqhuvPP1UAFAe3qadEQWX4iR1FOKKA9mi8yi
 SMTsO89sfnjh8uj+6IYeqf20/gsLUlOzmmqvWb0ZJPQ+jc+LQM2FIMNfF
 7wEUnSWlqaPe4SJ2tS6Wi9DmZHRpkdJ9X0ZkCQ8o8ednrJZrAjETXo41/
 y+AEYPZt6/xGHPuYZH77KDx51QTkEL3afybXfolDwH4kkhxPKBWrOKcTK
 bWNuvRMZZEnf31ytr/y7HCVMMDF3/UiQ3iepfnDKVSAac9RyxKfR6QuBD
 fNg3hvnhejXr5vAEIpBfNizmD5VS8tnSFC9K3cq4N/OWB894nK5Vary6O A==;
X-CSE-ConnectionGUID: sffHjm71Q8S3OyjoPg7idQ==
X-CSE-MsgGUID: X2ypYxYpSIy6tWiO93p4Ug==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18595118"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18595118"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 14:02:12 -0700
X-CSE-ConnectionGUID: KrC0QPfTTM6v8yiBWw0uQg==
X-CSE-MsgGUID: YqVfHDbgS52Tcd+2RsHi8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18538981"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 14:02:12 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH] drm/xe: Label RING_CONTEXT_CONTROL as masked
Date: Wed,  3 Apr 2024 14:02:07 -0700
Message-ID: <20240403210207.3839459-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

RING_CONTEXT_CONTROL is a masked register.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index a08528d9c76b..af71b87d8030 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -122,7 +122,7 @@
 #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
 #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
 
-#define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244)
+#define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
 #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
 #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
 
-- 
2.41.0

