Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA20CAC594
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 17:49:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AE410E4E7;
	Tue, 17 Sep 2024 17:49:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAAB10E4DC;
 Tue, 17 Sep 2024 17:49:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Implement_Wa=5F1402176879?=
 =?utf-8?q?2_to_bypass_m=5Fn_ratio_limit_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Sep 2024 17:49:47 -0000
Message-ID: <172659538791.1023160.6084540775464203128@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240917174200.2563528-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240917174200.2563528-1-ankit.k.nautiyal@intel.com>
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

Series: Implement Wa_14021768792 to bypass m_n ratio limit (rev2)
URL   : https://patchwork.freedesktop.org/series/138256/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5f727d10cda41dff6a60421ae1c9284333e2c2c9
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Tue Sep 17 23:12:00 2024 +0530

    drm/i915/display: Implement Wa_14021768792 for BMG DP for link_m/n ratio > 10
    
    Handle the bypass logic for the M/N ratio limit for DP.
    Calculate the M/N ratio, check if it can bypass the limit, and set the
    appropriate flags for the workaround.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 38e1b615fb395b928e514108e908cd6edf3d34c3 drm-intel
3690088437d3 Add bits for link_n_exended for DISPLAY >= 14
078b2ec44c43 drm/i915/display: Limit m/n ratio to 10 for display > 12
d67df8c48f3b drm/i915/display: Add bits for Wa_14021768792 for linkm/n ratio > 10
-:197: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#197: FILE: drivers/gpu/drm/i915/display/intel_display.c:5270:
+				     "found tu %i, data %i/%i link %i/%i bypass_m_n_ratio_limit %s)", \

total: 0 errors, 1 warnings, 0 checks, 206 lines checked
5f727d10cda4 drm/i915/display: Implement Wa_14021768792 for BMG DP for link_m/n ratio > 10


