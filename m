Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546EAC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 19:44:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BA010E0C8;
	Thu,  7 Dec 2023 19:44:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9460A10E0C8;
 Thu,  7 Dec 2023 19:44:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8E87FAADE1;
 Thu,  7 Dec 2023 19:44:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Adjust_to_?=
 =?utf-8?q?DRM_GPUVM_changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 07 Dec 2023 19:44:56 -0000
Message-ID: <170197829656.28720.9743998393572397137@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Adjust to DRM GPUVM changes
URL   : https://patchwork.freedesktop.org/series/127496/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 2fb92bd63 drm/xe: Rename info.supports_* to info.has_*
=== git am output follows ===
Applying: drm/gpuvm: convert WARN() to drm_WARN() variants
Applying: drm/gpuvm: don't always WARN in drm_gpuvm_check_overflow()
Applying: drm/gpuvm: export drm_gpuvm_range_valid()
Applying: drm/nouveau: make use of drm_gpuvm_range_valid()
Applying: drm/gpuvm: add common dma-resv per struct drm_gpuvm
Applying: drm/nouveau: make use of the GPUVM's shared dma-resv
Applying: drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
Applying: drm/nouveau: separately allocate struct nouveau_uvmm
Applying: drm/gpuvm: reference count drm_gpuvm structures
Applying: drm/gpuvm: add an abstraction for a VM / BO combination
Applying: drm/gpuvm: track/lock/validate external/evicted objects
Applying: drm/xe: Adjust to "drm/gpuvm: add common dma-resv per struct drm_gpuvm"
Applying: drm/xe: Adjust to commit "drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm"
Applying: drm/xe: Adjust to commit drm/gpuvm: reference count drm_gpuvm structures
Applying: drm/xe: Adjust to commit "drm/gpuvm: add an abstraction for a VM/BO combination"
Applying: drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm


