Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ACDD3C935
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 17:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9E810E114;
	Mon, 21 Oct 2024 17:39:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C4E10E572;
 Mon, 21 Oct 2024 17:39:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Take_ref_to_job?=
 =?utf-8?q?=27s_fence_in_arm?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 17:39:49 -0000
Message-ID: <172953238949.1306161.4604265447328838101@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021173512.1584248-1-matthew.brost@intel.com>
In-Reply-To: <20241021173512.1584248-1-matthew.brost@intel.com>
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

Series: drm/xe: Take ref to job's fence in arm
URL   : https://patchwork.freedesktop.org/series/140265/
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
commit 5652c6a46e0bcec23dd3e7c329520ad82fdccceb
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Oct 21 10:35:12 2024 -0700

    drm/xe: Take ref to job's fence in arm
    
    Take ref to job's fence in arm rather than run job. This ref is owned by
    the drm scheduler so it makes sense to take the ref before handing over
    the job to the scheduler. Also removes an atomic from the run job path.
    
    Suggested-by: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 186d247adb08a2570041d6ecee8e0faa02141495 drm-intel
5652c6a46e0b drm/xe: Take ref to job's fence in arm


