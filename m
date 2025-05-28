Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3BFC5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 14:14:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF1D10E630;
	Wed, 28 May 2025 14:14:06 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5C810E61E;
 Wed, 28 May 2025 14:14:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_mtd=3A_add_driver_fo?=
 =?utf-8?q?r_Intel_discrete_graphics_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 14:14:04 -0000
Message-ID: <174844164431.28743.9626701230656568647@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250528135115.2512429-1-alexander.usyskin@intel.com>
In-Reply-To: <20250528135115.2512429-1-alexander.usyskin@intel.com>
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

Series: mtd: add driver for Intel discrete graphics (rev4)
URL   : https://patchwork.freedesktop.org/series/147661/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 87357770e16c drm-tip: 2025y-05m-28d-08h-40m-14s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/i915_drv.h:65
error: drivers/gpu/drm/i915/i915_drv.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: mtd: add driver for intel graphics non-volatile memory device
Applying: mtd: intel-dg: implement region enumeration
Applying: mtd: intel-dg: implement access functions
Applying: mtd: intel-dg: register with mtd
Applying: mtd: intel-dg: align 64bit read and write
Applying: drm/i915/nvm: add nvm device for discrete graphics
Patch failed at 0006 drm/i915/nvm: add nvm device for discrete graphics
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


