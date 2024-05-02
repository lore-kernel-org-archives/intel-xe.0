Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB61C4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 18:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B1E10FD39;
	Thu,  2 May 2024 18:38:53 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124BD10F38F;
 Thu,  2 May 2024 18:38:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Perform_dma=5Fm?=
 =?utf-8?q?ap_when_moving_system_buffer_objects_to_TT_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 May 2024 18:38:52 -0000
Message-ID: <171467513206.1869305.8437076945270596392@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240502183251.10170-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240502183251.10170-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Perform dma_map when moving system buffer objects to TT (rev3)
URL   : https://patchwork.freedesktop.org/series/133068/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a749e2b61b4418a1ebca82d0b6c6d421a3b932f9
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu May 2 20:32:51 2024 +0200

    drm/xe: Perform dma_map when moving system buffer objects to TT
    
    Currently we dma_map on ttm_tt population and dma_unmap when
    the pages are released in ttm_tt unpopulate.
    
    Strictly, the dma_map is not needed until the bo is moved to the
    XE_PL_TT placement, so perform the dma_mapping on such moves
    instead, and remove the dma_mappig when moving to XE_PL_SYSTEM.
    
    This is desired for the upcoming shrinker series where shrinking
    of a ttm_tt might fail. That would lead to an odd construct where
    we first dma_unmap, then shrink and if shrinking fails dma_map
    again. If dma_mapping instead is performed on move like this,
    shrinking does not need to care at all about dma mapping.
    
    Finally, where a ttm_tt is destroyed while bound to a different
    memory type than XE_PL_SYSTEM, we keep the dma_unmap in
    unpopulate().
    
    v2:
    - Don't accidently unmap the dma-buf's sgtable.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
+ /mt/dim checkpatch 83d6b363ebb5ba75c62b3d632a3eb2f73b05f9d6 drm-intel
a749e2b61b44 drm/xe: Perform dma_map when moving system buffer objects to TT


