Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EE3C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 20:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08F610E66E;
	Tue,  1 Apr 2025 20:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QkLCCxX1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE0210E66E
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 20:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743540768; x=1775076768;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1dCRcpAhBq7pWDiUNq4qIfFEdvdudKN+i5D1rFR34NY=;
 b=QkLCCxX1Ecu5jwfnUyZ1Z8+BEsPdBLo76sJe69PRaJ+MZVpVMcJuGaRh
 N9aU3M2N8W3XEVVJGh1ndjCryXbpvtmrASg0As5BMbD0a92M24B8TXkAj
 N2H5Rxpk0E+1N6ue5HWu6qizNpDV/eCgsak5tGX79CMedheBYzn6ynOeg
 6JefYfAFD2EaeCtIBrlssii/6sqW2xFEsoVHiNzRQx4TfPo1UphtCn/mr
 FRoXdLHI2xDaxv4M7e0K1Ac2tMDJmK9B8LCkDpl3oUP4gjz2IM4WGWK6J
 A7OVUQlXNcv5k4EeCjc8JYzkRe55CEXLtR47qBkF9jRxFH9xfdxMX5BAK w==;
X-CSE-ConnectionGUID: m+RuZMstQtOL1qmqmMQitw==
X-CSE-MsgGUID: y4QzBSHQS3yTvEFzn1KO/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="45008734"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="45008734"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 13:52:48 -0700
X-CSE-ConnectionGUID: TGaU0nAgQNOWDZLRovP3JA==
X-CSE-MsgGUID: spKFLe21TWi0Qjh/zC/dUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="131362210"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.96])
 by orviesa003.jf.intel.com with ESMTP; 01 Apr 2025 13:52:47 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Add the missed value paramter of LE_COS
Date: Tue,  1 Apr 2025 20:52:21 +0000
Message-Id: <20250401205221.4179660-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
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

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index da1f198ac107..042c8401aee9 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -62,7 +62,7 @@
 #define   LE_SSE_MASK				REG_GENMASK(18, 17)
 #define   LE_SSE(value)				REG_FIELD_PREP(LE_SSE_MASK, value)
 #define   LE_COS_MASK				REG_GENMASK(16, 15)
-#define   LE_COS(value)				REG_FIELD_PREP(LE_COS_MASK)
+#define   LE_COS(value)				REG_FIELD_PREP(LE_COS_MASK, value)
 #define   LE_SCF_MASK				REG_BIT(14)
 #define   LE_SCF(value)				REG_FIELD_PREP(LE_SCF_MASK, value)
 #define   LE_PFM_MASK				REG_GENMASK(13, 11)
-- 
2.25.1

