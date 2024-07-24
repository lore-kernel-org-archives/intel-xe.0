Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF79BC3DA61
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 19:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A0910E0E9;
	Wed, 24 Jul 2024 19:41:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27E110E0E9;
 Wed, 24 Jul 2024 19:41:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Parallel_submission_?=
 =?utf-8?q?of_dma_fence_jobs_and_LR_jobs_with_shared_hardware_resources_=28r?=
 =?utf-8?q?ev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Jul 2024 19:41:45 -0000
Message-ID: <172185010572.363572.5088210887779014615@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240724193431.2685833-1-francois.dugast@intel.com>
In-Reply-To: <20240724193431.2685833-1-francois.dugast@intel.com>
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

Series: Parallel submission of dma fence jobs and LR jobs with shared hardware resources (rev2)
URL   : https://patchwork.freedesktop.org/series/136192/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: ff2008797dfd drm-tip: 2024y-07m-24d-17h-54m-07s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_guc_submit.c:1575
error: drivers/gpu/drm/xe/xe_guc_submit.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe/hw_engine_group: Introduce xe_hw_engine_group
Applying: drm/xe/guc_submit: Make suspend_wait interruptible
Patch failed at 0002 drm/xe/guc_submit: Make suspend_wait interruptible
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


