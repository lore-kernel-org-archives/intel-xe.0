Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96485C369C2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 20:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2E210E9CD;
	Fri, 25 Apr 2025 20:24:21 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC8A10E9CC;
 Fri, 25 Apr 2025 20:24:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/i915/display=3A_?=
 =?utf-8?q?Add_check_for_alloc=5Fordered=5Fworkqueue=28=29_and_alloc=5Fworkq?=
 =?utf-8?q?ueue=28=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Haoxiang Li" <haoxiang_li2024@163.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Apr 2025 20:24:20 -0000
Message-ID: <174561266025.12999.12890935353373205816@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250424025539.3504019-1-haoxiang_li2024@163.com>
In-Reply-To: <20250424025539.3504019-1-haoxiang_li2024@163.com>
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

Series: drm/i915/display: Add check for alloc_ordered_workqueue() and alloc_workqueue() (rev3)
URL   : https://patchwork.freedesktop.org/series/145242/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 6e67a7af4356 drm-tip: 2025y-04m-25d-15h-57m-07s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/display/intel_display_driver.c:241
error: drivers/gpu/drm/i915/display/intel_display_driver.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/i915/display: Add check for alloc_ordered_workqueue() and alloc_workqueue()
Patch failed at 0001 drm/i915/display: Add check for alloc_ordered_workqueue() and alloc_workqueue()
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


