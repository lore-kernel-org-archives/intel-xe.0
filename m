Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426FEC54FB9
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 12:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACAB10E04A;
	Mon, 20 Nov 2023 12:44:08 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id D004910E04A;
 Mon, 20 Nov 2023 12:44:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C874CAADED;
 Mon, 20 Nov 2023 12:44:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 20 Nov 2023 12:44:05 -0000
Message-ID: <170048424579.29475.17440596586833450931@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231116144316.7-1-francois.dugast@intel.com>
In-Reply-To: <20231116144316.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_uAPI_Alignment_-_Cleanup_and_future_proof_=28rev3=29?=
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

Series: uAPI Alignment - Cleanup and future proof (rev3)
URL   : https://patchwork.freedesktop.org/series/126535/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: b25aa17bf drm/xe/guc: Use valid scratch register for posting read
=== git am output follows ===
error: include/drm-uapi/xe_drm.h: does not exist in index
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe: Extend drm_xe_vm_bind_op
Applying: drm/xe/uapi: Separate bo_create placement from flags
Applying: drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
Applying: drm/xe/uapi: Reject bo creation of unaligned size
Applying: drm/xe/uapi: Align on a common way to return arrays (memory regions)
Applying: drm/xe/uapi: Align on a common way to return arrays (gt)
Applying: drm/xe/uapi: Align on a common way to return arrays (engines)
Applying: drm/xe/uapi: Fix various struct padding for 64b alignment
Patch failed at 0008 drm/xe/uapi: Fix various struct padding for 64b alignment
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


