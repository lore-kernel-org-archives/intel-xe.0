Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783F7C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 07:18:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B6A10EE85;
	Wed, 12 Aug 2026 07:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXpsnhaQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CCF10EE76;
 Wed, 12 Aug 2026 07:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786519095; x=1818055095;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0ShVVrFdWGuIR0lBW816NRJoyXB0pguL8csr2apXDas=;
 b=EXpsnhaQDRwk/VLSDKEVztGEdtulE2VgW472D0Akpd05/jATbCFX5kDi
 qBWLGc/F6ZuIv5KbYigwQ6EFX/uIssO8KMD5D6yJC7rY5X3RPysujh9T8
 dUxeLBBElc4fH0bX4CJ4ses2C0fNUnU2+6ShT86QHhbtI1fDKN1ILLkQE
 ICVHi8O2oGh1FmeLJbDN4XhLhqSU3KClqkn8ml+77rvKaOgoHK3NP9qlE
 cLcZWyxiOq9pEeIIYXhORtEFOIbiCFdC6+ixa/u1DbwCLMq0MZAlBAhbb
 NNROEG63HZVUqV/mASj5ZzwjsS39gWD1eNJEWT9Ef5HUtAQsqhiN1K773 Q==;
X-CSE-ConnectionGUID: 0WS644dVQWOCTyCSbwkQMg==
X-CSE-MsgGUID: lM2jSbLqT16ehmVBPIU3zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="97727627"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="97727627"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 00:18:14 -0700
X-CSE-ConnectionGUID: guoPo74/T6iVNeALmyyprg==
X-CSE-MsgGUID: GKruQrdQR4Km4+MkLF0bbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="260240509"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2026 00:18:12 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [v3 0/2] drm/i915/audio: Add HDMI TMDS audio bandwidth check
Date: Wed, 12 Aug 2026 12:24:25 +0530
Message-ID: <20260812065427.3154985-1-chaitanya.kumar.borah@intel.com>
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
2.50.1

