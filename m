Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8433DCD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 22:55:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4DC10EA87;
	Wed, 27 May 2026 22:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="baCYOSJb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FE910EA87
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 22:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779922512; x=1811458512;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tl31PEtrCRaDbtLsCyYw5ejtZqdQtjvADlA2Ju/EHss=;
 b=baCYOSJb90kEUzU6+5o2DP0JjnS8q8knG0YG/rExF/YZeOFyFnO4qWzN
 XfZLi+D6WUzXfxx/Fv8/KbQRmnpOjal6gLlooYzSIJYFj/lNnly1PnoQn
 hWHmPSSjIB5ORJqrFzTfuYUaUdl3HENkspxb6wnFuq0e7yxDjE52hIpGj
 5xLwWD6HdUTfbdFZ+slFrjrFmi1AtCLfWfLzvKTD6oYSY2wGY8SwOSlM2
 i06SOc5GY5ZfP2D1c0aP5MyRBGXdpZoGesAgEXZjH0weqlWpJD8pY90e6
 dS6EYrjEFnk7qx3p04z0g3GH2vffsCa2FxCqLHLYz6Dd05ICi/sTrSvhP A==;
X-CSE-ConnectionGUID: 0GxY2UyGT9eutHuzVtBMQA==
X-CSE-MsgGUID: LpRTw93fT2ePSnf3Ihq/Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="98340384"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="98340384"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 15:55:11 -0700
X-CSE-ConnectionGUID: cNbQpanLTuCda3paE8oRHQ==
X-CSE-MsgGUID: nPVrbib5Sq+K8GKB/93ptg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="266260445"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 15:55:11 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] perf/core: out-of-line and export
 perf_allow_cpu/tracepoint()
Date: Wed, 27 May 2026 15:55:06 -0700
Message-ID: <20260527225507.2044027-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527225507.2044027-1-ashutosh.dixit@intel.com>
References: <20260527225507.2044027-1-ashutosh.dixit@intel.com>
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

From: John Hubbard <jhubbard@nvidia.com>

These helpers are static inline in <linux/perf_event.h> and reach
into sysctl_perf_event_paranoid and security_perf_event_open(),
neither of which is itself exported. The perf_allow_* trio is
therefore asymmetric: built-in callers can use any of the three, but
modular code can only call perf_allow_kernel().

Move both bodies into kernel/events/core.c next to perf_allow_kernel()
and export them with EXPORT_SYMBOL_GPL, following the shape of
commit 5e9629d0ae97 ("drivers/perf: arm_spe: Use perf_allow_kernel()
for permissions"). Existing in-tree callers live in built-in arch and
tracing code, so the change is invisible to them.

Provide !CONFIG_PERF_EVENTS stubs that fall back to perfmon_capable(),
so the helpers stay callable when perf is compiled out.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/linux/perf_event.h | 31 +++++++++++++++----------------
 kernel/events/core.c       | 18 ++++++++++++++++++
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 48d851fbd8ea5..5842552294c19 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1791,22 +1791,8 @@ static inline int perf_is_paranoid(void)
 }
 
 extern int perf_allow_kernel(void);
-
-static inline int perf_allow_cpu(void)
-{
-	if (sysctl_perf_event_paranoid > 0 && !perfmon_capable())
-		return -EACCES;
-
-	return security_perf_event_open(PERF_SECURITY_CPU);
-}
-
-static inline int perf_allow_tracepoint(void)
-{
-	if (sysctl_perf_event_paranoid > -1 && !perfmon_capable())
-		return -EPERM;
-
-	return security_perf_event_open(PERF_SECURITY_TRACEPOINT);
-}
+extern int perf_allow_cpu(void);
+extern int perf_allow_tracepoint(void);
 
 extern int perf_exclude_event(struct perf_event *event, struct pt_regs *regs);
 
@@ -2023,6 +2009,19 @@ perf_event_pause(struct perf_event *event, bool reset)			{ return 0; }
 static inline int
 perf_exclude_event(struct perf_event *event, struct pt_regs *regs)	{ return 0; }
 
+static inline int perf_allow_kernel(void)
+{
+	return perfmon_capable() ? 0 : -EACCES;
+}
+static inline int perf_allow_cpu(void)
+{
+	return perfmon_capable() ? 0 : -EACCES;
+}
+static inline int perf_allow_tracepoint(void)
+{
+	return perfmon_capable() ? 0 : -EPERM;
+}
+
 #endif /* !CONFIG_PERF_EVENTS */
 
 #if defined(CONFIG_PERF_EVENTS) && defined(CONFIG_CPU_SUP_INTEL)
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 6d1f8bad7e1c5..735e502beb966 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -14691,6 +14691,24 @@ int perf_allow_kernel(void)
 }
 EXPORT_SYMBOL_GPL(perf_allow_kernel);
 
+int perf_allow_cpu(void)
+{
+	if (sysctl_perf_event_paranoid > 0 && !perfmon_capable())
+		return -EACCES;
+
+	return security_perf_event_open(PERF_SECURITY_CPU);
+}
+EXPORT_SYMBOL_GPL(perf_allow_cpu);
+
+int perf_allow_tracepoint(void)
+{
+	if (sysctl_perf_event_paranoid > -1 && !perfmon_capable())
+		return -EPERM;
+
+	return security_perf_event_open(PERF_SECURITY_TRACEPOINT);
+}
+EXPORT_SYMBOL_GPL(perf_allow_tracepoint);
+
 /*
  * Inherit an event from parent task to child task.
  *
-- 
2.54.0

