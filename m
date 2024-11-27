Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008DBD609A7
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 07:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB5010E9E2;
	Wed, 27 Nov 2024 07:14:59 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BA910E9E2;
 Wed, 27 Nov 2024 07:14:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Refactor_VRR_for_differen?=
 =?utf-8?q?t_VRR_timing_generator?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 Nov 2024 07:14:59 -0000
Message-ID: <173269169900.3641940.17710912997944386444@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127071136.1017190-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241127071136.1017190-1-ankit.k.nautiyal@intel.com>
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

Series: Refactor VRR for different VRR timing generator
URL   : https://patchwork.freedesktop.org/series/141819/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4be19bf0bdde337e2ec0ec6737c3ff18e260d503
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Wed Nov 27 12:41:36 2024 +0530

    drm/i915/display: Add vrr mode to crtc_state dump
    
    Print Vrr mode along with other vrr members in crtc_state dump.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 241f1fd26b38614aa85276a78b127e9abb14850a drm-intel
97e08f0a52a0 drm/i915/vrr: Refactor VRR Timing Computation
26617db16a90 drm/i915/vrr: Simplify CMRR Enable Check in intel_vrr_get_config
414290fd63c6 drm/i915/vrr: Introduce new field for VRR mode
c4bc342c7443 drm/i915/vrr: Fill VRR timing generator mode for CMRR and VRR
9a78813be025 drm/i915/display: Remove vrr.enable and instead check vrr.mode != NONE
85b6d9360fa4 drm/i915/display: Absorb cmrr attributes into vrr struct
4be19bf0bdde drm/i915/display: Add vrr mode to crtc_state dump


