Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95CCC48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 09:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8130410E659;
	Wed, 21 Feb 2024 09:33:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E68310E659;
 Wed, 21 Feb 2024 09:33:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_kunit=3A_Fix_printf_?=
 =?utf-8?q?format_specifier_issues_in_KUnit_assertions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David Gow" <davidgow@google.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Feb 2024 09:33:49 -0000
Message-ID: <170850802925.178559.10896969768967166485@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240221092728.1281499-1-davidgow@google.com>
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: kunit: Fix printf format specifier issues in KUnit assertions
URL   : https://patchwork.freedesktop.org/series/130186/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b895612a4da6 drm-tip: 2024y-02m-21d-08h-06m-32s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/tests/drm_buddy_test.c:55
error: drivers/gpu/drm/tests/drm_buddy_test.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: kunit: test: Log the correct filter string in executor_test
Applying: lib/cmdline: Fix an invalid format specifier in an assertion msg
Applying: lib: memcpy_kunit: Fix an invalid format specifier in an assertion msg
Applying: time: test: Fix incorrect format specifier
Applying: rtc: test: Fix invalid format specifier.
Applying: net: test: Fix printf format specifier in skb_segment kunit test
Applying: drm: tests: Fix invalid printf format specifiers in KUnit tests
Patch failed at 0007 drm: tests: Fix invalid printf format specifiers in KUnit tests
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


