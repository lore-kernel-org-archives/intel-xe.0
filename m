Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE46C5475B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 19:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8CA11349C;
	Wed,  6 Mar 2024 19:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBojcuZt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3860A11349A
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 19:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709752868; x=1741288868;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ch7iUuK848zslPMGPDLaRaSXJL0qj4tiPSZ+0Kp1cMQ=;
 b=hBojcuZtWrGEIqogn7evweddLmu9EFxC3yGut6XWfOWDQKsyF4X6YpHw
 IPFQmBBmtPVfb1vLqDHYWJzW40DWLwNVuapagRBs9z8wRLlSCKaM/QNdE
 vGHRlk76UjQ1QigJrG5Jq2QgRW+QyNRSW9FWxF9Gd+lh/g3q/amOneq2O
 GnMWnbuUE+MUYV/UoK350kyzu3kqR8soy6ZIaI54/9obT2X/+Tyo1Gk3i
 tILfAvXLtdzKtvfXEqNt9YADep4PkrrTNNOZHF5lNgXJlxyGcJ36YbW/L
 Fx2TqQPDbNSuV9Zhmr7OKiDOr5Nx/C0AqtaeH2Z1pQsCxAlqLQzNuMZwI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4235351"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4235351"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 11:21:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9775887"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 11:21:07 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/2] drm/xe: Remove unused FF_SLICE_CS_CHICKEN2
Date: Wed,  6 Mar 2024 11:21:27 -0800
Message-ID: <20240306192128.1895603-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Commit e89f4967d90c ("drm/xe: Drop WA 16015675438") removed the only
user of that register and should have removed it. Remove it now.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 0b1266c88a6a..a08528d9c76b 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -104,9 +104,6 @@
 #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0, XE_REG_OPTION_MASKED)
 #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
 
-#define FF_SLICE_CS_CHICKEN2(base)		XE_REG((base) + 0xe4, XE_REG_OPTION_MASKED)
-#define   PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
-
 #define CS_DEBUG_MODE1(base)			XE_REG((base) + 0xec, XE_REG_OPTION_MASKED)
 #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
 #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
-- 
2.43.0

