Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077DBCC6B00
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 07:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993E810E0A3;
	Thu,  2 Apr 2026 07:04:39 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5338910E0A3;
 Thu,  2 Apr 2026 07:04:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_move_more_dis?=
 =?utf-8?q?play_dependencies_from_i915_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Apr 2026 07:04:38 -0000
Message-ID: <177511347833.427101.4382116546479293537@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260331121608.1016333-1-luciano.coelho@intel.com>
In-Reply-To: <20260331121608.1016333-1-luciano.coelho@intel.com>
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

Series: drm/i915: move more display dependencies from i915 (rev2)
URL   : https://patchwork.freedesktop.org/series/163785/
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
commit ed1e8287c9e24b5e963c4dd74bec7d017ad27f3b
Author: Luca Coelho <luciano.coelho@intel.com>
Date:   Tue Mar 31 15:07:19 2026 +0300

    drm/i915: remove HAS_PCH_NOP() dependency from clock gating
    
    intel_pch_init_clock_gating() already handles unsupported PCH types,
    including PCH_NOP, by doing nothing.
    
    Drop the explicit HAS_PCH_NOP() check from the IVB clock gating
    path and always call the display helper directly. This removes one
    more direct dependency on display-side PCH macros from
    intel_clock_gating.c.
    
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
+ /mt/dim checkpatch 2ca39f35278e7f6e1750c710e75c32172fb1aa11 drm-intel
eda8382377c5 drm/i915: move SKL clock gating init to display
-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 61 lines checked
d109031a91cc drm/i915: move KBL clock gating init to display
d52e5d266b92 drm/i915/display: move CFL clock gating init to display
b1ec236f4b6f drm/i915/display: move BXT clock gating init to display
b8cc33ab3806 drm/i915/display: move GLK clock gating init to display
c6bc88d99314 drm/i915/display: move HSW and BDW clock gating init to display
ec6056271acb drm/i915/display: move pre-HSW clock gating init to display
ed1e8287c9e2 drm/i915: remove HAS_PCH_NOP() dependency from clock gating


