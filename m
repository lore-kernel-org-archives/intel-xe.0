Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58234C27C5F
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 06:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E060D10E29A;
	Fri,  7 Jun 2024 06:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dr2smoZR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC9210E197
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 06:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717743109; x=1749279109;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uDf7B16z9CfDpezIjxBR0xXfWlBadvKL3/e29NKCRLg=;
 b=dr2smoZRhim3jDap1fbLfPEydvp6ctdLDONrfeYf8+5WRmcZDfWbvkQ+
 XPWcrVCJyXXLZ6X02Cp2Uy87r8dUmdU4gDdXRBmsRw+BmLMaiK7lipVP1
 KVZAAs3xvf4ajTyDNJuy0Vo8EHkIAXip2aMyxYBVcD4yzKwBkNk+4xx7Z
 YKu5HsqZ6UASZtLBLe3eDipCRUjKEm1twe9RBSSQhvsmwSaqgHuC5mAwD
 2aD/Ke/tjKXpK9txbjQgyDiHfV80u3CrZbRRhx/RHpqbOxfeVc+mV7JdX
 48GgJRkT1cITH9qnDrWkFkjO/yKM9Ps+eBfblnBSO3kF08sTegXToZZ2/ g==;
X-CSE-ConnectionGUID: OZ1El5ZiSUuBiWT8wz2vTQ==
X-CSE-MsgGUID: B9wDpLnoRkmh0uiJP7aqKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14254927"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="14254927"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 23:51:48 -0700
X-CSE-ConnectionGUID: 62WUcnutSmaOHLky5KMqIA==
X-CSE-MsgGUID: RsPaXv4UTY+VvUC5Uc8mBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="75702761"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 23:51:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 2/5] drm/xe: Add MI_COPY_MEM_MEM GPU instruction
 definitions
Date: Thu,  6 Jun 2024 23:52:16 -0700
Message-Id: <20240607065219.2264624-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607065219.2264624-1-matthew.brost@intel.com>
References: <20240607065219.2264624-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index c74ceb550dce..f3deabb18ce4 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -56,6 +56,10 @@
 #define   MI_FLUSH_IMM_QW		REG_FIELD_PREP(MI_FLUSH_DW_LEN_DW, 5 - 2)
 #define   MI_FLUSH_DW_USE_GTT		REG_BIT(2)
 
+#define MI_COPY_MEM_MEM			(__MI_INSTR(0x2e) | 3)
+#define	  MI_COPY_MEM_MEM_SRC_GGTT	REG_BIT(22)
+#define	  MI_COPY_MEM_MEM_DST_GGTT	REG_BIT(21)
+
 #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
 #define   MI_LRM_USE_GGTT		REG_BIT(22)
 
-- 
2.34.1

