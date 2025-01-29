Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01FDC0218F
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 20:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B9610E139;
	Wed, 29 Jan 2025 20:59:23 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660C110E0C9;
 Wed, 29 Jan 2025 20:59:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Regression_on_linux-?=
 =?utf-8?q?next_=28next-20250120=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Al Viro" <viro@ZenIV.linux.org.uk>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 20:59:22 -0000
Message-ID: <173818436241.2510226.364725812710517512@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <SJ1PR11MB6129D7DA59A733AD38E081E3B9E02@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6129D7DA59A733AD38E081E3B9E02@SJ1PR11MB6129.namprd11.prod.outlook.com>
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

Series: Regression on linux-next (next-20250120) (rev2)
URL   : https://patchwork.freedesktop.org/series/143979/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: c2a5da40b8b1 drm-tip: 2025y-01m-29d-20h-15m-11s UTC integration manifest
=== git am output follows ===
error: patch failed: fs/debugfs/file.c:94
error: fs/debugfs/file.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: Regression on linux-next (next-20250120)
Patch failed at 0001 Regression on linux-next (next-20250120)
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


