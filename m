Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3FCC3601A
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 17:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0202010E248;
	Thu,  3 Apr 2025 17:11:46 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1BC10E256;
 Thu,  3 Apr 2025 17:11:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/dma=5Fbuf=3A_stop_?=
 =?utf-8?q?relying_on_placement_in_unmap?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Apr 2025 17:11:44 -0000
Message-ID: <174370030437.33519.14597165525012339767@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250403140735.304928-2-matthew.auld@intel.com>
In-Reply-To: <20250403140735.304928-2-matthew.auld@intel.com>
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

Series: drm/xe/dma_buf: stop relying on placement in unmap
URL   : https://patchwork.freedesktop.org/series/147218/
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
commit 961cc8f52845d4c80d0c44ef3101e18a0f4a5e2d
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Apr 3 15:07:36 2025 +0100

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
    
    To fix this rather make a note in the attachment if the sg was
    originally mapping vram or tt pages.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4563
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
+ /mt/dim checkpatch bc18da45d48d337b92a7ff9546ba61da32b3b586 drm-intel
961cc8f52845 drm/xe/dma_buf: stop relying on placement in unmap


