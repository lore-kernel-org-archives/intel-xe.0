Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB20ACD4F24
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 18:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A3B10EBCB;
	Tue, 12 May 2026 18:03:55 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D28B10EBCB;
 Tue, 12 May 2026 18:03:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/atomic=3A_Rework_init?=
 =?utf-8?q?ial_state_allocation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maxime Ripard" <mripard@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 May 2026 18:03:54 -0000
Message-ID: <177860903424.61708.18155852106290365112@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
In-Reply-To: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
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

Series: drm/atomic: Rework initial state allocation (rev3)
URL   : https://patchwork.freedesktop.org/series/163606/
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
commit b5d36bbd8ada66040d91e7af2a8d6d2cd4f29705
Author: Maxime Ripard <mripard@kernel.org>
Date:   Tue May 12 15:06:18 2026 +0200

    drm/bridge_connector: Convert to atomic_create_state
    
    The connector created by drm_bridge_connector only initializes a
    pristine state in reset, which is equivalent to what
    atomic_create_state would expect. Convert to it.
    
    Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
    Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
    Signed-off-by: Maxime Ripard <mripard@kernel.org>
+ /mt/dim checkpatch 9cb559e83f7f3c02c8c6566d3446cd37ecc56e86 drm-intel
c78cf41d3302 drm/atomic: Document atomic commit lifetime
91a09533a30b drm/colorop: Fix typos in the doc
4ef34e2bf741 drm/atomic: Drop drm_private_obj.state assignment from create_state
fc168bb31b0a drm/atomic: Expand atomic_create_state expectations for drm_private_obj
8e1d0cda1015 drm/mode-config: Document drm_private_obj exclusion from drm_mode_config_reset()
64b18679684a drm/colorop: Rename __drm_colorop_state_reset()
1fed4f55b5f9 drm/colorop: Create drm_atomic_helper_colorop_create_state()
e046d93b8fee drm/atomic-state-helper: Fix __drm_atomic_helper_plane_reset() doc typo
b2305520cca8 drm/atomic-state-helper: Rename __drm_atomic_helper_plane_state_reset()
-:91: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#91: FILE: include/drm/drm_atomic_state_helper.h:57:
+void __drm_atomic_helper_plane_state_init(struct drm_plane_state *state,
 					   struct drm_plane *plane);

total: 0 errors, 0 warnings, 1 checks, 51 lines checked
06665aee4bfb drm/plane: Add new atomic_create_state callback
-:49: WARNING:LONG_LINE_COMMENT: line length of 102 exceeds 100 columns
#49: FILE: drivers/gpu/drm/drm_atomic_state_helper.c:344:
+ * drm_atomic_helper_plane_create_state - default &drm_plane_funcs.atomic_create_state hook for planes

total: 0 errors, 1 warnings, 0 checks, 106 lines checked
e5b075985182 drm/atomic-state-helper: Rename __drm_atomic_helper_crtc_state_reset()
-:88: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#88: FILE: include/drm/drm_atomic_state_helper.h:44:
+void __drm_atomic_helper_crtc_state_init(struct drm_crtc_state *state,
 					  struct drm_crtc *crtc);

total: 0 errors, 0 warnings, 1 checks, 48 lines checked
2299165f48f1 drm/crtc: Add new atomic_create_state callback
974846012d51 drm/atomic-state-helper: Rename __drm_atomic_helper_connector_state_reset()
-:76: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#76: FILE: include/drm/drm_atomic_state_helper.h:74:
+void __drm_atomic_helper_connector_state_init(struct drm_connector_state *conn_state,
 					       struct drm_connector *connector);

total: 0 errors, 0 warnings, 1 checks, 41 lines checked
c2df25cb88fe drm/hdmi: Rename __drm_atomic_helper_connector_hdmi_reset()
-:51: WARNING:LONG_LINE_COMMENT: line length of 103 exceeds 100 columns
#51: FILE: drivers/gpu/drm/display/drm_hdmi_state_helper.c:309:
+ * __drm_atomic_helper_connector_hdmi_state_init() - Initialize all HDMI @drm_connector_state resources

total: 0 errors, 1 warnings, 0 checks, 76 lines checked
b1ff54e7ccf2 drm/connector: Add new atomic_create_state callback
-:50: WARNING:LONG_LINE_COMMENT: line length of 114 exceeds 100 columns
#50: FILE: drivers/gpu/drm/drm_atomic_state_helper.c:538:
+ * drm_atomic_helper_connector_create_state - default &drm_connector_funcs.atomic_create_state hook for connectors

total: 0 errors, 1 warnings, 0 checks, 107 lines checked
58781933ec3e drm/mode-config: Create drm_mode_config_create_initial_state()
db211bfa6934 drm/drv: Switch skeleton to drm_mode_config_create_initial_state()
960ecd290410 drm/tidss: Switch to drm_mode_config_create_initial_state()
c4c68f066f27 drm/tidss: Convert to atomic_create_state
b5d36bbd8ada drm/bridge_connector: Convert to atomic_create_state


