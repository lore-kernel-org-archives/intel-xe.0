Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3F5C61DD3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 11:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D813E10E3D0;
	Tue,  1 Sep 2026 11:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhdUa0Q+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB8110E3D0;
 Tue,  1 Sep 2026 11:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788260416; x=1819796416;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G1b9fngnftfY6lUQzwCc5m80e4+/Y3ufVU2ikPIqaXY=;
 b=BhdUa0Q+ryCQgMyyj2vuxxwUEjCE9Rrl1wJhDNR+gjscRefQq4N9UpjZ
 79FEhuK9rmmW/YMOyuC4G07YRDgchUpqpkqc2/7BFj+daWnXK496v3+iR
 +IcIEB/8/lbVF3qM9y5z/EG5qSaFBoUjXuCbg4G219wu+Z/5W/LVYa1AC
 yHZOmJWBPmQiY7gFSpQ/sVbLl6QAqU8W6GceXV9uuQDQYCcA6CB6wlAX3
 2qZay6X4SBOb0Vvwy7te71zW5/tnRi17+x2JI6Nnnn4PWh4YAt4NNJIpg
 sIH2jE+Q56Yk+2JDVsJRnIrN37pVG99wsA5Qz8c6zclf9sYTivcBWhsVT A==;
X-CSE-ConnectionGUID: xxC4qUytSluxKJm9EiM0LA==
X-CSE-MsgGUID: GpE/cRVORdqSIiJgMmQH8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88561545"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="88561545"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 04:00:16 -0700
X-CSE-ConnectionGUID: hw/D/r65SQWejawVNVDBaA==
X-CSE-MsgGUID: 9Qv49OhgQ6q6HcS09KDDMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="298955029"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa002.jf.intel.com with ESMTP; 01 Sep 2026 04:00:14 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [v5 0/2] drm/i915/audio: Add HDMI TMDS audio bandwidth check
Date: Tue,  1 Sep 2026 16:06:37 +0530
Message-ID: <20260901103639.617757-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
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

v3:
 - Rebase

v4:
 - Simply SAD Removal logic (Jani)

v5:
 - Drop the FRL guard, i915 doesn't support FRL yet. (Ankit)
 - s/required_tmds/hblank_audio_min (Ankit)
 - Add HDMI_TMDS_AUDIO_PACKETS_LINE_MAX macro
   instead of a magic number 18. (Ankit)
 - Use drm_eld_sad_get()/drm_eld_sad_set() instead of
   raw ELD byte access. (Ankit)
 - Drop extra blank line. (Ankit)

Chaitanya Kumar Borah (2):
  drm/i915/hdmi: Move audio compute config after format selection
  drm/i915/audio: Prune ELD SADs based on HDMI audio bandwidth

 drivers/gpu/drm/i915/display/intel_audio.c | 153 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdmi.c  |   8 +-
 2 files changed, 157 insertions(+), 4 deletions(-)

-- 
2.50.1

