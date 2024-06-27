Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E302FC2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 16:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD8510E0ED;
	Thu, 27 Jun 2024 16:03:12 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D032410E0ED;
 Thu, 27 Jun 2024 16:03:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_DRM_resource_managem?=
 =?utf-8?q?ent_cgroup=2C_try_2=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jun 2024 16:03:11 -0000
Message-ID: <171950419184.164688.16218465397391909919@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
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

Series: DRM resource management cgroup, try 2.
URL   : https://patchwork.freedesktop.org/series/135483/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 70d56bd71f6c drm-tip: 2024y-06m-27d-13h-03m-43s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/ttm/tests/ttm_bo_test.c:252
error: drivers/gpu/drm/ttm/tests/ttm_bo_test.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: mm/page_counter: Move calculating protection values to page_counter
Applying: drm/cgroup: Add memory accounting DRM cgroup
Applying: drm/ttm: Handle cgroup based eviction in TTM
Patch failed at 0003 drm/ttm: Handle cgroup based eviction in TTM
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


