Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9964C87FD2
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 14:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A7F10E698;
	Wed, 30 Jul 2025 14:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LNRMMDfJ";
	dkim-atps=neutral
Received: from mail-qv1-f74.google.com (mail-qv1-f74.google.com
 [209.85.219.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF8510E2A1
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 19:37:35 +0000 (UTC)
Received: by mail-qv1-f74.google.com with SMTP id
 6a1803df08f44-7073f12d826so74852576d6.0
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 12:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753817855; x=1754422655;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=mqlb+4Olh1TwsUKHNBaNVmipEQokIfwNy2zQhwsaeKw=;
 b=LNRMMDfJjPXMYxvMz4pDmXkWI4FRyiSlPfgXKA/068VQi0QC785yAWF5FHql89cRn/
 rLdjZqWPFdG1P7NyqgK+nNSrv5IVrRzBuEm883que9VS+c8KrmWiPnqZQ5Joql1olvDe
 qLU6xa9QSLAy0oRbsw+fgwqohZByCxPH5FgQFZJb9OPZSbOXIqu42H5NyyjrvaRUrF65
 5on/aVQob0+0e/668f/grmRNu5AUC7WIwD3yWDRYVA5WoqpzsjkPNTmmVPODuuIouPRD
 WVifPegEziwZpu1T/3k+U3prC8mC4bPxn5fNi/B9B61m65Lc51+S2xbWfETqQiGg7vHS
 RL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753817855; x=1754422655;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mqlb+4Olh1TwsUKHNBaNVmipEQokIfwNy2zQhwsaeKw=;
 b=T4DRif4vY9VWZ7Z7TzpPClPKRnhSsSSk7BdqCkz3Rxtify4TX6I83kDoqL5T6pOcFQ
 CVay/4sRRSyme+n/8lkPt1MwhkelpyvRCXq+VsYxxS9B/wVEK5808Ct0PrnpC0IBfs4M
 cixUMciRWWSjM2YXyZFQwVyH2Rn0FFrcgpSwXvHRF6wxhAeRe1xSVAJKKNNYwM6eSw/P
 Vlv5otblsMPAoHHEOshjQszqaVKi+UzRwjTad7d/Kd2imDNTdeNCUq7KOBt6dkmD7W2+
 jXIXdYAl/bTCsoH+6bRm0TAENbF3kLsYf3kunDNq7EpIkvUXdJ7TzIHkfd/DO3lEVWtp
 QBQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7KpUF4Kd8cFuGp+WqbU5RGCdiYy6Sv+OFGK/rq0AJUv9ZSgdEN3uR4XGXBLpEK+89sDFpatrtDQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqpTzmlXGIYZZgIDXafA5buZJ2jcUN4fWWTMpaSgPVUSxJjuiq
 aosyXAxPZXA+Xc8afttp7n6LBgc3HlpbumcdJ5pWkBGPIljn4WpS/fgg8YCBSK2t7AjdMf5hvV2
 +LBdlgV0wHblP9g==
X-Google-Smtp-Source: AGHT+IFR27oKs2zCkDtQSep4WwYS5IRJ7UhNV1P5uHsuK/x9zfXEMRZqniNBaaI394PfZErJdlbmGWKHOIGAkQ==
X-Received: from qtbcm22.prod.google.com
 ([2002:a05:622a:2516:b0:4ab:3fb5:ddd8])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:ac8:5fd3:0:b0:4ab:63b9:9bf4 with SMTP id
 d75a77b69052e-4aedb98b2bfmr15053941cf.1.1753817854822; 
 Tue, 29 Jul 2025 12:37:34 -0700 (PDT)
Date: Tue, 29 Jul 2025 19:36:46 +0000
In-Reply-To: <20250729193647.3410634-1-marievic@google.com>
Mime-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729193647.3410634-9-marievic@google.com>
Subject: [PATCH 8/9] kunit: Add example parameterized test with direct dynamic
 parameter array setup
From: Marie Zhussupova <marievic@google.com>
To: rmoar@google.com, davidgow@google.com, shuah@kernel.org, 
 brendan.higgins@linux.dev
Cc: elver@google.com, dvyukov@google.com, lucas.demarchi@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 kasan-dev@googlegroups.com, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marie Zhussupova <marievic@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 30 Jul 2025 14:02:27 +0000
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

Introduce `example_params_test_with_init_dynamic_arr`. This new
KUnit test demonstrates directly assigning a dynamic parameter
array using the `kunit_register_params_array` macro. It highlights the
use of `param_init` and `param_exit` for proper initialization and
cleanup, and their registration to the test with
`KUNIT_CASE_PARAM_WITH_INIT`.

Signed-off-by: Marie Zhussupova <marievic@google.com>
---
 lib/kunit/kunit-example-test.c | 95 ++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/lib/kunit/kunit-example-test.c b/lib/kunit/kunit-example-test.c
index 5bf559e243f6..3ab121d81bf6 100644
--- a/lib/kunit/kunit-example-test.c
+++ b/lib/kunit/kunit-example-test.c
@@ -387,6 +387,98 @@ static void example_params_test_with_init(struct kunit *test)
 	kunit_put_resource(res);
 }
 
+/*
+ * Helper function to create a parameter array of Fibonacci numbers. This example
+ * highlights a parameter generation scenario that is:
+ * 1. Not feasible to fully pre-generate at compile time.
+ * 2. Challenging to implement with a standard 'generate_params' function,
+ * as it typically only provides the immediately 'prev' parameter, while
+ * Fibonacci requires access to two preceding values for calculation.
+ */
+static void *make_fibonacci_params(int seq_size)
+{
+	int *seq;
+
+	if (seq_size <= 0)
+		return NULL;
+
+	seq = kmalloc_array(seq_size, sizeof(int), GFP_KERNEL);
+
+	if (!seq)
+		return NULL;
+
+	if (seq_size >= 1)
+		seq[0] = 0;
+	if (seq_size >= 2)
+		seq[1] = 1;
+	for (int i = 2; i < seq_size; i++)
+		seq[i] = seq[i - 1] + seq[i - 2];
+	return seq;
+}
+
+/*
+ * This is an example of a function that provides a description for each of the
+ * parameters.
+ */
+static void example_param_dynamic_arr_get_desc(const void *p, char *desc)
+{
+	const int *fib_num = p;
+
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "fibonacci param: %d", *fib_num);
+}
+
+/*
+ * Example of a parameterized test init function that registers a dynamic array.
+ */
+static int example_param_init_dynamic_arr(struct kunit *test)
+{
+	int seq_size = 6;
+	int *fibonacci_params = make_fibonacci_params(seq_size);
+
+	if (!fibonacci_params)
+		return -ENOMEM;
+
+	/*
+	 * Passes the dynamic parameter array information to the parent struct kunit.
+	 * The array and its metadata will be stored in test->parent->params_data.
+	 * The array itself will be located in params_data.params.
+	 */
+	kunit_register_params_array(test, fibonacci_params, seq_size,
+				    example_param_dynamic_arr_get_desc);
+	return 0;
+}
+
+/**
+ * Function to clean up the parameterized test's parent kunit struct if
+ * there were custom allocations.
+ */
+static void example_param_exit_dynamic_arr(struct kunit *test)
+{
+	/*
+	 * We allocated this array, so we need to free it.
+	 * Since the parent parameter instance is passed here,
+	 * we can directly access the array via `test->params_data.params`
+	 * instead of `test->parent->params_data.params`.
+	 */
+	kfree(test->params_data.params);
+}
+
+/*
+ * Example of test that uses the registered dynamic array to perform assertions
+ * and expectations.
+ */
+static void example_params_test_with_init_dynamic_arr(struct kunit *test)
+{
+	const int *param = test->param_value;
+	int param_val;
+
+	/* By design, param pointer will not be NULL. */
+	KUNIT_ASSERT_NOT_NULL(test, param);
+
+	param_val = *param;
+	KUNIT_EXPECT_EQ(test, param_val - param_val, 0);
+}
+
 /*
  * Here we make a list of all the test cases we want to add to the test suite
  * below.
@@ -408,6 +500,9 @@ static struct kunit_case example_test_cases[] = {
 	KUNIT_CASE_PARAM(example_params_test, example_gen_params),
 	KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init, NULL,
 				   example_param_init, NULL),
+	KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init_dynamic_arr, NULL,
+				   example_param_init_dynamic_arr,
+				   example_param_exit_dynamic_arr),
 	KUNIT_CASE_SLOW(example_slow_test),
 	{}
 };
-- 
2.50.1.552.g942d659e1b-goog

