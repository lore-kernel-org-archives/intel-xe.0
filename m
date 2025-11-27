Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859C6D116E4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 01:51:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAA510E720;
	Thu, 27 Nov 2025 01:51:24 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3216D10E720;
 Thu, 27 Nov 2025 01:51:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_SRIOV_scheduler?=
 =?utf-8?q?_groups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Nov 2025 01:51:23 -0000
Message-ID: <176420828319.32692.11320854318244806653@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
In-Reply-To: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
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

Series: Introduce SRIOV scheduler groups
URL   : https://patchwork.freedesktop.org/series/158142/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2bb13ada5c50ec8d38cac36e924be8ad094bfcde
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Nov 26 17:45:16 2025 -0800

    drm/xe/sriov: Add debugfs to set EQ and PT for scheduler groups
    
    A top-level debugfs file is added that allows a user to provide a
    comma-separated list of values to assign to each group. Per-group files
    are also added to allow individual tuning of a specific group.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch e7a767430515c3a6e8aee91c2a68cba8b06fe884 drm-intel
8fb1e02b22ed drm/xe/gt: Add engine masks for each class
8cc190c04502 drm/xe/sriov: Initialize scheduler groups
-:191: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'm == XE_SRIOV_SCHED_GROUPS_NONE'
#191: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c:466:
+		if ((m == XE_SRIOV_SCHED_GROUPS_NONE) || num_masks)

total: 0 errors, 0 warnings, 1 checks, 212 lines checked
8091054e06ab drm/xe/sriov: Add support for enabling scheduler groups
7fcee66f6e1b drm/xe/sriov: Scheduler groups are incompatible with multi-lrc
-:153: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'mode != XE_SRIOV_SCHED_GROUPS_NONE'
#153: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c:571:
+	if ((mode != XE_SRIOV_SCHED_GROUPS_NONE) && guc_has_mlrc_queue(&gt->uc.guc)) {

total: 0 errors, 0 warnings, 1 checks, 247 lines checked
0a109d3dc8af drm/xe/sriov: Add debugfs to enable scheduler groups
40f867c26023 drm/xe/sriov: Add debugfs with scheduler groups information
88c911962de3 drm/xe/sriov: Prep for multiple exec quantums and preemption timeouts
dc6140ec4d5d drm/xe/sriov: Add functions to set exec quantums for each group
e26bb478a62e drm/xe/sriov: Add functions to set preempt timeouts for each group
2bb13ada5c50 drm/xe/sriov: Add debugfs to set EQ and PT for scheduler groups


