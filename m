Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52A9CD8CA8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 14:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6B910F581;
	Fri, 12 Jun 2026 14:58:26 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E4B10F581;
 Fri, 12 Jun 2026 14:58:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Work_harder_t?=
 =?utf-8?q?o_enable_VRR_based_refresh_rate_changes_on_eDP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Jun 2026 14:58:26 -0000
Message-ID: <178127630614.74124.15131896478854815936@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260612144203.31715-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260612144203.31715-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Work harder to enable VRR based refresh rate changes on eDP
URL   : https://patchwork.freedesktop.org/series/168442/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 29b8e4fb7d58f107e022157a058dc631f991ac92
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Fri Jun 12 17:42:03 2026 +0300

    drm/i915/panel: Attempt VRR based refresh rate change for !allow_modeset
    
    Adjust the panel fixed mode selection algorithm to only consider
    fixed modes that are "VRR compatible" with the old fixed mode
    when userspace doesn't want to allow full modesets. This will
    allow a VRR based refresh rate changes (ie. just a change in
    the vblank length) via the fastset path.
    
    When full modesets are allowed, we still use the original algorithm
    as that may pick a fixed mode with a more optimal dotclock, potentially
    leading to reduced power consumption.
    
    This approach works as long as userspace does the initial
    allow_modeset=true commit using the highest refresh rate it will
    want to use. Subsequent commits with allow_modeset=false can then
    switch between lower refresh rates without blinks.
    
    One remaining hurdle we may need to solve is the guardband length.
    Assuming the highest refresh rate vblank is too short for
    intel_vrr_compute_optimized_guardband() the intitial guardband will
    match the highest refresh rate vblank. A subsequent switch to a lower
    refresh rate will then recompute the guardband and select a value
    that is higher (since the vblank will be longer). The mismatch in
    guardband lengths will prevent the fastset. We may either have to
    preserve the original (sub-optimal) guardband, or we'll have to
    revisit the idea of changing the guardband without a full modeset.
    
    Note that I'm not 100% happy with this solution because
    intel_panel_fixed_mode() is no longer fully idempotent, but I wasn't
    able to come up with anything truly better either :/ The simple
    solution would be just to always pick the fixed mode with the highest
    dotclock, but that could lead to increased power consumption even
    when high refresh rates are never used.
    
    Perhaps the proper solution would be to just deprecate this
    idea of taking in random modes for internal panels and then
    cooking up a compatible fixed modes. Life would be easier if
    userspace was required to provide the desired fixed mode directly.
    But in order to do that we'd need to introduce new uapi properties
    to control the pfit aspect of this, and we'd probably need a new
    client cap to select between the old and new userspace behaviour.
    Something to consider in the future...
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 536f4e1338749a805ec4a7b82b1444dae2c6fe4d drm-intel
8950e467b43a drm/modes: Add DRM_MODE_MATCH_TIMINGS_VRR
fb3b90d7b4f6 drm/i915: Pass the full atomic state to .compute_config()
-:173: WARNING:FUNCTION_ARGUMENTS: function definition argument 'struct intel_atomic_state *' should also have an identifier name
#173: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:181:
+	int (*compute_config)(struct intel_atomic_state *,

-:173: WARNING:FUNCTION_ARGUMENTS: function definition argument 'struct intel_encoder *' should also have an identifier name
#173: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:181:
+	int (*compute_config)(struct intel_atomic_state *,

-:173: WARNING:FUNCTION_ARGUMENTS: function definition argument 'struct intel_crtc_state *' should also have an identifier name
#173: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:181:
+	int (*compute_config)(struct intel_atomic_state *,

-:173: WARNING:FUNCTION_ARGUMENTS: function definition argument 'struct drm_connector_state *' should also have an identifier name
#173: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:181:
+	int (*compute_config)(struct intel_atomic_state *,

-:178: WARNING:FUNCTION_ARGUMENTS: function definition argument 'struct intel_atomic_state *' should also have an identifier name
#178: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:185:
+	int (*compute_config_late)(struct intel_atomic_state *,

-:178: WARNING:FUNCTION_ARGUMENTS: function definition argument 'struct intel_encoder *' should also have an identifier name
#178: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:185:
+	int (*compute_config_late)(struct intel_atomic_state *,

-:178: WARNING:FUNCTION_ARGUMENTS: function definition argument 'struct intel_crtc_state *' should also have an identifier name
#178: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:185:
+	int (*compute_config_late)(struct intel_atomic_state *,

-:178: WARNING:FUNCTION_ARGUMENTS: function definition argument 'struct drm_connector_state *' should also have an identifier name
#178: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:185:
+	int (*compute_config_late)(struct intel_atomic_state *,

total: 0 errors, 8 warnings, 0 checks, 224 lines checked
2ca258c9d96a drm/i915/panel: Adjust intel_panel_compute_config() calling convention
29b8e4fb7d58 drm/i915/panel: Attempt VRR based refresh rate change for !allow_modeset


