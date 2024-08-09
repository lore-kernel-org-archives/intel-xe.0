Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51369C52D7D
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 23:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0392810EA27;
	Fri,  9 Aug 2024 23:08:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DF410EA27;
 Fri,  9 Aug 2024 23:08:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Use_user-defined_workqueu?=
 =?utf-8?q?e_lockdep_map_for_drm_sched_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Aug 2024 23:08:04 -0000
Message-ID: <172324488481.558655.15654762816530579633@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240809222827.3211998-1-matthew.brost@intel.com>
In-Reply-To: <20240809222827.3211998-1-matthew.brost@intel.com>
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

Series: Use user-defined workqueue lockdep map for drm sched (rev3)
URL   : https://patchwork.freedesktop.org/series/136701/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
dc547930fbb1350eaf6bde84653b9ac973a411db
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a259e3d151f2bc3f4a8568aa3ceea5906382e14e
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Aug 9 15:28:27 2024 -0700

    drm/xe: Drop GuC submit_wq pool
    
    Now that drm sched uses a single lockdep map for all submit_wq, drop the
    GuC submit_wq pool hack.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 2ff5a7c32f9dca872aa50bc52dbb2bde6001c808 drm-intel
239beae2667b workqueue: Split alloc_workqueue into internal function and lockdep init
ed4e2afaacc2 workqueue: Change workqueue lockdep map to pointer
ca918d8818fa workqueue: Add interface for user-defined workqueue lockdep map
7bb2785df954 drm/sched: Use drm sched lockdep map for submit_wq
a259e3d151f2 drm/xe: Drop GuC submit_wq pool


