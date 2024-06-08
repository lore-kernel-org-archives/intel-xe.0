Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E02C27C53
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jun 2024 00:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA0D10E235;
	Sat,  8 Jun 2024 00:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mh9XR6YU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C87410E1BF
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Jun 2024 00:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717806031; x=1749342031;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+9tdG9coiP3IKvDKHsHRxr/u+rnKLpEDiVZada8Hoic=;
 b=Mh9XR6YUOQyuU2KtA1U8oyYD3Z7O51Xe9N1zX5udz0ytf2df/cU0KYXX
 +Dj/9ml1ThuW6cJk/WHE1UGQ7vNjMG00SjB0k/C/OL7bHE9xXa4lq4YKg
 EW2wdScGu8TJHqxzMCCrbCZt1Tm/9kN8PcMpXMWVuc4U418O+D13lJxU6
 sBfKBf6E4b/EkL8FbV/YE1dSjkOMj3YuwbsZj4KMa4GEpeSN4GVlATqV+
 c4lWihpnRSFn/zxaoaJGrefV7od/6e1AnqNvn2aAKzT74pUtM1A4/Z0pT
 fpOv7ZEhSisuXFcI0CdnyHFGsI5/QebJu1JgKyFX+4XJb3bToggKKA9Yp g==;
X-CSE-ConnectionGUID: 4bpACrmwS6WjOKMjgE8jFQ==
X-CSE-MsgGUID: XiXuSlSKTh2nt7Uq+QX2xQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25173693"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25173693"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 17:20:30 -0700
X-CSE-ConnectionGUID: QVNFaC8EQuSHZLAVoRZreg==
X-CSE-MsgGUID: 8inUTN71Rdm0ix7WeerPYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38427012"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 17:20:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 2/6] drm/xe: Add MI_COPY_MEM_MEM GPU instruction definitions
Date: Fri,  7 Jun 2024 17:20:59 -0700
Message-Id: <20240608002103.2371696-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240608002103.2371696-1-matthew.brost@intel.com>
References: <20240608002103.2371696-1-matthew.brost@intel.com>
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

