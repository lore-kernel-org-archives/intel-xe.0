Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E56FCE7B00
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 11:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC0F10EA2C;
	Fri,  6 Sep 2024 11:09:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853DC10EA28;
 Fri,  6 Sep 2024 11:09:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Enable_build_system_?=
 =?utf-8?q?on_macOS_hosts_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Gomez via B4 Relay" <devnull+da.gomez.samsung.com@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Sep 2024 11:09:43 -0000
Message-ID: <172562098352.954182.18075841136243474082@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
In-Reply-To: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
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

Series: Enable build system on macOS hosts (rev2)
URL   : https://patchwork.freedesktop.org/series/137005/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: d4b15a4609f1 drm-tip: 2024y-09m-06d-08h-53m-11s UTC integration manifest
=== git am output follows ===
error: patch failed: scripts/remove-stale-files:20
error: scripts/remove-stale-files: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config advice.mergeConflict false"
Applying: scripts: subarch.include: fix SUBARCH on macOS hosts
Applying: file2alias: fix uuid_t definitions for macos
Applying: drm/xe: xe_gen_wa_oob: fix program_invocation_short_name for macos
Applying: arm64: nvhe: add bee-headers support
Applying: scripts: add bee-headers support
Applying: selinux: do not include <linux/*.h> headers from host programs
Applying: selinux: move genheaders to security/selinux/
Patch failed at 0007 selinux: move genheaders to security/selinux/


