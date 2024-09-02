Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985EFCA0ED3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 17:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559C010E394;
	Mon,  2 Sep 2024 17:59:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BC110E394;
 Mon,  2 Sep 2024 17:59:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/ttm=3A_Really_use_a_s?=
 =?utf-8?q?eparate_LRU_list_for_swapped-_and_pinned_objects?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Sep 2024 17:59:52 -0000
Message-ID: <172529999233.907988.17561512582671016560@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240902154159.78871-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240902154159.78871-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/ttm: Really use a separate LRU list for swapped- and pinned objects
URL   : https://patchwork.freedesktop.org/series/138103/
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
commit 58f1f1476b9be58f2671bd55aec13ae6e1134328
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Sep 2 17:41:59 2024 +0200

    drm/ttm: Move pinned objects off LRU lists when pinning
    
    The ttm_bo_pin() and ttm_bo_unpin() functions weren't moving their
    resources off the LRU list to the unevictable list.
    
    Make sure that happens so that pinned objects don't accidently linger
    on the LRU lists, and also make sure to move them back once they
    are unpinned.
    
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <dri-devel@lists.freedesktop.org>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch f68a30b6b56c006ab1d6bca3b4ccf7aed1b2743e drm-intel
bd23981b9466 drm/ttm: Move swapped objects off the manager's LRU list
58f1f1476b9b drm/ttm: Move pinned objects off LRU lists when pinning


