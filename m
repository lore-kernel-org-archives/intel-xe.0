Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC4AC87FD6
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 14:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B050F10E6B2;
	Wed, 30 Jul 2025 14:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0YPDdV9m";
	dkim-atps=neutral
Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com
 [209.85.160.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0261310E08E
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 19:37:22 +0000 (UTC)
Received: by mail-qt1-f201.google.com with SMTP id
 d75a77b69052e-4ab701d5317so164668221cf.2
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 12:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753817842; x=1754422642;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=LOeFclXy3T+mxjPs2r95qUwInGd9f34oaUC//E5T6EQ=;
 b=0YPDdV9mOELMVVhl3ifrrlh0pxZhAcBPhIwFffmP993+gb8JtXezv/FzrxYxiX/3Zk
 wWwBGA/27AbzADA5vf5dPfl13MjhendmydR5tDfkUknJp8lE6U2HzuVLL+7Iu3CDryl6
 j4Atu3CXHcJkpOHGVRPfKeM4xGGfPNqv2wtrt92ivzMxFjHnzVYUdF/tTCNGDhf2bUxO
 /wVhDF8kYa+P0c1f8bYKySz36EBU0WnCBjMKJ2QRRJ8AytIhuJdz01e172ps920UbuuI
 SPo8xxqtfMsoRDGnsWJbhKBrt4pn72r2wqqdZVu/U+ml3f155QRtj/suMqhIe2lal62q
 92Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753817842; x=1754422642;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LOeFclXy3T+mxjPs2r95qUwInGd9f34oaUC//E5T6EQ=;
 b=vyVkcB4O8HejYVt/775mBWZ/sVkwLg2U+JnqUwAjA2Mig7suup24QXxPgb+I2N6Liy
 U1QPcC9agI9fU+CnvGlSg0u12EOfwMpes6k26KZjFoadaMgkDY8w2wv9UMeVhBs8fVh5
 B5fsD/dWfyumZWSfB8LRr3hgh9Vfy6yohplpptEavBXq0tAzy58wyvZsd0XXMAO+fh/J
 LuX3IISfpy8523P0zhdPMvHg9zEkodrJPZWdRvyo3Jc1HCTqYvQUkbsDFVB4GJW9rLY4
 WCF3XtMqtSJeTtEicfcPpHlbx3t101vfqmGGRHFxkPER7bgxXIHdrHzFW3dRdeiUhKBX
 ZQVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWLlfvVDhVoLfy/iFBm9xdgMy1WxxY1SYq+JMMwQMmkHOvZQ7DGITwg+MiRpZDKSEapC5z4D0JmA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkZNLojmRbPeK6LqvzY9LEzqEZq/Ak+1bjftr2A6Hdt0oMnZsC
 kKGobRca5x0YhvhMvR98P+kWAFsZmgRWiW9qi/uvcbKRFXEdUlHWjS6Q+JK6RbsfcCU7h1wZ1rK
 5YNQTEHADPfUzbg==
X-Google-Smtp-Source: AGHT+IGMUSrZqdOskeosr+igUyfuxaNIUOfIiK4baHfY/+3YYV3woVzpXvK0qcFaE6oy2EYskMsu3hBqN2Ggaw==
X-Received: from qtbfh7.prod.google.com ([2002:a05:622a:5887:b0:4ab:b3a4:9650])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:1906:b0:4ab:6a4c:83a2 with SMTP id
 d75a77b69052e-4aedbc5d048mr14740211cf.39.1753817842099; 
 Tue, 29 Jul 2025 12:37:22 -0700 (PDT)
Date: Tue, 29 Jul 2025 19:36:41 +0000
In-Reply-To: <20250729193647.3410634-1-marievic@google.com>
Mime-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729193647.3410634-4-marievic@google.com>
Subject: [PATCH 3/9] kunit: Pass additional context to generate_params for
 parameterized testing
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

To enable more complex parameterized test scenarios,
the `generate_params` function sometimes needs additional
context beyond just the previously generated parameter.
This patch modifies the `generate_params` function signature
to include an extra `struct kunit *test` argument, giving
users access to the parent kunit test's context when
generating subsequent parameters.

The `struct kunit *test` argument was added as the first parameter
to the function signature as it aligns with the convention
of other KUnit functions that accept `struct kunit *test` first.
This also mirrors the "this" or "self" reference found
in object-oriented programming languages.

Signed-off-by: Marie Zhussupova <marievic@google.com>
---
 include/kunit/test.h | 9 ++++++---
 lib/kunit/test.c     | 5 +++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index d8dac7efd745..4ba65dc35710 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -128,7 +128,8 @@ struct kunit_attributes {
 struct kunit_case {
 	void (*run_case)(struct kunit *test);
 	const char *name;
-	const void* (*generate_params)(const void *prev, char *desc);
+	const void* (*generate_params)(struct kunit *test,
+				       const void *prev, char *desc);
 	struct kunit_attributes attr;
 
 	/*
@@ -1701,7 +1702,8 @@ do {									       \
  * Define function @name_gen_params which uses @array to generate parameters.
  */
 #define KUNIT_ARRAY_PARAM(name, array, get_desc)						\
-	static const void *name##_gen_params(const void *prev, char *desc)			\
+	static const void *name##_gen_params(struct kunit *test,				\
+					     const void *prev, char *desc)			\
 	{											\
 		typeof((array)[0]) *__next = prev ? ((typeof(__next)) prev) + 1 : (array);	\
 		if (__next - (array) < ARRAY_SIZE((array))) {					\
@@ -1722,7 +1724,8 @@ do {									       \
  * Define function @name_gen_params which uses @array to generate parameters.
  */
 #define KUNIT_ARRAY_PARAM_DESC(name, array, desc_member)					\
-	static const void *name##_gen_params(const void *prev, char *desc)			\
+	static const void *name##_gen_params(struct kunit *test,				\
+					     const void *prev, char *desc)			\
 	{											\
 		typeof((array)[0]) *__next = prev ? ((typeof(__next)) prev) + 1 : (array);	\
 		if (__next - (array) < ARRAY_SIZE((array))) {					\
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index d80b5990d85d..f50ef82179c4 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -696,7 +696,7 @@ int kunit_run_tests(struct kunit_suite *suite)
 			/* Get initial param. */
 			param_desc[0] = '\0';
 			/* TODO: Make generate_params try-catch */
-			curr_param = test_case->generate_params(NULL, param_desc);
+			curr_param = test_case->generate_params(&test, NULL, param_desc);
 			test_case->status = KUNIT_SKIPPED;
 			kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
 				  "KTAP version 1\n");
@@ -727,7 +727,8 @@ int kunit_run_tests(struct kunit_suite *suite)
 
 				/* Get next param. */
 				param_desc[0] = '\0';
-				curr_param = test_case->generate_params(curr_param, param_desc);
+				curr_param = test_case->generate_params(&test, curr_param,
+									param_desc);
 			}
 		}
 
-- 
2.50.1.552.g942d659e1b-goog

