Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64CBC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 14:15:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AC210E289;
	Mon, 19 Aug 2024 14:15:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC76D10E288;
 Mon, 19 Aug 2024 14:15:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_Use_vma=5Fpa?=
 =?utf-8?q?ges=28=29_helper_function_in_xe=5Foa=5Fmmap=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thorsten Blum" <thorsten.blum@toblux.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 Aug 2024 14:15:49 -0000
Message-ID: <172407694989.694772.1631433011471852499@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240819095751.539645-2-thorsten.blum@toblux.com>
In-Reply-To: <20240819095751.539645-2-thorsten.blum@toblux.com>
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

Series: drm/xe/oa: Use vma_pages() helper function in xe_oa_mmap() (rev2)
URL   : https://patchwork.freedesktop.org/series/136514/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 28aceac5233bedae638c85b8979b80bbe5a80489
Author: Thorsten Blum <thorsten.blum@toblux.com>
Date:   Mon Aug 19 11:57:52 2024 +0200

    drm/xe/oa: Use vma_pages() helper function in xe_oa_mmap()
    
    Use the vma_pages() helper function and remove the following
    Coccinelle/coccicheck warning reported by vma_pages.cocci:
    
      WARNING: Consider using vma_pages helper on vma
    
    Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
+ /mt/dim checkpatch 619c97d7af9cabacd8639b08ee6c7cc9aee04cde drm-intel
28aceac5233b drm/xe/oa: Use vma_pages() helper function in xe_oa_mmap()


