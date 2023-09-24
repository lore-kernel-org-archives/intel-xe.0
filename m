Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C172CE7A8C
	for <intel-xe@archiver.kernel.org>; Sun, 24 Sep 2023 20:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96F110E15A;
	Sun, 24 Sep 2023 20:05:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3410B10E144;
 Sun, 24 Sep 2023 20:05:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 15A11A00E8;
 Sun, 24 Sep 2023 20:05:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Date: Sun, 24 Sep 2023 20:05:22 -0000
Message-ID: <169558592205.29778.13836106925883475765@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230924200226.3940-1-dev@lankhorst.se>
In-Reply-To: <20230924200226.3940-1-dev@lankhorst.se>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/xe=3A_Add_VM_snapshot_support?=
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

Series: drm/xe: Add VM snapshot support
URL   : https://patchwork.freedesktop.org/series/124165/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 16e2c940e drm/xe: Accept a const xe device
=== git am output follows ===
.git/rebase-apply/patch:77: new blank line at EOF.
+
.git/rebase-apply/patch:266: new blank line at EOF.
+
.git/rebase-apply/patch:280: new blank line at EOF.
+
error: patch failed: drivers/gpu/drm/xe/xe_vm_types.h:336
error: drivers/gpu/drm/xe/xe_vm_types.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe: Add VM snapshot support
Patch failed at 0001 drm/xe: Add VM snapshot support
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


