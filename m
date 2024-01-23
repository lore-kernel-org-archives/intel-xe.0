Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E12C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 16:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E766310E81A;
	Tue, 23 Jan 2024 16:13:51 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE59E10E80C;
 Tue, 23 Jan 2024 16:13:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe=3A_Document_n?=
 =?utf-8?q?ested_struct_members_according_to_guidelines_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 23 Jan 2024 16:13:50 -0000
Message-ID: <170602643097.683881.17088306844490207134@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240123153147.27305-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240123153147.27305-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Document nested struct members according to guidelines (rev3)
URL   : https://patchwork.freedesktop.org/series/129086/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: fc6b7c6ee drm-tip: 2024y-01m-23d-16h-04m-25s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_device_types.h:143
error: drivers/gpu/drm/xe/xe_device_types.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_exec_queue_types.h:109
error: drivers/gpu/drm/xe/xe_exec_queue_types.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_gsc_types.h:50
error: drivers/gpu/drm/xe/xe_gsc_types.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_gt_types.h:103
error: drivers/gpu/drm/xe/xe_gt_types.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_guc_ct_types.h:87
error: drivers/gpu/drm/xe/xe_guc_ct_types.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_guc_submit_types.h:102
error: drivers/gpu/drm/xe/xe_guc_submit_types.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_guc_types.h:49
error: drivers/gpu/drm/xe/xe_guc_types.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_hw_engine_types.h:79
error: drivers/gpu/drm/xe/xe_hw_engine_types.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_lrc_types.h:28
error: drivers/gpu/drm/xe/xe_lrc_types.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_sched_job_types.h:30
error: drivers/gpu/drm/xe/xe_sched_job_types.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_uc_fw_types.h:124
error: drivers/gpu/drm/xe/xe_uc_fw_types.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_wopcm_types.h:16
error: drivers/gpu/drm/xe/xe_wopcm_types.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe: Document nested struct members according to guidelines
Patch failed at 0001 drm/xe: Document nested struct members according to guidelines
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


