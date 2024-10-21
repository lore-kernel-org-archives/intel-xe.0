Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1041D17122
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 18:21:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D7C10E576;
	Mon, 21 Oct 2024 18:21:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DA410E576;
 Mon, 21 Oct 2024 18:21:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Mark_work_queues_with_WQ?=
 =?utf-8?q?=5FMEM=5FRECLAIM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 18:21:45 -0000
Message-ID: <172953490553.1306161.13873630026778037063@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021175705.1584521-1-matthew.brost@intel.com>
In-Reply-To: <20241021175705.1584521-1-matthew.brost@intel.com>
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

Series: Mark work queues with WQ_MEM_RECLAIM
URL   : https://patchwork.freedesktop.org/series/140267/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ git -C mt rev-list -n1 origin/master
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5ffbdb2433f6f470daf0035d4986c00e9a43eba4
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Oct 21 10:57:05 2024 -0700

    drm/xe: Mark GT work queue with WQ_MEM_RECLAIM
    
    GT ordered work queue can be used to free memory via resets and fence
    signaling thus we should allow this work queue to run during reclaim.
    Mark with GT ordered work queue with WQ_MEM_RECLAIM appropriately.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch aa0898115bcff3eda6d021cc66eb8a1c3b264c56 drm-intel
0762a49c17d9 drm/sched: Mark scheduler work queues with WQ_MEM_RECLAIM
06b15c58a006 drm/xe: Mark GGTT work queue with WQ_MEM_RECLAIM
742b11806809 drm/xe: Mark G2H work queue with WQ_MEM_RECLAIM
5ffbdb2433f6 drm/xe: Mark GT work queue with WQ_MEM_RECLAIM


