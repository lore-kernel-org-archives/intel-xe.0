Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E8CC19F32
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 01:54:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB4F10E8B3;
	Thu,  6 Mar 2025 01:54:14 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4D410E8B3;
 Thu,  6 Mar 2025 01:54:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Introduce_GPU_SVM_an?=
 =?utf-8?q?d_Xe_SVM_implementation_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Mar 2025 01:54:12 -0000
Message-ID: <174122605217.65013.1504864304262521462@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250306012657.3505757-1-matthew.brost@intel.com>
In-Reply-To: <20250306012657.3505757-1-matthew.brost@intel.com>
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

Series: Introduce GPU SVM and Xe SVM implementation (rev7)
URL   : https://patchwork.freedesktop.org/series/137870/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 3ccfd8016ad8 drm-tip: 2025y-03m-05d-21h-31m-20s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Retry BO allocation
Applying: mm/migrate: Add migrate_device_pfns
Applying: mm/migrate: Trylock device page in do_swap_page
Applying: drm/pagemap: Add DRM pagemap
Applying: drm/xe/bo: Introduce xe_bo_put_async
Applying: drm/gpusvm: Add support for GPU Shared Virtual Memory
Applying: drm/xe: Select DRM_GPUSVM Kconfig
Applying: drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR
Applying: drm/xe: Add SVM init / close / fini to faulting VMs
Applying: drm/xe: Add dma_addr res cursor
Applying: drm/xe: Nuke VM's mapping upon close
Applying: drm/xe: Add SVM range invalidation and page fault
Applying: drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
Applying: drm/xe: Add (re)bind to SVM page fault handler
Applying: drm/xe: Add SVM garbage collector
Applying: drm/xe: Add unbind to SVM garbage collector
Applying: drm/xe: Do not allow CPU address mirror VMA unbind if
Applying: drm/xe: Enable CPU address mirror uAPI
Applying: drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
Applying: drm/xe: Add migrate layer functions for SVM support
Applying: drm/xe: Add SVM device memory mirroring
Applying: drm/xe: Add drm_gpusvm_devmem to xe_bo
Applying: drm/xe: Add drm_pagemap ops to SVM
Applying: drm/xe: Add GPUSVM device memory copy vfunc functions
Applying: drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
Applying: drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
Applying: drm/xe: Add SVM VRAM migration
Applying: drm/xe: Basic SVM BO eviction
Applying: drm/xe: Add SVM debug
Applying: drm/xe: Add modparam for SVM notifier size
Applying: drm/xe: Add always_migrate_to_vram modparam
Applying: drm/doc: gpusvm: Add GPU SVM documentation


