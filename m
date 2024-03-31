Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2384CD128A
	for <intel-xe@archiver.kernel.org>; Sun, 31 Mar 2024 19:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A909510E783;
	Sun, 31 Mar 2024 19:05:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6743710E783;
 Sun, 31 Mar 2024 19:05:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_lib/xe/xe=5Futil=3A_?=
 =?utf-8?q?Creating_the_helper_functions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 31 Mar 2024 19:05:22 -0000
Message-ID: <171191192241.1117021.3178714125675581060@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240331185949.110269-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240331185949.110269-1-krishnaiah.bommu@intel.com>
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

Series: lib/xe/xe_util: Creating the helper functions
URL   : https://patchwork.freedesktop.org/series/131869/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b334e21cd003 drm-tip: 2024y-03m-29d-19h-58m-28s UTC integration manifest
=== git am output follows ===
error: lib/xe/xe_util.c: does not exist in index
error: lib/xe/xe_util.h: does not exist in index
error: tests/intel/xe_exec_compute_mode.c: does not exist in index
error: tests/intel/xe_exec_fault_mode.c: does not exist in index
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: lib/xe/xe_util: Creating the helper functions
Patch failed at 0001 lib/xe/xe_util: Creating the helper functions
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


