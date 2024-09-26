Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F2ACCFA15
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 03:51:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A80C10E124;
	Thu, 26 Sep 2024 03:51:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB17B10E124;
 Thu, 26 Sep 2024 03:51:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Take_ref_to_job?=
 =?utf-8?q?_and_job=27s_fence_in_xe=5Fsched=5Fjob=5Farm_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 03:51:27 -0000
Message-ID: <172732268782.1103965.9340513635236205216@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240924184541.2992459-1-matthew.brost@intel.com>
In-Reply-To: <20240924184541.2992459-1-matthew.brost@intel.com>
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

Series: drm/xe: Take ref to job and job's fence in xe_sched_job_arm (rev2)
URL   : https://patchwork.freedesktop.org/series/138939/
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
commit 5e3ae1af765850079897dbd3c850532ecdb5af70
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Sep 24 11:45:41 2024 -0700

    drm/xe: Take ref to job and job's fence in xe_sched_job_arm
    
    Fixes two possible races:
    
    - Submission to hardware signals job's fence before dma_fence_get at end
      of run_job
    - TDR fires and signals fence + free job before run_job completes
    
    Taking refs in xe_sched_job_arm to job and job's fence solves these by
    ensure all refs collected before entering the DRM scheduler. The refs
    are dropped in run_job and DRM scheduler respectfully. Safe as once
    xe_sched_job_arm is called execution of job through DRM sched is
    guaranteed.
    
    v2:
     - Take job ref on resubmit (Matt Auld)
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2811
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
+ /mt/dim checkpatch 88d592f72f7bc508d6a027b1f96aa2e53f803e1b drm-intel
5e3ae1af7658 drm/xe: Take ref to job and job's fence in xe_sched_job_arm


