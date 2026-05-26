Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C88CD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 18:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AB310E4BD;
	Tue, 26 May 2026 18:40:23 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF40310E1B1;
 Tue, 26 May 2026 18:40:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/atomic=3A_Rework_init?=
 =?utf-8?q?ial_state_allocation_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maxime Ripard" <mripard@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 May 2026 18:40:21 -0000
Message-ID: <177982082184.11680.18047337927954792881@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
In-Reply-To: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
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

Series: drm/atomic: Rework initial state allocation (rev5)
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
commit 1c35776ef222a5253aea1900f51cfb040316f04c
Author: Maxime Ripard <mripard@kernel.org>
Date:   Tue May 26 18:46:31 2026 +0200

    drm/bridge_connector: Convert to atomic_create_state
    
    The connector created by drm_bridge_connector only initializes a
    pristine state in reset, which is equivalent to what
    atomic_create_state would expect. Convert to it.
    
    Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
    Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
    Signed-off-by: Maxime Ripard <mripard@kernel.org>
+ /mt/dim checkpatch 1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c drm-intel
fb1b8e20360a drm/atomic: Document atomic commit lifetime
-:98: WARNING:TYPO_SPELLING: 'refererence' may be misspelled - perhaps 'reference'?
#98: FILE: drivers/gpu/drm/drm_atomic.c:111:
+ *   + Once done, and when the last refererence to our &struct
                                     ^^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 90 lines checked
1afca3049534 drm/colorop: Fix typos in the doc
0ae2ddf76739 drm/atomic: Drop drm_private_obj.state assignment from create_state
ea99c9899a5f drm/atomic: Expand atomic_create_state expectations for drm_private_obj
2adf81e42125 drm/mode-config: Document drm_private_obj exclusion from drm_mode_config_reset()
51cea161f30b drm/colorop: Rename __drm_colorop_state_reset()
55bd4d36a514 drm/colorop: Create drm_atomic_helper_colorop_create_state()
0513bd53224c drm/atomic-state-helper: Fix __drm_atomic_helper_plane_reset() doc typo
85930e869ba2 drm/atomic-state-helper: Rename __drm_atomic_helper_plane_state_reset()
-:91: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#91: FILE: include/drm/drm_atomic_state_helper.h:57:
+void __drm_atomic_helper_plane_state_init(struct drm_plane_state *state,
 					   struct drm_plane *plane);

total: 0 errors, 0 warnings, 1 checks, 51 lines checked
4c7804697a60 drm/plane: Add new atomic_create_state callback
-:50: WARNING:LONG_LINE_COMMENT: line length of 102 exceeds 100 columns
#50: FILE: drivers/gpu/drm/drm_atomic_state_helper.c:344:
+ * drm_atomic_helper_plane_create_state - default &drm_plane_funcs.atomic_create_state hook for planes

total: 0 errors, 1 warnings, 0 checks, 106 lines checked
1304b4539af8 drm/atomic-state-helper: Rename __drm_atomic_helper_crtc_state_reset()
-:88: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#88: FILE: include/drm/drm_atomic_state_helper.h:44:
+void __drm_atomic_helper_crtc_state_init(struct drm_crtc_state *state,
 					  struct drm_crtc *crtc);

total: 0 errors, 0 warnings, 1 checks, 48 lines checked
382007cbd4cd drm/crtc: Add new atomic_create_state callback
66cb7189d71c drm/atomic-state-helper: Rename __drm_atomic_helper_connector_state_reset()
-:76: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#76: FILE: include/drm/drm_atomic_state_helper.h:74:
+void __drm_atomic_helper_connector_state_init(struct drm_connector_state *conn_state,
 					       struct drm_connector *connector);

total: 0 errors, 0 warnings, 1 checks, 41 lines checked
104462b6a352 drm/hdmi: Rename __drm_atomic_helper_connector_hdmi_reset()
-:51: WARNING:LONG_LINE_COMMENT: line length of 103 exceeds 100 columns
#51: FILE: drivers/gpu/drm/display/drm_hdmi_state_helper.c:309:
+ * __drm_atomic_helper_connector_hdmi_state_init() - Initialize all HDMI @drm_connector_state resources

total: 0 errors, 1 warnings, 0 checks, 76 lines checked
df9589cf015e drm/connector: Add new atomic_create_state callback
-:51: WARNING:LONG_LINE_COMMENT: line length of 114 exceeds 100 columns
#51: FILE: drivers/gpu/drm/drm_atomic_state_helper.c:538:
+ * drm_atomic_helper_connector_create_state - default &drm_connector_funcs.atomic_create_state hook for connectors

-:88: CHECK:BRACES: braces {} should be used on all arms of this statement
#88: FILE: drivers/gpu/drm/drm_connector.c:621:
+	if (connector->funcs->atomic_create_state) {
[...]
+	} else if (connector->funcs->reset)
[...]

total: 0 errors, 1 warnings, 1 checks, 123 lines checked
74fa6af3e01c drm/mode-config: Create drm_mode_config_create_initial_state()
e995973eae70 drm/drv: Switch skeleton to drm_mode_config_create_initial_state()
a5c2dadb0d46 drm/tidss: Convert to atomic_create_state
1c35776ef222 drm/bridge_connector: Convert to atomic_create_state


