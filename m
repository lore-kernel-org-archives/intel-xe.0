Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F68C48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 12:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88B010E33E;
	Tue, 13 Feb 2024 12:28:37 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55D610E15B;
 Tue, 13 Feb 2024 12:28:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/mst=3A_enable_MS?=
 =?utf-8?q?T_mode_for_128b/132b_single-stream_sideband?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Feb 2024 12:28:36 -0000
Message-ID: <170782731668.1201024.12355438072722430763@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <cover.1707823736.git.jani.nikula@intel.com>
In-Reply-To: <cover.1707823736.git.jani.nikula@intel.com>
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

Series: drm/i915/mst: enable MST mode for 128b/132b single-stream sideband
URL   : https://patchwork.freedesktop.org/series/129828/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5e2b1fe0b03ce0f47bdcfdca0ee75d9c3af438cf
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Feb 13 13:31:01 2024 +0200

    drm/i915/mst: enable MST mode for 128b/132b single-stream sideband
    
    If the sink supports 128b/132b and single-stream sideband messaging,
    enable MST mode.
    
    With this, the topology manager will still write DP_MSTM_CTRL, which
    should be ignored by the sink. In the future, the topology manager
    should probably only set the sideband messaging related parts of the
    register.
    
    Cc: Arun R Murthy <arun.r.murthy@intel.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 7c8e9135509f2e438e11a4af17387a204ab59884 drm-intel
6d5496cbe drm/mst: read sideband messaging cap
-:127: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#127: FILE: include/drm/display/drm_dp_mst_helper.h:842:
+enum drm_dp_mst_mode drm_dp_read_mst_cap(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);

total: 0 errors, 1 warnings, 0 checks, 90 lines checked
e711430a9 drm/i915/mst: improve debug logging of DP MST mode detect
670ac33e6 drm/i915/mst: abstract choosing the MST mode to use
012da4d09 drm/i915/mst: use the MST mode detected previously
5fc5806e4 drm/i915/mst: add intel_dp_mst_disconnect()
5e2b1fe0b drm/i915/mst: enable MST mode for 128b/132b single-stream sideband


