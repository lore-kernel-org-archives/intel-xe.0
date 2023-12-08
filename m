Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37C2C10DCE
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 10:34:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E38B10EA5B;
	Fri,  8 Dec 2023 10:34:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id F41F310EA4C;
 Fri,  8 Dec 2023 10:34:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DFB95AADD5;
 Fri,  8 Dec 2023 10:34:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Adjust_to_GPUVM_/_fi?=
 =?utf-8?q?xup_version?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 08 Dec 2023 10:34:47 -0000
Message-ID: <170203168788.7325.6446769496263888232@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231208064643.877688-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231208064643.877688-1-rodrigo.vivi@intel.com>
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

Series: Adjust to GPUVM / fixup version
URL   : https://patchwork.freedesktop.org/series/127549/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: c4235ef53 fixup! drm/xe/display: Implement display support
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
Applying: fixup! drm/xe/vm: Simplify and document xe_vm_lock()
Applying: fixup! drm/xe: Convert pagefaulting code to use drm_exec
Applying: fixup! drm/xe: Rework xe_exec and the VM rebind worker to use the drm_exec helper
Applying: fixup! drm/xe: Convert remaining instances of ttm_eu_reserve_buffers to drm_exec
Applying: fixup! drm/xe: Port Xe to GPUVA


