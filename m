Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7053ACA0EC4
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 22:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F0610E573;
	Mon, 11 Aug 2025 22:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="idyctoZn";
	dkim-atps=neutral
Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com
 [209.85.222.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A7610E570
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 22:18:00 +0000 (UTC)
Received: by mail-qk1-f201.google.com with SMTP id
 af79cd13be357-7e84d132874so427380485a.2
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 15:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754950679; x=1755555479;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=kZCyJ8fS+0ViRKQvRY7E+bm8qVK2uq6SSWVZQUVTZM4=;
 b=idyctoZnn2ZOoSNnUvY2ODnBsg5rK+cvn1w9zKK5fds/lVY2NPWYmhyuoNxTzr7E03
 6fSMj8oONCctxDeWwO47ohwcJ+WPBduhcGLbyKD8JVNPjRakyLUWVklzgl0btOTdpb/z
 rj8NvWGESoEHvFyUr4p0pZutgfnbFVz/4H4ojI1WmYm1xpeFVNOuyl7IqM57AiiR00OZ
 aALL67Cg1Go7/x0wDLc4E2QsmpNFF699buuZPnGW5bFKca0ztEIQKKMvve6sQP/Hvf2T
 GiIMHX5D1RB9CVW1u/1iLhSoN7DL+Hag0Pn5b/0ig134Z6z2MLi0MHplDWnQxSRXS5S+
 /tOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754950679; x=1755555479;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kZCyJ8fS+0ViRKQvRY7E+bm8qVK2uq6SSWVZQUVTZM4=;
 b=cXy1O2xIvwV748Ly9++AOtBFKaK18k1A97jjLt1/35ZECiAT4ecCDOIfIbEoWKyEmd
 1sL2nqYjqL5GAQtjhXCYVH14sU4kYWZxOB4/C4P9XdUbnGImGXohvSa2wGpfFsr28mo8
 8m4IuFb7HJzBQCZZQ3p9TvOp78CpXseCF9AOq2CDCmYbuwoWvLJYQhE3KzgOhRNEA++1
 8TxzNpVHGlGfXdr9EnSdHt5dK/0q9XxBkjQhg3vOpdJozRXqY9EPiK8QM7pYFPxZH8C+
 qnLIwYMkZS2rPVoo+T9UT2qkbmEVAI5ydd5xFki5Uuniy3kN5n7REPLDQaYHp4+U/haf
 ZZVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4oLzaQjEW26e638L++d3iv6Hy0Ly7kFPMgZOabduChloBv9LPJh3I/TI/BhKGYtUOo9k3Y+qYjA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/8eEIjDvxHt8Qs2cAcqEbJ00TSQySV57r1it1ZCsX7OhmPlCe
 Qtdcv6vd0xTvlHg+pgZxj1aZ1wymHwvCDUbBV15ln/XcYclt1m6mikDj1ydwOT/xjSh1pwAQ9+O
 Flzojd6ktbK+xSA==
X-Google-Smtp-Source: AGHT+IGhtZ5xU+kV0HYNIrp9JCR5xLG8HbXSQzbL/irNzdF3bGZbSnIMXJ4PReI3rQSi5cdwkjBavHO6zcrEZg==
X-Received: from qktt14.prod.google.com ([2002:a05:620a:4e:b0:7e6:9d66:9ee3])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:e0a:b0:7e6:2610:f2e0 with SMTP id
 af79cd13be357-7e8588faba8mr194499385a.39.1754950679395; 
 Mon, 11 Aug 2025 15:17:59 -0700 (PDT)
Date: Mon, 11 Aug 2025 22:17:37 +0000
In-Reply-To: <20250811221739.2694336-1-marievic@google.com>
Mime-Version: 1.0
References: <20250811221739.2694336-1-marievic@google.com>
X-Mailer: git-send-email 2.51.0.rc0.205.g4a044479a3-goog
Message-ID: <20250811221739.2694336-6-marievic@google.com>
Subject: [PATCH v2 5/7] kunit: Add example parameterized test with shared
 resource management using the Resource API
From: Marie Zhussupova <marievic@google.com>
To: rmoar@google.com, davidgow@google.com, shuah@kernel.org, 
 brendan.higgins@linux.dev
Cc: mark.rutland@arm.com, elver@google.com, dvyukov@google.com, 
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, kasan-dev@googlegroups.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Marie Zhussupova <marievic@google.com>
Content-Type: text/plain; charset="UTF-8"
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

Add example_params_test_with_init() to illustrate how to manage
shared resources across a parameterized KUnit test. This example
showcases the use of the new param_init() function and its registration
to a test using the KUNIT_CASE_PARAM_WITH_INIT() macro.

Additionally, the test demonstrates how to directly pass a parameter array
to the parameterized test context via kunit_register_params_array()
and leveraging the Resource API for shared resource management.

Signed-off-by: Marie Zhussupova <marievic@google.com>
---

Changes in v2:

- kunit_array_gen_params() is now explicitly passed to
  KUNIT_CASE_PARAM_WITH_INIT() to be consistent with
  a parameterized test being defined by the existence
  of the generate_params() function.
- The comments were edited to be more concise.
- The patch header was changed to reflect that this example
  test's intent is more aligned with showcasing using the
  Resource API for shared resource management.
- The comments and the commit message were changed to
  reflect the parameterized testing terminology. See
  the patch series cover letter change log for the
  definitions.

---

 lib/kunit/kunit-example-test.c | 118 +++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/lib/kunit/kunit-example-test.c b/lib/kunit/kunit-example-test.c
index 3056d6bc705d..f2819ee58965 100644
--- a/lib/kunit/kunit-example-test.c
+++ b/lib/kunit/kunit-example-test.c
@@ -277,6 +277,122 @@ static void example_slow_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 1 + 1, 2);
 }
 
+/*
+ * This custom function allocates memory and sets the information we want
+ * stored in the kunit_resource->data field.
+ */
+static int example_resource_init(struct kunit_resource *res, void *context)
+{
+	int *info = kmalloc(sizeof(*info), GFP_KERNEL);
+
+	if (!info)
+		return -ENOMEM;
+	*info = *(int *)context;
+	res->data = info;
+	return 0;
+}
+
+/*
+ * This function deallocates memory for the kunit_resource->data field.
+ */
+static void example_resource_free(struct kunit_resource *res)
+{
+	kfree(res->data);
+}
+
+/*
+ * This match function is invoked by kunit_find_resource() to locate
+ * a test resource based on certain criteria.
+ */
+static bool example_resource_alloc_match(struct kunit *test,
+					 struct kunit_resource *res,
+					 void *match_data)
+{
+	return res->data && res->free == example_resource_free;
+}
+
+/*
+ * This is an example of a function that provides a description for each of the
+ * parameters in a parameterized test.
+ */
+static void example_param_array_get_desc(struct kunit *test, const void *p, char *desc)
+{
+	const struct example_param *param = p;
+
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE,
+		 "example check if %d is less than or equal to 3", param->value);
+}
+
+/*
+ * This function gets passed in the parameterized test context i.e. the
+ * struct kunit belonging to the parameterized test. You can use this function
+ * to add resources you want shared across the whole parameterized test or
+ * for additional setup.
+ */
+static int example_param_init(struct kunit *test)
+{
+	int ctx = 3; /* Data to be stored. */
+	size_t arr_size = ARRAY_SIZE(example_params_array);
+
+	/*
+	 * This allocates a struct kunit_resource, sets its data field to
+	 * ctx, and adds it to the struct kunit's resources list. Note that
+	 * this is parameterized test managed. So, it doesn't need to have
+	 * a custom exit function to deallocation as it will get cleaned up at
+	 * the end of the parameterized test.
+	 */
+	void *data = kunit_alloc_resource(test, example_resource_init, example_resource_free,
+					  GFP_KERNEL, &ctx);
+
+	if (!data)
+		return -ENOMEM;
+	/*
+	 * Pass the parameter array information to the parameterized test context
+	 * struct kunit. Note that you will need to provide kunit_array_gen_params()
+	 * as the generator function to KUNIT_CASE_PARAM_WITH_INIT() when registering
+	 * a parameter array this route.
+	 *
+	 * Alternatively, since this is a static array we can also use
+	 * KUNIT_CASE_PARAM_ARRAY(,DESC) to create  a `*_gen_params()` function
+	 * and pass that to  KUNIT_CASE_PARAM_WITH_INIT() instead of registering
+	 * the parameter array here.
+	 */
+	kunit_register_params_array(test, example_params_array, arr_size,
+				    example_param_array_get_desc);
+	return 0;
+}
+
+/*
+ * This is an example of a test that uses shared resources available in the
+ * parameterized test context.
+ */
+static void example_params_test_with_init(struct kunit *test)
+{
+	int threshold;
+	struct kunit_resource *res;
+	const struct example_param *param = test->param_value;
+
+	/* By design, param pointer will not be NULL. */
+	KUNIT_ASSERT_NOT_NULL(test, param);
+
+	/*
+	 * Here we pass test->parent to search for shared resources in the
+	 * parameterized test context.
+	 */
+	res = kunit_find_resource(test->parent, example_resource_alloc_match, NULL);
+
+	KUNIT_ASSERT_NOT_NULL(test, res);
+
+	/* Since kunit_resource->data is a void pointer we need to typecast it. */
+	threshold = *((int *)res->data);
+
+	/* Assert that the parameter is less than or equal to a certain threshold. */
+	KUNIT_ASSERT_LE(test, param->value, threshold);
+
+	/* This decreases the reference count after calling kunit_find_resource(). */
+	kunit_put_resource(res);
+}
+
 /*
  * Here we make a list of all the test cases we want to add to the test suite
  * below.
@@ -296,6 +412,8 @@ static struct kunit_case example_test_cases[] = {
 	KUNIT_CASE(example_static_stub_using_fn_ptr_test),
 	KUNIT_CASE(example_priv_test),
 	KUNIT_CASE_PARAM(example_params_test, example_gen_params),
+	KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init, kunit_array_gen_params,
+				   example_param_init, NULL),
 	KUNIT_CASE_SLOW(example_slow_test),
 	{}
 };
-- 
2.51.0.rc0.205.g4a044479a3-goog

