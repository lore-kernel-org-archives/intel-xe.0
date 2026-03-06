Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22AEFCB637
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 17:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B9610E0E0;
	Fri,  6 Mar 2026 17:11:31 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F4910E0E0;
 Fri,  6 Mar 2026 17:11:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_type-specific_GT_loop?=
 =?utf-8?q?_iterator?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Mar 2026 17:11:30 -0000
Message-ID: <177281709076.328022.17397408534251092222@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260305-gt-type-loops-v1-0-aa42e9fc3f06@intel.com>
In-Reply-To: <20260305-gt-type-loops-v1-0-aa42e9fc3f06@intel.com>
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

Series: Add type-specific GT loop iterator
URL   : https://patchwork.freedesktop.org/series/162710/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0aa6d19fd7f891663570df831de93732953792e0
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Thu Mar 5 14:59:28 2026 -0800

    drm/xe: Utilize for_each_gt_with_type() for type-specific GT loops
    
    Convert existing loops with Coccinelle via the following semantic patch:
    
        @@
        identifier GT, XE, ID;
        iterator name for_each_gt, for_each_gt_with_type;
        @@
        - for_each_gt(GT, XE, ID) {
        + for_each_gt_with_type(GT, XE, ID, BIT(XE_GT_TYPE_MAIN)) {
        -         if (xe_gt_is_media_type(GT))
        -                 continue;
                  ...
          }
    
        @@
        identifier GT, XE, ID;
        iterator name for_each_gt, for_each_gt_with_type;
        @@
        - for_each_gt(GT, XE, ID) {
        + for_each_gt_with_type(GT, XE, ID, BIT(XE_GT_TYPE_MEDIA)) {
        -         if (xe_gt_is_main_type(GT))
        -                 continue;
                  ...
          }
    
        @@
        identifier GT, XE, ID;
        iterator name for_each_gt, for_each_gt_with_type;
        @@
        - for_each_gt(GT, XE, ID) {
        + for_each_gt_with_type(GT, XE, ID, BIT(XE_GT_TYPE_MAIN)) {
        -         if (!xe_gt_is_main_type(GT))
        -                 continue;
                  ...
          }
    
        @@
        identifier GT, XE, ID;
        iterator name for_each_gt, for_each_gt_with_type;
        @@
        - for_each_gt(GT, XE, ID) {
        + for_each_gt_with_type(GT, XE, ID, BIT(XE_GT_TYPE_MEDIA)) {
        -         if (xe_gt_is_media_type(GT))
        -                 continue;
                  ...
          }
    
    No functional change expected.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch a48305e6a2e6a1ed90df374101dd29542c105d8f drm-intel
9d5a7a4fa7cb drm/xe: Add for_each_gt_with_type() iterator
-:37: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#37: FILE: drivers/gpu/drm/xe/xe_device.h:134:
+#define for_each_gt_with_type(gt__, xe__, id__, typemask__) \
+	for_each_gt((gt__), (xe__), (id__)) \
+		for_each_if((typemask__) & BIT((gt__)->info.type))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:37: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt__' - possible side-effects?
#37: FILE: drivers/gpu/drm/xe/xe_device.h:134:
+#define for_each_gt_with_type(gt__, xe__, id__, typemask__) \
+	for_each_gt((gt__), (xe__), (id__)) \
+		for_each_if((typemask__) & BIT((gt__)->info.type))

total: 1 errors, 0 warnings, 1 checks, 10 lines checked
0aa6d19fd7f8 drm/xe: Utilize for_each_gt_with_type() for type-specific GT loops


