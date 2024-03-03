Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23941C48BF6
	for <intel-xe@archiver.kernel.org>; Sun,  3 Mar 2024 13:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C5F10E471;
	Sun,  3 Mar 2024 13:01:27 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360C510E18E;
 Sun,  3 Mar 2024 13:01:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe=3A_support_sh?=
 =?utf-8?q?aring_VM_info_between_XE_drivers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Moti Haimovski" <mhaimovski@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 03 Mar 2024 13:01:26 -0000
Message-ID: <170947088622.470106.4062985311239334655@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240303125212.2816644-1-mhaimovski@habana.ai>
In-Reply-To: <20240303125212.2816644-1-mhaimovski@habana.ai>
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

Series: drm/xe: support sharing VM info between XE drivers
URL   : https://patchwork.freedesktop.org/series/130639/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 511ffdbe8863 drm-tip: 2024y-03m-03d-01h-23m-16s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_device.c:139
error: drivers/gpu/drm/xe/xe_device.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_vm.c:17
error: drivers/gpu/drm/xe/xe_vm.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe: support sharing VM info between XE drivers
Patch failed at 0001 drm/xe: support sharing VM info between XE drivers
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


