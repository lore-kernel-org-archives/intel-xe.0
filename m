Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8845DC27C65
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 14:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C50810E483;
	Mon, 10 Jun 2024 14:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mv90XedJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0758510E467
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 14:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718029081; x=1749565081;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+9tdG9coiP3IKvDKHsHRxr/u+rnKLpEDiVZada8Hoic=;
 b=Mv90XedJz9x1VEkm8bmrPJ7bqLRGdP0uezLmJGDRxsHLgxDw3fYwagtX
 QmdZtVEpxagJgR/t2ST9j0h6U+4Y7RCG6+TUGTwOp3FXPymLMiYF7Awk6
 Mc22JB+/WFDPMz85CkizyQZNEJN7mJG9ifSd0cPAHliBIga8jFMbL9ML8
 6ecRHWgEvc0mq/FZM2146VYJz5El0Snh9efFqiPXyRuGFbb64JIPo2Mjn
 A5ha92d6nwwL3WgIgfuHIvcjYDrwJ7EjTznWofDJhboUiS3JGhD58wdJA
 gtTqZMuTVM4DSx/kibmbPYW0IJsepzndyUbY74CzExF8VQhp1uSI426Rd A==;
X-CSE-ConnectionGUID: YeOMJdXjSMqsASrVamoXFw==
X-CSE-MsgGUID: 52TW/yIQSAykZsyrtPExig==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14864867"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14864867"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 07:17:52 -0700
X-CSE-ConnectionGUID: 0Z5Uyo6XQZa10y27Wb6+aA==
X-CSE-MsgGUID: EtzepZAYTmKIWxQx1dtGyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="70238690"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 07:17:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 02/10] drm/xe: Add MI_COPY_MEM_MEM GPU instruction
 definitions
Date: Mon, 10 Jun 2024 07:18:15 -0700
Message-Id: <20240610141823.2605496-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610141823.2605496-1-matthew.brost@intel.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
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

MI_COPY_MEM_MEM GPU instructions are used to copy ctx timestamp from a
LRC registers to another location at the beginning of every jobs
execution. Add MI_COPY_MEM_MEM GPU instruction definitions.

v2:
 - Include MI_COPY_MEM_MEM based on instruction order (Michal)
 - Fix tabs/spaces issue (Michal)
 - Use macro for DW definition (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index c74ceb550dce..b7bf99dd4848 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -59,6 +59,10 @@
 #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
 #define   MI_LRM_USE_GGTT		REG_BIT(22)
 
+#define MI_COPY_MEM_MEM			(__MI_INSTR(0x2e) | XE_INSTR_NUM_DW(5))
+#define   MI_COPY_MEM_MEM_SRC_GGTT	REG_BIT(22)
+#define   MI_COPY_MEM_MEM_DST_GGTT	REG_BIT(21)
+
 #define MI_BATCH_BUFFER_START		__MI_INSTR(0x31)
 
 #endif
-- 
2.34.1

