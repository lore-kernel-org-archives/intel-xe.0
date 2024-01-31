Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3195C47DDB
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 01:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB9B1137E2;
	Wed, 31 Jan 2024 01:10:04 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F591137E0;
 Wed, 31 Jan 2024 01:10:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Expose_number_o?=
 =?utf-8?q?f_dss_per_group_and_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Date: Wed, 31 Jan 2024 01:10:03 -0000
Message-ID: <170666340373.860255.1254461627341362872@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240130185744.209647-1-zhanjun.dong@intel.com>
In-Reply-To: <20240130185744.209647-1-zhanjun.dong@intel.com>
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

Series: drm/xe: Expose number of dss per group and helpers
URL   : https://patchwork.freedesktop.org/series/129331/
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
commit 838d5f880307e8308c63fe8533276be2cc781efa
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Tue Jan 30 10:57:44 2024 -0800

    drm/xe: Expose number of dss per group and helpers
    
    Expose helper for dss per group. This is a precursor patch to allow
    for easier iteration through MCR registers and other per-DSS uses.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch 3d244fce99b65e012c4409d8a22bb9168c41f101 drm-intel
838d5f880 drm/xe: Expose number of dss per group and helpers
-:97: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dss_' - possible side-effects?
#97: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:40:
+#define for_each_dss_steering(dss_, gt_, group_, instance_) \
+	for (dss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &group_, &instance_); \
+	     dss_ < XE_MAX_DSS_FUSE_BITS; \
+	     dss_++, xe_gt_mcr_get_dss_steering(gt_, dss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(gt_, group_, instance_))

-:97: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt_' - possible side-effects?
#97: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:40:
+#define for_each_dss_steering(dss_, gt_, group_, instance_) \
+	for (dss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &group_, &instance_); \
+	     dss_ < XE_MAX_DSS_FUSE_BITS; \
+	     dss_++, xe_gt_mcr_get_dss_steering(gt_, dss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(gt_, group_, instance_))

-:97: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'group_' - possible side-effects?
#97: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:40:
+#define for_each_dss_steering(dss_, gt_, group_, instance_) \
+	for (dss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &group_, &instance_); \
+	     dss_ < XE_MAX_DSS_FUSE_BITS; \
+	     dss_++, xe_gt_mcr_get_dss_steering(gt_, dss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(gt_, group_, instance_))

-:97: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'group_' may be better as '(group_)' to avoid precedence issues
#97: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:40:
+#define for_each_dss_steering(dss_, gt_, group_, instance_) \
+	for (dss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &group_, &instance_); \
+	     dss_ < XE_MAX_DSS_FUSE_BITS; \
+	     dss_++, xe_gt_mcr_get_dss_steering(gt_, dss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(gt_, group_, instance_))

-:97: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'instance_' - possible side-effects?
#97: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:40:
+#define for_each_dss_steering(dss_, gt_, group_, instance_) \
+	for (dss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &group_, &instance_); \
+	     dss_ < XE_MAX_DSS_FUSE_BITS; \
+	     dss_++, xe_gt_mcr_get_dss_steering(gt_, dss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(gt_, group_, instance_))

-:97: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'instance_' may be better as '(instance_)' to avoid precedence issues
#97: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:40:
+#define for_each_dss_steering(dss_, gt_, group_, instance_) \
+	for (dss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &group_, &instance_); \
+	     dss_ < XE_MAX_DSS_FUSE_BITS; \
+	     dss_++, xe_gt_mcr_get_dss_steering(gt_, dss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(gt_, group_, instance_))

total: 0 errors, 0 warnings, 6 checks, 95 lines checked


