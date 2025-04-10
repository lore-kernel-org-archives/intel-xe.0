Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FA0C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 18:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E741E10E379;
	Thu, 10 Apr 2025 18:02:45 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D1810E37A;
 Thu, 10 Apr 2025 18:02:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/dma=5Fbuf=3A_stop_?=
 =?utf-8?q?relying_on_placement_in_unmap_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Apr 2025 18:02:44 -0000
Message-ID: <174430816414.366.10335292753471525163@32c37dd7f93d>
X-Patchwork-Hint: ignore
References: <20250410162716.159403-2-matthew.auld@intel.com>
In-Reply-To: <20250410162716.159403-2-matthew.auld@intel.com>
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

Series: drm/xe/dma_buf: stop relying on placement in unmap (rev2)
URL   : https://patchwork.freedesktop.org/series/147218/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 98572c0e541ed70b4de01017a237037620e689c3
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Apr 10 17:27:17 2025 +0100

    drm/xe/dma_buf: stop relying on placement in unmap
    
    The is_vram() is checking the current placement, however if we consider
    exported VRAM with dynamic dma-buf, it looks possible for the xe driver
    to async evict the memory, notifying the importer, however importer does
    not have to call unmap_attachment() immediately, but rather just as
    "soon as possible", like when the dma-resv idles. Following from this we
    would then pipeline the move, attaching the fence to the manager, and
    then update the current placement. But when the unmap_attachment() runs
    at some later point we might see that is_vram() is now false, and take
    the complete wrong path when dma-unmapping the sg, leading to
    explosions.
    
    To fix this check if the sgl was mapping a struct page.
    
    v2:
      - The attachment can be mapped multiple times it seems, so we can't
        really rely on encoding something in the attachment->priv. Instead
        see if the page_link has an encoded struct page. For vram we expect
        this to be NULL.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4563
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
    Acked-by: Christian König <christian.koenig@amd.com>
+ /mt/dim checkpatch c56353870b17912f7d08fee2736fe7a740421b07 drm-intel
98572c0e541e drm/xe/dma_buf: stop relying on placement in unmap


