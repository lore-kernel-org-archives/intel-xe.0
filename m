Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E98ECF6D28
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 14:31:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BE110E753;
	Wed,  2 Oct 2024 14:31:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DA910E753;
 Wed,  2 Oct 2024 14:31:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Use_user-defined_workqueu?=
 =?utf-8?q?e_lockdep_map_for_drm_sched?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Oct 2024 14:31:03 -0000
Message-ID: <172787946327.1163775.6318240051978621479@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241002131639.3425022-1-matthew.brost@intel.com>
In-Reply-To: <20241002131639.3425022-1-matthew.brost@intel.com>
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

Series: Use user-defined workqueue lockdep map for drm sched
URL   : https://patchwork.freedesktop.org/series/139429/
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
+ /mt/dim checkpatch 55a90a928d9752b8a21298cb525b95de4b78f4ed drm-intel
commit 608a9e74fab6d0596dd8f04cddd5e882eb57f01e
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Oct 2 06:16:39 2024 -0700

    drm/xe: Drop GuC submit_wq pool
    
    Now that drm sched uses a single lockdep map for all submit_wq, drop the
    GuC submit_wq pool hack.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
1da30f8780e2 drm/sched: Use drm sched lockdep map for submit_wq
608a9e74fab6 drm/xe: Drop GuC submit_wq pool


