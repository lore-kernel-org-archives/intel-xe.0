Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148B3C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 19:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BF688DA9;
	Mon, 24 Feb 2025 19:44:10 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5EB988DA9;
 Mon, 24 Feb 2025 19:44:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=5Fmst=3A_Fix_?=
 =?utf-8?q?encoder_HW_state_readout_for_UHBR_MST?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Feb 2025 19:44:09 -0000
Message-ID: <174042624980.1702672.11189917544322819510@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224093242.1859583-1-imre.deak@intel.com>
In-Reply-To: <20250224093242.1859583-1-imre.deak@intel.com>
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

Series: drm/i915/dp_mst: Fix encoder HW state readout for UHBR MST
URL   : https://patchwork.freedesktop.org/series/145328/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 25176bac2fb118e475772c63843a86c2de96ce81
Author: Imre Deak <imre.deak@intel.com>
Date:   Mon Feb 24 11:32:42 2025 +0200

    drm/i915/dp_mst: Fix encoder HW state readout for UHBR MST
    
    The encoder HW/SW state verification should use a SW state which stays
    unchanged while the encoder/output is active. The intel_dp::is_mst flag
    used during state computation to choose between the DP SST/MST modes can
    change while the output is active, if the sink gets disconnected or the
    MST topology is removed for another reason. A subsequent state
    verification using intel_dp::is_mst leads then to a mismatch if the
    output is disabled/re-enabled without recomputing its state.
    
    Use the encoder's active MST link count instead, which will be always
    non-zero for an active MST output and will be zero for SST.
    
    Fixes: 35d2e4b75649 ("drm/i915/ddi: start distinguishing 128b/132b SST and MST at state readout")
    Fixes: 40d489fac0e8 ("drm/i915/ddi: handle 128b/132b SST in intel_ddi_read_func_ctl()")
    Cc: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 9c30a334a46272b014f3923d3d5c29ba0f962de7 drm-intel
25176bac2fb1 drm/i915/dp_mst: Fix encoder HW state readout for UHBR MST


