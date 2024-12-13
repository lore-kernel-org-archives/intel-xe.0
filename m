Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE94E7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 12:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97FB510E261;
	Fri, 13 Dec 2024 12:54:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E31A10E261;
 Fri, 13 Dec 2024 12:54:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=3A_128b/132b_?=
 =?utf-8?q?uncompressed_SST?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Dec 2024 12:54:01 -0000
Message-ID: <173409444111.2141069.4140315992973225847@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1734085515.git.jani.nikula@intel.com>
In-Reply-To: <cover.1734085515.git.jani.nikula@intel.com>
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

Series: drm/i915/dp: 128b/132b uncompressed SST
URL   : https://patchwork.freedesktop.org/series/142548/
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
commit caad8abd9fd04cc75a5fba4334170d2de41ce160
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Dec 13 12:39:57 2024 +0200

    drm/i915/dp: compute config for 128b/132b SST w/o DSC
    
    Enable basic 128b/132b SST functionality without compression. Reuse
    intel_dp_mtp_tu_compute_config() to figure out the TU after we've
    determined we need to use an UHBR rate.
    
    It's slightly complicated as the M/N computation is done in different
    places in MST and SST paths, so we need to avoid trashing the values
    later for UHBR.
    
    If uncompressed UHBR fails, we drop to compressed non-UHBR, which is
    quite likely to fail as well. We still lack 128b/132b SST+DSC.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 8f7b64e137723da601f3c07d0cda22566cf994d5 drm-intel
287e78b994b3 drm/mst: remove mgr parameter and debug logging from drm_dp_get_vc_payload_bw()
f4d4bc35ece0 drm/i915/mst: use intel_dp_compute_config_limits() for DP MST
d61d8bc38b8c drm/i915/mst: drop connector parameter from intel_dp_mst_bw_overhead()
afbc0149fd7e drm/i915/mst: drop connector parameter from intel_dp_mst_compute_m_n()
f7fa98218c10 drm/i915/mst: change return value of mst_stream_find_vcpi_slots_for_bpp()
9ce08129e0fd drm/i915/mst: add helper independent of MST for figuring out the TU
5e0fd5955dbf drm/i915/ddi: enable 128b/132b TRANS_DDI_FUNC_CTL mode for UHBR SST
32c4b62eb893 drm/i915/ddi: 128b/132b SST also needs DP_TP_CTL_MODE_MST
674f54f1cf5a drm/i915/ddi: write payload for 128b/132b SST
53021f04e597 drm/i915/ddi: initialize 128b/132b SST DP2 VFREQ registers
a812805c6f0f drm/i915/ddi: enable ACT handling for 128b/132b SST
0561ae2c59e8 drm/i915/ddi: start distinguishing 128b/132b SST and MST at state readout
caad8abd9fd0 drm/i915/dp: compute config for 128b/132b SST w/o DSC


