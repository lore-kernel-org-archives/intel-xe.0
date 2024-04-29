Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E978EC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 15:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A31910E0FB;
	Mon, 29 Apr 2024 15:48:39 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6A410E0FB;
 Mon, 29 Apr 2024 15:48:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Remove_uninitia?=
 =?utf-8?q?lized_end_var_from_xe=5Fgt=5Ftlb=5Finvalidation=5Frange=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Apr 2024 15:48:38 -0000
Message-ID: <171440571825.1756580.8982278911828895298@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240429152821.27490-1-nirmoy.das@intel.com>
In-Reply-To: <20240429152821.27490-1-nirmoy.das@intel.com>
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

Series: drm/xe: Remove uninitialized end var from xe_gt_tlb_invalidation_range()
URL   : https://patchwork.freedesktop.org/series/133029/
State : success

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
commit dd7857da11b68e9aef91c8e3baafe46439fa952b
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Mon Apr 29 17:28:21 2024 +0200

    drm/xe: Remove uninitialized end var from xe_gt_tlb_invalidation_range()
    
    This fixes commit c4f18703629d ("drm/xe: Add
    xe_gt_tlb_invalidation_range and convert PT layer to use this")
    which added the end variable as part of the function param.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch acf512bb5ff4d2e8ed5ef67444b6c1f92a222d77 drm-intel
dd7857da11b6 drm/xe: Remove uninitialized end var from xe_gt_tlb_invalidation_range()


