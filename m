Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E97EE499D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 12:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0E510E9E9;
	Wed, 11 Sep 2024 12:26:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8AC10E9E9;
 Wed, 11 Sep 2024 12:26:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/ttm=3A_Really_use_a_s?=
 =?utf-8?q?eparate_LRU_list_for_swapped-_and_pinned_objects_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Sep 2024 12:26:23 -0000
Message-ID: <172605758384.984928.3921963750922951496@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240911121859.85387-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240911121859.85387-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/ttm: Really use a separate LRU list for swapped- and pinned objects (rev6)
URL   : https://patchwork.freedesktop.org/series/138103/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cd66d11ff4901e3819ad6b11a690a4fcba2a35bd
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Sep 11 14:18:59 2024 +0200

    drm/ttm: Move pinned objects off LRU lists when pinning
    
    The ttm_bo_pin() and ttm_bo_unpin() functions weren't moving their
    resources off the LRU list to the unevictable list.
    
    Make sure that happens so that pinned objects don't accidently linger
    on the LRU lists, and also make sure to move them back once they
    are unpinned.
    
    v2:
    - Removing from a bulk move must be done with the pin-count still zero.
    v3:
    - ttm_resource_move_to_lru_tail must be done after pinning with a non-
      NULL resource (Intel CI).
    v6:
    - Use a TAB instead of space (checkpatch.pl error).
    
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <dri-devel@lists.freedesktop.org>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Christian König <christian.koenig@amd.com> #v1
+ /mt/dim checkpatch fe8a41f28dca3eddef8bdabe6c97504e49179e8c drm-intel
d6c5a80a7db3 drm/ttm: Move swapped objects off the manager's LRU list
cd66d11ff490 drm/ttm: Move pinned objects off LRU lists when pinning


