Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F752C47DB3
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 21:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DC310F6C3;
	Wed, 31 Jan 2024 21:51:30 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BC010F6C3;
 Wed, 31 Jan 2024 21:51:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_helper_macr?=
 =?utf-8?q?o_to_loop_each_dss?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Date: Wed, 31 Jan 2024 21:51:29 -0000
Message-ID: <170673788926.878359.16274405273806541937@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240131214811.309263-1-zhanjun.dong@intel.com>
In-Reply-To: <20240131214811.309263-1-zhanjun.dong@intel.com>
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

Series: drm/xe: Add helper macro to loop each dss
URL   : https://patchwork.freedesktop.org/series/129391/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b0eaf7f860a8e8bfeb9df4b9cbcf4f2db266a6f1
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Wed Jan 31 13:48:11 2024 -0800

    drm/xe: Add helper macro to loop each dss
    
    Add helper macro to loop each dss. This is a precursor patch to allow
    for easier iteration through MCR registers and other per-DSS uses.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch 8327dc2a5a26f82a8700035c6259f57e9299d6a2 drm-intel
b0eaf7f86 drm/xe: Add helper macro to loop each dss
-:84: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dss_' - possible side-effects?
#84: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:37:
+#define for_each_dss_steering(dss_, gt_, group_, instance_) \
+	for (dss_ = xe_gt_topology_get_next_dss(gt, 0); \
+	     dss_ >= 0; \
+	     dss_ = xe_gt_topology_get_next_dss(gt, dss_ + 1)) \
+		for_each_if(xe_gt_mcr_get_dss_steering(gt_, dss_, &(group_), &(instance_)))

total: 0 errors, 0 warnings, 1 checks, 110 lines checked


