Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A77D63923
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 10:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C263F10E6EA;
	Wed, 20 Nov 2024 10:41:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7550D10E051;
 Wed, 20 Nov 2024 10:41:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_DP_DSC_min/max_src_b?=
 =?utf-8?q?pc_fixes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Nov 2024 10:41:40 -0000
Message-ID: <173209930049.678852.12285921384678248856@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120103802.134295-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241120103802.134295-1-ankit.k.nautiyal@intel.com>
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

Series: DP DSC min/max src bpc fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/139490/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: ccf64319402f drm-tip: 2024y-11m-19d-20h-57m-02s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dp: Refactor FEC support check in intel_dp_supports_dsc
Applying: drm/i915/dp: Return early if DSC not supported
Applying: drm/i915/dp: Separate out helper for compute fec_enable
Applying: drm/i915/dp: Remove HAS_DSC macro for intel_dp_dsc_max_src_input_bpc
Applying: drm/i915/dp: Return int from dsc_max/min_src_input_bpc helpers
Applying: drm/i915/dp_mst: Use helpers to get dsc min/max input bpc
Applying: drm/i915/dp: Drop max_requested_bpc for dsc pipe_min/max bpp
Applying: drm/i915/dp: Refactor pipe_bpp limits with dsc
Applying: drm/i915/dp_mst: Refactor pipe_bpp limits with dsc for mst
Applying: drm/i915/dp: Use clamp for pipe_bpp limits with DSC
Applying: drm/i915/dp: Make dsc helpers accept const crtc_state pointers
Applying: drm/i915/dp: Set the DSC link limits intel_dp_compute_config_link_bpp_limits


