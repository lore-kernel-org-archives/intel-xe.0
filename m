Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDADC4707B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 19:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7064610E653;
	Wed, 10 Jan 2024 19:03:11 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5422F10E653;
 Wed, 10 Jan 2024 19:03:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/migrate=3A_Fix_CCS?=
 =?utf-8?q?_copy_for_small_VRAM_copy_chunks_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 10 Jan 2024 19:03:10 -0000
Message-ID: <170491339034.240792.14399044165221343691@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240110163415.524165-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240110163415.524165-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe/migrate: Fix CCS copy for small VRAM copy chunks (rev5)
URL   : https://patchwork.freedesktop.org/series/127874/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
414601bf14e77eeb048ecf6d1c25190801399524
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1de4ec48ca8f32d7263613740b9fd72ce29928e9
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jan 10 17:34:15 2024 +0100

    drm/xe/migrate: Fix CCS copy for small VRAM copy chunks
    
    Since the migrate code is using the identity map for addressing VRAM,
    copy chunks may become as small as 64K if the VRAM resource is fragmented.
    
    However, a chunk size smaller that 1MiB may lead to the *next* chunk's
    offset into the CCS metadata backup memory may not be page-aligned, and
    the XY_CTRL_SURF_COPY_BLT command can't handle that, and even if it could,
    the current code doesn't handle the offset calculaton correctly.
    
    To fix this, make sure we align the size of VRAM copy chunks to 1MiB. If
    the remaining data to copy is smaller than that, that's not a problem,
    so use the remaining size. If the VRAM copy cunk becomes fragmented due
    to the size alignment restriction, don't use the identity map, but instead
    emit PTEs into the page-table like we do for system memory.
    
    v2:
    - Rebase
    v3:
    - Future proof somewhat by taking into account the real data size to
      flat CCS metadata size ratio. (Matt Roper)
    - Invert a couple of if-statements for better readability.
    - Fix support for 4K-granularity VRAM sizes. (Tested on DG1).
    v4:
    - Fix up code comments
    - Fix debug printout format typo.
    v5:
    - Add a Fixes: tag.
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Matthew Auld <matthew.william.auld@gmail.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Fixes: e89b384cde62 ("drm/xe/migrate: Update emit_pte to cope with a size level than 4k")
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch bb9e8031d2feb59becdea41e54e62f1bc47f3ef9 drm-intel
1de4ec48c drm/xe/migrate: Fix CCS copy for small VRAM copy chunks
-:39: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'e89b384cde62', maybe rebased or not pulled?
#39: 
Fixes: e89b384cde62 ("drm/xe/migrate: Update emit_pte to cope with a size level than 4k")

total: 0 errors, 1 warnings, 0 checks, 229 lines checked


