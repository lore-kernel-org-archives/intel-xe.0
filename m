Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25A9C54E58
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 11:05:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6546910EC1B;
	Wed, 20 Mar 2024 11:05:03 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0319F10EC1B;
 Wed, 20 Mar 2024 11:05:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_series_starting_with?=
 =?utf-8?q?_=5BCI=2C1/8=5D_drm/xe=3A_Make_TLB_invalidation_fences_unordered?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Mar 2024 11:05:02 -0000
Message-ID: <171093270201.921376.4691294515673488224@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240320101020.5611-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240320101020.5611-1-thomas.hellstrom@linux.intel.com>
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

Series: series starting with [CI,1/8] drm/xe: Make TLB invalidation fences unordered
URL   : https://patchwork.freedesktop.org/series/131365/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b87a8b85562f drm-tip: 2024y-03m-20d-10h-18m-20s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/display/xe_fb_pin.c:381
error: drivers/gpu/drm/xe/display/xe_fb_pin.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_exec.c:335
error: drivers/gpu/drm/xe/xe_exec.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe: Make TLB invalidation fences unordered
Applying: drm/xe: Use ring ops TLB invalidation for rebinds
Applying: drm/xe: Reserve fences where needed
Applying: drm/xe: Rework rebinding
Applying: drm/xe: Move vma rebinding to the drm_exec locking loop
Applying: drm/xe/bo: Forward the decision to evict local objects during validation
Patch failed at 0006 drm/xe/bo: Forward the decision to evict local objects during validation
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


