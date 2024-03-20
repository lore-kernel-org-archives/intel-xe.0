Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A233FC6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 13:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6496B10EDF0;
	Wed, 20 Mar 2024 13:49:24 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D050D10E80C;
 Wed, 20 Mar 2024 13:49:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/8=5D_drm/xe=3A_Make_TLB_invalidation_fences_unordered?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Mar 2024 13:49:22 -0000
Message-ID: <171094256284.921419.15262335268360131222@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240320134356.73655-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240320134356.73655-1-thomas.hellstrom@linux.intel.com>
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
URL   : https://patchwork.freedesktop.org/series/131373/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ffede32205c0b7127d412bd318ad77d830a4adc0
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Mar 20 14:43:56 2024 +0100

    drm/xe/bo: Allow migrating local bos to TT to make room in VRAM
    
    If VRAM is full and we want to evict local bos we can't typically
    do that, since we require all local bos to be residient at
    execution time.
    But we're allowed to migrate to TT if that's a valid placement
    for GPU access, so in that case, do that.
    
    Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Oded Gabbay <ogabbay@kernel.org>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch b87a8b85562fc94e2314b61279ffa80b6c294cfa drm-intel
f38eee97b954 drm/xe: Make TLB invalidation fences unordered
041286d4c2c8 drm/xe: Use ring ops TLB invalidation for rebinds
8e7c6de72cef drm/xe: Reserve fences where needed
7c50d2a1fbb6 drm/xe: Rework rebinding
da160a477c9f drm/xe: Move vma rebinding to the drm_exec locking loop
42998c80d27a drm/xe/bo: Forward the decision to evict local objects during validation
a94e36b140fd drm/xe/bo: Allow eviction of unbound local bos
ffede32205c0 drm/xe/bo: Allow migrating local bos to TT to make room in VRAM


