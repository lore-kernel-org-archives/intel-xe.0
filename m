Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F05EC54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 16:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EBC10F746;
	Thu, 14 Mar 2024 16:06:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1BD10F746;
 Thu, 14 Mar 2024 16:06:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_helper_macr?=
 =?utf-8?q?o_to_loop_each_DSS?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Mar 2024 16:06:57 -0000
Message-ID: <171043241783.754222.3720036344596581008@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240314160026.232786-1-zhanjun.dong@intel.com>
In-Reply-To: <20240314160026.232786-1-zhanjun.dong@intel.com>
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

Series: drm/xe: Add helper macro to loop each DSS
URL   : https://patchwork.freedesktop.org/series/131144/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 091118713bd7ee4e546a6deaf0598c2669966ef8
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Thu Mar 14 09:00:26 2024 -0700

    drm/xe: Add helper macro to loop each DSS
    
    Add helper macro to loop each DSS. This is a precursor patch to allow
    for easier iteration through MCR registers and other per-DSS uses.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch 6ef6a88b113169e4637be283b2514cfed22f8d99 drm-intel
091118713bd7 drm/xe: Add helper macro to loop each DSS
-:88: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt' - possible side-effects?
#88: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:36:
+#define for_each_dss(dss, gt) \
+	for_each_or_bit((dss), \
+			(gt)->fuse_topo.g_dss_mask, \
+			(gt)->fuse_topo.c_dss_mask, \
+			XE_MAX_DSS_FUSE_BITS)

-:102: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#102: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:50:
+#define for_each_dss_steering(dss, gt, group, instance) \
+	for_each_dss((dss), (gt)) \
+		for_each_if((xe_gt_mcr_get_dss_steering((gt), (dss), &(group), &(instance)), true))

-:102: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dss' - possible side-effects?
#102: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:50:
+#define for_each_dss_steering(dss, gt, group, instance) \
+	for_each_dss((dss), (gt)) \
+		for_each_if((xe_gt_mcr_get_dss_steering((gt), (dss), &(group), &(instance)), true))

-:102: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt' - possible side-effects?
#102: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:50:
+#define for_each_dss_steering(dss, gt, group, instance) \
+	for_each_dss((dss), (gt)) \
+		for_each_if((xe_gt_mcr_get_dss_steering((gt), (dss), &(group), &(instance)), true))

-:135: WARNING:NEW_TYPEDEFS: do not add new typedefs
#135: FILE: drivers/gpu/drm/xe/xe_gt_types.h:32:
+typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];

-:136: WARNING:NEW_TYPEDEFS: do not add new typedefs
#136: FILE: drivers/gpu/drm/xe/xe_gt_types.h:33:
+typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(XE_MAX_EU_FUSE_BITS)];

total: 1 errors, 2 warnings, 3 checks, 107 lines checked


