Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47E3C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 15:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3B310E970;
	Thu,  5 Jun 2025 15:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0F4Taud";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5502F10E8AB
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749137455; x=1780673455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z8AtlOXNcnE/rh0uymYUh520dbLMK6C1ZRCYWDuiv14=;
 b=m0F4Taud1DJ/cX0gTfJv263iv9hujoP5KYDKN5T6VLRafwR7UvyGBv+H
 ml/o5YTe0fylVBNjHi2SIC0RWkC9ucmQ4GlJmyO+4X4zIpCm/P2MKEUWu
 nK5EJvCaKFZjHDEZ+WgQ4AYIvsuAKOp8AT9OiytMGpGZf5HdM4CWCe8XZ
 qPzKdUeTwLwwH5hLNgEiZObbmruyRrtvvELM+yzG2hw+OIhhVwifZ3yq3
 J5zEi8p4/S1ZTAdPMPKBoYqxjDwI7pOYNNRwlMPI/CsN+Hyo1LoFP4ZOC
 +REfKj5zRB1j7pyhxVJdUdqHgAdUH3JzPKdivq4x5bTXj3HKS3WxkMBkR g==;
X-CSE-ConnectionGUID: aZFvAKtCRCubAVVuxgOPeg==
X-CSE-MsgGUID: 3wD17cJ5SYSqnesu3Hs50A==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61529496"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="61529496"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:52 -0700
X-CSE-ConnectionGUID: GCDeYVBBSXCVQpncGUYeuw==
X-CSE-MsgGUID: 1hhK7YmgSlmYLlt4i702pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="176502816"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 09/15] drm/xe: Add MI_SEMAPHORE_WAIT instruction defs
Date: Thu,  5 Jun 2025 08:32:17 -0700
Message-Id: <20250605153223.2789122-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605153223.2789122-1-matthew.brost@intel.com>
References: <20250605153223.2789122-1-matthew.brost@intel.com>
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

Add MI_SEMAPHORE_WAIT instruction defs which are need for kernel ULLS
migration jobs.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index e3f5e8bb3ebc..7a871b186401 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -34,6 +34,12 @@
 #define MI_FORCE_WAKEUP			__MI_INSTR(0x1D)
 #define MI_MATH(n)			(__MI_INSTR(0x1A) | XE_INSTR_NUM_DW((n) + 1))
 
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

