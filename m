Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE07C61D97
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 09:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B83B10E7C5;
	Fri, 24 Nov 2023 09:04:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2DBBB10E7C5;
 Fri, 24 Nov 2023 09:04:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 29294A03D2;
 Fri, 24 Nov 2023 09:04:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 24 Nov 2023 09:04:49 -0000
Message-ID: <170081668916.13022.7053228510130601235@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231123153158.12779-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231123153158.12779-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Assorted_memory-management_fixes_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Assorted memory-management fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/126753/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 016715465e52d22f99386dff8949a1449644c310
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Nov 23 16:31:58 2023 +0100

    drm/xe/vm: Fix ASID XA usage
    
    xa_alloc_cyclic() returns 1 on successful allocation, if wrapping occurs,
    but the code incorrectly treats that as an error. Fix that.
    Also, xa_alloc_cyclic() requires xa_init_flags(..., XA_FLAGS_ALLOC), so
    fix that, and assuming we don't want a zero ASID, instead of using
    XA_FLAGS_ALLOC1, adjust the xa limits at alloc_cyclic time.
    
    v2:
    - On CONFIG_DRM_XE_DEBUG, Initialize the cyclic ASID allocation in such a
      way that the next allocated ASID will be the maximum one, and the one
      following will cause an ASID wrap, (all to have CI test high ASIDs
      and ASID wraps).
    
    Suggested-by: Ohad Sharabi <osharabi@habana.ai>
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/946
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 1832821c7e4c5bd24353183f060f1435b2eb7992 drm-intel
92999c6d9 drm/xe: Ensure that we don't access the placements array out-of-bounds
563f3cdc4 drm/xe/bo: Rename xe_bo_get_sg() to xe_bo_sg()
4e4145e07 drm/xe/bo: Remove leftover trace_printk()
016715465 drm/xe/vm: Fix ASID XA usage


