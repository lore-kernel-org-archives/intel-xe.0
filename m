Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995D3C48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 16:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC5C10E4ED;
	Tue, 20 Feb 2024 16:25:03 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B12F10E4ED;
 Tue, 20 Feb 2024 16:25:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_helper_macr?=
 =?utf-8?q?o_to_loop_each_dss?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Feb 2024 16:25:02 -0000
Message-ID: <170844630223.125904.8610549909235148425@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240220161937.11714-1-zhanjun.dong@intel.com>
In-Reply-To: <20240220161937.11714-1-zhanjun.dong@intel.com>
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

Series: drm/xe: Add helper macro to loop each dss
URL   : https://patchwork.freedesktop.org/series/130135/
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
commit 1bf9b74295de39e85e7be6856b6eda7ae743a90b
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Tue Feb 20 08:19:37 2024 -0800

    drm/xe: Add helper macro to loop each dss
    
    Add helper macro to loop each dss. This is a precursor patch to allow
    for easier iteration through MCR registers and other per-DSS uses.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch f5141e176ece962a62e4a62df36f32952f85b72d drm-intel
1bf9b74295de drm/xe: Add helper macro to loop each dss
-:97: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dss_' - possible side-effects?
#97: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:39:
+#define for_each_dss_steering(dss_, gt_, group_, instance_) \
+	for (dss_ = xe_gt_topology_get_next_dss(gt_, 0); \
+	     dss_ >= 0; \
+	     dss_ = xe_gt_topology_get_next_dss(gt_, dss_ + 1)) \
+		for_each_if(xe_gt_mcr_get_dss_steering(gt_, dss_, &(group_), &(instance_)))

-:97: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt_' - possible side-effects?
#97: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:39:
+#define for_each_dss_steering(dss_, gt_, group_, instance_) \
+	for (dss_ = xe_gt_topology_get_next_dss(gt_, 0); \
+	     dss_ >= 0; \
+	     dss_ = xe_gt_topology_get_next_dss(gt_, dss_ + 1)) \
+		for_each_if(xe_gt_mcr_get_dss_steering(gt_, dss_, &(group_), &(instance_)))

-:175: WARNING:NEW_TYPEDEFS: do not add new typedefs
#175: FILE: drivers/gpu/drm/xe/xe_gt_types.h:32:
+typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];

-:176: WARNING:NEW_TYPEDEFS: do not add new typedefs
#176: FILE: drivers/gpu/drm/xe/xe_gt_types.h:33:
+typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(XE_MAX_EU_FUSE_BITS)];

total: 0 errors, 2 warnings, 2 checks, 141 lines checked


