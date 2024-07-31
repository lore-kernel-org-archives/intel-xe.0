Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E343C3DA49
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 00:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F4610E5AF;
	Wed, 31 Jul 2024 00:35:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D45910E5AC;
 Wed, 31 Jul 2024 00:35:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Use_user-defined_wor?=
 =?utf-8?q?kqueue_lockdep_map_for_drm_sched_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 31 Jul 2024 00:35:48 -0000
Message-ID: <172238614837.466194.10551784631549857973@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240731003119.2422940-1-matthew.brost@intel.com>
In-Reply-To: <20240731003119.2422940-1-matthew.brost@intel.com>
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

Series: Use user-defined workqueue lockdep map for drm sched (rev2)
URL   : https://patchwork.freedesktop.org/series/136701/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4b1ff33f467a drm-tip: 2024y-07m-30d-20h-58m-38s UTC integration manifest
=== git am output follows ===
error: patch failed: kernel/workqueue.c:5725
error: kernel/workqueue.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: workqueue: Split alloc_workqueue into internal function and lockdep init
Patch failed at 0001 workqueue: Split alloc_workqueue into internal function and lockdep init
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


