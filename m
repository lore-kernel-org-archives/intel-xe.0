Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D12C4345F
	for <intel-xe@archiver.kernel.org>; Wed,  1 May 2024 22:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C7A10E7BF;
	Wed,  1 May 2024 22:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0eKc4nr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F9510E7BF
 for <intel-xe@lists.freedesktop.org>; Wed,  1 May 2024 22:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714602764; x=1746138764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i+fa6kH3n4S/Se+2HKVNNAPtTBYaqzneXcLQZeIpTEo=;
 b=a0eKc4nrmT+5HEvI9UNLuZvEYUSC4OQ3iQpqTPgUZfEbfpc3qZ3GtaLX
 I+MxwSm4ZcipC6sB2Ae/XvX9CAQspbYKb3eA+zQXGRg+qp6VPP0v4BygN
 h3EChXJZdrBH4fQEo+hTFiAV7DUwlM/rRp/YuImes7KUbgoNbUef6sE3x
 6arX61ZP/rvToQtdTDjJu+AXmJtF3KxJAGZSTb30nrcsIUK3UEoT1kCEa
 TzX3lxl/6rVhuTcd5WHX7smvX0nXe2rCmUhSsl7CxVTmvaowrAPludMMs
 /ZTA/Y0UzgnwxN7TYAb93Z20JckeUl8hACHWDgmgNkYdl9QQI690LpBFZ A==;
X-CSE-ConnectionGUID: n1mW94mtTNaBCWDVXTn+NA==
X-CSE-MsgGUID: 8mhwG7BgQiaSgtCcEBBMoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10180944"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; d="scan'208";a="10180944"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 15:32:44 -0700
X-CSE-ConnectionGUID: U5un7lhMT5WkoUxF77m5KA==
X-CSE-MsgGUID: 38ml0pSFRyuri/gEXi3SpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; d="scan'208";a="31399904"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.34.25])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 15:32:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/2] args.h: add more helpers for manipulating macro arguments
Date: Thu,  2 May 2024 00:32:20 +0200
Message-Id: <20240501223221.2395-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240501223221.2395-1-michal.wajdeczko@intel.com>
References: <20240501223221.2395-1-michal.wajdeczko@intel.com>
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

Some advanced macros used to generate code may use helper macros
to manipulate the argument lists. Define generic helpers that can
replace existing local definitions and allow reuse by new code.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/linux/args.h | 103 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/include/linux/args.h b/include/linux/args.h
index 8ff60a54eb7d..141803f0f41c 100644
--- a/include/linux/args.h
+++ b/include/linux/args.h
@@ -25,4 +25,107 @@
 #define __CONCAT(a, b) a ## b
 #define CONCATENATE(a, b) __CONCAT(a, b)
 
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
 #endif	/* _LINUX_ARGS_H */
-- 
2.43.0

