Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2C1CCF9EF
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 20:15:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6B810E879;
	Wed, 25 Sep 2024 20:15:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C8C10E879;
 Wed, 25 Sep 2024 20:15:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_fix_UAF_around_?=
 =?utf-8?q?queue_destruction_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Sep 2024 20:15:42 -0000
Message-ID: <172729534295.1102817.3306723221548660124@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240923145647.77707-2-matthew.auld@intel.com>
In-Reply-To: <20240923145647.77707-2-matthew.auld@intel.com>
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

Series: drm/xe: fix UAF around queue destruction (rev2)
URL   : https://patchwork.freedesktop.org/series/138931/
State : warning

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
commit f83c5b4d20f1d57fcfe70244353a7f213de2ddf6
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Sep 23 15:56:48 2024 +0100

    drm/xe: fix UAF around queue destruction
    
    We currently do stuff like queuing the final destruction step on a
    random system wq, which will outlive the driver instance. With bad
    timing we can teardown the driver with one or more work workqueue still
    being alive leading to various UAF splats. Add a fini step to ensure
    user queues are properly torn down. At this point GuC should already be
    nuked so queue itself should no longer be referenced from hw pov.
    
    v2 (Matt B)
     - Looks much safer to use a waitqueue and then just wait for the
       xa_array to become empty before triggering the drain.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2317
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 88d592f72f7bc508d6a027b1f96aa2e53f803e1b drm-intel
f83c5b4d20f1 drm/xe: fix UAF around queue destruction
-:77: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#77: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:285:
+	ret = wait_event_timeout(

total: 0 errors, 0 warnings, 1 checks, 96 lines checked


