Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52835E77197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 11:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DAC10E3F4;
	Tue,  7 Jan 2025 11:08:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AB010E3F4;
 Tue,  7 Jan 2025 11:08:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_128b/132b_?=
 =?utf-8?q?uncompressed_SST_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Jan 2025 11:08:01 -0000
Message-ID: <173624808158.762007.12784979278870464874@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1735912293.git.jani.nikula@intel.com>
In-Reply-To: <cover.1735912293.git.jani.nikula@intel.com>
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

Series: drm/i915/dp: 128b/132b uncompressed SST (rev5)
URL   : https://patchwork.freedesktop.org/series/142548/
State : warning

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
commit 7e2383fec9329c16409ba0cfd9961b9ac1e8c9ef
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Jan 3 15:52:39 2025 +0200

    drm/i915/dp: compute config for 128b/132b SST w/o DSC
    
    Enable basic 128b/132b SST functionality without compression. Reuse
    intel_dp_mtp_tu_compute_config() to figure out the TU after we've
    determined we need to use an UHBR rate.
    
    It's slightly complicated as the M/N computation is done in different
    places in MST and SST paths, so we need to avoid trashing the values
    later for UHBR.
    
    If uncompressed UHBR fails, we drop to compressed non-UHBR, which is
    quite likely to fail as well. We still lack 128b/132b SST+DSC.
    
    We need mst_master_transcoder also for 128b/132b SST. Use cpu_transcoder
    directly. Enhanced framing is "don't care" for 128b/132b link.
    
    v2: mst_master_transcoder, enhanced framing (Imre)
    
    Reviewed-by: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch a39a4fbf8a995eaff7494102f992bec5284fae84 drm-intel
fe4b2f72ae78 drm/mst: remove mgr parameter and debug logging from drm_dp_get_vc_payload_bw()
523870aab78a drm/i915/mst: drop connector parameter from intel_dp_mst_bw_overhead()
9b0ea9ff32ad drm/i915/mst: drop connector parameter from intel_dp_mst_compute_m_n()
903f838c3ff6 drm/i915/mst: change return value of mst_stream_find_vcpi_slots_for_bpp()
dc65e6c87a52 drm/i915/mst: remove crtc_state->pbn
3dabc74dcf57 drm/i915/mst: split out a helper for figuring out the TU
4c904985c36a drm/i915/mst: adapt intel_dp_mtp_tu_compute_config() for 128b/132b SST
-:87: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#87: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:280:
+								      true, dsc_slice_count, link_bpp_x16);

total: 0 errors, 1 warnings, 0 checks, 128 lines checked
08ca9a818954 drm/i915/ddi: enable 128b/132b TRANS_DDI_FUNC_CTL mode for UHBR SST
cca7fa5d1731 drm/i915/ddi: 128b/132b SST also needs DP_TP_CTL_MODE_MST
c1b5608329c9 drm/i915/ddi: write payload for 128b/132b SST
b6b19ed9e1ea drm/i915/ddi: initialize 128b/132b SST DP2 VFREQ registers
14a58331aba1 drm/i915/ddi: enable ACT handling for 128b/132b SST
6e8fa11d0858 drm/i915/ddi: start distinguishing 128b/132b SST and MST at state readout
0c8c330b47e6 drm/i915/ddi: handle 128b/132b SST in intel_ddi_read_func_ctl()
db74e4413c4b drm/i915/ddi: disable trancoder port select for 128b/132b SST
7e2383fec932 drm/i915/dp: compute config for 128b/132b SST w/o DSC


