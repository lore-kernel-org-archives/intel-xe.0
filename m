Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A07C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 03:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91ED10E4D4;
	Thu, 18 May 2023 03:21:02 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D16210E4D4;
 Thu, 18 May 2023 03:21:01 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 56231AADE7;
 Thu, 18 May 2023 03:21:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 18 May 2023 03:21:00 -0000
Message-ID: <168438006032.2369.12230088885583800865@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230518031804.3133486-1-matthew.d.roper@intel.com>
In-Reply-To: <20230518031804.3133486-1-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_i915=3A_Move_display_identification/probing_under_display/?=
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

Series: i915: Move display identification/probing under display/
URL   : https://patchwork.freedesktop.org/series/117930/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: c795cf636 drm/xe: Allow dma-fences as in-syncs for compute / faulting VM
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/display/intel_cursor.c:36
error: drivers/gpu/drm/i915/display/intel_cursor.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/i915_pci.c:223
error: drivers/gpu/drm/i915/i915_pci.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/i915/display: Move display device info to header under display/
Applying: drm/i915: Convert INTEL_INFO()->display to a pointer
Patch failed at 0002 drm/i915: Convert INTEL_INFO()->display to a pointer
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


