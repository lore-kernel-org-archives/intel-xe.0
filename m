Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46232C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 13:03:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8FB10F022;
	Wed,  1 Jul 2026 13:03:42 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7FD10F020;
 Wed,  1 Jul 2026 13:03:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/gpusvm=3A_fix_IOVA_un?=
 =?utf-8?q?map_path_in_=5F=5Fdrm=5Fgpusvm=5Funmap=5Fpages=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Honglei Huang" <honglei1.huang@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Jul 2026 13:03:40 -0000
Message-ID: <178291102077.137468.8685833456626661998@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260627033325.3795298-1-honglei1.huang@amd.com>
In-Reply-To: <20260627033325.3795298-1-honglei1.huang@amd.com>
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

Series: drm/gpusvm: fix IOVA unmap path in __drm_gpusvm_unmap_pages()
URL   : https://patchwork.freedesktop.org/series/169599/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f068f9c78cdea0f2309bfca3573fb4cbae003e47
Author: Honglei Huang <honghuan@amd.com>
Date:   Sat Jun 27 11:33:25 2026 +0800

    drm/gpusvm: do not route system pages to device_unmap() on IOVA unmap
    
    In a mixed range: ctx->allow_mixed dpagemap is not NULL while some entries
    are system pages. The unmap loop used:
    
            dma_unmap_page(...);
        else if (dpagemap && dpagemap->ops->device_unmap)
            dpagemap->ops->device_unmap(...);
    
    When use_iova is true the first condition is false for system pages, so they
    fall through to device_unmap() and a system DMA address is handed to the
    device specific unmap callback, risking invalid accesses or state corruption.
    
    Key the branch off addr->proto instead: system pages only need an explicit
    dma_unmap_page() in the non IOVA case, IOVA system pages are already torn
    down by the single dma_iova_destroy(), and only genuine device pages
    reach device_unmap().
    
    Reported-by: Sashiko AI review
    Signed-off-by: Honglei Huang <honghuan@amd.com>
+ /mt/dim checkpatch 32ebc37ae37fcca08cddfcec5c9f3365685ee908 drm-intel
dc8bd1cfb4ae drm/gpusvm: avoid reading uninitialized dma_addr[0].dir on IOVA unmap
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
whenever dma_use_iova() is true. On the error path of drm_gpusvm_get_pages()

-:20: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Sashiko AI review'
#20: 
Reported-by: Sashiko AI review

-:20: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#20: 
Reported-by: Sashiko AI review
Signed-off-by: Honglei Huang <honghuan@amd.com>

total: 1 errors, 2 warnings, 0 checks, 26 lines checked
f068f9c78cde drm/gpusvm: do not route system pages to device_unmap() on IOVA unmap
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
When use_iova is true the first condition is false for system pages, so they

-:23: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Sashiko AI review'
#23: 
Reported-by: Sashiko AI review

-:23: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#23: 
Reported-by: Sashiko AI review
Signed-off-by: Honglei Huang <honghuan@amd.com>

total: 1 errors, 2 warnings, 0 checks, 23 lines checked


