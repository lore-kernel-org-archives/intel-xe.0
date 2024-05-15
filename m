Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B596BC04FFE
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 00:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB2E10E1BD;
	Wed, 15 May 2024 00:38:19 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8801310E1BD;
 Wed, 15 May 2024 00:38:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_tests/intel/xe=5Fvm?=
 =?utf-8?q?=3A_Add_bind_array_conflict_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 May 2024 00:38:17 -0000
Message-ID: <171573349755.2116540.11537527761630493899@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240515003413.99777-1-matthew.brost@intel.com>
In-Reply-To: <20240515003413.99777-1-matthew.brost@intel.com>
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

Series: tests/intel/xe_vm: Add bind array conflict tests
URL   : https://patchwork.freedesktop.org/series/133633/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4cb2d17202b7 drm-tip: 2024y-05m-14d-21h-24m-53s UTC integration manifest
=== git am output follows ===
error: lib/xe/xe_ioctl.c: does not exist in index
error: lib/xe/xe_ioctl.h: does not exist in index
error: tests/intel/xe_vm.c: does not exist in index
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: tests/intel/xe_vm: Add bind array conflict tests
Patch failed at 0001 tests/intel/xe_vm: Add bind array conflict tests
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


