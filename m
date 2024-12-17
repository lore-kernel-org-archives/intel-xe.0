Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A05E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 13:09:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECA810E40D;
	Tue, 17 Dec 2024 13:09:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B2910E96A;
 Tue, 17 Dec 2024 13:09:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_DP_DSC_min/max_src_bpc_fi?=
 =?utf-8?q?xes_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Dec 2024 13:09:15 -0000
Message-ID: <173444095520.3813373.16170942235087768601@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217093244.3938132-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241217093244.3938132-1-ankit.k.nautiyal@intel.com>
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

Series: DP DSC min/max src bpc fixes (rev4)
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
commit 5e8f8ae226e421ea52e8ffce5e088a7023341b8f
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Tue Dec 17 15:02:44 2024 +0530

    drm/i915/dp_mst: Use link.{min/max}_bpp_x16
    
    The link.{min/max}_bpp_x16 is already set in crtc_state, use that while
    computing link config for MST.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch ff2d4c1b285a836d28341cdf04adbc811757d4c8 drm-intel
ae817877ccd2 drm/i915/dp: Refactor FEC support check in intel_dp_supports_dsc
3bc9866ba291 drm/i915/dp: Return early if DSC not supported
faa27f8750b3 drm/i915/dp: Separate out helper for compute fec_enable
783dc5f1f61a drm/i915/dp: Drop check for FEC in intel_dp_fec_compute_config
f73bbb5ce90f drm/i915/dp: Remove HAS_DSC macro for intel_dp_dsc_max_src_input_bpc
e503b5c07ff4 drm/i915/dp: Return int from dsc_max/min_src_input_bpc helpers
2d18bcf85c66 drm/i915/dp_mst: Use helpers to get dsc min/max input bpc
07a97c60127a drm/i915/dp: Drop max_requested_bpc for dsc pipe_min/max bpp
fe10c02432f5 drm/i915/dp: Refactor pipe_bpp limits with dsc
f243b7a113e8 drm/i915/dp_mst: Use pipe_bpp->limits.{max/min}_bpp for dsc
d333c8041292 drm/i915/dp: Use clamp for pipe_bpp limits with DSC
7ede017f1b28 drm/i915/dp: Make dsc helpers accept const crtc_state pointers
eacdf1425779 drm/i915/dp: Set the DSC link limits in intel_dp_compute_config_link_bpp_limits
5e8f8ae226e4 drm/i915/dp_mst: Use link.{min/max}_bpp_x16


