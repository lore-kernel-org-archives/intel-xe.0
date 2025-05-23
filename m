Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88468C54ED1
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 19:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3467110E864;
	Fri, 23 May 2025 19:46:06 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC6610E845;
 Fri, 23 May 2025 19:46:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_VRAM_Self_Refresh_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 May 2025 19:46:05 -0000
Message-ID: <174802956576.18215.8202818501548938201@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250523190155.2623462-1-badal.nilawar@intel.com>
In-Reply-To: <20250523190155.2623462-1-badal.nilawar@intel.com>
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

Series: VRAM Self Refresh (rev3)
URL   : https://patchwork.freedesktop.org/series/145342/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5ed61f4a36b3 drm-tip: 2025y-05m-23d-13h-19m-23s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/display/xe_display.c:88
error: drivers/gpu/drm/xe/display/xe_display.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: PCI/ACPI: Add D3cold Aux Power Limit_DSM method
Applying: PCI/ACPI: Per root port allow one Aux power limit request
Applying: PCI/ACPI: Add PERST# Assertion Delay _DSM method
Applying: drm/xe/vrsr: Introduce flag has_vrsr
Applying: drm/xe/vrsr: Detect VRSR Capability
Applying: drm/xe/vrsr: Initialize VRSR feature
Applying: drm/xe/vrsr: Enable VRSR on default VGA boot device
Patch failed at 0007 drm/xe/vrsr: Enable VRSR on default VGA boot device
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


