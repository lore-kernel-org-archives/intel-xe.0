Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DABC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 21:14:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C07210E40A;
	Mon, 27 Nov 2023 21:14:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id CDC4E10E300;
 Mon, 27 Nov 2023 21:14:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CB080AADE0;
 Mon, 27 Nov 2023 21:14:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Date: Mon, 27 Nov 2023 21:14:03 -0000
Message-ID: <170111964382.3003.13679394650531004014@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231127195856.4183070-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20231127195856.4183070-1-vinay.belgaumkar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Add_a_flag_that_can_disable_GuC_PM_=28rev3=29?=
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

Series: drm/xe: Add a flag that can disable GuC PM (rev3)
URL   : https://patchwork.freedesktop.org/series/126788/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8cff4a47c7b8ecf78b1e2ba7a9d4d7bb9ff86c57
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Mon Nov 27 11:58:56 2023 -0800

    drm/xe: Manually setup C6 when skip_guc_pc is set
    
    Skip the init/start/stop GuC PC functions and toggle C6 using
    register writes instead. Also request max possible frequency
    as dynamic freq management is disabled.
    
    v2: Fix compile warning
    
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 7cd1cacf17749d821ca9966ae5913852943d35e7 drm-intel
210c965d5 drm/xe: Rename xe_gt_idle_sysfs to xe_gt_idle
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
rename from drivers/gpu/drm/xe/xe_gt_idle_sysfs.c

total: 0 errors, 1 warnings, 0 checks, 55 lines checked
a957ca72f drm/xe: Add skip_guc_pc flag
8cff4a47c drm/xe: Manually setup C6 when skip_guc_pc is set


