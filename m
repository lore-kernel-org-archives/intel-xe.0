Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21079C10F13
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 05:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C073710E319;
	Fri, 15 Dec 2023 05:11:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A8A1C10E314;
 Fri, 15 Dec 2023 05:11:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A4F6EAADED;
 Fri, 15 Dec 2023 05:11:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_wait_for_co?=
 =?utf-8?q?mpletion_after_gt_force_reset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Date: Fri, 15 Dec 2023 05:11:16 -0000
Message-ID: <170261707667.27834.5722093811029685260@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231215051541.2536859-1-karthik.poosa@intel.com>
In-Reply-To: <20231215051541.2536859-1-karthik.poosa@intel.com>
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

Series: drm/xe: Add wait for completion after gt force reset
URL   : https://patchwork.freedesktop.org/series/127855/
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
commit 5a55b5e7c7136ef74216c727d4c341ab4dc9a523
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Fri Dec 15 10:45:41 2023 +0530

    drm/xe: Add wait for completion after gt force reset
    
    Wait for gt reset to complete before returning from force_reset
    sysfs call. Without this igt test freq_reset_multiple fails
    sporadically in case xe_guc_pc is not started.
    
    Testcase: igt@xe_guc_pc@freq_reset_multiple
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
+ /mt/dim checkpatch 6154a8abd3c0766b93740feb7e0268ae3f425849 drm-intel
5a55b5e7c drm/xe: Add wait for completion after gt force reset
-:42: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#42: FILE: drivers/gpu/drm/xe/xe_gt_debugfs.c:26:
+#define XE_GT_RESET_TIMEOUT_MS	(msecs_to_jiffies(5*1000))
                               	                   ^

total: 0 errors, 0 warnings, 1 checks, 49 lines checked


