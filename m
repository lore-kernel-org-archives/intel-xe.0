Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE426C5478C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 04:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE57810EA59;
	Fri,  1 Mar 2024 04:00:05 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400ED10EA87;
 Fri,  1 Mar 2024 04:00:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_xe=5Fsync_and_ufence_rewo?=
 =?utf-8?q?rk_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Mar 2024 04:00:04 -0000
Message-ID: <170926560426.414517.16045904052680367570@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240301035522.238307-1-matthew.brost@intel.com>
In-Reply-To: <20240301035522.238307-1-matthew.brost@intel.com>
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

Series: xe_sync and ufence rework (rev2)
URL   : https://patchwork.freedesktop.org/series/130418/
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
commit 4cdaeb94334e0e521f536b4c46e40843003a8e8f
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Feb 29 19:55:22 2024 -0800

    drm/xe: Get page on user fence creation
    
    Attempt to get page on user fence creation and kmap_local_page on
    signaling. Should reduce latency and can ensure 64 bit atomicity
    compared to copy_to_user.
    
    v2:
     - Prefault page and drop ref (Thomas)
     - Use set_page_dirty_lock (Thomas)
     - try_cmpxchg64 loop (Thomas)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch c1763f7b4fa52f922a0b507246013779acc58611 drm-intel
1b7abd29e309 drm/xe: Remove used xe_sync_entry_wait
44f528cc3e4e drm/xe: Validate user fence during creation
4cdaeb94334e drm/xe: Get page on user fence creation


