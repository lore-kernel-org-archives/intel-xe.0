Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037F6D64072
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 17:48:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46F110E273;
	Fri,  8 Nov 2024 17:48:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C6E10E273;
 Fri,  8 Nov 2024 17:48:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Devcoredump_Improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Nov 2024 17:48:01 -0000
Message-ID: <173108808106.1428661.4153815581749357251@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241108174312.272792-1-matthew.brost@intel.com>
In-Reply-To: <20241108174312.272792-1-matthew.brost@intel.com>
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

Series: Devcoredump Improvements
URL   : https://patchwork.freedesktop.org/series/141110/
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
commit 101d44d551a5cdd6f2fb88dbfb5411916b1406d1
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Nov 8 09:43:12 2024 -0800

    drm/xe: Wire devcoredump to LR TDR
    
    LR queue's can hang, cause engine reset, or cause IOMMU CAT errors.
    Collect an error capture when this occurs.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 5521311ecd7ffbb0adf016dbf83bd0165fc94d25 drm-intel
6729fc602f92 drm/xe: Add xe_lrc_is_idle() helper
04b12c2f3fd3 drm/xe: Add ring address to LRC snapshot
7cc2e0951b0f drm/xe: Add ring start to LRC snapshot
3bc3bf3b68ba drm/xe: Improve schedule disable response failure
87b6f9564947 drm/xe: Add exec queue param to devcoredump
b0d7a0a519b1 drm/xe: Change xe_engine_snapshot_capture_for_job to be for_queue
101d44d551a5 drm/xe: Wire devcoredump to LR TDR


