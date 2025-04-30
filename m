Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E831C369DC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 13:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0637B10E795;
	Wed, 30 Apr 2025 13:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LkGVj0i5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C5210E795
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746018074; x=1777554074;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kkjEXTGuPkz/rt4q7W9tkgGqPYNTy5SvpXeGyQ9f94g=;
 b=LkGVj0i5glZIibm+n2bjuL98xQQhBUR5XtqfJcBy1n39+ogjA/NCMaoO
 aABa7iXUgjPiVy8F0/b3YF+3jmCB+VAFDpdNQa6ocM0VNTncolSCDBVjD
 SfF6rcxnRL/AxKT7fu1fr+jm2nAGeFK9VxqSY/oQUiy8VvX12P0hhVmel
 2Aj5jVoR8CFV60Je4l8tXGloOPKYg8H6nqZmGn2zZuZsOCooxUf5z+IVQ
 Z1yDJx4jvyIafePB0jTDV/yLdbyjSIiMxr6kAyPZYA3c/LNVSuH+etDyN
 OEXO8/PJYnTMvRk+NXp9+D8nZaXqUgi94ij9MYQxrgvxu07W5moJFyzSh w==;
X-CSE-ConnectionGUID: D2lHmYXnQ82Wh16h3AH+dA==
X-CSE-MsgGUID: cJ/JtPHmRmaFWrD1dvDlnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="35288790"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="35288790"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 06:01:02 -0700
X-CSE-ConnectionGUID: YsPPKhNQTaCxm1beCUkPZw==
X-CSE-MsgGUID: foKSg1++QMOJkWd+y+sykQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134058860"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa006.fm.intel.com with ESMTP; 30 Apr 2025 06:00:58 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
Date: Wed, 30 Apr 2025 18:47:10 +0530
Message-ID: <20250430131710.20532-1-satyanarayana.k.v.p@intel.com>
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

When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
functions, the CI test systems are going out of space and crashing. To
avoid this issue, a new helper function is created and when fault is
injected into this xe_should_fail_ct_dead_capture() helper function,
ct dead capture is avoided which suppresses ct dumps in the log.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: John Harrison <John.C.Harrison@Intel.com>
Tested-by: Aditya Chauhan <aditya.chauhan@intel.com>

---
Cc: Jani Nikula <jani.nikula@intel.com>

V1 -> V2:
- Fixed review comments.
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 2447de0ebedf..d6e7a8b80d8c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1770,6 +1770,20 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+/**
+ * xe_should_fail_ct_dead_capture - Helper function to inject fault.
+ *
+ * This is a helper function to inject fault into ct_dead_capture().
+ * As fault is injected using this function, need to make sure that
+ * the compiler does not optimize and make it as a inline function.
+ * To prevent compile optimization, "noinline" is added.
+ */
+static noinline int xe_should_fail_ct_dead_capture(void)
+{
+	return 0;
+}
+ALLOW_ERROR_INJECTION(xe_should_fail_ct_dead_capture, ERRNO);
+
 static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
 {
 	struct xe_guc_log_snapshot *snapshot_log;
@@ -1778,6 +1792,13 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
 	unsigned long flags;
 	bool have_capture;
 
+	/*
+	 * Huge dump is getting generated when injecting error for guc CT/MMIO
+	 * functions. So, let us suppress the dump when fault is injected.
+	 */
+	if (xe_should_fail_ct_dead_capture())
+		return;
+
 	if (ctb)
 		ctb->info.broken = true;
 
-- 
2.43.0

