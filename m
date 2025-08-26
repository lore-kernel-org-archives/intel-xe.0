Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533E5CA0FED
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 09:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43CB10E61F;
	Tue, 26 Aug 2025 09:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="E9Dxt7IJ";
	dkim-atps=neutral
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
 [209.85.214.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CCB10E616
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 09:13:53 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-24640dae139so32878695ad.1
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 02:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756199633; x=1756804433;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=E/DdI8QKaF0QvnOvsbrRP9RRgtoSroBxXesHs3tNY3s=;
 b=E9Dxt7IJlw0pkSfYjIiq7ipZl5aMpdm1TiCcRRVcv+cgyePQ+qDtnC8kBUHhJNtRto
 PWhxPzPYkObVHTfbWMPQqaVf+xx3ZdlR7qz8vUWNAZrtY1jqoDu93lmWN3rV2ymjtLy7
 9V/wo83mRGyDH9NUJLc+xGQexj+xMQFDazVX0IoE5DxaLZTbNenL4OrI0O2wyUg5N3mV
 Bn9p3u3WHtjYmRyYAh/eWLhxTK+WUmLiCQmwD9KK2US46TmRGh3ZapOqeQFMertGwBSu
 GHas5M+/dAbYub4AogctwRORX7Se3U3DgXIO1FYxGA+5IgXdfYxGI6W9ruBZPszvJXIm
 /jCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756199633; x=1756804433;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E/DdI8QKaF0QvnOvsbrRP9RRgtoSroBxXesHs3tNY3s=;
 b=sisrHUE435kVUq2BU1nHl3PwrZN6iSOvwKM2aRzNA+MUliDnQVLJS0q6VLkgCW+xXG
 2ThmWH2KA6EzGDMbAuTQWapMXqRbnz+ACVlC/5eAJHT5VgslPXcP/mACwatdmfyY1hbJ
 XjEJk0MUjj+7rTkpsLMQt4YDj3I276Hl1yPN2pMVgtkU5yZUOydxOpu9wmoZv+4z+ezD
 JdOYcbU216h7PMCL/jpPU6WZhmOT5sTgZjs+jYL0LihU41sU6b2PPsC0SrfrM1LFSf8k
 XkMan3nTZvfxGes7yDx8OxtoFgVnk96sz7jOcQV8Zvq0tGkOzzxBBlOfIUIWkuKRl6X5
 jB8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjPj+ep/uuL0dVh++d9z3Kebl17BgHXlJYG6DMGEVJfH7mPDdLmFJEIh8wET1ffdpbu8mUeID9Kw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeSpQZEjT6phNujrbiCjXS9O77FIs9AI9zgePP8t7hlakKyCMH
 DkP+1+FQNq/5Ph/Dl60NT1PLOHtODQe8Z31vsserWPutkYNWkxeXT58aaK12bjqPgjXSZ/KFNgL
 nnNnsWGZAk9CjoQ==
X-Google-Smtp-Source: AGHT+IFm2ccebIdeBPqgsg0k7MRJFE97IlpYmQ10sZM4xPEDskf6ORLyTRQTD8U2eP7B+NNUOmHZ2XIMml/jXw==
X-Received: from pldp2.prod.google.com ([2002:a17:902:eac2:b0:237:cedc:1467])
 (user=davidgow job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ec87:b0:246:6a8b:8473 with SMTP id
 d9443c01a7336-2466a8b8672mr147539915ad.45.1756199632691; 
 Tue, 26 Aug 2025 02:13:52 -0700 (PDT)
Date: Tue, 26 Aug 2025 17:13:35 +0800
In-Reply-To: <20250826091341.1427123-1-davidgow@google.com>
Mime-Version: 1.0
References: <20250826091341.1427123-1-davidgow@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250826091341.1427123-6-davidgow@google.com>
Subject: [PATCH v4 5/7] kunit: Add example parameterized test with shared
 resource management using the Resource API
From: David Gow <davidgow@google.com>
To: Marie Zhussupova <marievic@google.com>, marievictoria875@gmail.com,
 rmoar@google.com, shuah@kernel.org, brendan.higgins@linux.dev
Cc: mark.rutland@arm.com, elver@google.com, dvyukov@google.com, 
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, kasan-dev@googlegroups.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, 
 David Gow <davidgow@google.com>
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

From: Marie Zhussupova <marievic@google.com>

Add example_params_test_with_init() to illustrate how to manage
shared resources across a parameterized KUnit test. This example
showcases the use of the new param_init() function and its registration
to a test using the KUNIT_CASE_PARAM_WITH_INIT() macro.

Additionally, the test demonstrates how to directly pass a parameter array
to the parameterized test context via kunit_register_params_array()
and leveraging the Resource API for shared resource management.

Reviewed-by: Rae Moar <rmoar@google.com>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Marie Zhussupova <marievic@google.com>
Signed-off-by: David Gow <davidgow@google.com>
---

No changes in v4:
v3: https://lore.kernel.org/linux-kselftest/20250815103604.3857930-6-marievic@google.com/

Changes in v3:
v2: https://lore.kernel.org/all/20250811221739.2694336-6-marievic@google.com/
- Code comment edits.

Changes in v2:
v1: https://lore.kernel.org/all/20250729193647.3410634-8-marievic@google.com/
- kunit_array_gen_params() is now explicitly passed to
  KUNIT_CASE_PARAM_WITH_INIT() to be consistent with a parameterized test
  being defined by the existence of the generate_params() function.
- The comments were edited to be more concise.
- The patch header was changed to reflect that this example test's intent
  is more aligned with showcasing using the Resource API for shared
  resource management.
- The comments and the commit message were changed to reflect the
  parameterized testing terminology. See the patch series cover letter
  change log for the definitions.

---
 lib/kunit/kunit-example-test.c | 113 +++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/lib/kunit/kunit-example-test.c b/lib/kunit/kunit-example-test.c
index 3056d6bc705d..3e858367be01 100644
--- a/lib/kunit/kunit-example-test.c
+++ b/lib/kunit/kunit-example-test.c
@@ -277,6 +277,117 @@ static void example_slow_test(struct kunit *test)
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
@@ -296,6 +407,8 @@ static struct kunit_case example_test_cases[] = {
 	KUNIT_CASE(example_static_stub_using_fn_ptr_test),
 	KUNIT_CASE(example_priv_test),
 	KUNIT_CASE_PARAM(example_params_test, example_gen_params),
+	KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init, kunit_array_gen_params,
+				   example_param_init, NULL),
 	KUNIT_CASE_SLOW(example_slow_test),
 	{}
 };
-- 
2.51.0.261.g7ce5a0a67e-goog

