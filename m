Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3CFCF854A
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 00:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87C210E07D;
	Thu,  3 Oct 2024 00:34:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF8D10E07D;
 Thu,  3 Oct 2024 00:34:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_TDR_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Oct 2024 00:34:00 -0000
Message-ID: <172791564058.1165801.2736844196572017978@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241003001657.3517883-1-matthew.brost@intel.com>
In-Reply-To: <20241003001657.3517883-1-matthew.brost@intel.com>
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

Series: TDR fixes
URL   : https://patchwork.freedesktop.org/series/139456/
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
commit 43744cc75a4550baae3af75b744dcb8d776273b6
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Oct 2 17:16:57 2024 -0700

    drm/xe: Don't free job in TDR
    
    Freeing job in TDR is not safe as TDR can pass the run_job thread
    resulting in UAF. It is only safe for free job to naturally be called by
    the scheduler. Rather free job in TDR, add to pending list.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2811
    Cc: Matthew Auld <matthew.auld@intel.com>
    Fixes: e275d61c5f3f ("drm/xe/guc: Handle timing out of signaled jobs gracefully")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 789d5631453c3edad1988cd47db1643555e52ac9 drm-intel
4afb5a968752 drm/xe: Take job list lock in xe_sched_add_pending_job
43744cc75a45 drm/xe: Don't free job in TDR


