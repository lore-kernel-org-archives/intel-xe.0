Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D26EC1E83
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 09:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68FB10E38C;
	Thu,  5 Feb 2026 09:37:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FFB10E16C;
 Thu,  5 Feb 2026 09:37:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Joiner_cle?=
 =?utf-8?q?anups_and_fix?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Feb 2026 09:37:09 -0000
Message-ID: <177028422994.228132.7635399506555849090@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260205083623.793902-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260205083623.793902-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/dp: Joiner cleanups and fix
URL   : https://patchwork.freedesktop.org/series/161181/
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
commit b5448059d389a7d844c4c76417cee5d1430541a7
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Thu Feb 5 14:06:23 2026 +0530

    drm/i915/dp: Restore the missing check for intel_dp_has_joiner
    
    Commit ad121a62d566 ("drm/i915/dp: Rework pipe joiner logic in mode_valid")
    replaced intel_dp_num_joined_pipes() with an explicit joiner candidate
    iteration. The previous code implicitly checked for DP joiner capability
    via intel_dp_has_joiner(), but this check was lost during the refactor.
    
    Restore the missing intel_dp_has_joiner() check in intel_dp_can_join() so
    that DP specific joiner conditions are taken into account.
    
    This change also requires propagating struct intel_dp * from the callers
    down to the new check.
    
    Fixes: ad121a62d566 ("drm/i915/dp: Rework pipe joiner logic in mode_valid")
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Cc: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 943149d1a27f8b3b8e7a8a5b81d0381843fe9dce drm-intel
fb8fa969c1eb drm/i915/dp: Make intel_dp_can_join() static
b5448059d389 drm/i915/dp: Restore the missing check for intel_dp_has_joiner
-:93: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__num_joined_pipes' - possible side-effects?
#93: FILE: drivers/gpu/drm/i915/display/intel_dp.h:235:
+#define for_each_joiner_candidate(__intel_dp, __connector, __mode, __num_joined_pipes) \
 	for ((__num_joined_pipes) = 1; (__num_joined_pipes) <= (I915_MAX_PIPES); (__num_joined_pipes)++) \
+		for_each_if(intel_dp_joiner_candidate_valid(__intel_dp, __connector, (__mode)->hdisplay, __num_joined_pipes))

-:96: WARNING:LONG_LINE: line length of 125 exceeds 100 columns
#96: FILE: drivers/gpu/drm/i915/display/intel_dp.h:237:
+		for_each_if(intel_dp_joiner_candidate_valid(__intel_dp, __connector, (__mode)->hdisplay, __num_joined_pipes))

total: 0 errors, 1 warnings, 1 checks, 79 lines checked


