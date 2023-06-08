Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387E3C7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 20:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F5C10E087;
	Thu,  8 Jun 2023 20:11:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3361410E087;
 Thu,  8 Jun 2023 20:11:50 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3037CAADF1;
 Thu,  8 Jun 2023 20:11:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 08 Jun 2023 20:11:50 -0000
Message-ID: <168625511019.18384.3684557169963951420@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230608200857.124884-1-matthew.brost@intel.com>
In-Reply-To: <20230608200857.124884-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Gu?=
 =?utf-8?q?C_doorbells_for_submission?=
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

Series: GuC doorbells for submission
URL   : https://patchwork.freedesktop.org/series/119096/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5218db4afa59f8f4e32963f86671b9b49281cec4
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jun 8 13:08:57 2023 -0700

    drm/xe/guc: Print doorbell ID in GuC engine debugfs / error capture
    
    This information is helpful so print it.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch c075cadc4c6d0238556545baab98a63368908404 drm-intel
e07cdc0ac drm/xe/guc: Read HXG fields from DW1 of G2H response
8aa9c4dad drm/xe/guc: Return the lower part of blocking H2G message
89f1d5ae9 drm/xe/guc: Use doorbells for submission if possible
-:114: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'xe' - possible side-effects?
#114: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:40:
+#define HAS_GUC_MMIO_DB(xe) (IS_DGFX(xe) || GRAPHICS_VERx100(xe) >= 1250)

-:115: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'xe' - possible side-effects?
#115: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:41:
+#define HAS_GUC_DIST_DB(xe) \
+	(GRAPHICS_VERx100(xe) >= 1200 && !HAS_GUC_MMIO_DB(xe))

-:255: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'e_' - possible side-effects?
#255: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:351:
+#define doorbell_read(guc_, e_, field_) ({			\
+	struct iosys_map _vmap = (e_)->guc->doorbell_bo->vmap;	\
+	iosys_map_incr(&_vmap, (e_)->guc->doorbell_offset);	\
+	xe_map_rd_field(guc_to_xe((guc_)), &_vmap, 0,		\
+				  struct guc_doorbell_info, field_); \
+	})

-:261: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'e_' - possible side-effects?
#261: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:357:
+#define doorbell_write(guc_, e_, field_, val_) ({		\
+	struct iosys_map _vmap = (e_)->guc->doorbell_bo->vmap;	\
+	iosys_map_incr(&_vmap, (e_)->guc->doorbell_offset);	\
+	xe_map_wr_field(guc_to_xe((guc_)), &_vmap, 0,		\
+				  struct guc_doorbell_info, field_, val_); \
+	})

-:322: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#322: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:418:
+	XE_BUG_ON(!has_doorbell(e));

-:342: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#342: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:438:
+	XE_BUG_ON(!has_doorbell(e));

-:509: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#509: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:1502:
+	XE_BUG_ON(engine_registered(e) && !has_doorbell(e));

total: 0 errors, 3 warnings, 4 checks, 492 lines checked
5218db4af drm/xe/guc: Print doorbell ID in GuC engine debugfs / error capture


