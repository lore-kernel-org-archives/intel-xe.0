Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322ACE7716B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 09:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0298E10E127;
	Wed,  4 Dec 2024 09:50:28 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C9C10E127;
 Wed,  4 Dec 2024 09:50:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_DP_DSC_min/max_src_bpc_fi?=
 =?utf-8?q?xes_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Dec 2024 09:50:26 -0000
Message-ID: <173330582694.2397466.13233541033404055631@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241204092642.1835807-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241204092642.1835807-1-ankit.k.nautiyal@intel.com>
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

Series: DP DSC min/max src bpc fixes (rev3)
URL   : https://patchwork.freedesktop.org/series/139490/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b5847746f6a8e0435c084f226d1b2d9e2306ea77
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Wed Dec 4 14:56:42 2024 +0530

    drm/i915/dp: Set the DSC link limits intel_dp_compute_config_link_bpp_limits
    
    The helper intel_dp_compute_config_link_bpp_limits is the correct place
    to set the DSC link limits. Move the code to this function and remove
    the #TODO item.
    
    v2: Add argument intel_connector to the helper to get correct connector
    for DP MST. (Imre)
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 01f05d37bed61bd0dddb698bfb2b1fe1e973eec8 drm-intel
d345d6b73522 drm/i915/dp: Refactor FEC support check in intel_dp_supports_dsc
19d2feab0921 drm/i915/dp: Return early if DSC not supported
e8226caef096 drm/i915/dp: Separate out helper for compute fec_enable
22510119e866 drm/i915/dp: Drop check for FEC in intel_dp_fec_compute_config
2ec00b9193d0 drm/i915/dp: Remove HAS_DSC macro for intel_dp_dsc_max_src_input_bpc
a4cd73551fcd drm/i915/dp: Return int from dsc_max/min_src_input_bpc helpers
92420788b42a drm/i915/dp: Use intel_display in intel_dp_dsc_max_src_input_bpc()
8ffb211e144a drm/i915/dp_mst: Use helpers to get dsc min/max input bpc
400e76dba80f drm/i915/dp: Drop max_requested_bpc for dsc pipe_min/max bpp
7f734552def3 drm/i915/dp: Refactor pipe_bpp limits with dsc
a6e637fc5862 drm/i915/dp_mst: Refactor pipe_bpp limits with dsc for mst
ba23f4cb742d drm/i915/dp: Use clamp for pipe_bpp limits with DSC
daf9fdec0b05 drm/i915/dp: Make dsc helpers accept const crtc_state pointers
b5847746f6a8 drm/i915/dp: Set the DSC link limits intel_dp_compute_config_link_bpp_limits


