Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2759EC9830B
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 16:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BB810E09B;
	Wed, 23 Sep 2026 16:50:06 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D746410E09B;
 Wed, 23 Sep 2026 16:50:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/i915/vrr=3A_Use_vrr=2Ein=5Frange_to_determine_if_we_nee?=
 =?utf-8?q?d_the_AS_SDP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Sep 2026 16:50:04 -0000
Message-ID: <179018220487.198725.2017509778281927362@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260923164321.9230-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260923164321.9230-1-ville.syrjala@linux.intel.com>
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

Series: series starting with [1/3] drm/i915/vrr: Use vrr.in_range to determine if we need the AS SDP
URL   : https://patchwork.freedesktop.org/series/174830/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c085fe357e52b229fe6013e440f2b9936070705f
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Sep 23 19:43:21 2026 +0300

    drm/i915/vrr: s/intel_vrr_possible()/has_vrr_tg_timings()/
    
    Several places in the VRR code are using intel_vrr_possible() as
    an indication whether whether we should program the VRR timing
    generator registers or not. While the implementation is correct
    the function name is very confusing. Rename the function to
    has_vrr_tg_timings(), and make it static as it's no longer needed
    outside intel_vrr.c.
    
    Cc: Xizhe Tang <xizheTang2005@163.com>
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 29d97ae4454ccf06c122aff5715742967ee776d8 drm-intel
33c44ae51f15 drm/i915/vrr: Use vrr.in_range to determine if we need the AS SDP
-:29: WARNING:REPEATED_WORD: Possible repeated word: 'during'
#29: 
end up taking the full modeset path during during initial_commit(),

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
d0f13a3c922b drm/i915/vrr: Introduce intel_vrr_can_use_vrr_tg()
c085fe357e52 drm/i915/vrr: s/intel_vrr_possible()/has_vrr_tg_timings()/
-:10: WARNING:REPEATED_WORD: Possible repeated word: 'whether'
#10: 
an indication whether whether we should program the VRR timing

total: 0 errors, 1 warnings, 0 checks, 55 lines checked


