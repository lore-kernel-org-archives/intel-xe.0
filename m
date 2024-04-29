Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E33C04FFE
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 20:50:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FDF10F214;
	Mon, 29 Apr 2024 20:50:52 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC74010F214;
 Mon, 29 Apr 2024 20:50:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Remove_uninitia?=
 =?utf-8?q?lized_end_var_from_xe=5Fgt=5Ftlb=5Finvalidation=5Frange=28=29_=28?=
 =?utf-8?q?rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Apr 2024 20:50:50 -0000
Message-ID: <171442385070.1757642.12408933989412438797@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240429203039.26918-1-nirmoy.das@intel.com>
In-Reply-To: <20240429203039.26918-1-nirmoy.das@intel.com>
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

Series: drm/xe: Remove uninitialized end var from xe_gt_tlb_invalidation_range() (rev2)
URL   : https://patchwork.freedesktop.org/series/133029/
State : warning

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
commit f7aa43feafe00586203b96fac4745269f4a3cba7
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Mon Apr 29 22:30:39 2024 +0200

    drm/xe: Remove uninitialized end var from xe_gt_tlb_invalidation_range()
    
    This fixes commit c4f18703629d ("drm/xe: Add
    xe_gt_tlb_invalidation_range and convert PT layer to use this")
    which added the end variable as part of the function param.
    
    v2: Add fixes tag(Matt)
    
    Fixes: c4f18703629d ("drm/xe: Add xe_gt_tlb_invalidation_range and
    convert PT layer to use this")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 4f88a4cc3d4cba837cf1f8040f0140583f204225 drm-intel
f7aa43feafe0 drm/xe: Remove uninitialized end var from xe_gt_tlb_invalidation_range()
-:13: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: f7aa43feafe0 ("drm/xe: Remove uninitialized end var from xe_gt_tlb_invalidation_range()")'
#13: 
Fixes: c4f18703629d ("drm/xe: Add xe_gt_tlb_invalidation_range and

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


