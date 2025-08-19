Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBD3CA0EED
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 07:36:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9163110E53F;
	Tue, 19 Aug 2025 07:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="eUsNIqGp";
	dkim-atps=neutral
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com
 [209.85.210.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BB410E53F
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 07:36:36 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-76e2e60221fso11492000b3a.0
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 00:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755588996; x=1756193796;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=9KSbimSnv0XBPGJ9MxTD7jYQER3c+CloUdhjhKYZFuw=;
 b=eUsNIqGpAp5/+a9vB9cUfwpzjXudrJRE31znN8aXFUnbXGhO7zwt5V5bq4DCapaJDu
 tXJnIfrpMGX6DDJsL/2l9D6MwrRLEW519XWDUqNYfWhvyiXZU6Azt9s3sFbkcrImytri
 JsIq9MxEGHoSCpP1oxHHvU98ARW25EuSG1RqgdV1MPCagY5a99KO0okP7kGnrF31LQqw
 yRFO59XDnhFf/0oXz2JLLb++GGlIlUBXguMVLNVVN2MDz6UeKCTkr7NUt/vFNFL4BYqG
 i1GoJgh8mzkpGvJDsGsGtcFWva7CKeoeNIWRH8LIY4kE/9OI5Gq9Dy0Lu59eQk8v3ifb
 8CRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755588996; x=1756193796;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9KSbimSnv0XBPGJ9MxTD7jYQER3c+CloUdhjhKYZFuw=;
 b=wyyckJbiR87wQydO5VvorTsHdQrYW2OBnYa6RAr41TeMvIRfYKS5ybmlKiChWYU7qD
 0lzmso9b+qMt/tw3PtwzEVlxwk94wv37NGgZBgfy/jBM+d7mNbyj6ZYcxRbd5giEP4AQ
 XYo0knutWc7r660eQPiKHccTOzPiVOMh62WXLL2uRz5p5C+cgZ9uSc8MRFRS8poETsZ3
 HuiVa7951Y0wV5qxD9rJ7uWq9z4j7mKbCl7+bhCMQO2fRyMDFhFmC5qzqbRBd2AEwNnB
 RBWFWxSJRIhrwrtVfz8h51SxGsdoan0l1HiNuqotYoSM4p7ZYg9HLbcKU83dF0JQn1hA
 ev0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV57AVi353SxFbwbOarawaUgoyQJFEHCXyqp+OZDtUX8mrojFB/lxd+Os8IU9zJAHrgGrko6s/8mA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymuYTBW5W6OR7+9aEgnHnsWT0JsS36k1KdQlsDae7+gO7NiQo3
 Y1NyL28XNNbs33FtKn8k0oY81AGBYy/nv0bDmiCaDOWFp1U5M2wxML9A4CGpOimrFJQZdCRoT2g
 8KR1spkK4xYu4ig==
X-Google-Smtp-Source: AGHT+IFVitRB2pYP30mQyIezEFbnNHtlcuT+1BqFK4GSPkogm0Fg1JqC4rE6PsNNNd1LADkKo8O8s6mLcTxctw==
X-Received: from pfij13.prod.google.com ([2002:aa7:800d:0:b0:765:6e59:d7fe])
 (user=davidgow job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2290:b0:748:e38d:fed4 with SMTP id
 d2e1a72fcca58-76e80eb456cmr2204859b3a.6.1755588995886; 
 Tue, 19 Aug 2025 00:36:35 -0700 (PDT)
Date: Tue, 19 Aug 2025 15:34:33 +0800
In-Reply-To: <20250819073434.1411114-1-davidgow@google.com>
Mime-Version: 1.0
References: <20250819073434.1411114-1-davidgow@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819073434.1411114-2-davidgow@google.com>
Subject: [PATCH 2/2] kunit: Only output a test plan if we're using
 kunit_array_gen_params
From: David Gow <davidgow@google.com>
To: Rae Moar <rmoar@google.com>, Marie Zhussupova <marievic@google.com>,
 marievictoria875@gmail.com, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <davidgow@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 intel-xe@lists.freedesktop.org, 
 kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

In 6a2a027e254b ("kunit: Enable direct registration of parameter arrays to a KUnit test"),
we now output a test plan for parameterised tests which use parameter
arrays. This uses the size of the array (via the ARRAY_SIZE macro) to
determine the number of subtests, which otherwise was indeterminate.

However some tests (particularly xe_pci.check_platform_gt_count) use
their own gen_params function which further filters the array, resulting
in the test plan being inaccurate (and hence kunit.py failing).

For now, only print the test plan line if the gen_params function is the
provided kunit_array_gen_params. Unfortunately, this catches a lot of
tests which would work, but at least makes sure we don't regress
anything until we can rework how some of these macros function.

Fixes: 6a2a027e254b ("kunit: Enable direct registration of parameter arrays to a KUnit test")
Signed-off-by: David Gow <davidgow@google.com>
---
 lib/kunit/test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index b661407ad0a3..bb66ea1a3eac 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -732,10 +732,12 @@ int kunit_run_tests(struct kunit_suite *suite)
 				  "KTAP version 1\n");
 			kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
 				  "# Subtest: %s", test_case->name);
-			if (test.params_array.params)
+			if (test.params_array.params &&
+			    test_case->generate_params == kunit_array_gen_params) {
 				kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT
 					  KUNIT_SUBTEST_INDENT "1..%zd\n",
 					  test.params_array.num_params);
+			}
 
 			while (curr_param) {
 				struct kunit param_test = {
-- 
2.51.0.rc1.167.g924127e9c0-goog

