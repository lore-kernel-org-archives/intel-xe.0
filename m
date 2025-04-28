Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1E9C369D1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 02:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B96D10E31E;
	Mon, 28 Apr 2025 02:28:57 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD14A10E31E;
 Mon, 28 Apr 2025 02:28:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Drop_force=5Fal?=
 =?utf-8?q?loc_from_xe=5Fbo=5Fevict_in_selftests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Apr 2025 02:28:56 -0000
Message-ID: <174580733671.17074.14593622540450463618@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250428022318.877860-1-matthew.brost@intel.com>
In-Reply-To: <20250428022318.877860-1-matthew.brost@intel.com>
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

Series: drm/xe: Drop force_alloc from xe_bo_evict in selftests (rev2)
URL   : https://patchwork.freedesktop.org/series/148326/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a9b8c2548143790d97e2cd3664f27fa7c47ee7cc
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Sun Apr 27 19:23:18 2025 -0700

    drm/xe: Drop force_alloc from xe_bo_evict in selftests
    
    The force_alloc flag was removed from TTM / Xe but updating the
    selftests to new function interfaces was missed. Remove argument from
    xe_bo_evict in selftests.
    
    v2:
     - Fix dma-buf, migrate selftests (CI)
    
    Fixes: 55df7c0c62c1 ("drm/ttm/xe: drop unused force_alloc flag")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Clint Taylor <Clinton.A.Taylor@intel.com>
+ /mt/dim checkpatch f05adacde2faff8e0938d53b42ed318a06229f9c drm-intel
a9b8c2548143 drm/xe: Drop force_alloc from xe_bo_evict in selftests


