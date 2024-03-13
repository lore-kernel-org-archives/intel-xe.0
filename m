Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A7BC54E58
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 10:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F85210E9D0;
	Wed, 13 Mar 2024 10:34:14 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B917410E541;
 Wed, 13 Mar 2024 10:34:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/7=5D_drm/xe=3A_Make_TLB_invalidation_fences_unordered_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Mar 2024 10:34:11 -0000
Message-ID: <171032605175.727309.2132045914654871487@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240312153459.10185-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240312153459.10185-1-thomas.hellstrom@linux.intel.com>
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

Series: series starting with [CI,1/7] drm/xe: Make TLB invalidation fences unordered (rev2)
URL   : https://patchwork.freedesktop.org/series/131036/
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
commit 35d981a1e4084d4bc704b24cc99b4428876fe77e
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Mar 12 16:34:59 2024 +0100

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
+ /mt/dim checkpatch c323e03ff602c24e09dd579aae3e1c2ceb4b8531 drm-intel
117403d12edd drm/xe: Make TLB invalidation fences unordered
f8c24eca76fc drm/xe: Rework xe_vm_rebind()
d9dba569fcf5 drm/xe: Reserve fences where needed
d86a10ec2de1 drm/xe: Move vma rebinding to the drm_exec locking loop
a2517968a235 drm/xe/bo: Forward the decision to evict local objects during validation
7029e0e85b70 drm/xe/bo: Allow eviction of unbound local bos
35d981a1e408 drm/xe/bo: Allow migrating local bos to TT to make room in VRAM


