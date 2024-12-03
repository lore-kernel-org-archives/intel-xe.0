Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465DAE74ACF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 20:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B40610E164;
	Tue,  3 Dec 2024 20:39:24 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B4210E164;
 Tue,  3 Dec 2024 20:39:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Regression_on_linux-?=
 =?utf-8?q?next_=28next-20241120=29_and_drm-tip_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Dec 2024 20:39:22 -0000
Message-ID: <173325836214.2143460.7761315163422276079@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <5e405ad4-34d6-4507-978f-3d81d4af2455@t-8ch.de>
In-Reply-To: <5e405ad4-34d6-4507-978f-3d81d4af2455@t-8ch.de>
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

Series: Regression on linux-next (next-20241120) and drm-tip (rev2)
URL   : https://patchwork.freedesktop.org/series/142039/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: fac293c5c775 drm-tip: 2024y-12m-03d-20h-04m-25s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/usb/typec/ucsi/ucsi.c:651
error: drivers/usb/typec/ucsi/ucsi.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: Regression on linux-next (next-20241120) and drm-tip
Patch failed at 0001 Regression on linux-next (next-20241120) and drm-tip
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


