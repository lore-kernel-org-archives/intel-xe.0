Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBCBEA4FBF
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 13:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD9010E3A4;
	Mon, 23 Feb 2026 13:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TitQcwJj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003A410E2EB;
 Mon, 23 Feb 2026 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771853399; x=1803389399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sEG/VIlh+NDtVmeFekSlFCQFBGFI0TvzI+Zv3hqjkwg=;
 b=TitQcwJjqpBxXV70WOBXhDyiLSLdLwnvNne54YJPdfh1KMZtVcm0XA7J
 opgudPqdWrxVWIvYp5Of9I6fP+M/Doz1Psde9X7Deq/AxyoFjIkRhtN/6
 3RTs4bASbWVziSPpg+6MdBGr+xdYES/yZrttWp5b3pSeqS+Hrg0jSmhik
 Zp5Wdm1RF+DfXQ/a8vz4oBVuFWnFFs4otsrheWlF6C8pjDf6gTMkzCV8M
 8NZNcfNKOrlC7/P/Hfi0oJ14B1AZYvU7DwH1LYYZHxPTtfSo30zuOYzGR
 KNW8mafhWk24YLY/Ahq7ZBLZmzIqDIcnPBnLFb8NDe7HpXcWHQJCsrqoL g==;
X-CSE-ConnectionGUID: SjwLdM0sSF6+BmfiQdbeGw==
X-CSE-MsgGUID: /d4bNMyoSOKGs1+/bn1rNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72724128"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72724128"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 05:29:56 -0800
X-CSE-ConnectionGUID: i4YlxEzOR7WN1kunIW5+vg==
X-CSE-MsgGUID: ERAQLS2sTPCTUOHBq1qXRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="215580164"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 05:29:54 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 00/14] Fix Adaptive Sync SDP for Panel Replay
Date: Mon, 23 Feb 2026 18:44:12 +0530
Message-ID: <20260223131426.1638946-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251111093007.3771409-3-ankit.k.nautiyal@intel.com>
References: <20251111093007.3771409-3-ankit.k.nautiyal@intel.com>
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

Enable Adaptive Sync SDP for Panel replay + auxless ALPM.
First few patches are fixes in existing AS SDP enablement.
Later patches add the support to send AS SDP for Panel replay with Link
ON and with auxless ALPM (Link-Off). 

This series is in continuation from discussions in [1] [2].
[1] https://lore.kernel.org/all/1b8c6c6de1e5fe0db83e6ae942dfee7e6f950767.camel@intel.com/
[2] https://lore.kernel.org/all/aPtqdAxDwiuQZbrn@intel.com/

Rev2:
Add few fixes in AS_SDP and Lobf.

Rev3:
Add patch to avoid VRR with PCON.

Rev4:
- Address review comments.
- Drop Lobf changes. To be sent as a separate series.

Rev5:
- Add AS SDP version and PR and VRR specific bits in drm_dp.h.
- Modify AS SDP compute config to accomodate PR with Link On and Link
  Off.
- Program Downspread Ctrl DPCD bits.
- Make way for T1 and T2 AS SDP transmission timing/position.

Ankit Nautiyal (14):
  drm/i915/dp: Fix readback for target_rr in Adaptive Sync SDP
  drm/i915/vrr: Avoid vrr for PCON with HDMI2.1 sink
  drm/i915/dp: Add a helper to decide if AS SDP is needed
  drm/i915/dp: Update the helper intel_dp_needs_as_sdp() for CMRR
  include/drm/display/dp: Add field for storing AS SDP version
  drm/i915/dp: Use version field of AS SDP data structure
  drm/i915/dp: Compute AS SDP after PSR and LOBF
  drm/i915/dp: Add AS SDP support for PR with link ON
  drm/i915/psr: Add helper to check if PR is with link OFF
  drm/i915/dp: Set relevant Downspread Ctrl DPCD bits for PR + Auxless
    ALPM
  drm/i915/dp: Program AS SDP DB[1:0] for PR with Link off
  include/drm/display/dp: Add DPCD registers for configuring Panel
    Replay + VRR
  drm/i915/display: Add member to store AS SDP transmission time
  drm/i915/dp: Account for AS_SDP guardband only when enabled

 drivers/gpu/drm/display/drm_dp_helper.c       |  1 +
 drivers/gpu/drm/i915/display/intel_alpm.c     | 21 +++++++-
 drivers/gpu/drm/i915/display/intel_display.c  |  3 +-
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 48 ++++++++++++++-----
 .../drm/i915/display/intel_dp_link_training.c | 10 +++-
 .../drm/i915/display/intel_dp_link_training.h |  3 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      | 13 +++++
 drivers/gpu/drm/i915/display/intel_psr.h      |  1 +
 drivers/gpu/drm/i915/display/intel_vrr.c      | 10 ++++
 include/drm/display/drm_dp.h                  |  9 ++++
 include/drm/display/drm_dp_helper.h           |  1 +
 13 files changed, 105 insertions(+), 18 deletions(-)

-- 
2.45.2

