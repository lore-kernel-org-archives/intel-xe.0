Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CF2E77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 21:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A60310EDF1;
	Thu, 19 Dec 2024 21:40:42 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB86B10EDE8;
 Thu, 19 Dec 2024 21:40:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/dp=3A_128b/?=
 =?utf-8?q?132b_uncompressed_SST_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Dec 2024 21:40:40 -0000
Message-ID: <173464444082.549164.11831188896883814652@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1734643485.git.jani.nikula@intel.com>
In-Reply-To: <cover.1734643485.git.jani.nikula@intel.com>
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

Series: drm/i915/dp: 128b/132b uncompressed SST (rev2)
URL   : https://patchwork.freedesktop.org/series/142548/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a5b4c40929f3 drm-tip: 2024y-12m-19d-15h-56m-38s UTC integration manifest
=== git am output follows ===
Applying: drm/mst: remove mgr parameter and debug logging from drm_dp_get_vc_payload_bw()
Applying: drm/i915/mst: drop connector parameter from intel_dp_mst_bw_overhead()
Applying: drm/i915/mst: drop connector parameter from intel_dp_mst_compute_m_n()
Applying: drm/i915/mst: change return value of mst_stream_find_vcpi_slots_for_bpp()
Applying: drm/i915/mst: remove crtc_state->pbn
Applying: drm/i915/mst: split out a helper for figuring out the TU
Applying: drm/i915/mst: adapt intel_dp_mtp_tu_compute_config() for 128b/132b SST
Applying: drm/i915/ddi: enable 128b/132b TRANS_DDI_FUNC_CTL mode for UHBR SST
Applying: drm/i915/ddi: 128b/132b SST also needs DP_TP_CTL_MODE_MST
Applying: drm/i915/ddi: write payload for 128b/132b SST
Applying: drm/i915/ddi: initialize 128b/132b SST DP2 VFREQ registers
Applying: drm/i915/ddi: enable ACT handling for 128b/132b SST
Applying: drm/i915/ddi: start distinguishing 128b/132b SST and MST at state readout
Applying: drm/i915/ddi: handle 128b/132b SST in intel_ddi_read_func_ctl()
Applying: drm/i915/ddi: disable trancoder port select for 128b/132b SST
Applying: drm/i915/dp: compute config for 128b/132b SST w/o DSC


