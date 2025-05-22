Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C66C54E65
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 10:29:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834B710EA72;
	Thu, 22 May 2025 10:29:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A447310E973;
 Thu, 22 May 2025 10:29:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/vrr=3A_Set_vrr?=
 =?utf-8?q?=2Evmin_to_min_Vtotal_to_re-enable_LRR_for_PTL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 May 2025 10:29:04 -0000
Message-ID: <174790974466.13259.10386442168289503391@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250509031107.958280-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250509031107.958280-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/vrr: Set vrr.vmin to min Vtotal to re-enable LRR for PTL (rev2)
URL   : https://patchwork.freedesktop.org/series/148787/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6306bfa5182ea612f669932e1423c3960987e857
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Fri May 9 08:41:07 2025 +0530

    drm/i915/vrr: Set vrr.vmin to min Vtotal to re-enable LRR for PTL
    
    Currently in intel_vrr_compute_config, we set vrr.vmin to crtc_vtotal for
    all cases to avoid having vrr.vmin changed when we switch from
    fixed refresh rate timings to variable refresh rate timings. This works for
    all cases, except for LRR case where user can change the clock so as to
    seamlessly switch to a lower refresh rate only for a VRR supporting panel.
    
    In LRR case the crtc_vtotal changes for the mode, and due to which vrr.vmin
    changes and therefore the guardband also changes. Since we cannot change
    the guardband on the fly when VRR Timing Generator is on, this gets
    rejected.
    
    To overcome this, for panels that support VRR, instead of setting the
    vrr.vmin to crtc_vtotal, we set that to the lowest Vtotal (for highest
    Refresh rate supported by the panel). For non-vrr panels, the vrr.vmin
    stays the same i.e. crtc_vtotal.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 444fd022f6c4f5245b1e8f797805ab3917235d3d drm-intel
6306bfa5182e drm/i915/vrr: Set vrr.vmin to min Vtotal to re-enable LRR for PTL


