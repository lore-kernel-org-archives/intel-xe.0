Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB42C001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 12:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D29010E12E;
	Tue,  8 Aug 2023 12:01:11 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 78F7810E12E;
 Tue,  8 Aug 2023 12:01:09 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 716D2AADDC;
 Tue,  8 Aug 2023 12:01:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Tue, 08 Aug 2023 12:01:09 -0000
Message-ID: <169149606946.13859.12254460017762242012@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230726210352.390864-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230726210352.390864-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/xe=3A_Invert_mask_and_val_in_xe=5Fmmio=5Fwait32=2E?=
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

Series: drm/xe: Invert mask and val in xe_mmio_wait32.
URL   : https://patchwork.freedesktop.org/series/121388/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 958ba208e fixup! drm/xe/display: Implement display support
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h:90
error: drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_force_wake.c:120
error: drivers/gpu/drm/xe/xe_force_wake.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_gt.c:456
error: drivers/gpu/drm/xe/xe_gt.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_gt_mcr.c:423
error: drivers/gpu/drm/xe/xe_gt_mcr.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_guc.c:290
error: drivers/gpu/drm/xe/xe_guc.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_huc.c:85
error: drivers/gpu/drm/xe/xe_huc.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_mmio.h:107
error: drivers/gpu/drm/xe/xe_mmio.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_pcode.c:68
error: drivers/gpu/drm/xe/xe_pcode.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_uc_fw.c:484
error: drivers/gpu/drm/xe/xe_uc_fw.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe: Invert mask and val in xe_mmio_wait32.
Patch failed at 0001 drm/xe: Invert mask and val in xe_mmio_wait32.
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


