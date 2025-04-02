Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BC1C28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 17:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B9310E878;
	Wed,  2 Apr 2025 17:29:00 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B02210E878;
 Wed,  2 Apr 2025 17:29:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Precompute_pl?=
 =?utf-8?q?ane_SURF_address/etc=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Apr 2025 17:29:00 -0000
Message-ID: <174361494049.28365.18092811813247533982@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402172240.9275-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250402172240.9275-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Precompute plane SURF address/etc. (rev2)
URL   : https://patchwork.freedesktop.org/series/147096/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5e999ae489bacd462c8ef961252af1b49b7eddb0
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Apr 2 20:22:40 2025 +0300

    drm/i915: Don't pass crtc_state to foo_plane_ctl() & co.
    
    The *_plane_ctl() functions only consider the state of the
    plane (the state of the crtc is handled by the corresponding
    *_plane_ctl_crtc()), and thus they don't need the crtc_state
    at all. Don't pass it in.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 6deef7a0418bc26082804287b18c8db1e0810686 drm-intel
5324888bf6f8 drm/i915: Precompute plane SURF address
27d3eee823b6 drm/i915: Nuke intel_plane_ggtt_offset()
34296c865813 drm/i915: Move the intel_dpt_offset() check into intel_plane_pin_fb()
3aebf304444b drm/i915: Use i915_vma_offset() in intel_dpt_offset()
ff845dbc0420 drm/i915: Remove unused dpt_total_entries()
5e999ae489ba drm/i915: Don't pass crtc_state to foo_plane_ctl() & co.


