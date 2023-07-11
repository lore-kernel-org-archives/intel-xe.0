Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1241BEB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 09:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58C910E34C;
	Tue, 11 Jul 2023 09:24:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9CC0910E34C;
 Tue, 11 Jul 2023 09:24:25 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3C76EAADEA;
 Tue, 11 Jul 2023 09:24:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Tue, 11 Jul 2023 09:24:25 -0000
Message-ID: <168906746524.18665.8115918414366574193@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230711092122.7-1-francois.dugast@intel.com>
In-Reply-To: <20230711092122.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_Prevent_flooding_the_kernel_log_with_XE=5FIOCTL=5FERR?=
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

Series: Prevent flooding the kernel log with XE_IOCTL_ERR
URL   : https://patchwork.freedesktop.org/series/120535/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: d39e49e2a drm/xe: Port Xe to GPUVA
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_engine.c:586
error: drivers/gpu/drm/xe/xe_engine.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_vm.c:2560
error: drivers/gpu/drm/xe/xe_vm.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_vm_madvise.c:115
error: drivers/gpu/drm/xe/xe_vm_madvise.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe: Prevent flooding the kernel log with XE_IOCTL_ERR
Patch failed at 0001 drm/xe: Prevent flooding the kernel log with XE_IOCTL_ERR
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


