Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F73C7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 09:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD3B10EB46;
	Thu,  6 Apr 2023 09:22:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3FDED10EB42;
 Thu,  6 Apr 2023 09:22:44 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3843FA00E6;
 Thu,  6 Apr 2023 09:22:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Thu, 06 Apr 2023 09:22:44 -0000
Message-ID: <168077296422.9557.6650726048204586951@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230406092223.2819951-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230406092223.2819951-1-himal.prasad.ghimiray@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/xe/ras=3A_Supporting_RAS_on_XE=2E?=
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

Series: drm/xe/ras: Supporting RAS on XE.
URL   : https://patchwork.freedesktop.org/series/116180/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 58e5cc5ff399294871892dfbc06ae7b8597ee67a
Author:     Matthew Brost <matthew.brost@intel.com>
AuthorDate: Wed Apr 5 16:20:03 2023 -0700
Commit:     Matthew Brost <matthew.brost@intel.com>
CommitDate: Wed Apr 5 17:26:51 2023 -0700

    drm/xe: Always write GEN12_RCU_MODE.GEN12_RCU_MODE_CCS_ENABLE for CCS engines
    
    If CCS0 was fused we did not write this register thus CCS engine were
    not enabled resulting in driver load failures.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/regs/xe_regs.h:92
error: drivers/gpu/drm/xe/regs/xe_regs.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_irq.c:344
error: drivers/gpu/drm/xe/xe_irq.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe: Handle GRF/IC ECC error irq
Patch failed at 0001 drm/xe: Handle GRF/IC ECC error irq
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


