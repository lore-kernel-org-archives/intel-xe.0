Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6365EC52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 02:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DFF10E06F;
	Mon, 12 Aug 2024 02:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n//Sangg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECA310E052
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 02:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723430789; x=1754966789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ej0kUwQpTgw9NSFpLfkpPBX8bUf0VK0hJtZt/8R7180=;
 b=n//Sanggx9nISO/Jwg0eDz61ACoM5PcLLs/BZLvR4lAZeW97tvZAKyk2
 H282OQt2zppDeJmZihnELXR6Qug3DFa6b+vounju5VNppjo8RLDOjWIun
 JNuZ5zujRmTaMRAlBTy9DWdEFJmgAm1mKhoQc5GPme+viW66UHYA10cPM
 A+RXjVZWnbwAiXxnOuXrHC5jRVH6VReBq4W2fV+n7QZgPtSc3gKIXG+c4
 FIFqckg43rkMlkIjZB5oxCsn6/mdoGdReZwi8Y17Qixs88tdoT+PGYL8J
 qRZ/kXKx1HHJsqbUphld6kKSvAhf+2XkcNIK6iVrW36i5nZu7NNd2nxkT g==;
X-CSE-ConnectionGUID: zsm/GsRRRzyg3Fd293+rNg==
X-CSE-MsgGUID: yrDmwqEOQ8OhBoek6GuU/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="32099521"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="32099521"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 19:46:28 -0700
X-CSE-ConnectionGUID: B3tAZy1nT1ySiORpTsGIfw==
X-CSE-MsgGUID: dCY1De69Q6yiZM2mkr6F+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="62256303"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 19:46:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 5/8] drm/xe: Add MI_SEMAPHORE_WAIT instruction defs
Date: Sun, 11 Aug 2024 19:47:14 -0700
Message-Id: <20240812024717.3584636-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812024717.3584636-1-matthew.brost@intel.com>
References: <20240812024717.3584636-1-matthew.brost@intel.com>
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

Needed for kernel ULLS of migration jobs.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index 10ec2920d31b..5f939a8dc838 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -33,6 +33,12 @@
 #define MI_TOPOLOGY_FILTER		__MI_INSTR(0xD)
 #define MI_FORCE_WAKEUP			__MI_INSTR(0x1D)
 
+#define MI_SEMAPHORE_WAIT		(__MI_INSTR(0x1c) | XE_INSTR_NUM_DW(4))
+#define   MI_SEMAPHORE_GLOBAL_GTT	REG_BIT(22)
+#define   MI_SEMAPHORE_POLL             REG_BIT(15)
+#define   MI_SEMAPHORE_COMPARE		GENMASK(15, 12)
+#define   MI_SEMAPHORE_SAD_EQ_SDD       REG_FIELD_PREP(MI_SEMAPHORE_COMPARE, 4)
+
 #define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
 #define   MI_SDI_GGTT			REG_BIT(22)
 #define   MI_SDI_LEN_DW			GENMASK(9, 0)
-- 
2.34.1

