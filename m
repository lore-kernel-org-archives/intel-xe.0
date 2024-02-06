Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8A1C4829A
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 10:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E5510E421;
	Tue,  6 Feb 2024 10:18:53 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F31510E421;
 Tue,  6 Feb 2024 10:18:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_lib/kunit=3A_Support?=
 =?utf-8?q?_writable_filter*_parameters_of_kunit_module_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Feb 2024 10:18:52 -0000
Message-ID: <170721473206.1040826.13695195818908497100@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240206101514.6897-10-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20240206101514.6897-10-janusz.krzysztofik@linux.intel.com>
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

Series: lib/kunit: Support writable filter* parameters of kunit module (rev4)
URL   : https://patchwork.freedesktop.org/series/129175/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b1651bcc3 drm-tip: 2024y-02m-06d-08h-13m-55s UTC integration manifest
=== git am output follows ===
error: lib/igt_kmod.c: does not exist in index
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: lib/kunit: Enter legacy path only if applying filters fails
Patch failed at 0001 lib/kunit: Enter legacy path only if applying filters fails
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


