Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13ECC54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 16:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C09C10E9C6;
	Tue,  5 Mar 2024 16:09:30 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745A710E9C6;
 Tue,  5 Mar 2024 16:09:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_TTM_unlockable_restartabl?=
 =?utf-8?q?e_LRU_list_iteration_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Mar 2024 16:09:28 -0000
Message-ID: <170965496848.524851.15439271433934911620@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240305160202.3555-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240305160202.3555-1-thomas.hellstrom@linux.intel.com>
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

Series: TTM unlockable restartable LRU list iteration (rev3)
URL   : https://patchwork.freedesktop.org/series/130000/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7d6fb25447372de10c7d82d450bf95e4b2e2a0ab
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2ce14d89ceaf738b194fb18fd0f0ce5364df1b06
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Mar 5 17:02:02 2024 +0100

    drm/ttm: Allow continued swapout after -ENOSPC falure
    
    The -ENOSPC failure from ttm_bo_swapout() meant that the lru_lock
    was dropped and simply restarting the iteration meant we'd likely
    hit the same error again on the same resource. Now that we can
    restart the iteration even if the lock was dropped, do that.
    
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
    Cc: <dri-devel@lists.freedesktop.org>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 06211dd7770129a5e2c720d928a606c1433a9bcd drm-intel
c5392e7dad6f drm/ttm: Allow TTM LRU list nodes of different types
caf0693d2dc7 drm/ttm: Use LRU hitches
c18cafc13c3c drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
2ce14d89ceaf drm/ttm: Allow continued swapout after -ENOSPC falure


