Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA05D606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 03:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XBIbC0U1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBAC10E26C;
	Thu, 22 Oct 2026 03:23:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB1010E26C;
 Thu, 22 Oct 2026 03:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792639375; x=1824175375;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CiyipC05mORPXm70C4ZOexHN/l1317ilcRQA5QFja0I=;
 b=XBIbC0U1l11DPwJBmY9ec5qVkGAxuRiDOmzTqmSLeFpCbW1X+C6XxL2d
 28M7084HrcAcqc2pKn/i5Aby8QsaaJN14aKutU8lZGVlE76kfh2ggpNZT
 pQKRGD93oLoZRfPzUR2lQ+ODfDVH14DZLOPwuvqIHHRRhJcxiUuHANqGh
 kZCo5t2e/nxUJTbqyszQloC+HlFRJKYeLGrBdheCG3z0fyFDZ5JefKl18
 n8ZIRwDY4kyVhGFsXNb7O3Bid1vb/R4IR/1vbe7gffqwr3vt8Kpd38PiC
 jR2bUy+BkSeh43o3Zunwx8Tl+Qm6usG5af2oWi86+/GW68wjJH50uditb g==;
X-CSE-ConnectionGUID: /F/GKSdUSPmPXylo4PlYXA==
X-CSE-MsgGUID: V0inRZ5/SVera8DYARLXnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1383483"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1383483"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 20:22:55 -0700
X-CSE-ConnectionGUID: 57aXIEcdREmjZXfSB8jrDw==
X-CSE-MsgGUID: D/T6Tx3XQjODfUcOCAob6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3197258"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 21 Oct 2026 20:22:54 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v7 00/13] Implement Wa_14021768792 to bypass m_n ratio limit
Date: Thu, 22 Oct 2026 08:52:34 +0530
Message-Id: <20261022032247.1378809-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For Platforms that support higher link rates, there is a limitation on
Link M /Link N ratio.
If the CEILING( Link M / Link N ) ratio is greater than 10.0, then
hardware cannot support the given resolution / refresh rate at the given
configuration.
For BMG Wa_14021768792 helps to bypass this limitation and allows it to
support the ratio till 15.0.

This series adds the missing restrictions for earlier platforms and adds
the Wa_14021768792 for BMG as per Bspec:49266

Ankit Nautiyal (8):
  drm/i915/display: Add helper to compute link M/N ratio for reuse
  drm/i915/dp_mst: Limit M/N ratio for MST
  drm/i915/dp: Add M/N ratio check for DP link config
  drm/i915/display: Add bits for link_n_extended for DISPLAY >= 14
  drm/i915/display_wa: Add support for Wa_14021768792
  drm/i915/display: Add bits for Wa_14021768792 for linkm/n ratio > 10
  drm/i915/display: Implement Wa_14021768792 for BMG DP for link_m/n
    ratio > 10
  drm/i915/dp: Extend intel_dp_can_support_m_n() for BMG M/N bypass

Suraj Kandpal (5):
  drm/i915/dp: Limit M/N ratio for DP
  drm/i915/display_wa: Add support for Wa_14014191401
  drm/i915/display: Compare bypass_m_n_ratio_limit in the state checker
  drm/i915/display: Dump bypass_m_n_ratio_limit in the crtc state dump
  drm/i915/dp: Bump the max Link M/N ratio to 22 for DISPLAY_VER >= 35

 .../drm/i915/display/intel_crtc_state_dump.c  |   6 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 113 +++++++++++-
 drivers/gpu/drm/i915/display/intel_display.h  |   4 +
 .../gpu/drm/i915/display/intel_display_regs.h |  12 ++
 .../drm/i915/display/intel_display_types.h    |   2 +
 .../gpu/drm/i915/display/intel_display_wa.c   |  11 ++
 .../gpu/drm/i915/display/intel_display_wa.h   |   2 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 167 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp.h       |   6 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   7 +
 10 files changed, 321 insertions(+), 9 deletions(-)

-- 
2.34.1

