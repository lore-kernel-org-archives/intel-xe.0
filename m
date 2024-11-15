Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B13D68BCD
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 16:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D901B10E042;
	Fri, 15 Nov 2024 16:41:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8E810E035;
 Fri, 15 Nov 2024 16:41:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hw=5Fengine=5Fgrou?=
 =?utf-8?q?p=3A_Fix_bad_free_in_xe=5Fhw=5Fengine=5Fsetup=5Fgroups=28=29_=28r?=
 =?utf-8?q?ev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Su Hui" <suhui@nfschina.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 Nov 2024 16:41:08 -0000
Message-ID: <173168886843.283831.16617762018324952701@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241115024941.3737042-1-suhui@nfschina.com>
In-Reply-To: <20241115024941.3737042-1-suhui@nfschina.com>
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

Series: drm/xe/hw_engine_group: Fix bad free in xe_hw_engine_setup_groups() (rev2)
URL   : https://patchwork.freedesktop.org/series/141417/
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
commit de8576e81ff9e268bb5e14efa57222a23401a102
Author: Su Hui <suhui@nfschina.com>
Date:   Fri Nov 15 10:49:42 2024 +0800

    drm/xe/hw_engine_group: Fix bad free in xe_hw_engine_setup_groups()
    
    Clang static checker(scan-build) warning：
    drivers/gpu/drm/xe/xe_hw_engine_group.c: line 134, column 2
    Argument to kfree() is a constant address (18446744073709551604), which
    is not memory allocated by malloc().
    
    kfree() can only handle NULL pointers instead of negitave error codes.
    When hw_engine_group_alloc() failed, there is a bad kfree call for
    negitave error codes in xe_hw_engine_setup_groups().
    
    Free 'group' when alloc_workqueue() failed in hw_engine_group_alloc(), and
    remove wrong kfree() in xe_hw_engine_setup_groups() to fix this problem.
    It's safe to remove these kfree() because drmm_add_action_or_reset()
    can free these by calling hw_engine_group_free().
    
    Fixes: d16ef1a18e39 ("drm/xe/exec: Switch hw engine group execution mode upon job submission")
    Fixes: f784750c670f ("drm/xe/hw_engine_group: Introduce xe_hw_engine_group")
    Signed-off-by: Su Hui <suhui@nfschina.com>
+ /mt/dim checkpatch c43ac257e8f2dfe3a5f56d3565472cb8051ca32d drm-intel
de8576e81ff9 drm/xe/hw_engine_group: Fix bad free in xe_hw_engine_setup_groups()


