Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB47EC43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 17:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A18B10EA03;
	Mon,  6 Jul 2026 17:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ePxDBImn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E673D10E9FD;
 Mon,  6 Jul 2026 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783358452; x=1814894452;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J8U0CB7/YDuDjPYQRhjIjSgq9opovH2ISKY5vmzVir4=;
 b=ePxDBImn7DxpuVPVr5iRi+hbBoBsNbH8U7tF7a5opreUlSW5ykYPg2/t
 eDiP339DLxmVnGnEJTmVJRWUB5iLMYgWMBlSU2dr9euYlM2R7sMgCm8VG
 XQV5m+NVWCix5BLdNAglybJxF16a8tIhw5PZJvDn2kdhUA4+eIIuqgB9U
 ypdWH5J812l8wN1Hsi5JelD4wh71tc87DPfZNxjYaVnfvcI7bMhifPOJ0
 Ow71j8NSdHQOtu45//WWBL4JGRzKXr3rJ6XlRF/bxaxUDiEtDrbd7vBGv
 j+U8AEq1JuJvdNH2/7+qZYtBpNTdckU2yB18JZbMOo3WGe/WVaLgftJ8E Q==;
X-CSE-ConnectionGUID: 6ji7Te/EQsm/rc3HBqtY7Q==
X-CSE-MsgGUID: P4CouFAkRsqvo+Cva64SMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="101417672"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="101417672"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 10:20:51 -0700
X-CSE-ConnectionGUID: 7zxkbQvkRCqvGqbeQ7juRQ==
X-CSE-MsgGUID: h+x24hecRWCW1YSpxe64Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="255704355"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa004.fm.intel.com with ESMTP; 06 Jul 2026 10:20:48 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [v2 0/2] drm/i915/audio: Add HDMI TMDS audio bandwidth check
Date: Mon,  6 Jul 2026 22:26:44 +0530
Message-Id: <20260706165646.2731978-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series adds audio bandwidth validation for HDMI TMDS mode.
When the available hblank period cannot carry the required
audio packets for a given sample rate and channel count, the
corresponding frequencies are pruned from the ELD SADs before they reach
the audio driver.

Sample rates are pruned rather than channel counts because compressed
audio formats like Dolby Digital (AC-3) and DTS require a fixed channel
configuration to decode.

This improves on an earlier attempt which can be seen in [1]

[1] https://lore.kernel.org/intel-gfx/20230615063137.2219870-3-mitulkumar.ajitkumar.golani@intel.com/

v2:
 - Use DIV64_U64_ROUND_UP() instead of DIV_ROUND_UP_ULL() to avoid
   do_div() truncating the 64-bit divisor to 32-bit, which caused
   audio_packets_line to be wildly inflated and all SADs to be pruned.
 - Guard intel_audio_hdmi_eld_compute_config() against HDMI FRL modes.

Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

Chaitanya Kumar Borah (2):
  drm/i915/hdmi: Move audio compute config after format selection
  drm/i915/audio: Prune ELD SADs based on HDMI audio bandwidth

 drivers/gpu/drm/i915/display/intel_audio.c | 149 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdmi.c  |   8 +-
 2 files changed, 153 insertions(+), 4 deletions(-)

-- 
2.25.1

