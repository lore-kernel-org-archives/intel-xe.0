Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE4FCA0ED1
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 10:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F7810E918;
	Fri, 15 Aug 2025 10:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3LXytZel";
	dkim-atps=neutral
Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com
 [209.85.222.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B4310E916
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 10:36:09 +0000 (UTC)
Received: by mail-qk1-f201.google.com with SMTP id
 af79cd13be357-7e8705feefaso493629185a.2
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 03:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755254168; x=1755858968;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eFpXxq44oeslvizqCF8Bv0M0ZVaQrSB155EOLBMECVQ=;
 b=3LXytZelSyYRb+4IG6/Or3+by7CPU5Hc5GsntJbUeAJ47KM5JqsU4Z7nCIfDRKO5yb
 YagboBbwZsqp6SVjj9lm0UGONPxjDCvHg6EygHVx9sqOmHDkUM62zgXQWQ/Hqjxy3603
 ho7fVohRqz5ea6Xzbda3TtBuOAraC3s8Hm7nNAAITbv2A9XcavCt5UIV683rNPO0lSar
 t4hXFxJfYVq8SnfRC4W/i1OIAZFbhkPYpmZcQq/dw/tTJ++sD/uYNZ6gqVEoE9vFbvP+
 NwaPfm1DHPeRodVXfpmJRyxh8g6MPRcEfdnakHxuB3lgDld2am2Ken3eYNdESaXDFF9R
 3GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755254168; x=1755858968;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eFpXxq44oeslvizqCF8Bv0M0ZVaQrSB155EOLBMECVQ=;
 b=YbXgQYhbKe1OyBw7nI4INj/LWP4MJ37ekNpBlnpY3QaNQuBHBCHh7ohmlVjZ0j1Dfy
 vjl70EfYe4AaX583T7ctK/JjGhKVe65426PgTVh5qqoDCFReYT+vlY3bKPVMSoE13YMl
 PngisXngRaLpHtw7xcDAepF1hpbS57ZdLk9YhI8q+IIfDnR14JMBjJOm/6mo2ae6sGYQ
 MdjX5F5L0cYxYf9ZDwTst9/auAy0GvNK394LnmUoWMsf5pqglPjzSK3ob+9wiEbZZI3C
 2qwWTlJ76PYmYqXuWylI4HecJGvZQjPLOSZe3wIyinuGTHbX6qSlOD6bzcBEMFjsWghL
 Enog==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3tO0BEgVe3ge+jZLDHv8gmqp074SuDCMvrgmW8SP1xbg3xcSBytx3RJ+b60bHarBDfzw8wehOHA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEc2cQ4jqZEPkgXFetMtdSwPn7Dw8+H3qSP0mEMzn7Xo5xj3mj
 pNyQFvBBDi2WaE6XffxpbzYPhovL7SyW6IZgkDimbTETWCrWEQF1085s3kMqQmrpgkZfK6Tf+oz
 De73qXDm+52qE3Q==
X-Google-Smtp-Source: AGHT+IGqwcNa0muVNYMhfJnNR56U34U3LHWpaKq2hOoZwkS5Io63dT+8xTEkaJe22M4TB6v424ec54WU5OMILA==
X-Received: from qkpg1.prod.google.com ([2002:a05:620a:2781:b0:7e8:14fd:d2c9])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:1a17:b0:7e1:9c2d:a862 with SMTP id
 af79cd13be357-7e87e06b8dbmr185880085a.39.1755254168517; 
 Fri, 15 Aug 2025 03:36:08 -0700 (PDT)
Date: Fri, 15 Aug 2025 10:35:57 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250815103604.3857930-1-marievic@google.com>
Subject: [PATCH v3 0/7] kunit: Refactor and extend KUnit's parameterized
 testing framework
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

Hello!

KUnit offers a parameterized testing framework, where tests can be
run multiple times with different inputs. However, the current
implementation uses the same `struct kunit` for each parameter run.
After each run, the test context gets cleaned up, which creates
the following limitations:

a. There is no way to store resources that are accessible across
   the individual parameter runs.
b. It's not possible to pass additional context, besides the previous
   parameter (and potentially anything else that is stored in the current
   test context), to the parameter generator function.
c. Test users are restricted to using pre-defined static arrays
   of parameter objects or generate_params() to define their
   parameters. There is no flexibility to make a custom dynamic
   array without using generate_params(), which can be complex if
   generating the next parameter depends on more than just the single
   previous parameter.

This patch series resolves these limitations by:

1. [P 1] Giving each parameterized run its own `struct kunit`. It will
   remove the need to manage state, such as resetting the `test->priv`
   field or the `test->status_comment` after every parameter run.

2. [P 1] Introducing parameterized test context available to all
   parameter runs through the parent pointer of type `struct kunit`.
   This context won't be used to execute any test logic, but will
   instead be used for storing shared resources. Each parameter run
   context will have a reference to that parent instance and thus,
   have access to those resources.

3. [P 2] Introducing param_init() and param_exit() functions that can
   initialize and exit the parameterized test context. They will run once
   before and after the parameterized test. param_init() can be used to add
   resources to share between parameter runs, pass parameter arrays, and
   any other setup logic. While param_exit() can be used to clean up
   resources that were not managed by the parameterized test, and
   any other teardown logic.

4. [P 3] Passing the parameterized test context as an additional argument
   to generate_params(). This provides generate_params() with more context,
   making parameter generation much more flexible. The generate_params()
   implementations in the KCSAN and drm/xe tests have been adapted to match
   the new function pointer signature.

5. [P 4] Introducing a `params_array` field in `struct kunit`. This will
   allow the parameterized test context to have direct storage of the
   parameter array, enabling features like using dynamic parameter arrays
   or using context beyond just the previous parameter. This will also
   enable outputting the KTAP test plan for a parameterized test when the
   parameter count is available.

Patches 5 and 6 add examples tests to lib/kunit/kunit-example-test.c to
showcase the new features and patch 7 updates the KUnit documentation
to reflect all the framework changes.

Thank you!
-Marie

---

Changes in v3:

Link to v2 of this patch series:
https://lore.kernel.org/all/20250811221739.2694336-1-marievic@google.com/

- Added logic for skipping the parameter runs and updating the test statistics
  when parameterized test initialization fails.
- Minor changes to the documentation.
- Commit message formatting.

Changes in v2:

Link to v1 of this patch series:
https://lore.kernel.org/all/20250729193647.3410634-1-marievic@google.com/

- Establish parameterized testing terminology:
   - "parameterized test" will refer to the group of all runs of a single test
     function with different parameters.
   - "parameter run" will refer to the execution of the test case function with
     a single parameter.
   - "parameterized test context" is the `struct kunit` that holds the context
     for the entire parameterized test.
   - "parameter run context" is the `struct kunit` that holds the context of the
     individual parameter run.
   - A test is defined to be a parameterized tests if it was registered with a
     generator function.
- Make comment edits to reflect the established terminology.
- Require users to manually pass kunit_array_gen_params() to
  KUNIT_CASE_PARAM_WITH_INIT() as the generator function, unless they want to
  provide their own generator function, if the parameter array was registered
  in param_init(). This is to be consistent with the definition of a
  parameterized test, i.e. generate_params() is never NULL if it's
  a parameterized test.
- Change name of kunit_get_next_param_and_desc() to
  kunit_array_gen_params().
- Other minor function name changes such as removing the "__" prefix in front
  of internal functions.
- Change signature of get_description() in `struct params_array` to accept
  the parameterized test context, as well.
- Output the KTAP test plan for a parameterized test when the parameter count
  is available.
- Cover letter was made more concise.
- Edits to the example tests.
- Fix bug of parameterized test init/exit logic being done outside of the
  parameterized test check.
- Fix bugs identified by the kernel test robot.

---

Marie Zhussupova (7):
  kunit: Add parent kunit for parameterized test context
  kunit: Introduce param_init/exit for parameterized test context
    management
  kunit: Pass parameterized test context to generate_params()
  kunit: Enable direct registration of parameter arrays to a KUnit test
  kunit: Add example parameterized test with shared resource management
    using the Resource API
  kunit: Add example parameterized test with direct dynamic parameter
    array setup
  Documentation: kunit: Document new parameterized test features

 Documentation/dev-tools/kunit/usage.rst | 342 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/tests/xe_pci.c       |   2 +-
 include/kunit/test.h                    |  95 ++++++-
 kernel/kcsan/kcsan_test.c               |   2 +-
 lib/kunit/kunit-example-test.c          | 217 +++++++++++++++
 lib/kunit/test.c                        |  94 +++++--
 rust/kernel/kunit.rs                    |   4 +
 7 files changed, 728 insertions(+), 28 deletions(-)

-- 
2.51.0.rc1.167.g924127e9c0-goog

