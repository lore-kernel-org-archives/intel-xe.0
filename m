Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6901BD0EE30
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 19:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2302F10EBAC;
	Fri, 11 Oct 2024 19:55:00 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBC010EBA8;
 Fri, 11 Oct 2024 19:54:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/ufence=3A_ufence_c?=
 =?utf-8?q?an_be_signaled_right_after_wait=5Fwoken_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Oct 2024 19:54:58 -0000
Message-ID: <172867649870.1241934.9778819279305117812@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241011151029.4160630-1-nirmoy.das@intel.com>
In-Reply-To: <20241011151029.4160630-1-nirmoy.das@intel.com>
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

Series: drm/xe/ufence: ufence can be signaled right after wait_woken (rev2)
URL   : https://patchwork.freedesktop.org/series/139897/
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
commit d8d6e63796b3855f7ce7b7df726f0082f44f5ab3
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Fri Oct 11 17:10:29 2024 +0200

    drm/xe/ufence: ufence can be signaled right after wait_woken
    
    do_comapre() can return success after a timedout wait_woken() which was
    treated as -ETIME. The loop calling wait_woken() sets correct err so
    there is no need to re-evaluate err.
    
    v2: Remove entire check that reevaluate err at the end(Matt)
    
    Fixes: e670f0b4ef24 ("drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl")
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
    Cc: <stable@vger.kernel.org> # v6.8+
    Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 04bb73440015e221297eed8aa260e6e75442b4e6 drm-intel
d8d6e63796b3 drm/xe/ufence: ufence can be signaled right after wait_woken


