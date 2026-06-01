Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4423CCD6E56
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 12:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F111B113308;
	Mon,  1 Jun 2026 12:56:41 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB5211330A;
 Mon,  1 Jun 2026 12:56:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/dp/i915=3A_drm/i915/d?=
 =?utf-8?q?p=5Flink=3A_Refactor_DP_link_recovery_logic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jun 2026 12:56:39 -0000
Message-ID: <178031859989.30505.3375432615039546161@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260601093836.3057345-1-imre.deak@intel.com>
In-Reply-To: <20260601093836.3057345-1-imre.deak@intel.com>
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

Series: drm/dp/i915: drm/i915/dp_link: Refactor DP link recovery logic
URL   : https://patchwork.freedesktop.org/series/167646/
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
commit 522748cff3b8da46d89d5342a12f3ae394f99198
Author: Imre Deak <imre.deak@intel.com>
Date:   Mon Jun 1 12:38:35 2026 +0300

    drm/i915/dp_link_training: Document DP link recovery logic
    
    Add kernel-doc documentation describing the Intel DP link training
    recovery state machine and the sequence of automatic retraining,
    fallback selection, and userspace notification.
    
    v2:
    - Rebase on dedicated intel-display documentation change.
    - Remove unnecessary indent in section bodies. (Jani)
    - Add recovery flowcharts. (Jani)
    
    Cc: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 8133a9f4c4fd407e81df71530490836a1170bb2f drm-intel
1a8cc6377308 drm/i915/dp_link_training: Introduce link training state struct
18bff482cbf7 drm/i915/dp_link_training: Factor out link training state reset helper
c2ec8e7cb687 drm/i915/dp_link_training: Flush commits in debugfs entries
4b6c6fba762f drm/i915/dp_link_training: Move link training helpers to link training code
656bfe237e23 drm/i915/dp_link_training: Use link_training as base pointer in debugfs
a862e72da657 drm/i915/dp_link_training: Add helpers to access force retrain state
9f97650eb339 drm/i915/dp_link_training: Move link recovery/debug state to link_training
9d2685418fac drm/i915/dp_link_training: Prevent repeated autoretrain attempts
62b139b62ce6 drm/i915/dp_link_training: Clamp sequential link training failure counter
88e5626ca8b0 drm/i915/dp_link_training: Check for pending autoretrain explicitly
a5250fe3b4ed drm/i915/dp_link_training: Add helper to query pending autoretrain
859d5647e1d7 drm/i915/dp_link_training: Add helper to query allowed autoretrain
069b29b8f534 drm/i915/dp_link_training: Add helper to mark link training failure
7ad4d4340919 drm/i915/dp_link_training: Add helper to reset link recovery state
ba0f65e29191 drm/i915/dp_link_training: Track link recovery state with an enum
-:131: CHECK:LINE_SPACING: Please don't use multiple blank lines
#131: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:1370:
 
+

total: 0 errors, 0 warnings, 1 checks, 111 lines checked
5bef5b59ec01 drm/i915/dp_link_training: Add no-fallback link recovery state
49d7fe2bd0a9 drm/i915/display: Factor out a helper to modeset a pipe with atomic state
a76f9ddd45f8 drm/i915/display: Simplify intel_modeset_commit_pipes_for_atomic_state()
07e48be14e2c drm/i915/dp_link_training: Allocate atomic state for autoretrain modeset
3549076b5c92 drm/i915/dp_link_training: Disallow autoretrains after failed modeset
8a58d31be108 drm/i915/dp_link_training: Fix kernel-doc of intel_dp_init_lttpr_and_dprx_caps()
522748cff3b8 drm/i915/dp_link_training: Document DP link recovery logic
-:19: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#19: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 350 lines checked


