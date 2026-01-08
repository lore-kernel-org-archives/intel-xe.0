Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA527D0D17D
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 00:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8345810E0FA;
	Thu,  8 Jan 2026 00:26:15 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C6A10E0FA;
 Thu,  8 Jan 2026 00:26:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Start_fixing_OA_whitelist?=
 =?utf-8?q?_mistakes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Jan 2026 00:26:14 -0000
Message-ID: <176783197413.134482.11170518178012430266@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260108002000.384449-6-matthew.d.roper@intel.com>
In-Reply-To: <20260108002000.384449-6-matthew.d.roper@intel.com>
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

Series: Start fixing OA whitelist mistakes
URL   : https://patchwork.freedesktop.org/series/159772/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9f1cb6875f3f9eb0925ed50c16100322a2df513c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b67415315ee56a3c6242b3709e09cd8407b2f08a
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Wed Jan 7 16:20:05 2026 -0800

    drm/xe/oa: Stop whitelisting OAG registers after Xe3
    
    According to Xe2 and beyond's hardware design, userspace does not need
    access to OAG_OAHEADPTR, OAG_OATAILPTR, OAG_OABUFFER, or
    OAG_OASTARTTRIG_COUNTER; the hardware deliberately blocks userspace
    access to these registers and adding them to our software whitelist was
    a mistake.  However since they're already on the software list, it's
    possible that userspace software has developed an unwanted dependency on
    them and that removal of access now could break userspace.  So while we
    investigate further to determine whether removal is safe or not, let's
    add an upper bound to prevent the mistake from spreading further past
    our current Xe3 platforms.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 9e023f4255817c26599a3335845f29c15a393448 drm-intel
10a2273dd17a drm/xe/oa: Stop whitelisting MMIO_TRG registers on non-DG2
-:40: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#40: FILE: drivers/gpu/drm/xe/xe_reg_whitelist.c:94:
+#define WHITELIST_OA_MMIO_TRG(status, head) \
 	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
 	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)

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

total: 1 errors, 0 warnings, 0 checks, 47 lines checked
f45744d0e2f6 drm/xe/oa: Stop whitelisting OAG_OASTATUS
df8ee55d6ace drm/xe/oa: Stop whitelisting OAM registers on non Xe2/Xe3
b67415315ee5 drm/xe/oa: Stop whitelisting OAG registers after Xe3


