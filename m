Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BBEC77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 18:18:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A25210E65E;
	Wed, 26 Apr 2023 18:18:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A9AEF10E336;
 Wed, 26 Apr 2023 18:18:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 03929AADE7;
 Wed, 26 Apr 2023 18:18:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 26 Apr 2023 18:18:16 -0000
Message-ID: <168253309601.17155.14986633724069211422@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
In-Reply-To: <20230421223258.128781-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_Cleanup_registers_and_introduce_xe=5Freg=5F*_=28rev2=29?=
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

Series: Cleanup registers and introduce xe_reg_* (rev2)
URL   : https://patchwork.freedesktop.org/series/116845/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: d600a3f50 drm/xe: Fix build without CONFIG_PM_SLEEP
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/regs/xe_gt_regs.h:335
error: drivers/gpu/drm/xe/regs/xe_gt_regs.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_ggtt.c:199
error: drivers/gpu/drm/xe/xe_ggtt.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_guc_pc.c:414
error: drivers/gpu/drm/xe/xe_guc_pc.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe: Cleanup page-related defines
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/i915/display: Allow fbdev to allocate stolen memory
Applying: drm/xe: Rename RC0/RC6 macros
Applying: drm/xe: Rename instruction field to avoid confusion
Applying: drm/xe/guc: Rename GEN11_SOFT_SCRATCH for clarity
Applying: drm/xe/guc: Move GuC registers to regs/
Applying: drm/xe/guc: Convert GuC registers to REG_FIELD/REG_BIT
Applying: drm/xe: Drop gen prefixes and suffixes from registers
Patch failed at 0009 drm/xe: Drop gen prefixes and suffixes from registers
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


