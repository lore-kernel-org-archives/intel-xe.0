Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9991FC5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 12:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC9310F2E8;
	Thu, 13 Aug 2026 12:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jSsv1D5X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F7910F2E8;
 Thu, 13 Aug 2026 12:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786623850; x=1818159850;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S/yCi7ulU6RM7w3ZDKoUi6qzyk7PuRX00zBaLBI4LHU=;
 b=jSsv1D5XsKCtaSQAJaS8kYZ6cYcfhoaruywL7fdMbZtphAS6KW+oQGfl
 SkhgP/XoX/mRBYnpyWP6FeHnfk9vz8aNI05peb8ZIJz1AXo3dj0notsfZ
 nldrT28GTbBSDmzS4RgKTAq0/VIXrh+8NC3lIf2ChlStFNCARTpLiQYVX
 lz3wUD3gVsOLWjapqn32v+YEIUiOgB5HOaANZMjlwppFbdVRB4YRvtjMn
 GggiZGP+KCc7vhMnGtNPPVJH2I15TtAyc8wK45ZuSNJqQPqkLpSTcgJ1r
 VW00R3R06vOhtCuuvDTtFD2860Id9ADCy6X4QEXr40ZmFLEQSqAzikQhW A==;
X-CSE-ConnectionGUID: /YPILJFvRie4Jfg6AjUeXQ==
X-CSE-MsgGUID: OwVOMcsMQ9WNmkhqrhcgJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86314058"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="86314058"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 05:24:10 -0700
X-CSE-ConnectionGUID: 2yWaVWl+TtG8B86Otw5Z3g==
X-CSE-MsgGUID: NHTLziMISH2mz8n9aGD4eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="260652270"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa007.fm.intel.com with ESMTP; 13 Aug 2026 05:24:09 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [v4 0/2] drm/i915/audio: Add HDMI TMDS audio bandwidth check
Date: Thu, 13 Aug 2026 17:30:14 +0530
Message-ID: <20260813120016.3444891-1-chaitanya.kumar.borah@intel.com>
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

Chaitanya Kumar Borah (2):
  drm/i915/hdmi: Move audio compute config after format selection
  drm/i915/audio: Prune ELD SADs based on HDMI audio bandwidth

 drivers/gpu/drm/i915/display/intel_audio.c | 156 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdmi.c  |   8 +-
 2 files changed, 160 insertions(+), 4 deletions(-)

-- 
2.50.1

