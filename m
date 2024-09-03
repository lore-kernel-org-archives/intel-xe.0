Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B68CD3420
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 12:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DBE10E579;
	Tue,  3 Sep 2024 12:28:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F23910E579;
 Tue,  3 Sep 2024 12:28:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=3A_Really_use_a_s?=
 =?utf-8?q?eparate_LRU_list_for_swapped-_and_pinned_objects_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Sep 2024 12:28:13 -0000
Message-ID: <172536649338.912710.7211643274249544409@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240903121958.11078-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240903121958.11078-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/ttm: Really use a separate LRU list for swapped- and pinned objects (rev3)
URL   : https://patchwork.freedesktop.org/series/138103/
State : warning

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
commit 58d684b7eefe402541d9dfddd3eb844f53968f8a
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Sep 3 14:19:58 2024 +0200

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
    
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <dri-devel@lists.freedesktop.org>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Christian König <christian.koenig@amd.com> #v1
+ /mt/dim checkpatch 707f9d05c039aa43d5cbfc29573b642d3c43b618 drm-intel
4bcc9cee200a drm/ttm: Move swapped objects off the manager's LRU list
-:336: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#336: FILE: drivers/gpu/drm/ttm/ttm_tt.c:370:
 }
+#if IS_ENABLED(CONFIG_DRM_TTM_KUNIT_TEST)

total: 0 errors, 0 warnings, 1 checks, 292 lines checked
58d684b7eefe drm/ttm: Move pinned objects off LRU lists when pinning
-:38: ERROR:CODE_INDENT: code indent should use tabs where possible
#38: FILE: drivers/gpu/drm/ttm/ttm_bo.c:598:
+^I        ttm_resource_move_to_lru_tail(bo->resource);$

total: 1 errors, 0 warnings, 0 checks, 21 lines checked


