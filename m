Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AF8C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 23:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE7410FFE7;
	Fri, 26 Jan 2024 23:26:35 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF6310FFE7;
 Fri, 26 Jan 2024 23:26:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Expose_numb?=
 =?utf-8?q?er_of_dss_per_group_and_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Date: Fri, 26 Jan 2024 23:26:34 -0000
Message-ID: <170631159464.764817.1243814648533329193@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240126232308.305358-1-zhanjun.dong@intel.com>
In-Reply-To: <20240126232308.305358-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Expose number of dss per group and helpers
URL   : https://patchwork.freedesktop.org/series/129227/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2d919ac662b2798c053d68d1cc16b758c61b55ca
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c627eba756846251012afb1d6b7f34d212dc2427
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Fri Jan 26 15:23:08 2024 -0800

    drm/xe/guc: Expose number of dss per group and helpers
    
    Expose helper for dss per group of mcr, features like GuC register
    capture will need this info to prepare buffer required.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch eeedb1b4360b100e4fa15a9c5c968a8f5a8de7ed drm-intel
c627eba75 drm/xe/guc: Expose number of dss per group and helpers
-:95: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ss_' - possible side-effects?
#95: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:40:
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))

-:95: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt_' - possible side-effects?
#95: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:40:
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))

-:95: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'group_' - possible side-effects?
#95: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:40:
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))

-:95: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'group_' may be better as '(group_)' to avoid precedence issues
#95: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:40:
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))

-:95: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'instance_' - possible side-effects?
#95: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:40:
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))

-:95: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'instance_' may be better as '(instance_)' to avoid precedence issues
#95: FILE: drivers/gpu/drm/xe/xe_gt_mcr.h:40:
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))

total: 0 errors, 0 warnings, 6 checks, 97 lines checked


