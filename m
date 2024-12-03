Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C997E69E88
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 10:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5954B10E9D7;
	Tue,  3 Dec 2024 10:31:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC2A10E9D3;
 Tue,  3 Dec 2024 10:31:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Regression_on_linux-?=
 =?utf-8?q?next_=28next-20241120=29_and_drm-tip?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Dec 2024 10:31:37 -0000
Message-ID: <173322189777.1968577.11846270755925557060@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <SJ1PR11MB6129CCD82CD78D8EE6E27EF4B9362@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6129CCD82CD78D8EE6E27EF4B9362@SJ1PR11MB6129.namprd11.prod.outlook.com>
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

Series: Regression on linux-next (next-20241120) and drm-tip
URL   : https://patchwork.freedesktop.org/series/142039/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4de82d50b8de drm-tip: 2024y-12m-03d-00h-37m-04s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/power/supply/power_supply_core.c:1411
error: drivers/power/supply/power_supply_core.c: patch does not apply
error: patch failed: drivers/power/supply/power_supply_core.c:1410
error: drivers/power/supply/power_supply_core.c: patch does not apply
error: patch failed: drivers/power/supply/power_supply_core.c:1356
error: drivers/power/supply/power_supply_core.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: Regression on linux-next (next-20241120) and drm-tip
Patch failed at 0001 Regression on linux-next (next-20241120) and drm-tip
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


