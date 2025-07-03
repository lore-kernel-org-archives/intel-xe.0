Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6369C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 14:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7066110E115;
	Thu,  3 Jul 2025 14:23:51 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9528210E856;
 Thu,  3 Jul 2025 14:23:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_LMTT_invalidation_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Jul 2025 14:23:49 -0000
Message-ID: <175155262960.131399.8927136785623410335@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250702223041.1700-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250702223041.1700-1-michal.wajdeczko@intel.com>
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

Series: LMTT invalidation (rev3)
URL   : https://patchwork.freedesktop.org/series/151092/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b8b96ddb7a331d28b806c1af235b0e0ed94a9d85
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Jul 3 00:30:41 2025 +0200

    drm/xe/pf: Invalidate LMTT after completing changes
    
    Once we finish populating all leaf pages in the VF's LMTT we should
    make sure that hardware will not access any stale data. Explicitly
    force LMTT invalidation (as it was already planned in the past).
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Michał Winiarski <michal.winiarski@intel.com>
    Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch d04a54cd3b99001adbc4cd3305b44f9f3e658407 drm-intel
0f7d90616af0 drm/xe/pf: Force GuC virtualization mode
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
 [ ] xe 0000:4d:00.0: [drm] *ERROR* GT0: FAST_REQ H2G fence 0x804e failed! e=0x30, h=0

total: 0 errors, 1 warnings, 0 checks, 52 lines checked
732ec78abc69 drm/xe/pf: Invalidate LMTT during LMEM unprovisioning
-:25: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#25: FILE: drivers/gpu/drm/xe/xe_device.h:134:
+#define for_each_gt_on_tile(gt__, tile__, id__) \
+	for_each_gt((gt__), (tile__)->xe, (id__)) \
+		for_each_if((gt__)->tile == (tile__))

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

-:25: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt__' - possible side-effects?
#25: FILE: drivers/gpu/drm/xe/xe_device.h:134:
+#define for_each_gt_on_tile(gt__, tile__, id__) \
+	for_each_gt((gt__), (tile__)->xe, (id__)) \
+		for_each_if((gt__)->tile == (tile__))

-:25: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'tile__' - possible side-effects?
#25: FILE: drivers/gpu/drm/xe/xe_device.h:134:
+#define for_each_gt_on_tile(gt__, tile__, id__) \
+	for_each_gt((gt__), (tile__)->xe, (id__)) \
+		for_each_if((gt__)->tile == (tile__))

total: 1 errors, 0 warnings, 2 checks, 138 lines checked
b8b96ddb7a33 drm/xe/pf: Invalidate LMTT after completing changes


