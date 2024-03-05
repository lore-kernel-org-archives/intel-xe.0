Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472ACC54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 10:41:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0561A112A08;
	Tue,  5 Mar 2024 10:41:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD10112A08;
 Tue,  5 Mar 2024 10:41:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_TTM_unlockable_restartabl?=
 =?utf-8?q?e_LRU_list_iteration_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Mar 2024 10:41:57 -0000
Message-ID: <170963531737.524257.16932039197633401014@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240305103445.75919-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240305103445.75919-1-thomas.hellstrom@linux.intel.com>
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

Series: TTM unlockable restartable LRU list iteration (rev2)
URL   : https://patchwork.freedesktop.org/series/130000/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
4dc7d0cc630cdd9ac56065b1a22afc329345a519
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6e3104f1631486096e9ebb0db2c11c9ce5e9535c
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Mar 5 11:34:45 2024 +0100

    drm/ttm: Allow continued swapout after -ENOSPC falure
    
    The -ENOSPC failure from ttm_bo_swapout() meant that the lru_lock
    was dropped and simply restarting the iteration meant we'd likely
    hit the same error again on the same resource. Now that we can
    restart the iteration even if the lock was dropped, do that.
    
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
    Cc: <dri-devel@lists.freedesktop.org>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 98da761379cfaa31b32641ad648f83c90a8e629e drm-intel
aa88889be970 drm/ttm: Allow TTM LRU list nodes of different types
4414db953e49 drm/ttm: Use LRU hitches
452ff4d0c4b0 drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
6e3104f16314 drm/ttm: Allow continued swapout after -ENOSPC falure


