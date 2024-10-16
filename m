Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FD3D2A520
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 15:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2798010E735;
	Wed, 16 Oct 2024 15:11:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073C910E730;
 Wed, 16 Oct 2024 15:11:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_caller_info?=
 =?utf-8?q?_to_xe=5Fgt=5Freset=5Fasync_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Oct 2024 15:11:07 -0000
Message-ID: <172909146702.1274561.9670123058762768575@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241016141717.881143-1-nirmoy.das@intel.com>
In-Reply-To: <20241016141717.881143-1-nirmoy.das@intel.com>
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

Series: drm/xe: Add caller info to xe_gt_reset_async (rev2)
URL   : https://patchwork.freedesktop.org/series/140065/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c51ef81797d79d31923a567e1e113914a551bd44
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Wed Oct 16 16:17:17 2024 +0200

    drm/xe: Add caller info to xe_gt_reset_async
    
    Add caller info to the xe_gt_reset_async() to help debug issues.
    
    v2: s/%pS/%ps(Matt)
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2874
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch f8c32f7bb8415efe24e19f58ff0be2e126eb08a8 drm-intel
c51ef81797d7 drm/xe: Add caller info to xe_gt_reset_async


