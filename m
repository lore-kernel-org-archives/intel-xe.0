Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF68AC28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 21:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F61A10E7CB;
	Wed, 12 Mar 2025 21:10:55 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFACB10E7CB;
 Wed, 12 Mar 2025 21:10:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm=2C_drm/xe=3A_Mul?=
 =?utf-8?q?ti-device_GPUSVM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Mar 2025 21:10:53 -0000
Message-ID: <174181385397.26561.7834738979456295376@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
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

Series: drm, drm/xe: Multi-device GPUSVM
URL   : https://patchwork.freedesktop.org/series/146227/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e2e6ad67ea05 drm-tip: 2025y-03m-12d-17h-31m-46s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:264: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
Applying: drm/xe/svm: Fix a potential bo UAF
Applying: drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap
Applying: drm/pagemap: Add a populate_mm op
Applying: drm/xe: Implement and use the drm_pagemap populate_mm op
Applying: drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap and manage lifetime
Applying: drm/pagemap: Get rid of the struct drm_pagemap_zdd::device_private_page_owner field
Applying: drm/xe/bo: Add a bo remove callback
Applying: drm/pagemap_util: Add a utility to assign an owner to a set of interconnected gpus
Applying: drm/gpusvm, drm/xe: Move the device private owner to the drm_gpusvm_ctx
Applying: drm/xe: Use the drm_pagemap_util helper to get a svm pagemap owner
Applying: drm/xe: Make the PT code handle placement per PTE rather than per vma / range
Applying: drm/gpusvm: Allow mixed mappings
Applying: drm/xe: Add a preferred dpagemap
Applying: drm/pagemap/util: Add file descriptors pointing to struct drm_pagemap
Applying: drm/xe/migrate: Allow xe_migrate_vram() also on non-pagefault capable devices
Applying: drm/xe/uapi: Add the devmem_open ioctl
Applying: drm/xe/uapi: HAX: Add the xe_madvise_prefer_devmem IOCTL
Applying: drm/xe: HAX: Use pcie p2p dma to test fast interconnect


