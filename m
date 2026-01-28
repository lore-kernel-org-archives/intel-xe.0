Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7195FD46BF6
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 19:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354D610E065;
	Wed, 28 Jan 2026 19:43:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F7110E065;
 Wed, 28 Jan 2026 19:43:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/gvt=3A_further_r?=
 =?utf-8?q?educe_dependency_on_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Jan 2026 19:43:13 -0000
Message-ID: <176962939352.202812.16907256215314742871@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1769612208.git.jani.nikula@intel.com>
In-Reply-To: <cover.1769612208.git.jani.nikula@intel.com>
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

Series: drm/i915/gvt: further reduce dependency on display
URL   : https://patchwork.freedesktop.org/series/160771/
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
commit 5a45eac0e38f4af3391d05a38370f78d94befbb5
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Jan 28 16:59:10 2026 +0200

    drm/i915/gvt: drop unnecessary include of intel_display.h
    
    This does not appear to be needed at all.
    
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 8059f097e25f736bb3da09af6a9b283079abfd4f drm-intel
6c2349ede117 drm/i915/display: move enum aux_ch to intel_display_limits.h
357e98b4600a drm/i915/gvt: drop dependency on display struct dpll
-:47: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#47: FILE: drivers/gpu/drm/i915/gvt/handlers.c:593:
+		m2 |= REG_FIELD_GET(PORT_PLL_M2_FRAC_MASK, vgpu_vreg_t(vgpu, BXT_PORT_PLL(phy, ch, 2)));

total: 0 errors, 1 warnings, 0 checks, 51 lines checked
c1728849f805 drm/i915/gvt: drop dependency on intel_display_types.h
5a45eac0e38f drm/i915/gvt: drop unnecessary include of intel_display.h


