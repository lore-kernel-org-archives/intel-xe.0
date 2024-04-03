Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57047CD128A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 17:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121EA112DDA;
	Wed,  3 Apr 2024 17:21:24 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D19112DDA;
 Wed,  3 Apr 2024 17:21:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_series_starting_with?=
 =?utf-8?q?_=5Bi-g-t=2C1/3=5D_tests/intel/xe=5Fpm=3A_Fix_runtime=5Fpm_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Apr 2024 17:21:22 -0000
Message-ID: <171216488255.1171321.7326186123819414527@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240403151411.113159-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240403151411.113159-1-rodrigo.vivi@intel.com>
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

Series: series starting with [i-g-t,1/3] tests/intel/xe_pm: Fix runtime_pm tests
URL   : https://patchwork.freedesktop.org/series/131999/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: c8dc2a19ae71 drm-tip: 2024y-04m-03d-14h-13m-00s UTC integration manifest
=== git am output follows ===
error: tests/intel/xe_pm.c: does not exist in index
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: tests/intel/xe_pm: Fix runtime_pm tests
Patch failed at 0001 tests/intel/xe_pm: Fix runtime_pm tests
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


