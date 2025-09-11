Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38049CAC58E
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 21:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C4710EB90;
	Thu, 11 Sep 2025 21:11:44 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8028510EB86;
 Thu, 11 Sep 2025 21:11:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_WCL_as_subplatform_fr?=
 =?utf-8?q?om_PTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Sep 2025 21:11:44 -0000
Message-ID: <175762510451.327980.9518770372829681023@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250911210514.389014-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250911210514.389014-1-dnyaneshwar.bhadane@intel.com>
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

Series: Add WCL as subplatform from PTL
URL   : https://patchwork.freedesktop.org/series/154425/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3afcb42db994e053837dcdd538cf48935a33ed55
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Date:   Fri Sep 12 02:35:14 2025 +0530

    drm/i915/xe3: Restrict PTL intel_encoder_is_c10phy() to only PHY A
    
    On PTL, no combo PHY is connected to PORT B. However, PORT B can
    still be used for Type-C and will utilize the C20 PHY for eDP
    over Type-C. In such configurations, VBTs also enumerate PORT B.
    
    This leads to issues where PORT B is incorrectly identified as using the
    C10 PHY, due to the assumption that returning true for PORT B in
    intel_encoder_is_c10phy() would not cause problems.
    
    From PTL's perspective, only PORT A/PHY A uses the C10 PHY.
    
    Update the helper intel_encoder_is_c10phy() to return true only for
    PORT A/PHY on PTL.
    
    Bspec: 72571,73944
    Fixes: 9d10de78a37f ("drm/i915/wcl: C10 phy connected to port A and B")
    Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
+ /mt/dim checkpatch a433a14cc397ef049ef273a3d4404d46a20a28cb drm-intel
41e2924631b4 drm/pcids: Split PTL pciids group to make wcl subplatform
-:35: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#35: FILE: include/drm/intel/pciids.h:882:
+#define INTEL_WCL_IDS(MACRO__, ...) \
 	MACRO__(0xFD80, ## __VA_ARGS__), \
 	MACRO__(0xFD81, ## __VA_ARGS__)

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

-:35: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#35: FILE: include/drm/intel/pciids.h:882:
+#define INTEL_WCL_IDS(MACRO__, ...) \
 	MACRO__(0xFD80, ## __VA_ARGS__), \
 	MACRO__(0xFD81, ## __VA_ARGS__)

total: 1 errors, 0 warnings, 1 checks, 17 lines checked
e09b7a4b3eda drm/i915/display: Add definition for wcl as subplatform
3afcb42db994 drm/i915/xe3: Restrict PTL intel_encoder_is_c10phy() to only PHY A


