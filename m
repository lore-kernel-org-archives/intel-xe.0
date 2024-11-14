Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDFAD41D46
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 05:24:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DEA10E794;
	Thu, 14 Nov 2024 05:24:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BFE10E03F;
 Thu, 14 Nov 2024 05:24:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Add_pci=5Fmembarrier?=
 =?utf-8?q?_test_in_xe=5Fmmap_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Nov 2024 05:24:15 -0000
Message-ID: <173156185515.3944581.15374958672202123533@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241114050129.1381711-1-tejas.upadhyay@intel.com>
In-Reply-To: <20241114050129.1381711-1-tejas.upadhyay@intel.com>
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

Series: Add pci_membarrier test in xe_mmap (rev2)
URL   : https://patchwork.freedesktop.org/series/141297/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 52166ab72753 drm-tip: 2024y-11m-14d-01h-51m-12s UTC integration manifest
=== git am output follows ===
error: lib/i915/i915_drm_local.h: does not exist in index
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: lib/i915_drm_local: Remove macros added via merged kernel
Patch failed at 0001 lib/i915_drm_local: Remove macros added via merged kernel
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


