Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7299ACD8CA4
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 12:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE2D10E5FB;
	Tue,  9 Jun 2026 12:50:14 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6E210E600;
 Tue,  9 Jun 2026 12:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_don=27t_allow_changes_to_?=
 =?utf-8?q?inactive_colorops_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melissa Wen" <mwen@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Jun 2026 12:50:13 -0000
Message-ID: <178100941323.60453.11327418610291042303@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260609121230.1358786-1-mwen@igalia.com>
In-Reply-To: <20260609121230.1358786-1-mwen@igalia.com>
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

Series: don't allow changes to inactive colorops (rev3)
URL   : https://patchwork.freedesktop.org/series/167294/
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
commit 9ab90121f1d56693cfe94d1a72bb2b6d5dfa5113
Author: Melissa Wen <mwen@igalia.com>
Date:   Tue Jun 9 13:51:41 2026 +0200

    drm/amd/display: allow individual colorop changes
    
    Every AMD colorop helper requires new colorop state to update a single
    active colorop, i.e. if the userspace modifies a single property of a
    colorop, but doesn't resubmit the whole color pipeline, the driver
    rejects the atomic commit, instead of just restore colorop settings from
    committed state. Change all colorop helpers to get the committed state
    if there's no new state for a given colorop. It keeps walking in the
    active color pipeline and update a color block if the related colorop
    changed.
    
    Signed-off-by: Melissa Wen <mwen@igalia.com>
+ /mt/dim checkpatch 1e8798282ef0590ad21ca33d80e225208d9c7864 drm-intel
032def906841 drm/atomic: only add states of active or transient active colorops
-:113: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'colorop' - possible side-effects?
#113: FILE: include/drm/drm_colorop.h:462:
+#define drm_for_each_colorop_in_pipeline(colorop, pipeline) \
+	for ((colorop) = (pipeline); (colorop); (colorop) = (colorop)->next)

total: 0 errors, 0 warnings, 1 checks, 92 lines checked
cd01410327b0 drm/atomic: reject colorop update from inactive color pipeline
47a53753f936 drm/amd/display: don't check colorop status if its in an inactive pipeline
-:15: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#15: 
Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: d3a549f4df78 ("drm/amd/display: Use overlay cursor when color pipeline is active")

total: 0 errors, 1 warnings, 0 checks, 48 lines checked
71a1dd6e4b29 drm/amd/display: truly bypass plane colorop 3x4 matrix and hdr mult
-:44: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#44: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1632:
+			dc_plane_state->hdr_mult = amdgpu_dm_fixpt_from_s3132(colorop_state->multiplier);

total: 0 errors, 1 warnings, 0 checks, 30 lines checked
40cc0431a0ed drm/amd/display: make shaper bypass mode cleaner
-:6: WARNING:TYPO_SPELLING: 'tranfer' may be misspelled - perhaps 'transfer'?
#6: 
Start shaper tranfer function setup in bypass mode, i.e. tf->type ==
             ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 32 lines checked
53515f3958e8 drm/amd/display: fix bnld colorop bypass mode
9ab90121f1d5 drm/amd/display: allow individual colorop changes
-:105: CHECK:SPACING: No space is necessary after a cast
#105: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1576:
+		ctm = (struct drm_color_ctm_3x4 *) blob->data;

total: 0 errors, 0 warnings, 1 checks, 290 lines checked


