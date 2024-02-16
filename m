Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E62C48260
	for <intel-xe@archiver.kernel.org>; Fri, 16 Feb 2024 13:20:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6E610E279;
	Fri, 16 Feb 2024 13:20:04 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F0210E279;
 Fri, 16 Feb 2024 13:20:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_TTM_unlockable_restartabl?=
 =?utf-8?q?e_LRU_list_iteration?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Feb 2024 13:20:02 -0000
Message-ID: <170808960240.925.4360251290141226846@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240216131306.101932-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240216131306.101932-1-thomas.hellstrom@linux.intel.com>
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

Series: TTM unlockable restartable LRU list iteration
URL   : https://patchwork.freedesktop.org/series/130000/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3a1c1490d63a9899feb46378f160b7436da410d9
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Feb 16 14:13:06 2024 +0100

    drm/ttm: Allow continued swapout after -ENOSPC falure
    
    The -ENOSPC failure from ttm_bo_swapout() meant that the lru_lock
    was dropped and simply restarting the iteration meant we'd likely
    hit the same error again on the same resource. Now that we can
    restart the iteration even if the lock was dropped, do that.
    
    Cc: Christian König <christian.koenig@amd.com>
    Cc: <dri-devel@lists.freedesktop.org>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 2b4b0c5d388b6148478a187eac6f503800f5063d drm-intel
833eabbe2 drm/ttm: Allow TTM LRU list nodes of different types
8874e8e27 drm/ttm: Use LRU hitches
25ea36ec5 drm/ttm: Consider hitch moves within bulk sublist moves
3a1c1490d drm/ttm: Allow continued swapout after -ENOSPC falure


