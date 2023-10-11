Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57585CD6E54
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 10:49:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1450F10E692;
	Wed, 11 Oct 2023 10:49:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3B64B10E692;
 Wed, 11 Oct 2023 10:49:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 36B8BA47E9;
 Wed, 11 Oct 2023 10:49:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 11 Oct 2023 10:49:04 -0000
Message-ID: <169702134422.26514.16822222020383594209@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231010124839.7948-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231010124839.7948-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_series_starting_with_=5BCI=2C01/11=5D_drm/gpuvm=3A_add_commo?=
 =?utf-8?q?n_dma-resv_per_struct_drm=5Fgpuvm_=28rev2=29?=
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

Series: series starting with [CI,01/11] drm/gpuvm: add common dma-resv per struct drm_gpuvm (rev2)
URL   : https://patchwork.freedesktop.org/series/124899/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 3c98b0d34 fixup! drm/xe/display: Implement display support
=== git am output follows ===
.git/rebase-apply/patch:278: trailing whitespace.
	
.git/rebase-apply/patch:307: trailing whitespace.
err_no_resv:	
warning: 2 lines add whitespace errors.
.git/rebase-apply/patch:60: trailing whitespace.
			
.git/rebase-apply/patch:89: trailing whitespace.
			
warning: 2 lines add whitespace errors.
Applying: drm/gpuvm: add common dma-resv per struct drm_gpuvm
Applying: drm/xe: Adjust to "drm/gpuvm: add common dma-resv per struct drm_gpuvm"
Applying: drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
Applying: drm/xe: Adjust to commit "drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm"
Applying: drm/gpuvm: add an abstraction for a VM / BO combination
Applying: drm/xe: Adjust to commit "drm/gpuvm: add an abstraction for a VM/BO combination"
Applying: drm/gpuvm: track/lock/validate external/evicted objects
Applying: drm/xe: Adapt to GPUVM tracking of external / evicted objects.
Applying: drm/gpuvm: Local fixes
Applying: drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm
Applying: drm/nouveau: make use of the GPUVM's shared dma-resv


