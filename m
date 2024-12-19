Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD89EE77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 16:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6236910E4A9;
	Thu, 19 Dec 2024 16:57:42 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37EF10E4A9;
 Thu, 19 Dec 2024 16:57:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Remove_get=5Ftask=5F?=
 =?utf-8?q?comm=28=29_and_print_task_comm_directly?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yafang Shao" <laoar.shao@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Dec 2024 16:57:40 -0000
Message-ID: <173462746073.467596.11740920659810175427@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241219023452.69907-1-laoar.shao@gmail.com>
In-Reply-To: <20241219023452.69907-1-laoar.shao@gmail.com>
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

Series: Remove get_task_comm() and print task comm directly
URL   : https://patchwork.freedesktop.org/series/142835/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a5b4c40929f3 drm-tip: 2024y-12m-19d-15h-56m-38s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/display/intel_display_driver.c:391
error: drivers/gpu/drm/i915/display/intel_display_driver.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: kernel: Remove get_task_comm() and print task comm directly
Applying: arch: Remove get_task_comm() and print task comm directly
Applying: net: Remove get_task_comm() and print task comm directly
Applying: security: Remove get_task_comm() and print task comm directly
Applying: drivers: Remove get_task_comm() and print task comm directly
Patch failed at 0005 drivers: Remove get_task_comm() and print task comm directly
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


