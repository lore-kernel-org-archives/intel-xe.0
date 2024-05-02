Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D888C4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 22:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD3B10E330;
	Thu,  2 May 2024 22:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPkqnWZm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3CE10E330
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 22:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714689207; x=1746225207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xcswW1kVwbLZjJ0TBYSdSndPJdqeuaLlt6nhwABwzQc=;
 b=TPkqnWZmeoDvA63TwLICu4iGPw+ZkuiiEZuxoDAnl86l0ogDEahZViIQ
 1QtaIpYXaMZ3UBWGTIUz2EB5XfbfBAespytTwfx5W8MRjLherfY0yO6Rr
 hUKXmOwDphZ2E98JlwHG+EFuwc6KMaKERY4G8OTTqM0PlVkSGpnGJf7fk
 GA0Qos8Uxw7Y6IrhAwwzPMdinWUCegUoe1IVmPLPGRSZGRUHkvkmp81fh
 53/ia66qvR22S7n866uaDYVX/MlfNI6F/OHmsL48t41KeMY4xk9qytmze
 nXIbro2nkEqpugAUD7w56h44KSBb5VRJ91BRS6/Hve+xS3Kdxy+Ibtmde w==;
X-CSE-ConnectionGUID: 70VdXYU9QmCaz7In7qlKOw==
X-CSE-MsgGUID: MQn7cAS+RwKrtmKP3OO9dA==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10312970"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10312970"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 15:33:27 -0700
X-CSE-ConnectionGUID: C6nXcAe4QTC1/rzNq8AsXg==
X-CSE-MsgGUID: +6ZU8SbrS2+ZNNQngztuxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="32061544"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.17.255])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 15:33:26 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 1/3] drm/xe: Add helpers for manipulating macro arguments
Date: Fri,  3 May 2024 00:33:11 +0200
Message-Id: <20240502223313.2527-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240502223313.2527-1-michal.wajdeczko@intel.com>
References: <20240502223313.2527-1-michal.wajdeczko@intel.com>
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

Define generic helpers that will replace private definitions used
by the RTP code and will allow reuse by the new code.

Put them in new xe_args.h file (instead of infamous xe_macros.h)
as once we find more potential users outside of the Xe driver we
may want to move all of these macros as-is to linux/args.h.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: don't pollute linux/args.h yet (Andy)
v3: add explicit comment on future use inside the code (Lucas)
    fix include guard (Lucas)
---
 drivers/gpu/drm/xe/xe_args.h | 121 +++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_args.h

diff --git a/drivers/gpu/drm/xe/xe_args.h b/drivers/gpu/drm/xe/xe_args.h
new file mode 100644
index 000000000000..40b9eb4151d8
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_args.h
@@ -0,0 +1,121 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_ARGS_H_
+#define _XE_ARGS_H_
+
+#include <linux/args.h>
+
+/*
+ * Why don't the following macros have the XE prefix?
+ *
+ * Once we find more potential users outside of the Xe driver, we plan to move
+ * all of the following macros unchanged to linux/args.h.
+ */
+
+/**
+ * CALL_ARGS - Invoke a macro, but allow parameters to be expanded beforehand.
+ * @f: name of the macro to invoke
+ * @args: arguments for the macro
+ *
+ * This macro allows calling macros which names might generated or we want to
+ * make sure it's arguments will be correctly expanded.
+ *
+ * Example:
+ *
+ *	#define foo	X,Y,Z,Q
+ *	#define bar	COUNT_ARGS(foo)
+ *	#define buz	CALL_ARGS(COUNT_ARGS, foo)
+ *
+ *	With above definitions bar expands to 1 while buz expands to 4.
+ */
+#define CALL_ARGS(f, args...)		__CALL_ARGS(f, args)
+#define __CALL_ARGS(f, args...)		f(args)
+
+/**
+ * DROP_FIRST - Returns all arguments except the first one.
+ * @args: arguments
+ *
+ * This helper macro allows manipulation the argument list before passing it
+ * to the next level macro.
+ *
+ * Example:
+ *
+ *	#define foo	X,Y,Z,Q
+ *	#define bar	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo))
+ *
+ *	With above definitions bar expands to 3.
+ */
+#define DROP_FIRST(args...)		__DROP_FIRST(args)
+#define __DROP_FIRST(a, b...)		b
+
+/**
+ * PICK_FIRST - Returns the first argument.
+ * @args: arguments
+ *
+ * This helper macro allows manipulation the argument list before passing it
+ * to the next level macro.
+ *
+ * Example:
+ *
+ *	#define foo	X,Y,Z,Q
+ *	#define bar	PICK_FIRST(foo)
+ *
+ *	With above definitions bar expands to X.
+ */
+#define PICK_FIRST(args...)		__PICK_FIRST(args)
+#define __PICK_FIRST(a, b...)		a
+
+/**
+ * PICK_LAST - Returns the last argument.
+ * @args: arguments
+ *
+ * This helper macro allows manipulation the argument list before passing it
+ * to the next level macro.
+ *
+ * Like COUNT_ARGS() this macro works up to 12 arguments.
+ *
+ * Example:
+ *
+ *	#define foo	X,Y,Z,Q
+ *	#define bar	PICK_LAST(foo)
+ *
+ *	With above definitions bar expands to Q.
+ */
+#define PICK_LAST(args...)		__PICK_ARG(COUNT_ARGS(args), args)
+#define __PICK_ARG(n, args...)		CALL_ARGS(CONCATENATE(PICK_ARG, n), args)
+#define PICK_ARG1(args...)		PICK_FIRST(args)
+#define PICK_ARG2(args...)		PICK_ARG1(DROP_FIRST(args))
+#define PICK_ARG3(args...)		PICK_ARG2(DROP_FIRST(args))
+#define PICK_ARG4(args...)		PICK_ARG3(DROP_FIRST(args))
+#define PICK_ARG5(args...)		PICK_ARG4(DROP_FIRST(args))
+#define PICK_ARG6(args...)		PICK_ARG5(DROP_FIRST(args))
+#define PICK_ARG7(args...)		PICK_ARG6(DROP_FIRST(args))
+#define PICK_ARG8(args...)		PICK_ARG7(DROP_FIRST(args))
+#define PICK_ARG9(args...)		PICK_ARG8(DROP_FIRST(args))
+#define PICK_ARG10(args...)		PICK_ARG9(DROP_FIRST(args))
+#define PICK_ARG11(args...)		PICK_ARG10(DROP_FIRST(args))
+#define PICK_ARG12(args...)		PICK_ARG11(DROP_FIRST(args))
+
+/**
+ * ARGS_SEP_COMMA - Definition of a comma character.
+ *
+ * This definition can be used in cases where any intermediate macro expects
+ * fixed number of arguments, but we want to pass more arguments which can
+ * be properly evaluated only by the next level macro.
+ *
+ * Example:
+ *
+ *	#define foo(f)	f(X) f(Y) f(Z) f(Q)
+ *	#define bar	DROP_FIRST(foo(ARGS_SEP_COMMA __stringify))
+ *	#define buz	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo(ARGS_SEP_COMMA)))
+ *
+ *	With above definitions bar expands to
+ *		"X", "Y", "Z", "Q"
+ *	and buz expands to 4.
+ */
+#define ARGS_SEP_COMMA			,
+
+#endif
-- 
2.43.0

