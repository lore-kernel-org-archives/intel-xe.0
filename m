Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13844C54FB9
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 21:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4DF10E795;
	Fri, 17 Nov 2023 21:32:08 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5390610E795;
 Fri, 17 Nov 2023 21:32:06 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 519D1A882E;
 Fri, 17 Nov 2023 21:32:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 17 Nov 2023 21:32:06 -0000
Message-ID: <170025672633.7873.7200041410458722376@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231114133434.7-1-francois.dugast@intel.com>
In-Reply-To: <20231114133434.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_uAPI_Alignment_-_Renaming_=28rev2=29?=
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

Series: uAPI Alignment - Renaming (rev2)
URL   : https://patchwork.freedesktop.org/series/126399/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 3b8183b7e drm/xe/uapi: Be more specific about the vm_bind prefetch region
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_bo.c:209
error: drivers/gpu/drm/xe/xe_bo.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_exec_queue.c:393
error: drivers/gpu/drm/xe/xe_exec_queue.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_gt.c:556
error: drivers/gpu/drm/xe/xe_gt.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_pmu.c:17
error: drivers/gpu/drm/xe/xe_pmu.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_query.c:261
error: drivers/gpu/drm/xe/xe_query.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_vm.c:2183
error: drivers/gpu/drm/xe/xe_vm.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_vm_doc.h:32
error: drivers/gpu/drm/xe/xe_vm_doc.h: patch does not apply
error: patch failed: include/uapi/drm/xe_drm.h:19
error: include/uapi/drm/xe_drm.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe/uapi: Add missing DRM_ prefix in uAPI constants
Patch failed at 0001 drm/xe/uapi: Add missing DRM_ prefix in uAPI constants
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


