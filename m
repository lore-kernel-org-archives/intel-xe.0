Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2C4606A324
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 16:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BE910EA89;
	Wed, 11 Nov 2026 16:18:01 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1C710EA88;
 Wed, 11 Nov 2026 16:18:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/atomic=3A_only_add_st?=
 =?utf-8?q?ates_of_active_or_transient_active_colorops?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melissa Wen" <mwen@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Nov 2026 16:18:00 -0000
Message-ID: <179441388082.10647.961311496767149769@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261111160814.21326-1-mwen@igalia.com>
In-Reply-To: <20261111160814.21326-1-mwen@igalia.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/atomic: only add states of active or transient active colorops
URL   : https://patchwork.freedesktop.org/series/178329/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b5653e62472247be2c3009b3e6be788215eda83d
Author: Melissa Wen <mwen@igalia.com>
Date:   Wed Nov 11 17:05:28 2026 +0100

    drm/amd/display: distinguish colorop setup error from no colorop support
    
    amdgpu_dm_plane_set_colorop_properties() returns -EINVAL both when the
    plane has no color pipeline selected, where falling back to the legacy
    color properties is correct, and when programming an active pipeline
    fails, so the caller treats every failure as the former and silently
    programs the plane from the legacy properties, leaving it in a mixed
    state and userspace with no error. Check if plane_state->color_pipeline
    is set instead, so the legacy path is only taken when no pipeline is set
    and any other failure is propagated out of the atomic check. Update
    AMD KUnit color tests accordingly.
    
    Fixes: 9ba25915efba ("drm/amd/display: Add support for sRGB EOTF in DEGAM block")
    Reviewed-by: Harry Wentland <harry.wentland@amd.com>
    Signed-off-by: Melissa Wen <mwen@igalia.com>
+ /mt/dim checkpatch 1434742f20cf3d14b493e40c453536b5414b9762 drm-intel
dea324d78194 drm/amd/display: Update colorop pipeline tests for new fixed matrix op
9bc8f54ac445 drm/amd/display: add missing FIXED_MATRIX colorop to AMD KUnit tests
6cf9986e9c67 drm/atomic: only add states of active or transient active colorops
-:100: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'colorop' - possible side-effects?
#100: FILE: include/drm/drm_colorop.h:586:
+#define drm_for_each_colorop_in_pipeline(colorop, pipeline) \
+	for ((colorop) = (pipeline); (colorop); (colorop) = (colorop)->next)

total: 0 errors, 0 warnings, 1 checks, 80 lines checked
0607b0c8d8dd drm/amd/display: add plane to commit on KUnit cursor mode tests
a366b3dc97df drm/amd/display: only check colorops of an active color pipeline
-:14: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#14: 
Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: d3a549f4df78 ("drm/amd/display: Use overlay cursor when color pipeline is active")

total: 0 errors, 1 warnings, 0 checks, 34 lines checked
3598b3dd36c9 drm/atomic: reject colorop update from inactive color pipeline
75384a90ebbc drm/atomic: duplicate state of all colorops
31ee6baed5c5 drm/atomic: check if an active colorop has a blob if its type requires one
887b7057f9a3 drm/amd/display: truly bypass plane colorop 3x4 matrix and hdr mult
-:47: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#47: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1747:
+			dc_plane_state->hdr_mult = amdgpu_dm_fixpt_from_s3132(colorop_state->multiplier);

total: 0 errors, 1 warnings, 0 checks, 30 lines checked
fc501dab4516 drm/amd/display: make shaper bypass mode cleaner
78587c616b76 drm/amd/display: make blnd bypass mode clearer
f7e649ce2db9 drm/amd/display: don't ignore failure on blend colorop setup
-:10: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#10: 
Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 5ed78b44e4e6 ("drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT")

total: 0 errors, 1 warnings, 0 checks, 38 lines checked
4ab8e0dc325c drm/amd/display: allow individual colorop changes
-:166: CHECK:SPACING: No space is necessary after a cast
#166: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1683:
+		ctm = (struct drm_color_ctm_3x4 *) blob->data;

total: 0 errors, 0 warnings, 1 checks, 403 lines checked
fd1c6e9fca5e drm/atomic: make drm_atomic_add_affected_colorops() static
b5653e624722 drm/amd/display: distinguish colorop setup error from no colorop support


