Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B4AC35274
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917A510E2A0;
	Mon, 18 Dec 2023 19:27:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7BD6610E27F;
 Mon, 18 Dec 2023 19:27:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7595AAADD6;
 Mon, 18 Dec 2023 19:27:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/migrate=3A_Fix_CCS?=
 =?utf-8?q?_copy_for_small_VRAM_copy_chunks_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Mon, 18 Dec 2023 19:27:51 -0000
Message-ID: <170292767147.12105.783864063568563242@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231218142933.8571-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231218142933.8571-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe/migrate: Fix CCS copy for small VRAM copy chunks (rev3)
URL   : https://patchwork.freedesktop.org/series/127874/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ec0cd7afaf282e6bbbf117ea79462bd555bc4a9d
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Dec 18 15:29:33 2023 +0100

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
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Matthew Auld <matthew.william.auld@gmail.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 16f9e14e9101e3250294fc3ccb0acb35cd75532d drm-intel
ec0cd7afa drm/xe/migrate: Fix CCS copy for small VRAM copy chunks


