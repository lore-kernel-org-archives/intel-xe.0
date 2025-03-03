Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A856C282CD
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 17:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D1F10E4BA;
	Mon,  3 Mar 2025 17:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="At+n9r9E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65FD10E4BC
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 17:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741023338; x=1772559338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cgxE1hD2stoCIcB5heUNvh3do/qrfCdmISY5Vsfelzo=;
 b=At+n9r9Eh24qO+Sn8/Vyf83IdZp5PYqeyxhBqgD0IQHJQEKZElPT0DeP
 /fszPUWyNKMDN8vydnA/5NYZxq1gsqpSGaUQ4OuKZwwnkV5Q5/6gtVR4m
 vxiyH5k1hAbc8J1vMUHHcYpG/fMlC8KJJnqbBlmAb/kQg+Eu8djYeKepN
 o/Cp6ETutqtkqTVCToVQCKtu843T1bQk9PBNgePPUtYXFkGAt7i1asH3U
 c5lkDX1DWm6W8SnLmNCy0NT/+7oIRwaDmNh1IcvHUK9bxM2pL3tB2bBug
 baUmkwRfY8/+IHIItW7k9epLTw0G7sddKQ6bwiEj5xOAPEgA45uGA9yeI w==;
X-CSE-ConnectionGUID: SBf4UWbUQ9CQPnnMZVla9A==
X-CSE-MsgGUID: 0dWNhHMgQzKZ2R8r0JjKgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41937518"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41937518"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:35:38 -0800
X-CSE-ConnectionGUID: XK6p30YtSZq9SSGg1c+gTQ==
X-CSE-MsgGUID: VN187Ea5ROWRf3PNSDJinQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="118101268"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.99.10])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:35:36 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/5] drm/xe: Add MI_LOAD_REGISTER_REG command definition
Date: Mon,  3 Mar 2025 18:35:18 +0100
Message-Id: <20250303173522.1822-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250303173522.1822-1-michal.wajdeczko@intel.com>
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
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

The MI_LOAD_REGISTER_REG command reads value from a source register
location and writes that value to a destination register location.

Bspec: 45730, 60233
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index 167fb0f742de..526bad9d4bac 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -61,6 +61,10 @@
 #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
 #define   MI_LRM_USE_GGTT		REG_BIT(22)
 
+#define MI_LOAD_REGISTER_REG		(__MI_INSTR(0x2a) | XE_INSTR_NUM_DW(3))
+#define   MI_LRR_DST_CS_MMIO		REG_BIT(19)
+#define   MI_LRR_SRC_CS_MMIO		REG_BIT(18)
+
 #define MI_COPY_MEM_MEM			(__MI_INSTR(0x2e) | XE_INSTR_NUM_DW(5))
 #define   MI_COPY_MEM_MEM_SRC_GGTT	REG_BIT(22)
 #define   MI_COPY_MEM_MEM_DST_GGTT	REG_BIT(21)
-- 
2.47.1

