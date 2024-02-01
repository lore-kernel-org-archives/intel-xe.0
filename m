Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E42BC47258
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 00:49:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05D010FDFF;
	Thu,  1 Feb 2024 00:49:47 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B872C10FDFF;
 Thu,  1 Feb 2024 00:49:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_helper_macr?=
 =?utf-8?q?o_to_loop_each_dss_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Date: Thu, 01 Feb 2024 00:49:46 -0000
Message-ID: <170674858676.878359.4371892174348732711@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240201001417.354270-1-zhanjun.dong@intel.com>
In-Reply-To: <20240201001417.354270-1-zhanjun.dong@intel.com>
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

Series: drm/xe: Add helper macro to loop each dss (rev2)
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
commit 79bd578e25cf637b14ced29c42efae57b7f1ded4
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Wed Jan 31 16:14:17 2024 -0800

    drm/xe: Add helper macro to loop each dss
    
    Add helper macro to loop each dss. This is a precursor patch to allow
    for easier iteration through MCR registers and other per-DSS uses.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch cba66c6a2af4df1b9b420fbad0a9ac1e68f14030 drm-intel
79bd578e2 drm/xe: Add helper macro to loop each dss
-:88: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dss_' - possible side-effects?
#88: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:36:
+#define for_each_dss_steering(dss_, gt_, group_, instance_) \
+	for (dss_ = xe_gt_topology_get_next_dss(gt, 0); \
+	     dss_ >= 0; \
+	     dss_ = xe_gt_topology_get_next_dss(gt, dss_ + 1)) \
+		for_each_if(xe_gt_mcr_get_dss_steering(gt_, dss_, &(group_), &(instance_)))

total: 0 errors, 0 warnings, 1 checks, 124 lines checked


