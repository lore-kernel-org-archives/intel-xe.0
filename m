Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235B6C36005
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 07:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA25210E3BC;
	Mon, 28 Apr 2025 07:37:30 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AFA10E3BC;
 Mon, 28 Apr 2025 07:37:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe=3A_Fix_xe=5Fb?=
 =?utf-8?q?o=5Fevict_build_error?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Apr 2025 07:37:29 -0000
Message-ID: <174582584966.18439.8397330102334488005@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250428063956.1729460-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250428063956.1729460-1-tejas.upadhyay@intel.com>
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

Series: drm/xe: Fix xe_bo_evict build error
URL   : https://patchwork.freedesktop.org/series/148340/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 3169be72c46a drm-tip: 2025y-04m-28d-02h-42m-37s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_bo.c:2930
error: drivers/gpu/drm/xe/xe_bo.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_bo.h:274
error: drivers/gpu/drm/xe/xe_bo.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_dma_buf.c:233
error: drivers/gpu/drm/xe/xe_dma_buf.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe: Fix xe_bo_evict build error
Patch failed at 0001 drm/xe: Fix xe_bo_evict build error
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


