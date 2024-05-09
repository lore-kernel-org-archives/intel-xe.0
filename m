Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B339C10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 21:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336E310F22F;
	Thu,  9 May 2024 21:09:37 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8237110F03B;
 Thu,  9 May 2024 21:09:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_series_starting_with?=
 =?utf-8?q?_=5B1/4=5D_tests/intel/xe=5Fpm=3A_Update_runtime_pm_conditions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 May 2024 21:09:35 -0000
Message-ID: <171528897553.2038581.18105985322995983011@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240509210401.519062-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240509210401.519062-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/4] tests/intel/xe_pm: Update runtime pm conditions
URL   : https://patchwork.freedesktop.org/series/133414/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 20edf912c45c drm-tip: 2024y-05m-09d-21h-02m-22s UTC integration manifest
=== git am output follows ===
error: lib/igt_pm.c: does not exist in index
error: lib/igt_pm.h: does not exist in index
error: tests/intel/xe_pm.c: does not exist in index
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: tests/intel/xe_pm: Update runtime pm conditions
Patch failed at 0001 tests/intel/xe_pm: Update runtime pm conditions
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


