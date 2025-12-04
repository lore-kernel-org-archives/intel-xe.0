Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD3ED1D862
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 05:01:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCB510E00D;
	Thu,  4 Dec 2025 05:01:58 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD13E10E00D;
 Thu,  4 Dec 2025 05:01:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_OA=3A_More_OA_and_registe?=
 =?utf-8?q?r_whitelist_changes_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Dec 2025 05:01:56 -0000
Message-ID: <176482451670.56073.759142213472272886@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251202025115.373546-1-ashutosh.dixit@intel.com>
In-Reply-To: <20251202025115.373546-1-ashutosh.dixit@intel.com>
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

Series: OA: More OA and register whitelist changes (rev4)
URL   : https://patchwork.freedesktop.org/series/158084/
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
commit 369e43f2fbe388e7240402884d5396e703e78ee9
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Mon Dec 1 18:51:15 2025 -0800

    drm/xe/rtp: Whitelist OAM MMIO trigger registers
    
    Whitelist OAM registers to enable userspace to execute MMIO triggers on OAM
    units.
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 2d16d4e1aef3cb501fcd37c8558dafeb579be813 drm-intel
df0ae51ea029 drm/xe/oa: Use explicit struct initialization for struct xe_oa_regs
5f59b7a1124c drm/xe/oa/uapi: Add gt_id to struct drm_xe_oa_unit
ce8857699d9e drm/xe/oa: Allow exec_queue's to be specified only for OAG OA unit
6040ed70da6f drm/xe/rtp: Refactor OAG MMIO trigger register whitelisting
-:50: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#50: FILE: drivers/gpu/drm/xe/xe_reg_whitelist.c:78:
+#define WHITELIST_OA_MMIO_TRG(trg, status, head) \
+	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
+	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
+	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)

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

total: 1 errors, 0 warnings, 0 checks, 53 lines checked
369e43f2fbe3 drm/xe/rtp: Whitelist OAM MMIO trigger registers
-:56: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#56: FILE: drivers/gpu/drm/xe/xe_reg_whitelist.c:86:
+#define WHITELIST_OAM_MMIO_TRG \
+	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SAG_BASE_ADJ), \
+			      OAM_STATUS(XE_OAM_SAG_BASE_ADJ), \
+			      OAM_HEAD_POINTER(XE_OAM_SAG_BASE_ADJ)), \
+	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SCMI_0_BASE_ADJ), \
+			      OAM_STATUS(XE_OAM_SCMI_0_BASE_ADJ), \
+			      OAM_HEAD_POINTER(XE_OAM_SCMI_0_BASE_ADJ)), \
+	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SCMI_1_BASE_ADJ), \
+			      OAM_STATUS(XE_OAM_SCMI_1_BASE_ADJ), \
+			      OAM_HEAD_POINTER(XE_OAM_SCMI_1_BASE_ADJ))

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

total: 1 errors, 0 warnings, 0 checks, 59 lines checked


