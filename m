Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AA5C5478C
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 18:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BD410E461;
	Mon, 26 Feb 2024 18:18:46 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA0C10E461;
 Mon, 26 Feb 2024 18:18:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_VM_Overcommit_h?=
 =?utf-8?q?andling_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Feb 2024 18:18:43 -0000
Message-ID: <170897152396.299440.10283058128167340018@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240226164455.10179-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240226164455.10179-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: VM Overcommit handling fixes
URL   : https://patchwork.freedesktop.org/series/130395/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ad2b3bb3dfeeafded3d3ea5808514e49cb1e552
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5a65edd762985d1a9ca83c5492d0b6c25ac85444
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Feb 26 17:44:55 2024 +0100

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
+ /mt/dim checkpatch c815c7fa9257eb8ff4433c43058dd292b16347eb drm-intel
d45386464760 drm/xe/bo: Forward the decision to evict local objects during validation
3cae97ec13f2 drm/xe/bo: Allow eviction of unbound local bos
5a65edd76298 drm/xe/bo: Allow migrating local bos to TT to make room in VRAM


