Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2438AD609C1
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 09:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E712A10E16E;
	Wed, 27 Nov 2024 09:41:28 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF9E10E16E;
 Wed, 27 Nov 2024 09:41:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_locking/ww=5Fmutex?=
 =?utf-8?q?=3A_Fix_ww=5Fmutex_dummy_lockdep_map_selftest_warnings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 Nov 2024 09:41:27 -0000
Message-ID: <173270048724.3676557.2055833966484032997@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127085430.3045-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20241127085430.3045-1-thomas.hellstrom@linux.intel.com>
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

Series: locking/ww_mutex: Fix ww_mutex dummy lockdep map selftest warnings
URL   : https://patchwork.freedesktop.org/series/141827/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 441e225c838a drm-tip: 2024y-11m-27d-08h-24m-28s UTC integration manifest
=== git am output follows ===
error: patch failed: include/linux/ww_mutex.h:156
error: include/linux/ww_mutex.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: locking/ww_mutex: Fix ww_mutex dummy lockdep map selftest warnings
Patch failed at 0001 locking/ww_mutex: Fix ww_mutex dummy lockdep map selftest warnings
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


