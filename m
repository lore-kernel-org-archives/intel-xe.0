Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5AFC87FDA
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 23:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D8410E6F8;
	Tue,  5 Aug 2025 23:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0Zljxe5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83EF10E5C8
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754437326; x=1785973326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iBnI44Kb6PTmeBjKs1sxuXbMrEnnh6jOwF8l8PrzQLY=;
 b=G0Zljxe5khPArkRymfSX5UGRCOLQ5vToZfk5hKXakKOPD9HqxYFzta45
 AywkbepfEZk6ZP9vRfo7RK+uXr2WohVl0oUDammrWUyapb41HhSJeimi2
 bAhmgsWqFE+5n5O80i+gelLoYXhhjUBwxyd5Wv6ukWzUmSO4ej9UVktt1
 9QOFgy1IyERGBf9DJCG8ZxTcvYeBePFCgGZPXyQUEC4so2d3+/sND2GrO
 zASzZi8yY923mL3FLk211YxjgDQ+Ro5FLU//TxFD1UB+nCffrYd96jd9s
 hEVAQyWMAeiCaK6/IyCSK11YVMmNsqgJjYkGsDQEYjr+QMgaW9Cef2QQa w==;
X-CSE-ConnectionGUID: JvlOQmseSvyCDWrdoqrdmw==
X-CSE-MsgGUID: f6R3V1nXRH6iw4RaVvITDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68119066"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="68119066"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:05 -0700
X-CSE-ConnectionGUID: AiAOx7UwR4W3N2zJAvV7Aw==
X-CSE-MsgGUID: MmM3e++lR7eGSYmj/b9roQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164641629"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 10/15] drm/xe: Add MI_SEMAPHORE_WAIT instruction defs
Date: Tue,  5 Aug 2025 16:41:55 -0700
Message-Id: <20250805234200.1035609-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805234200.1035609-1-matthew.brost@intel.com>
References: <20250805234200.1035609-1-matthew.brost@intel.com>
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
index c47b290e0e9f..4491f880513a 100644
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

