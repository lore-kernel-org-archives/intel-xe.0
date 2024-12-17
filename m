Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C025E7716A
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 09:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C8510E8A5;
	Tue, 17 Dec 2024 09:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4p2X4hP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF8E10E8A3;
 Tue, 17 Dec 2024 09:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734427787; x=1765963787;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9F7sx+cZ2xQ1ARckH4GSNR9W3BVWhZ+p3NKhpfrSrnU=;
 b=O4p2X4hPtaCwtno2DRkA+yiFsprqlmF5ES952kba9D2WTVSz63PjNCU/
 SmRyx82sdh3ugO29qulHk5o1xR4T6xuaNrxrHOeuK84cX/01m0u5KlazM
 iz8J4MKHsaHjqu/R9G8gx2Mi/dw9f5LRPnq6IrzUZ3YanhrP1cDJHtsdw
 h5TmRQ+SJvFhSpQ6iB4gCnI/w1HuYjJDYEVOT/c521y9CVYE8rwlYd7KT
 xy2EdQpqmpNKStcmvCuF99sjZsp7avsNYrsZ+U4nSceWLN8rKWwqZSdeW
 nRzWuzINKMjKrDLv5OigkeKA5NKLzjjJTSL0dLmb8lrkah8ZeH/zdfXwF g==;
X-CSE-ConnectionGUID: 3+539o8ZQdabjvzsBWq1xw==
X-CSE-MsgGUID: QRENHxCqTv27lbECAFQIVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34976124"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="34976124"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 01:29:47 -0800
X-CSE-ConnectionGUID: srg3w06gRBuejCh7ueppSw==
X-CSE-MsgGUID: dibgofVLRcSAQu9EtogN2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="98052401"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 01:29:45 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, suraj.kandpal@intel.com,
 jani.nikula@linux.intel.com, imre.deak@intel.com
Subject: [PATCH 00/14] DP DSC min/max src bpc fixes
Date: Tue, 17 Dec 2024 15:02:30 +0530
Message-ID: <20241217093244.3938132-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use helpers for source min/max src bpc appropriately for dp mst case and
to limit max_requested_bpc property min/max values. 

Rev2: Drop patch to limit max_requested_bpc based on src DSC bpc
limits. Instead add change to ignore max_requested_bpc if its
too low for DSC.

Rev3: Update patch#1 commit message.

Rev4: Rebase.

Rev5: Address Jani's comment on patch#3.

Rev6: Rebase.

Rev7: Add patch to fix return type for dsc_min/max_src bpc helpers to
int.

Rev8:
-Drop the first patch.
-Refactor helpers for fec support.
-Add patches to refactor pipe_bpp limits and link limits.

Rev9:
-Address review comments.
-Split patch#3 and patch#6 to 2 patches each.
-Rebase.

Rev10:
-Rebase.
-Few patches dropped after rebase and new patches for crtc_state->limits
for MST.

Ankit Nautiyal (14):
  drm/i915/dp: Refactor FEC support check in intel_dp_supports_dsc
  drm/i915/dp: Return early if DSC not supported
  drm/i915/dp: Separate out helper for compute fec_enable
  drm/i915/dp: Drop check for FEC in intel_dp_fec_compute_config
  drm/i915/dp: Remove HAS_DSC macro for intel_dp_dsc_max_src_input_bpc
  drm/i915/dp: Return int from dsc_max/min_src_input_bpc helpers
  drm/i915/dp_mst: Use helpers to get dsc min/max input bpc
  drm/i915/dp: Drop max_requested_bpc for dsc pipe_min/max bpp
  drm/i915/dp: Refactor pipe_bpp limits with dsc
  drm/i915/dp_mst: Use pipe_bpp->limits.{max/min}_bpp for dsc
  drm/i915/dp: Use clamp for pipe_bpp limits with DSC
  drm/i915/dp: Make dsc helpers accept const crtc_state pointers
  drm/i915/dp: Set the DSC link limits in
    intel_dp_compute_config_link_bpp_limits
  drm/i915/dp_mst: Use link.{min/max}_bpp_x16

 drivers/gpu/drm/i915/display/intel_dp.c     | 177 ++++++++++----------
 drivers/gpu/drm/i915/display/intel_dp.h     |   9 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  30 +---
 3 files changed, 104 insertions(+), 112 deletions(-)

-- 
2.45.2

