Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7863C83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 21 Jul 2025 09:34:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D25110E045;
	Mon, 21 Jul 2025 09:34:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103C610E045;
 Mon, 21 Jul 2025 09:34:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Implement_Wa=5F1402176879?=
 =?utf-8?q?2_to_bypass_m=5Fn_ratio_limit_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Jul 2025 09:34:15 -0000
Message-ID: <175309045506.176858.11268085998372340824@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250721091529.3864004-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250721091529.3864004-1-ankit.k.nautiyal@intel.com>
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

Series: Implement Wa_14021768792 to bypass m_n ratio limit (rev5)
URL   : https://patchwork.freedesktop.org/series/138256/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63535c743231a7497a612c53f6edbb8a7d14412d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit eb191f4ee62393387162b4998fbe8009ee311435
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Jul 21 14:45:29 2025 +0530

    drm/i915/dp: Extend intel_dp_can_support_m_n() for BMG M/N bypass
    
    On BMG platforms, the standard M/N ratio limit of 10 can be bypassed
    under specific conditions, as permitted by hardware capabilities.
    
    Modify the helper intel_dp_can_support_m_n() to account for this by
    checking whether the platform supports bypassing the limit.
    
    During mode_valid phase, the check assumes that PIPE_A will be used to
    allow the mode, where M/N ratio is with int the limits for the workaround.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 62dc6f672f79c0b74acd61dd86936f8e5e6fdb0d drm-intel
72acce8a6eb1 drm/i915: Add helper to compute link M/N ratio for reuse
a9f0a2622ec7 drm/i915/dp: Limit m/n ratio to 10 for DP SST
edf67a68d527 drm/i915/dp_mst: Limit m/n ratio to 10 for MST
6ceb9bf2674f drm/i915/dp: Add M/N ratio check with warning for DP link config
b9b0b06a2be9 drm/i915/display: Add bits for link_n_exended for DISPLAY >= 14
6d47196507ac drm/i915/display_wa: Add support for Wa_14021768792
4c2c735dbc7f drm/i915/display: Add bits for Wa_14021768792 for linkm/n ratio > 10
-:223: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#223: FILE: drivers/gpu/drm/i915/display/intel_display.c:5211:
+				     "found tu %i, data %i/%i link %i/%i bypass_m_n_ratio_limit %s)", \

total: 0 errors, 1 warnings, 0 checks, 229 lines checked
59ea772a0beb drm/i915/display: Implement Wa_14021768792 for BMG DP for link_m/n ratio > 10
eb191f4ee623 drm/i915/dp: Extend intel_dp_can_support_m_n() for BMG M/N bypass


