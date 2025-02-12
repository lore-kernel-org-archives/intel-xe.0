Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA67C02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 16:54:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C9E10E933;
	Wed, 12 Feb 2025 16:54:32 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537B810E932;
 Wed, 12 Feb 2025 16:54:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Regression_on_linux-?=
 =?utf-8?q?next_=28next-20250205=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mike Rapoport" <rppt@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Feb 2025 16:54:32 -0000
Message-ID: <173937927233.1363296.377764327747489590@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <SJ1PR11MB6129A45FFE75371036820909B9F22@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6129A45FFE75371036820909B9F22@SJ1PR11MB6129.namprd11.prod.outlook.com>
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

Series: Regression on linux-next (next-20250205)
URL   : https://patchwork.freedesktop.org/series/144728/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b9696aa14a67 drm-tip: 2025y-02m-12d-16h-46m-44s UTC integration manifest
=== git am output follows ===
error: patch failed: kernel/module/main.c:1260
error: kernel/module/main.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: Regression on linux-next (next-20250205)
Patch failed at 0001 Regression on linux-next (next-20250205)
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


