Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE943606A32C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J6bYPTJY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA52112A89;
	Fri, 20 Nov 2026 14:23:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF06910E1C7;
 Fri, 20 Nov 2026 14:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184589; x=1826720589;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LGXdn3W8gZ9tio//QtCYo9HEsfrbCXmSWkqKMjvRoMg=;
 b=J6bYPTJYbftX+EOtABq/TvkE06gx9nMJTBFiUJKhdUVNFVJX4msTpmyv
 7vmcylRNJ+sWk/obda3Co2yX51lHwDR1bIe1P1Oho4cyzt4L3ptc6EIbP
 JVQw2V/RpbIWc3NZUZ2QFycuRu3i7fIpKe7NFPfDckD4tgy3hxOa+1QKU
 r02aUjTQDS345jEnvRMby01njXCWQyO5cahC/ZQMbJkHLJbE1P2SDq7HY
 MvCa/JQ+gQTuTA0msbqaWfj/zBRFok3uT9BjfZVRjv4RsEN1IV5fVzqjA
 oXIsYntZtFvjx4j+nE2gi/1P7vSXBD2MuoEOa27b3L7+BYp9TmkuodFjq Q==;
X-CSE-ConnectionGUID: BT8SOhPTQJ6ddRrwICT+Cw==
X-CSE-MsgGUID: GRyzoWq8SFmUaNBU2p4Q3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4090883"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4090883"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:08 -0800
X-CSE-ConnectionGUID: lp0p1VBfSQ+tULxaNOUlIw==
X-CSE-MsgGUID: tRN/tGqAQZi6UnzkLYJH5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12421979"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:07 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 00/29] DP-HDMI PCON DSC fixes
Date: Fri, 20 Nov 2026 19:37:00 +0530
Message-ID: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PCON mode_valid path currently does not fully account for the bandwidth
limitations of the PCON <-> HDMI link. The DSC capability between the
PCON and the HDMI sink also needs to be taken into account, which currently
isn't. Furthermore, the compressed bpp chosen needs to fit the
FRL configuration, which is also missing.

This series:
 - reworks the HDMI DSC helpers so they can be reused across the
   mode_valid, compute_config and FRL bandwidth check paths
 - fixes the FRL/TMDS downstream bandwidth checks, and allows
   PCON DSC modes through the FRL check
 - Clamps the programmed DSC bpp to the FRL link bandwidth.
 - Adds the PCON DSC operations (decode, decode and re-encode and
   pass-through), and uses the FRL rate of the stream on the HDMI link.

This series is sent as a whole to have all the solution in one place.
It will be split in 3 series and merged in this order:
 1. Groundwork (patches 1-9): FRL/TMDS downstream bandwidth checks and
    the HDMI DSC helpers. A couple of patches are still to be reviewed,
    so these will be separated out for CI testing and merged first.
 2. PCON DSC operations (patches 10-21): PCON DSC state, decode and
    decode and re-encode operations and the FRL rate of the stream.
 3. DSC pass-through (patches 22-29): pass-through of a DSC 1.2a stream,
    within the limits of the HDMI sink.

Rev2:
 - Rebase and address comments from Suraj.
 - Drop drm/i915/dp: Use FRL pair check for the DFP dotclock limit as no
   longer required.

Rev3:
 - Address Comments from Sashiko.
 - Account for FRL encoding overhead during bw calculation.
 - Pass pixel clock instead of using mode->crtc_clock to make it work
   with mode-valid case.
 - Clamp the target bpp only when it equals the pipe bpp to avoid
   missing the case when dsc min_bpp and max_bpp are same.

Rev4:
 - Add the PCON DSC operations as per DP Spec: decode,
   decode and re-encode, and pass-through for a DSC 1.2a stream.
 - Add the PCON DSC state to crtc_state, compute the operation and the
   PCON DSC encoder parameters in compute_config, and only program them
   at enable. Disable the PCON DSC encoder unless it is needed.
 - Enable DSC pass-through in the PCON, and limit the slice count and
   the compressed bpp of the DP stream to what the HDMI sink supports.
 - Store the FRL rate in crtc_state, use the regular or the DSC max FRL
   rate depending on the stream on the HDMI link, and retrain the FRL
   link from the link check work.
 - Use link bpp instead of pipe bpp in the target_bpp clamp patch and
   reuse intel_dp_output_format_link_bpp_x16(). (Suraj)

Ankit Nautiyal (29):
  drm/i915/hdmi: Split the intel_hdmi_dsc_get_bpp()
  drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
  drm/i915/dp: Add a wrapper to check frl/tmds downstream constraints
  drm/i915/dp: Use the common downstream bw check in compute_bpc
  drm/i915/hdmi: Expose DSC min/max bpp helpers
  drm/i915/hdmi: Add helper to check if DSC chunksize fits the sink
    limits
  drm/i915/hdmi: Pass pixel clock to DSC slice helper
  drm/i915/dp: Account for FRL 16b/18b encoding overhead
  drm/i915/hdmi: Clamp the target_bpp only when it equals the link bpp
  drm/i915/dp: Add PCON DSC state to crtc_state
  drm/dp: Add a helper to disable the PCON DSC encoder
  drm/i915/dp: Compute the PCON DSC operation
  drm/i915/dp: Disable the PCON DSC encoder unless it is needed
  drm/i915/dp: Clamp PCON DSC bpp to the FRL link bandwidth
  drm/i915/dp: Add a helper for the DSC stream version
  drm/i915/dp: Add a helper for the FRL payload bandwidth
  drm/i915/dp: Compute the PCON DSC encoder parameters
  drm/i915/dp: Retrain the PCON FRL link from the link check work
  drm/i915/dp: Store the PCON FRL rate in the crtc state
  drm/i915/dp: Use the FRL rate of the stream on the HDMI link
  drm/i915/dp: Allow PCON DSC modes through the FRL bw check
  drm/i915/dp: Enable DSC pass-through in the PCON
  drm/i915/dp: Limit the DP link bpp for DSC pass-through to the FRL
    bandwidth
  drm/i915/dp: Select DSC pass-through in the PCON for DSC 1.2a streams
  drm/i915/dp: Allow limiting the DSC slice count for the downstream
    device
  drm/i915/dp: Check the HDMI sink slice limits for DSC pass-through
  drm/i915/dp: Pick the DSC slice count for pass-through within the HDMI
    limits
  drm/i915/dp: Limit the compressed bpp for pass-through to the HDMI
    sink
  drm/i915/dp: Accept DSC 1.2a pass-through modes in the PCON mode check

 drivers/gpu/drm/display/drm_dp_helper.c       |  23 +
 drivers/gpu/drm/i915/display/g4x_dp.c         |   2 +-
 .../drm/i915/display/intel_crtc_state_dump.c  |  17 +
 drivers/gpu/drm/i915/display/intel_ddi.c      |   4 +-
 .../drm/i915/display/intel_display_types.h    |  31 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 668 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_dp.h       |  13 +-
 .../drm/i915/display/intel_dp_link_training.c |   5 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 138 +++-
 drivers/gpu/drm/i915/display/intel_hdmi.h     |   8 +-
 include/drm/display/drm_dp_helper.h           |   1 +
 11 files changed, 731 insertions(+), 179 deletions(-)

-- 
2.50.1

