Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7982C27C77
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 14:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F2A10E674;
	Tue, 11 Jun 2024 14:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QaqHgKpB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBA310E674
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718116833; x=1749652833;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=47g+1qfHy7aAKoJOfnmAcC+EEcYmzEBjE4vy+W48GTI=;
 b=QaqHgKpBhNhN8z98H+op3nSEBK2ZQRDtypx3TQ+2Ela9gI11pHaB4BQ6
 72LXhm/3BjK2fqlUBzXdem5i6yiOcBdKDj2EkM0+6J6s+U2V2Gd/ZAS7j
 GKWexTEuYJjTaqkhrGnsCOWZjVVh3FKF96TRCFxeSk/ZK2vVz3bXJfuam
 p6CUBjwmVg0M2XEoqrGyYR3owwIomZnGFSTmzple3t+BuONM278+dfvZa
 GOyxDlNR4PiExiZ5PDvKxcm9u/seDl7ENCG01fd/fJVCabwUfr1Wu0N7J
 /kxKVo0m5Yli5bWVvd73L/edBl0PUpD49OzwxpuUn+fpiLojY3j2QYyip g==;
X-CSE-ConnectionGUID: zWyON5K9S1mxE2qi4ZAQtw==
X-CSE-MsgGUID: 39DMgBmEScuDsCQbCqUvZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14784560"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="14784560"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:40:19 -0700
X-CSE-ConnectionGUID: ySeQaNXFTm2um3TkIfRwAA==
X-CSE-MsgGUID: JFgZx9FAS0mZKb9J4raHXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44590314"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:40:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 02/11] drm/xe: Add MI_COPY_MEM_MEM GPU instruction
 definitions
Date: Tue, 11 Jun 2024 07:40:44 -0700
Message-Id: <20240611144053.2805091-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611144053.2805091-1-matthew.brost@intel.com>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
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
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
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

