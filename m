Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDFDC54FC6
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 13:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF33010EDF9;
	Wed, 21 May 2025 13:57:39 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228DD14BB2C;
 Wed, 21 May 2025 13:09:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=3A_Fix_the_en?=
 =?utf-8?q?abling/disabling_of_audio_SDP_splitting_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 May 2025 13:09:26 -0000
Message-ID: <174783296613.9489.6043613028922032761@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250520142219.1688401-1-imre.deak@intel.com>
In-Reply-To: <20250520142219.1688401-1-imre.deak@intel.com>
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

Series: drm/i915/dp: Fix the enabling/disabling of audio SDP splitting (rev2)
URL   : https://patchwork.freedesktop.org/series/149254/
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
commit add661acc8e960ed361be546984f281dfc8bb096
Author: Imre Deak <imre.deak@intel.com>
Date:   Tue May 20 17:22:19 2025 +0300

    drm/i915/dp: Fix the enabling/disabling of audio SDP splitting
    
    Adjust the enabling/disabling steps of the DP audio SDP splitting
    according to a recent Bspec update. This moves the enabling to the audio
    codec enable sequence after the transcoder is enabled and disables SDP
    splitting explicitly during the audio disable sequence.
    
    Bspec requires waiting for a vblank event after the transcoder is
    enabled and before SDP splitting is enabled. There is no need for an
    explicit wait for this, since after the transcoder is enabled this
    vblank event is guaranteed to have happened via a flip done wait (see
    intel_atomic_commit_tail() -> drm_atomic_helper_wait_for_flip_done()).
    
    The bspec update is for LNL+ only, but the HW team clarified that this
    has been always the intended sequence on all platforms and bspec will be
    updated everywhere accordingly.
    
    The way SDP splitting was originally enabled matched the version of
    bspec at that time. Adding here the Fixes: line still, since this
    change fixes a FIFO underrun on PTL during output enabling when DSC is
    enabled.
    
    Bspec: 49283, 68943
    Fixes: 8853750dbad8 ("drm/i915: Enable SDP split for DP2.0")
    Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
    Acked-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch 3695d568b260d85e65f9331ca1180a9dd2b5560b drm-intel
add661acc8e9 drm/i915/dp: Fix the enabling/disabling of audio SDP splitting


