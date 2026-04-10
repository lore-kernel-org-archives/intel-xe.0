Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4667F459F5
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 16:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6694310E98B;
	Fri, 10 Apr 2026 16:35:43 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7B910E98B;
 Fri, 10 Apr 2026 16:35:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Start_fixing_OA_whitelist?=
 =?utf-8?q?_mistakes_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Apr 2026 16:35:42 -0000
Message-ID: <177583894204.451491.2238536951915685404@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
In-Reply-To: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
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

Series: Start fixing OA whitelist mistakes (rev5)
URL   : https://patchwork.freedesktop.org/series/159772/
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
commit 952b29e0ff2e98f38946cf86e4c69e3287dfa596
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Wed Apr 8 16:43:09 2026 -0700

    drm/xe/oa: Stop whitelisting OASTARTTRIG_COUNTER
    
    Whitelisting OAHEADPTR with flag RING_FORCE_TO_NONPRIV_RANGE_4
    whitelists not just the intended OAHEADPTR, OATAILPTR, and OABUFFER
    registers, but also OASTARTTRIG_COUNTER which is not necessary or
    desirable.  Stop using the RANGE_4 flag in cases where we don't truly
    want to whitelist four registers.
    
    While at it, eliminate some of the layers of C macros; these are making
    it harder to see what registers are truly being whitelisted which isn't
    really worth the lines of code being saved.  We can however reduce some
    of the duplication of code by consolidating oam_mmio_trg_vcs and
    oam_mmio_trg_vecs into a single entry with a custom match function; this
    will also make things simpler in the future if we determine that we can
    tighten up the specific engines that some of these registers are
    whitelisted on.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5 drm-intel
4388884b87d3 drm/xe/oa: Stop whitelisting non-SAG MMIO_TRG registers on non-DG2
-:52: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#52: FILE: drivers/gpu/drm/xe/xe_reg_whitelist.c:101:
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

total: 1 errors, 0 warnings, 0 checks, 65 lines checked
81b32a4c7a9d drm/xe/oa: Stop whitelisting OAG_OASTATUS
52de4a687e49 drm/xe/oa: Stop whitelisting OAM registers on non Xe2/Xe3
d0b214465c62 drm/xe/oa: Stop whitelisting OAG registers after Xe3
33c7e65acd6e drm/xe: Add WHITELIST_RO macro
dfb44ff2c1e7 drm/xe/oa: Consolidate RTP entries for OAM whitelist
13224f0645aa drm/xe/oa: Consolidate RTP entries for OAG whitelist
4f26884442b3 drm/xe/oa: Consolidate RTP entries for OA MERT
8d07e022c3d4 drm/xe: Enable all FORCE_TO_NONPRIV registers
952b29e0ff2e drm/xe/oa: Stop whitelisting OASTARTTRIG_COUNTER


