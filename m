Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2D5C00528
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 23:20:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163D010E13E;
	Fri,  4 Aug 2023 23:20:02 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id D0DC689F63;
 Fri,  4 Aug 2023 23:19:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C63F8A0BA8;
 Fri,  4 Aug 2023 23:19:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Date: Fri, 04 Aug 2023 23:19:59 -0000
Message-ID: <169119119980.2852.11904500940127406353@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230804213813.2381799-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230804213813.2381799-1-umesh.nerlige.ramappa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_tests/xe/xe=5Fquery=3A_Add_a_test_for_querying_cs_cycles_=28?=
 =?utf-8?q?rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: tests/xe/xe_query: Add a test for querying cs cycles (rev2)
URL   : https://patchwork.freedesktop.org/series/122053/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 8a6b4e2f0 drm/xe: Fix error path in xe_guc_pc_start()
=== git am output follows ===
error: include/drm-uapi/xe_drm.h: does not exist in index
error: tests/xe/xe_query.c: does not exist in index
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: tests/xe/xe_query: Add a test for querying cs cycles
Patch failed at 0001 tests/xe/xe_query: Add a test for querying cs cycles
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


