Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F2AC4725D
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jan 2024 01:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBD610E1E9;
	Sat, 20 Jan 2024 01:53:14 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0406A10E1E9;
 Sat, 20 Jan 2024 01:53:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Xe_OA_Consolidated_D?=
 =?utf-8?q?iffs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Sat, 20 Jan 2024 01:53:13 -0000
Message-ID: <170571559301.593747.12993806080235483227@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240120014953.1241724-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240120014953.1241724-1-ashutosh.dixit@intel.com>
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

Series: Xe OA Consolidated Diffs
URL   : https://patchwork.freedesktop.org/series/128993/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b239ffd47 drm-tip: 2024y-01m-19d-21h-47m-43s UTC integration manifest
=== git am output follows ===
error: drivers/gpu/drm/xe/regs/xe_oa_regs.h: does not exist in index
error: patch failed: drivers/gpu/drm/xe/xe_device.c:537
error: drivers/gpu/drm/xe/xe_device.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_module.c:72
error: drivers/gpu/drm/xe/xe_module.c: patch does not apply
error: drivers/gpu/drm/xe/xe_oa.c: does not exist in index
error: drivers/gpu/drm/xe/xe_oa.h: does not exist in index
error: drivers/gpu/drm/xe/xe_oa_types.h: does not exist in index
error: patch failed: include/uapi/drm/xe_drm.h:100
error: include/uapi/drm/xe_drm.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe/oa: Combined diff of changes between v7 and v8
Patch failed at 0001 drm/xe/oa: Combined diff of changes between v7 and v8
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


