Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2841C27C78
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 01:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8757810E1DA;
	Wed, 12 Jun 2024 01:58:34 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C87F10E1DA;
 Wed, 12 Jun 2024 01:58:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Xe_OA_Consolidated_D?=
 =?utf-8?q?iffs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Jun 2024 01:58:33 -0000
Message-ID: <171815751304.67160.276729366116015789@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240612015303.2658884-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240612015303.2658884-1-ashutosh.dixit@intel.com>
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

Series: Xe OA Consolidated Diffs
URL   : https://patchwork.freedesktop.org/series/134742/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 1340288da1f2 drm-tip: 2024y-06m-11d-21h-24m-08s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/instructions/xe_mi_commands.h:45
error: drivers/gpu/drm/xe/instructions/xe_mi_commands.h: patch does not apply
error: drivers/gpu/drm/xe/regs/xe_oa_regs.h: does not exist in index
error: patch failed: drivers/gpu/drm/xe/xe_device.c:41
error: drivers/gpu/drm/xe/xe_device.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_guc_pc.c:193
error: drivers/gpu/drm/xe/xe_guc_pc.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_guc_pc.h:9
error: drivers/gpu/drm/xe/xe_guc_pc.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_module.c:10
error: drivers/gpu/drm/xe/xe_module.c: patch does not apply
error: drivers/gpu/drm/xe/xe_oa.c: does not exist in index
error: drivers/gpu/drm/xe/xe_oa.h: does not exist in index
error: drivers/gpu/drm/xe/xe_oa_types.h: does not exist in index
error: drivers/gpu/drm/xe/xe_perf.c: does not exist in index
error: drivers/gpu/drm/xe/xe_perf.h: does not exist in index
error: patch failed: include/uapi/drm/xe_drm.h:1374
error: include/uapi/drm/xe_drm.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe/oa: Combined diff of changes between v16 and v17
Patch failed at 0001 drm/xe/oa: Combined diff of changes between v16 and v17
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


