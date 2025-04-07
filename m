Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79DBC369A3
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 14:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9607310E4B2;
	Mon,  7 Apr 2025 14:39:12 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5039110E4AF;
 Mon,  7 Apr 2025 14:39:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/dma=5Fbuf=3A_stop_relying_on_placement_in_unmap?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Apr 2025 14:39:11 -0000
Message-ID: <174403675132.44253.14330842223633982458@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250407141823.44504-3-matthew.auld@intel.com>
In-Reply-To: <20250407141823.44504-3-matthew.auld@intel.com>
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

Series: series starting with [1/2] drm/xe/dma_buf: stop relying on placement in unmap
URL   : https://patchwork.freedesktop.org/series/147332/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 591bd171ed0ed921e274af4de1def4b8ad70c66e
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Apr 7 15:18:25 2025 +0100

    drm/amdgpu/dma_buf: fix page_link check
    
    The page_link lower bits of the first sg could contain something like
    SG_END, if we are mapping a single VRAM page or contiguous blob which
    fits into one sg entry. Rather pull out the struct page, and use that in
    our check to know if we mapped struct pages vs VRAM.
    
    Fixes: f44ffd677fb3 ("drm/amdgpu: add support for exporting VRAM using DMA-buf v3")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: amd-gfx@lists.freedesktop.org
    Cc: <stable@vger.kernel.org> # v5.8+
    Reviewed-by: Christian König <christian.koenig@amd.com>
+ /mt/dim checkpatch 100ba24787e877cd422caa7d08cb046ef4bb769c drm-intel
14d392b7452d drm/xe/dma_buf: stop relying on placement in unmap
591bd171ed0e drm/amdgpu/dma_buf: fix page_link check


