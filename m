Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37ADC7EE25
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 21:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC53C10EA4D;
	Wed, 26 Apr 2023 21:32:59 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146AD10EA45
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Apr 2023 21:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682544777; x=1714080777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PVUHNzJ+P89EXCNR1Wdp+9hCBGqZsKqeRzIkMetUT+w=;
 b=lE57Eca/+AhVAKY6VSH/6CK5+91FZDon6t3qqvoBLRrPvR5j9mnyrs4E
 pgmsFHCzIgAseuo2qYA66k3LPQPyLOxGH+vMTdgUdOVB0BBEpTg0Mhjia
 qwFfDqFzhL33SPR+oDImxP50v+Oh534NudjAkPgy21quDiBkJhs/H41M1
 C1J06XxIi5DA2v2oQ6w5qFS9qCJunY3U46eJxC1E0G27StXUPvNnKSliV
 jmhkqVhqohYgVfhe+o34nHFPtN/2IdV+OJ6EyOMn8NV+M+hFif5yQdKNL
 5NrtRLTFEQnLH1AhMb4/5MCZpz0x6FcrNqaplAT7Aaoa3/dshlCFKEfOo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375213096"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="375213096"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:32:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="644415188"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="644415188"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:32:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Apr 2023 14:32:37 -0700
Message-Id: <20230426213242.1315119-13-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230426213242.1315119-1-lucas.demarchi@intel.com>
References: <20230426213242.1315119-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 12/17] drm/xe/rtp: Improve magic macros for
 RTP tables
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The macros for writing the rtp tables have some downsides:

	1) They are fragile, and when making a typo it's hard to know
	   where it's failing for someone not used to them
	2) They polute the global scope. The CONCAT/COUNT_ARGS/etc only
	   work because they are defined exactly the same as the ones in
	   kernel.h.
	3) They are not compatible with rules/actions with registers
	   passing additional options

This new implementation fixes (2) and (3).

For (2), prefix everything with "_XE" or "XE_RTP", so there is less chance of
clashes. Also, the maximum number of rules and actions is 4, so there is
no need to make the helper macros go until 12: reduce that to 5, so if
more arguments is passed, the compiler gives an error that there is not
definition with _5 suffix.

For (3), change the implementation to concentrate on "pasting a prefix
to each argument" rather than the more general "call any macro for each
argument". Hopefully this will avoid trying to extending this infra and
making it more complex. The new changes to how the arguments are
constructed using tuples will allow extending the interface where it's
needed: passing additional register fields to allow creating our own
struct xe_reg.

v2:
  - Prefer XE_RTP_ prefix for helpers use in the rest of rtp header
    (Michal Wajdeczko)
  - Remove unnecessary indirection to paste to each arg

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com> # v1
---
 drivers/gpu/drm/xe/xe_rtp.h | 107 +++++++++++++++++++++++-------------
 1 file changed, 70 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index a3be7c77753a..67e1b4c44052 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -22,43 +22,77 @@ struct xe_reg_sr;
 /*
  * Helper macros - not to be used outside this header.
  */
-/* This counts to 12. Any more, it will return 13th argument. */
-#define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
-#define COUNT_ARGS(X...) __COUNT_ARGS(, ##X, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
+#define _XE_ESC(...) __VA_ARGS__
+#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__,5,4,3,2,1,))
+#define __XE_COUNT_ARGS(_,_5,_4,_3,_2,X_,...) X_
 
-#define __CONCAT(a, b) a ## b
-#define CONCATENATE(a, b) __CONCAT(a, b)
+#define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
+#define __XE_FIRST(x_,...) x_
+#define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
+#define __XE_TUPLE_TAIL(x_,...) (__VA_ARGS__)
 
-#define __CALL_FOR_EACH_1(MACRO_, x, ...) MACRO_(x)
-#define __CALL_FOR_EACH_2(MACRO_, x, ...)					\
-	MACRO_(x) __CALL_FOR_EACH_1(MACRO_, ##__VA_ARGS__)
-#define __CALL_FOR_EACH_3(MACRO_, x, ...)					\
-	MACRO_(x) __CALL_FOR_EACH_2(MACRO_, ##__VA_ARGS__)
-#define __CALL_FOR_EACH_4(MACRO_, x, ...)					\
-	MACRO_(x) __CALL_FOR_EACH_3(MACRO_, ##__VA_ARGS__)
+#define _XE_DROP_FIRST(x_, ...) __VA_ARGS__
 
-#define _CALL_FOR_EACH(NARGS_, MACRO_, x, ...)					\
-	CONCATENATE(__CALL_FOR_EACH_, NARGS_)(MACRO_, x, ##__VA_ARGS__)
-#define CALL_FOR_EACH(MACRO_, x, ...)						\
-	_CALL_FOR_EACH(COUNT_ARGS(x, ##__VA_ARGS__), MACRO_, x, ##__VA_ARGS__)
+#define _XE_RTP_CONCAT(a, b) __XE_RTP_CONCAT(a, b)
+#define __XE_RTP_CONCAT(a, b) XE_RTP_ ## a ## b
 
-#define _XE_RTP_REG(x_)	(x_), XE_RTP_REG_REGULAR
-#define _XE_RTP_MCR_REG(x_) (x_), XE_RTP_REG_MCR
+#define __XE_RTP_PASTE_SEP_COMMA		,
+#define __XE_RTP_PASTE_SEP_BITWISE_OR		|
 
 /*
- * Helper macros for concatenating prefix - do not use them directly outside
- * this header
+ * XE_RTP_PASTE_FOREACH - Paste XE_RTP_<@prefix_> on each element of the tuple
+ * @args, with the end result separated by @sep_. @sep must be one of the
+ * previously declared macros __XE_RTP_PASTE_SEP_*, or declared with such
+ * prefix.
+ *
+ * Examples:
+ *
+ * 1) XE_RTP_PASTE_FOREACH(TEST_, COMMA, (FOO, BAR))
+ *    expands to:
+ *
+ *	XE_RTP_TEST_FOO , XE_RTP_TEST_BAR
+ *
+ * 2) XE_RTP_PASTE_FOREACH(TEST2_, COMMA, (FOO))
+ *    expands to:
+ *
+ *	XE_RTP_TEST2_FOO
+ *
+ * 3) XE_RTP_PASTE_FOREACH(TEST3, BITWISE_OR, (FOO, BAR))
+ *    expands to:
+ *
+ *	XE_RTP_TEST3_FOO | XE_RTP_TEST3_BAR
+ *
+ * 4) #define __XE_RTP_PASTE_SEP_MY_SEP	BANANA
+ *    XE_RTP_PASTE_FOREACH(TEST_, MY_SEP, (FOO, BAR))
+ *    expands to:
+ *
+ *	XE_RTP_TEST_FOO BANANA XE_RTP_TEST_BAR
  */
-#define __ADD_XE_RTP_ENTRY_FLAG_PREFIX(x) CONCATENATE(XE_RTP_ENTRY_FLAG_, x) |
-#define __ADD_XE_RTP_ACTION_FLAG_PREFIX(x) CONCATENATE(XE_RTP_ACTION_FLAG_, x) |
-#define __ADD_XE_RTP_RULE_PREFIX(x) CONCATENATE(XE_RTP_RULE_, x) ,
-#define __ADD_XE_RTP_ACTION_PREFIX(x) CONCATENATE(XE_RTP_ACTION_, x) ,
+#define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_ESC(_XE_RTP_CONCAT(PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_, args_))
+#define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_)
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
+
+
+/*
+ * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
+ *
+ * Example:
+ *
+ *	#define foo(a_)	((struct foo){ .a = a_ })
+ *	XE_RTP_DROP_CAST(foo(10))
+ *	expands to:
+ *
+ *	{ .a = 10 }
+ */
+#define XE_RTP_DROP_CAST(...) _XE_ESC(_XE_DROP_FIRST _XE_ESC __VA_ARGS__)
+
 
 /*
  * Macros to encode rules to match against platform, IP version, stepping, etc.
  * Shouldn't be used directly - see XE_RTP_RULES()
  */
-
 #define _XE_RTP_RULE_PLATFORM(plat__)						\
 	{ .match_type = XE_RTP_MATCH_PLATFORM, .platform = plat__ }
 
@@ -315,8 +349,8 @@ struct xe_reg_sr;
  *		...
  *	};
  */
-#define XE_RTP_ENTRY_FLAG(f1_, ...)						\
-	.flags = (CALL_FOR_EACH(__ADD_XE_RTP_ENTRY_FLAG_PREFIX, f1_, ##__VA_ARGS__) 0)
+#define XE_RTP_ENTRY_FLAG(...)							\
+	.flags = (XE_RTP_PASTE_FOREACH(ENTRY_FLAG_, BITWISE_OR, (__VA_ARGS__)))
 
 /**
  * XE_RTP_ACTION_FLAG - Helper to add multiple flags to a struct xe_rtp_action
@@ -338,8 +372,8 @@ struct xe_reg_sr;
  *		...
  *	};
  */
-#define XE_RTP_ACTION_FLAG(f1_, ...)						\
-	.flags = (CALL_FOR_EACH(__ADD_XE_RTP_ACTION_FLAG_PREFIX, f1_, ##__VA_ARGS__) 0)
+#define XE_RTP_ACTION_FLAG(...)							\
+	.flags = (XE_RTP_PASTE_FOREACH(ACTION_FLAG_, BITWISE_OR, (__VA_ARGS__)))
 
 /**
  * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry entry
@@ -361,16 +395,15 @@ struct xe_reg_sr;
  *		...
  *	};
  */
-#define XE_RTP_RULES(r1, ...)							\
-	.n_rules = COUNT_ARGS(r1, ##__VA_ARGS__),				\
+#define XE_RTP_RULES(...)							\
+	.n_rules = _XE_COUNT_ARGS(__VA_ARGS__),					\
 	.rules = (const struct xe_rtp_rule[]) {					\
-		CALL_FOR_EACH(__ADD_XE_RTP_RULE_PREFIX, r1, ##__VA_ARGS__)	\
+		XE_RTP_PASTE_FOREACH(RULE_, COMMA, (__VA_ARGS__))	\
 	}
 
 /**
  * XE_RTP_ACTIONS - Helper to set multiple actions to a struct xe_rtp_entry
- * @a1: Action to take. Last part of XE_RTP_ACTION_*
- * @...: Additional rules, defined like @r1
+ * @...: Actions to be taken
  *
  * At least one rule is needed and up to 4 are supported. Multiple rules are
  * AND'ed together, i.e. all the rules must evaluate to true for the entry to
@@ -388,10 +421,10 @@ struct xe_reg_sr;
  *		...
  *	};
  */
-#define XE_RTP_ACTIONS(a1, ...)							\
-	.n_actions = COUNT_ARGS(a1, ##__VA_ARGS__),				\
+#define XE_RTP_ACTIONS(...)							\
+	.n_actions = _XE_COUNT_ARGS(__VA_ARGS__),				\
 	.actions = (const struct xe_rtp_action[]) {				\
-		CALL_FOR_EACH(__ADD_XE_RTP_ACTION_PREFIX, a1, ##__VA_ARGS__)	\
+		XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS__))	\
 	}
 
 void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
-- 
2.40.1

