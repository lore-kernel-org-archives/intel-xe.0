Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22469C76188
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 17:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95EB10E534;
	Mon,  3 Apr 2023 17:16:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A1CB810E534;
 Mon,  3 Apr 2023 17:16:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7F0D2AADE3;
 Mon,  3 Apr 2023 17:16:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mauro Carvalho Chehab" <mauro.chehab@linux.intel.com>
Date: Mon, 03 Apr 2023 17:16:35 -0000
Message-ID: <168054219549.24311.16729984225303440102@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230328130826.61029-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230328130826.61029-1-zbigniew.kempczynski@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/xe/bo=3A_Return_object_bo_size_on_create_=28rev2=29?=
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

Series: drm/xe/bo: Return object bo size on create (rev2)
URL   : https://patchwork.freedesktop.org/series/115726/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit cbd8b47f28266aad8f9786be9a1899e3f0e0f2e0
Author:     Matt Roper <matthew.d.roper@intel.com>
AuthorDate: Mon Mar 27 10:34:33 2023 -0700
Commit:     Matt Roper <matthew.d.roper@intel.com>
CommitDate: Fri Mar 31 17:06:44 2023 -0700

    fixup! drm/xe/pat: Handle unicast vs MCR PAT registers
    
    Somehow I dropped the error message when sending this; add it back.
    
    To be squashed next time the Xe driver is rebased.
    
    Fixes: 11946af00717 ("drm/xe/pat: Handle unicast vs MCR PAT registers")
    Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
    Link: https://lore.kernel.org/r/20230327173433.2957645-1-matthew.d.roper@intel.com
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_bo.c:993
error: drivers/gpu/drm/xe/xe_bo.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe/bo: Return object bo size on create
Patch failed at 0001 drm/xe/bo: Return object bo size on create
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


