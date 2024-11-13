Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46458D637A4
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 18:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED1810E264;
	Wed, 13 Nov 2024 18:17:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A5610E25E;
 Wed, 13 Nov 2024 18:17:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Devcoredump_Improvements_?=
 =?utf-8?q?=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 18:17:00 -0000
Message-ID: <173152182026.3666420.18041417965873522979@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112220127.1369527-1-matthew.brost@intel.com>
In-Reply-To: <20241112220127.1369527-1-matthew.brost@intel.com>
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

Series: Devcoredump Improvements (rev5)
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
commit 91b1a49d16fb9f13258dab4e4febf271a3a45b79
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Nov 12 14:01:27 2024 -0800

    drm/xe: Wire devcoredump to LR TDR
    
    LR queues can hang, cause engine reset, or cause IOMMU CAT errors.
    Collect an error capture when this occurs.
    
    v2:
     - s/queue's/queues (Jonathan)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 169c7cd31a373ed31054abb423981856eb5fb119 drm-intel
d0e10bbe3149 drm/xe: Add xe_ring_lrc_is_idle() helper
22928be88580 drm/xe: Add ring address to LRC snapshot
83be46039c7e drm/xe: Add ring start to LRC snapshot
2553b7a870c3 drm/xe: Improve schedule disable response failure
dc207d71c398 drm/xe: Add exec queue param to devcoredump
1fbee02815ab drm/xe: Change xe_engine_snapshot_capture_for_job to be for queue
91b1a49d16fb drm/xe: Wire devcoredump to LR TDR


