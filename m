Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817C4EB64DA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 11:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5584F10E313;
	Tue, 18 Jul 2023 11:42:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B6C410E313;
 Tue, 18 Jul 2023 11:42:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 629C9A47E9;
 Tue, 18 Jul 2023 11:42:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Tue, 18 Jul 2023 11:42:26 -0000
Message-ID: <168968054640.22206.837196027275422326@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230717193746.7-1-francois.dugast@intel.com>
In-Reply-To: <20230717193746.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/xe=3A_Cleanup_style_warnings_=28rev3=29?=
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

Series: drm/xe: Cleanup style warnings (rev3)
URL   : https://patchwork.freedesktop.org/series/120868/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: a43fd52b7 drm/xe: Cleanup style warnings
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/display/ext/intel_clock_gating.c:119
error: drivers/gpu/drm/xe/display/ext/intel_clock_gating.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_bo.c:1710
error: drivers/gpu/drm/xe/xe_bo.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_exec.c:231
error: drivers/gpu/drm/xe/xe_exec.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_execlist.h:11
error: drivers/gpu/drm/xe/xe_execlist.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_gt.h:13
error: drivers/gpu/drm/xe/xe_gt.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_guc.c:186
error: drivers/gpu/drm/xe/xe_guc.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_guc_ads.c:444
error: drivers/gpu/drm/xe/xe_guc_ads.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_guc_ct.c:716
error: drivers/gpu/drm/xe/xe_guc_ct.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_guc_fwif.h:140
error: drivers/gpu/drm/xe/xe_guc_fwif.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_guc_submit.c:329
error: drivers/gpu/drm/xe/xe_guc_submit.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_huc.c:68
error: drivers/gpu/drm/xe/xe_huc.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_irq.c:251
error: drivers/gpu/drm/xe/xe_irq.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_lrc.c:374
error: drivers/gpu/drm/xe/xe_lrc.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_migrate.c:511
error: drivers/gpu/drm/xe/xe_migrate.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_pci.c:540
error: drivers/gpu/drm/xe/xe_pci.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_pcode.c:58
error: drivers/gpu/drm/xe/xe_pcode.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_reg_whitelist.c:82
error: drivers/gpu/drm/xe/xe_reg_whitelist.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_res_cursor.h:130
error: drivers/gpu/drm/xe/xe_res_cursor.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_sa.c:81
error: drivers/gpu/drm/xe/xe_sa.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_uc_fw.c:147
error: drivers/gpu/drm/xe/xe_uc_fw.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_vm.c:2105
error: drivers/gpu/drm/xe/xe_vm.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_vm_doc.h:428
error: drivers/gpu/drm/xe/xe_vm_doc.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe: Cleanup style warnings
Patch failed at 0001 drm/xe: Cleanup style warnings
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


