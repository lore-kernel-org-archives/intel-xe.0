Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C155AEE0210
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 22:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E5210E114;
	Wed, 13 Sep 2023 22:35:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A78D510E114;
 Wed, 13 Sep 2023 22:35:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 926D0AA917;
 Wed, 13 Sep 2023 22:35:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Wed, 13 Sep 2023 22:35:18 -0000
Message-ID: <169464451859.31252.4268348149429827878@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230913223228.2788706-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230913223228.2788706-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_uC_management_cleanup?=
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

Series: uC management cleanup
URL   : https://patchwork.freedesktop.org/series/123654/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 89b671db4 drm/xe: Use Xe assert macros instead of XE_WARN_ON macro
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_execlist.c:321
error: drivers/gpu/drm/xe/xe_execlist.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_ggtt.c:233
error: drivers/gpu/drm/xe/xe_ggtt.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_guc_pc.c:816
error: drivers/gpu/drm/xe/xe_guc_pc.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_guc_submit.c:1123
error: drivers/gpu/drm/xe/xe_guc_submit.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe/uc: Rename guc_submission_enabled() to uc_enabled()
Patch failed at 0001 drm/xe/uc: Rename guc_submission_enabled() to uc_enabled()
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


