Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DC8C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 16:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0254F10E99B;
	Fri,  9 Aug 2024 16:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2Y1kDzT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E13910E999
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 16:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723222348; x=1754758348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J/9loFlUOJ+Oi1+GsuwGNfN9OHhBjwnGot1jE6ZzVoY=;
 b=d2Y1kDzTeJQvthgTpEAbK678F3M1YpoltDFMkyqDOSioCU/uJaLcTdGw
 YBsZWNyVfrkb702Bmu/OTc0tO2klAFPg3d8T+CkmRVeWNt3eNdQtWcUN/
 wjsc1dZaBgC4Vklc1wec9Wiyvahf4jrSl0DuRvTY+3q2Vh9Vc68sQ5Tc3
 kbTPIl9Zr8xDaXwNQ6snoLkR7ooB5iAJGT25uZ6/sCfHDEGSUMjBC+myt
 nXpkXqhMLwotlN1301ydOhwem6oe6R12BYRXwCdckL+DNPHOslzmFJiaQ
 RNYrkomuLAbDNbjqpv4osKRvvetjtYpSwCc9Lh/N7SG1XEqcjEj/Ca218 A==;
X-CSE-ConnectionGUID: zimozLx0RcWq8YFy0gQivg==
X-CSE-MsgGUID: qoEK8vEwR7ad0n1YVpzq0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21379430"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21379430"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:28 -0700
X-CSE-ConnectionGUID: 85IZO5plTrWDMMRi+3xApQ==
X-CSE-MsgGUID: hqT+jPMHRkyEMb5cMgqM/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57569333"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:26 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 07/12] drm/xe/tests: Add helpers to call stubs out of KUnit
 context
Date: Fri,  9 Aug 2024 18:51:54 +0200
Message-Id: <20240809165159.662-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240809165159.662-1-michal.wajdeczko@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
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

The KUNIT_STATIC_STUB_REDIRECT() allows to redirect function call but will
work only if the caller is in a KUnit context. To allow implementation of
the more complex test cases, add helpers that allow calling stubs also out
of a KUnit context.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_test.h | 74 ++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_test.h b/drivers/gpu/drm/xe/tests/xe_test.h
index b8fa409ce2b1..ffa8fa6c96f0 100644
--- a/drivers/gpu/drm/xe/tests/xe_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_test.h
@@ -54,11 +54,85 @@ xe_cur_kunit_priv(enum xe_test_priv_id id)
 	return priv->id == id ? priv : NULL;
 }
 
+/**
+ * XE_TEST_REDIRECT() - Call a function stub if one exists.
+ * @stub: The pointer to the function stub
+ * @args: All of the arguments passed to this stub
+ *
+ * This is a function prologue which is used to allow calls to the current
+ * function to be redirected if a KUnit is running. If the stub is NULL or
+ * the KUnit is not running the function will continue execution as normal.
+ *
+ * Unlikely the KUNIT_STATIC_STUB_REDIRECT(), this redirection will work
+ * even if the caller is not in a KUnit context (like a worker thread).
+ *
+ * Example:
+ *
+ * .. code-block:: c
+ *
+ *	int (*stub)(int n);
+ *
+ *	int real_func(int n)
+ *	{
+ *		XE_TEST_REDIRECT(stub, n);
+ *		return n + 1;
+ *	}
+ *
+ *	int replacement_func(int n)
+ *	{
+ *		return n + 100;
+ *	}
+ *
+ *	void example_test(struct kunit *test)
+ *	{
+ *		stub = replacement_func;
+ *		KUNIT_EXPECT_EQ(test, real_func(1), 101);
+ *		KUNIT_EXPECT_EQ(test, real_func(1), 101);
+ *	}
+ */
+#define XE_TEST_REDIRECT(stub, args...)							\
+do {											\
+	typeof(stub) replacement = (stub);						\
+	if (XE_TEST_RUNNING()) {							\
+		if (unlikely(replacement)) {						\
+			pr_info(KUNIT_SUBTEST_INDENT "# %s: calling stub %ps\n",	\
+				__func__, replacement);					\
+			return replacement(args);					\
+		}									\
+	}										\
+} while (0)
+
+static inline void __nullify_pointer(void *data)
+{
+	void **ptr = data;
+
+	*ptr = NULL;
+}
+
+/**
+ * XE_TEST_ACTIVATE_STUB() - Setup a function stub.
+ * @test: Test case that wants to setup a function stub
+ * @stub: The function stub pointer
+ * @replacement: The replacement function
+ *
+ * This helper setups a function stub with the replacement function.
+ * It will also automatically restore stub to NULL at the test end.
+ */
+#define XE_TEST_ACTIVATE_STUB(test, stub, replacement)	({					\
+	typeof(test) __test = (test);								\
+	typeof(stub) *__ptr = &(stub);								\
+	typecheck_pointer(*__ptr);								\
+	*__ptr = (replacement);									\
+	kunit_info(__test, "activated stub %s with %ps\n", __stringify(stub), *__ptr);		\
+	kunit_add_action_or_reset(__test, __nullify_pointer, __ptr);				\
+})
+
 #else /* if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST) */
 
 #define XE_TEST_DECLARE(x)
 #define XE_TEST_ONLY(x) 0
 #define XE_TEST_RUNNING() false
+#define XE_TEST_REDIRECT(...) do { } while (0)
 
 #define xe_cur_kunit_priv(_id) NULL
 
-- 
2.43.0

