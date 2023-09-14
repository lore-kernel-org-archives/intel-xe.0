Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2051EEEAA60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 18:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A6410E2A9;
	Thu, 14 Sep 2023 18:16:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 80AD810E2A9;
 Thu, 14 Sep 2023 18:16:25 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7FF65AADE0;
 Thu, 14 Sep 2023 18:16:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 14 Sep 2023 18:16:25 -0000
Message-ID: <169471538552.29166.18046198231899720236@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230914153112.455547-8-matthew.auld@intel.com>
In-Reply-To: <20230914153112.455547-8-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_PAT_and_cache_coherency_support_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: PAT and cache coherency support (rev2)
URL   : https://patchwork.freedesktop.org/series/123027/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: aeac46cfa Revert "FIXME: drm/i915: add a lot of includes in intel_display_power.h"
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_pat.c:135
error: drivers/gpu/drm/xe/xe_pat.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_pat.h:28
error: drivers/gpu/drm/xe/xe_pat.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe/uapi: Add support for cache and coherency mode
Applying: drm/xe: move pat_table into device info
Patch failed at 0002 drm/xe: move pat_table into device info
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


