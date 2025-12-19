Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E133CD711CC
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 01:47:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A130210EC4A;
	Fri, 19 Dec 2025 01:47:18 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6743610EC4A;
 Fri, 19 Dec 2025 01:47:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_SRIOV_scheduler?=
 =?utf-8?q?_groups_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Dec 2025 01:47:17 -0000
Message-ID: <176610883740.104239.13693485371668125567@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251218223846.1146344-14-daniele.ceraolospurio@intel.com>
In-Reply-To: <20251218223846.1146344-14-daniele.ceraolospurio@intel.com>
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

Series: Introduce SRIOV scheduler groups (rev5)
URL   : https://patchwork.freedesktop.org/series/158142/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5f54f403acc61a45ad2b4d68dfd74b336dce1968
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b914cb1dd7c082ac543be2f3f19ef9b18dedecfc
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Thu Dec 18 14:38:58 2025 -0800

    drm/xe/pf: Add debugfs to set EQ and PT for scheduler groups
    
    Debugfs files are added to allow a user to provide a comma-separated list
    of values to assign to each group for each VF.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 93db616df689a410d961e7c614c57e61d17a29a0 drm-intel
c247e3229c5f drm/xe/gt: Add engine masks for each class
72e9f3c252ed drm/gt/guc: extract scheduler-related defines from guc_fwif.h
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 146 lines checked
5ae05e745a75 drm/xe/pf: Initialize scheduler groups
5d34bed722f8 drm/xe/pf: Add support for enabling scheduler groups
f2b1e793073c drm/xe/pf: Scheduler groups are incompatible with multi-lrc
4768b720b3ec drm/xe/vf: Check if scheduler groups are enabled
c16d40fabe24 drm/xe/pf: Add debugfs to enable scheduler groups
cd75b3a9524b drm/xe/pf: Add debugfs with scheduler groups information
4756f35368a8 drm/xe/pf: Prep for multiple exec quantums and preemption timeouts
2316a74c0a1f drm/xe/pf: Add functions to set exec quantums for each group
76c0854ad6bb drm/xe/pf: Add functions to set preempt timeouts for each group
b914cb1dd7c0 drm/xe/pf: Add debugfs to set EQ and PT for scheduler groups
-:72: WARNING:LINE_SPACING: Missing a blank line after declarations
#72: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:303:
+	u32 values[GUC_MAX_SCHED_GROUPS];
+	int *input __free(kfree) = NULL;

total: 0 errors, 1 warnings, 0 checks, 139 lines checked


