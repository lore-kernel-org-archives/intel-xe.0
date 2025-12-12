Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46048D59D77
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 17:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057B510E304;
	Fri, 12 Dec 2025 17:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ExpzrO9y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA31310E304
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 17:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765560905; x=1797096905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PnqtkE4+dGZ2t2kz7nobkttr5+1Tn5Ec/f+CpqhLFkY=;
 b=ExpzrO9yLGB/4qDtuMzulpnCw9ocaMVJbPdxotGmhdBOVIzRSzqRnTGg
 SI9b7m/MvWu8PGbL2bsai24mSNvbNmSIzjT/GcRJYZVsoyt9VM2JuExSI
 cMwl6WkB0EvfUY+kzn+MPHoa/NJcY4gFeEBXv686CzjVM+ZiBOIcLwZ8t
 WpdboLkY+sHxtmumwMQ6uzlagygES6ffpzX+HZvHQ6JJMVHLx/Y0dA6Qm
 OMZYOsic+wtRqhj/FGVL1VwVGtjQZtzD9K2MvX4whe0GZEuPl72v1DChG
 EeMuvSEquV0mFAGv5lq6xkqFwNQt8TeltwD8lDIw9JrPMiXpwnRl5iuna w==;
X-CSE-ConnectionGUID: afRNf2w8RK67P27E1vbfMw==
X-CSE-MsgGUID: SAV2sn92Tn2Wqcizxvk9Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71414747"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71414747"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 09:35:05 -0800
X-CSE-ConnectionGUID: uu/MRNhlS8uZZ3hkNM1Q/Q==
X-CSE-MsgGUID: HPrJ7SDDQl2o8zs70Wby1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="197205051"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 09:35:04 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/3] drm/xe: Introduce IF_ARGS macro utility
Date: Fri, 12 Dec 2025 18:34:47 +0100
Message-ID: <20251212173449.192639-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212173449.192639-1-michal.wajdeczko@intel.com>
References: <20251212173449.192639-1-michal.wajdeczko@intel.com>
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

We want to extend our macro-based KLV list definitions with new
information about the version from which given KLV is supported.
Add utility IF_ARGS macro that can be used in code generators to
emit different code based on the presence of additional arguments.

Introduce macro itself and extend our kunit tests to cover it.
We will use this macro in next patch.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_args_test.c | 53 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_args.h            | 18 +++++++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_args_test.c b/drivers/gpu/drm/xe/tests/xe_args_test.c
index f3fb23aa5d2e..d11ea610f67a 100644
--- a/drivers/gpu/drm/xe/tests/xe_args_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_args_test.c
@@ -78,6 +78,24 @@ static void pick_arg_example(struct kunit *test)
 #undef buz
 }
 
+static void if_args_example(struct kunit *test)
+{
+	enum { Z = 1, Q };
+
+#define foo	X, Y
+#define bar	IF_ARGS(Z, Q, foo)
+#define buz	IF_ARGS(Z, Q, DROP_FIRST_ARG(FIRST_ARG(foo)))
+
+	KUNIT_EXPECT_EQ(test, bar, Z);
+	KUNIT_EXPECT_EQ(test, buz, Q);
+	KUNIT_EXPECT_STREQ(test, __stringify(bar), "Z");
+	KUNIT_EXPECT_STREQ(test, __stringify(buz), "Q");
+
+#undef foo
+#undef bar
+#undef buz
+}
+
 static void sep_comma_example(struct kunit *test)
 {
 #define foo(f)	f(X) f(Y) f(Z) f(Q)
@@ -198,6 +216,39 @@ static void last_arg_test(struct kunit *test)
 	KUNIT_EXPECT_STREQ(test, __stringify(LAST_ARG(MAX_ARGS)), "-12");
 }
 
+static void if_args_test(struct kunit *test)
+{
+	bool with_args = true;
+	bool no_args = false;
+	enum { X = 100 };
+
+	KUNIT_EXPECT_TRUE(test, IF_ARGS(true, false, FOO_ARGS));
+	KUNIT_EXPECT_FALSE(test, IF_ARGS(true, false, NO_ARGS));
+
+	KUNIT_EXPECT_TRUE(test, CONCATENATE(IF_ARGS(with, no, FOO_ARGS), _args));
+	KUNIT_EXPECT_FALSE(test, CONCATENATE(IF_ARGS(with, no, NO_ARGS), _args));
+
+	KUNIT_EXPECT_STREQ(test, __stringify(IF_ARGS(yes, no, FOO_ARGS)), "yes");
+	KUNIT_EXPECT_STREQ(test, __stringify(IF_ARGS(no, no, NO_ARGS)), "no");
+
+	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, FOO_ARGS), -1, FOO_ARGS), 4);
+	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, FOO_ARGS), -1, NO_ARGS), -1);
+	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, NO_ARGS), -1, FOO_ARGS), 0);
+	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, NO_ARGS), -1, NO_ARGS), -1);
+
+	KUNIT_EXPECT_EQ(test,
+			FIRST_ARG(CONCATENATE(CALL_ARGS(IF_ARGS, FOO, MAX, FOO_ARGS), _ARGS)), X);
+	KUNIT_EXPECT_EQ(test,
+			FIRST_ARG(CONCATENATE(CALL_ARGS(IF_ARGS, FOO, MAX, NO_ARGS), _ARGS)), -1);
+
+	KUNIT_EXPECT_EQ(test,
+			CALL_ARGS(COUNT_ARGS,
+				  CONCATENATE(CALL_ARGS(IF_ARGS, FOO, MAX, FOO_ARGS), _ARGS)), 4);
+	KUNIT_EXPECT_EQ(test,
+			CALL_ARGS(COUNT_ARGS,
+				  CONCATENATE(CALL_ARGS(IF_ARGS, FOO, MAX, NO_ARGS), _ARGS)), 12);
+}
+
 static struct kunit_case args_tests[] = {
 	KUNIT_CASE(count_args_test),
 	KUNIT_CASE(call_args_example),
@@ -209,6 +260,8 @@ static struct kunit_case args_tests[] = {
 	KUNIT_CASE(last_arg_example),
 	KUNIT_CASE(last_arg_test),
 	KUNIT_CASE(pick_arg_example),
+	KUNIT_CASE(if_args_example),
+	KUNIT_CASE(if_args_test),
 	KUNIT_CASE(sep_comma_example),
 	{}
 };
diff --git a/drivers/gpu/drm/xe/xe_args.h b/drivers/gpu/drm/xe/xe_args.h
index 4dbc7e53c624..b24e6d3349bb 100644
--- a/drivers/gpu/drm/xe/xe_args.h
+++ b/drivers/gpu/drm/xe/xe_args.h
@@ -121,6 +121,24 @@
 #define PICK_ARG11(args...)		PICK_ARG10(DROP_FIRST_ARG(args))
 #define PICK_ARG12(args...)		PICK_ARG11(DROP_FIRST_ARG(args))
 
+/**
+ * IF_ARGS() - Make selection based on optional argument list.
+ * @then: token to return if arguments are present
+ * @else: token to return if arguments are empty
+ * @...: arguments to check (optional)
+ *
+ * This macro allows to select a token based on the presence of the argumen list.
+ *
+ * Example:
+ *
+ *	#define foo	X, Y
+ *	#define bar	IF_ARGS(Z, Q, foo)
+ *	#define buz	IF_ARGS(Z, Q, DROP_FIRST_ARG(FIRST_ARG(foo)))
+ *
+ *	With above definitions bar expands to Z while buz expands to Q.
+ */
+#define IF_ARGS(then, else, ...)	FIRST_ARG(__VA_OPT__(then,) else)
+
 /**
  * ARGS_SEP_COMMA - Definition of a comma character.
  *
-- 
2.47.1

