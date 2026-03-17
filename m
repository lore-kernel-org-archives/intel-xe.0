Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD44CFF6E89
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 22:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B55E10E1CA;
	Tue, 17 Mar 2026 22:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUlIuF5F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF57410E1CA
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 22:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773784909; x=1805320909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c5P0qbUGeDsm9mG99/ERW7JzLAFEaGAkty1dHEAZ2ls=;
 b=XUlIuF5F3KNJCnRozKPKLhcvlC67VYwNC2LUs6HYjXSd234EXcJf8cgA
 C6S2zWcbXL01++TnpHnjKk+pfOofhW0ADSwitEoN10+RUJ8IrSj77T8DM
 W6XkitpAKiUOg0s+BeJYrxDLZpzHzYHxhQDyVFMXHhYz4j1DsG3i7k786
 4sST+1CoysUOyoKv2x0LWYdbKciqtb+0yLWmbGo72YNvsAWgoFPnL4dde
 MeqkGgo8mVZ++PsYZuJvY7iZdm1oI/EAc04iEph08Fp0kdcWJr82Ushhv
 MCysqeTbzaVEIoczf4sq7GG8V3abEJ76xt9CDlrpykV+KjlOUq/6X5+AS A==;
X-CSE-ConnectionGUID: sey66VeXRYOUC8X8gmM9SQ==
X-CSE-MsgGUID: TpCBQNaHRfi6BrwtTcKTzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74011919"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="74011919"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 15:01:49 -0700
X-CSE-ConnectionGUID: FqobevaJSz+zDnoKGQjypA==
X-CSE-MsgGUID: H3jvfJRVTi+GVYQPRNCvFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="245427909"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa002.fm.intel.com with ESMTP; 17 Mar 2026 15:01:47 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH 1/5] drm/xe: Add missing include guards to unprotected headers
Date: Tue, 17 Mar 2026 21:57:17 +0000
Message-ID: <20260317215732.2208976-8-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317215732.2208976-7-shuicheng.lin@intel.com>
References: <20260317215732.2208976-7-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Two headers lack include guards entirely, which can cause duplicate
definition errors if they are included more than once (directly or
transitively).

Add standard _XE_<NAME>_H_ include guards to:
  - xe_dep_scheduler.h: forward declarations and function prototypes
  - xe_pcode_api.h: PCODE mailbox register definitions

No functional change.

Suggested-by: Nitin Gote <nitin.r.gote@intel.com>
Assisted-by: GitHub Copilot:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_dep_scheduler.h | 5 +++++
 drivers/gpu/drm/xe/xe_pcode_api.h     | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.h b/drivers/gpu/drm/xe/xe_dep_scheduler.h
index 853961eec64b..f314fb5d80f5 100644
--- a/drivers/gpu/drm/xe/xe_dep_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_dep_scheduler.h
@@ -3,6 +3,9 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#ifndef _XE_DEP_SCHEDULER_H_
+#define _XE_DEP_SCHEDULER_H_
+
 #include <linux/types.h>
 
 struct drm_sched_entity;
@@ -19,3 +22,5 @@ void xe_dep_scheduler_fini(struct xe_dep_scheduler *dep_scheduler);
 
 struct drm_sched_entity *
 xe_dep_scheduler_entity(struct xe_dep_scheduler *dep_scheduler);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 85cc7478b787..b619030b9e17 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -3,6 +3,9 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#ifndef _XE_PCODE_API_H_
+#define _XE_PCODE_API_H_
+
 /* Internal to xe_pcode */
 
 #include "regs/xe_reg_defs.h"
@@ -101,3 +104,5 @@
 #define BMG_PCIE_CAP			XE_REG(0x138340)
 #define   LINK_DOWNGRADE		REG_GENMASK(1, 0)
 #define     DOWNGRADE_CAPABLE		2
+
+#endif
-- 
2.43.0

