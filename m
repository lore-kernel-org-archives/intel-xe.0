Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1697D3B7CC
	for <intel-xe@archiver.kernel.org>; Mon, 25 Nov 2024 01:22:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855F110E378;
	Mon, 25 Nov 2024 01:22:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6FE10E0F8;
 Mon, 25 Nov 2024 01:22:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_linux-next=3A_manual?=
 =?utf-8?q?_merge_of_the_drm-xe_tree_with_Linus=27_tree?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Nov 2024 01:22:21 -0000
Message-ID: <173249774134.2645111.8009122022906565130@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241125120921.1bbc1930@canb.auug.org.au>
In-Reply-To: <20241125120921.1bbc1930@canb.auug.org.au>
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

Series: linux-next: manual merge of the drm-xe tree with Linus' tree
URL   : https://patchwork.freedesktop.org/series/141736/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5b1cbd59111b drm-tip: 2024y-11m-23d-03h-11m-22s UTC integration manifest
=== git am output follows ===
error: patch failed: include/drm/intel/pciids.h:829
error: include/drm/intel/pciids.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: linux-next: manual merge of the drm-xe tree with Linus' tree
Patch failed at 0001 linux-next: manual merge of the drm-xe tree with Linus' tree
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


