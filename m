Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFC4CA0EF8
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 13:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E784810E9A2;
	Thu, 21 Aug 2025 13:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="aOYbkFqq";
	dkim-atps=neutral
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com
 [209.85.215.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75C410E9A2
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 13:54:54 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-b471a0e5a33so1832143a12.3
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 06:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755784494; x=1756389294;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=XpTFpmF3LpyMWsoi7YRVPJftCPsO+iVXO+bA6kJHgfU=;
 b=aOYbkFqqZR05Fktzknv/wyxM5biChiDcrWhsebZtz5MqZbMo4oSfKAScmlpTm2ZrKh
 RLCa7/HeRUlBKBVGZfaoTS3Sat4OcNp6IBKBbdnszAItCe5U8zkIdlH9a3R20P/URFWr
 D0MvakwAap1aQAsO63KPHoFsaAlXp4u2ukWCYjEeUX7ZzWtDE0sJ1nnTnA5ixQ5sAVm9
 /oBDYgsZp8NieDKexwr96/hu40DVKq/EjBQ28ojAA7M3x30o6HUEOjnLJpA1/2X3B7DC
 ERv+DTTC8V4ORW0DYzWOPmXoQwd+pzXeVlSKMi4f09XVKYML2R+eoqlDe/klq87vg3uS
 pKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755784494; x=1756389294;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XpTFpmF3LpyMWsoi7YRVPJftCPsO+iVXO+bA6kJHgfU=;
 b=XelgIdJM1Y+VpCGRNGgwseuBkVAN4CzS4nP3eW6CEqLoE7H0jbGOhJWmcTm13yEklc
 1908UWYPy7GU+opv/vSTOGscKptozsCFutykrrABnXwQRsKgfNkpwjrtiCz3b0MMV0R4
 r3yfihCeapGncJu3ouGG1vU46pHxn9gbo55+UGj2gbSUXtxBWN0u6xxd0bO1nb+gp2RZ
 Vu5ftWkC+c/YRdZpam4c87XDuNGP0y7Cf4FkArEp2Gy0tUmZknb0d20PYuR1WxIVsS1u
 rVva9ekBkQepE1CI+b6lppD7ocop/dAoWQELbkpaxNl9lfImYkWCa3G+40XIxM80VX0l
 mQ4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWowZBSiTdy34eqnLV9Jv5QwnW4s1DsfkrDEgRiiSjHqd4P/K7EMPOJgDrVt0YOG6YKbaj2eHicYg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYZiU4ekKXRvayMRHHlYotbEkuW19JSr9nKsXdu2pifbGWXjxt
 HVl8Par8boQzF35J0p1bXrc3h1skCz0Js6iM4G+ohT3aVrmEVJI1/5J3qpGM10aTr5F4iqbifXg
 8yEgyei07ugIUlw==
X-Google-Smtp-Source: AGHT+IGJEX7ZclUuZ2o8JPzaPgxqgSiOjHKYAc6KuCEwQ4l/jHJHNh6xVmvyFffzu/3E1KDZ2EtRfnXg3G6H5Q==
X-Received: from pfbmd16.prod.google.com
 ([2002:a05:6a00:7710:b0:76b:c859:e832])
 (user=davidgow job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:5493:b0:23f:fd87:427c with SMTP id
 adf61e73a8af0-243307cb3b7mr3418114637.18.1755784494062; 
 Thu, 21 Aug 2025 06:54:54 -0700 (PDT)
Date: Thu, 21 Aug 2025 21:54:45 +0800
In-Reply-To: <20250821135447.1618942-1-davidgow@google.com>
Mime-Version: 1.0
References: <20250821135447.1618942-1-davidgow@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821135447.1618942-2-davidgow@google.com>
Subject: [PATCH v2 2/2] kunit: Only output a test plan if we're using
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

No changes since v1:
https://lore.kernel.org/linux-kselftest/20250819073434.1411114-2-davidgow@google.com/

(The change was in patch 1.)

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
2.51.0.rc2.233.g662b1ed5c5-goog

