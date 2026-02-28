Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C936A1048925
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 01:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC2610EC6B;
	Sat, 28 Feb 2026 01:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q3cPf4s1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774E910E1E1
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 01:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772242514; x=1803778514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iBnI44Kb6PTmeBjKs1sxuXbMrEnnh6jOwF8l8PrzQLY=;
 b=Q3cPf4s1zTqomJh7IapgYRo7B3LmZDeZIF8rwN5zyTtJthzo2masf3h3
 jXbYOMTXYc1neiIzrMFYSvK8pOUjLnT9w6+Pss3D7+9p15ou4rtpipUo3
 Z9VqOlaJw4f/FjTL7kcjDM8LoNo77IDc3rfDCyQOTldoRuupJwX5/4ebh
 jReghtWHcCx0AAr0kdP+tj1nxMu3XeJFANgcjqFV8JTOW4r+gzQ9zR66g
 r0mtJIfs2Zyi65Uu7QskSQx+2kPvSD4VYjFtB4Ro+kFtzYDMJwjc5uoES
 aJPy4KJWgle0OlVvdTcHFGf/qrJG1841QRhUbbr7/Rb1hSr9xWlUK+ANr g==;
X-CSE-ConnectionGUID: Lf4n5aMtRpGw2Ytw2biLZA==
X-CSE-MsgGUID: tVrniQu7QeyUmHbcgBDOgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83966360"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="83966360"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:09 -0800
X-CSE-ConnectionGUID: FXRsqvdfQoKpD+lQ/Y0pTA==
X-CSE-MsgGUID: MWRxIShcTk2/pAlUisx50w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="213854899"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v3 21/25] drm/xe: Add MI_SEMAPHORE_WAIT instruction defs
Date: Fri, 27 Feb 2026 17:34:57 -0800
Message-Id: <20260228013501.106680-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260228013501.106680-1-matthew.brost@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
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

