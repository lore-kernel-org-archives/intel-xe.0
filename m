Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EEDC36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 12:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA20910E12A;
	Fri, 21 Mar 2025 12:33:34 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125EB10E12A;
 Fri, 21 Mar 2025 12:33:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Implement_Wa=5F1402176879?=
 =?utf-8?q?2_to_bypass_m=5Fn_ratio_limit_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Mar 2025 12:33:34 -0000
Message-ID: <174256041407.64419.433936080757308325@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250321112650.3594298-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250321112650.3594298-1-ankit.k.nautiyal@intel.com>
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

Series: Implement Wa_14021768792 to bypass m_n ratio limit (rev4)
URL   : https://patchwork.freedesktop.org/series/138256/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 55182368c8e8451d0a08cc434730775eea85d087
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Fri Mar 21 16:56:50 2025 +0530

    drm/i915/display: Implement Wa_14021768792 for BMG DP for link_m/n ratio > 10
    
    Handle the bypass logic for the M/N ratio limit for DP.
    Calculate the M/N ratio, check if it can bypass the limit, and set the
    appropriate flags for the workaround.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch b15a87713d14b1c2986f47a622c5a8c5458e2396 drm-intel
7253c4c79bc6 Add bits for link_n_exended for DISPLAY >= 14
352dab6967ed drm/i915/display: Limit m/n ratio to 10 for display > 12
93d7f9891d46 drm/i915/display: Add bits for Wa_14021768792 for linkm/n ratio > 10
-:218: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#218: FILE: drivers/gpu/drm/i915/display/intel_display.c:5195:
+				     "found tu %i, data %i/%i link %i/%i bypass_m_n_ratio_limit %s)", \

total: 0 errors, 1 warnings, 0 checks, 225 lines checked
55182368c8e8 drm/i915/display: Implement Wa_14021768792 for BMG DP for link_m/n ratio > 10


