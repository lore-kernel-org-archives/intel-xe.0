Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AF4C4706F
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 07:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CAB10E3BD;
	Thu,  4 Jan 2024 07:58:23 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3E610E3BD;
 Thu,  4 Jan 2024 07:58:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/debugfs=3A_Make_sy?=
 =?utf-8?q?sfs_gt_force_reset_synchronous_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
Date: Thu, 04 Jan 2024 07:58:23 -0000
Message-ID: <170435510304.1841.13750952434016293405@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231227115820.4104261-1-karthik.poosa@intel.com>
In-Reply-To: <20231227115820.4104261-1-karthik.poosa@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/debugfs: Make sysfs gt force reset synchronous (rev2)
URL   : https://patchwork.freedesktop.org/series/128033/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c09fe6e720f5c7d541d974c7b95c127d0ae964e3
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Wed Dec 27 17:28:20 2023 +0530

    drm/xe/debugfs: Make sysfs gt force reset synchronous
    
    Wait for gt reset to complete before returning from force_reset
    sysfs call. Without this igt test freq_reset_multiple fails
    sporadically in case xe_guc_pc is not started.
    
    v2:
    - Changed wait for completion to interruptible (Anshuman).
    - Moved timeout to xe_gt.h (Anshuman).
    - Created a debugfs for updating timeout (Rodrigo).
    - Moved completion and timeout under gt->reset struct (Badal).
    
    Testcase: igt@xe_guc_pc@freq_reset_multiple
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
c09fe6e72 drm/xe/debugfs: Make sysfs gt force reset synchronous
-:52: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#52: FILE: drivers/gpu/drm/xe/xe_gt_debugfs.c:66:
+	ret = wait_for_completion_interruptible_timeout(&gt->reset.done,
+						msecs_to_jiffies(gt->reset.timeout_ms));

-:67: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#67: FILE: drivers/gpu/drm/xe/xe_gt_debugfs.c:259:
+	debugfs_create_u32("gt_reset_timeout_ms", 0600, root,
+					&gt->reset.timeout_ms);

total: 0 errors, 0 warnings, 2 checks, 56 lines checked


