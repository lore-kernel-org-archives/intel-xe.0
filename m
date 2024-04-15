Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50FAC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 22:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC7210EA7E;
	Mon, 15 Apr 2024 22:27:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0035F10EA36;
 Mon, 15 Apr 2024 22:27:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_lib/kunit=3A_Read_re?=
 =?utf-8?q?sults_from_debugfs_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 22:27:55 -0000
Message-ID: <171322007599.1424052.5278404546904718861@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240415173405.120137-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20240415173405.120137-2-janusz.krzysztofik@linux.intel.com>
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

Series: lib/kunit: Read results from debugfs (rev3)
URL   : https://patchwork.freedesktop.org/series/131687/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 7bc330055f5c drm-tip: 2024y-04m-15d-20h-48m-49s UTC integration manifest
=== git am output follows ===
error: lib/igt_kmod.c: does not exist in index
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: lib/kunit: Read results from debugfs
Patch failed at 0001 lib/kunit: Read results from debugfs
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


