Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA63C3DA63
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 14:16:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2AA10E6F2;
	Wed, 24 Jul 2024 14:16:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBAD10E6F2;
 Wed, 24 Jul 2024 14:16:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_spi=3A_add_driver_fo?=
 =?utf-8?q?r_Intel_discrete_graphics?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Jul 2024 14:16:46 -0000
Message-ID: <172183060670.362578.8030675453694611238@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240724140014.428991-1-alexander.usyskin@intel.com>
In-Reply-To: <20240724140014.428991-1-alexander.usyskin@intel.com>
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

Series: spi: add driver for Intel discrete graphics
URL   : https://patchwork.freedesktop.org/series/136430/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: d3f0e5757ac0 drm-tip: 2024y-07m-24d-14h-13m-43s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_device.c:634
error: drivers/gpu/drm/xe/xe_device.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_device_types.h:39
error: drivers/gpu/drm/xe/xe_device_types.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_pci.c:62
error: drivers/gpu/drm/xe/xe_pci.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: spi: add driver for intel graphics on-die spi device
Applying: spi: intel-dg: implement region enumeration
Applying: spi: intel-dg: implement spi access functions
Applying: spi: intel-dg: spi register with mtd
Applying: spi: intel-dg: implement mtd access handlers
Applying: spi: intel-dg: align 64bit read and write
Applying: spi: intel-dg: wake card on operations
Applying: drm/i915/spi: add spi device for discrete graphics
Applying: drm/i915/spi: add intel_spi_region map
Applying: drm/i915/spi: add support for access mode
Applying: drm/xe/spi: add on-die spi device
Patch failed at 0011 drm/xe/spi: add on-die spi device
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


