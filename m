Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F0F606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GqsRk/sw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E775310E57D;
	Fri, 23 Oct 2026 05:02:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2F710E00B;
 Fri, 23 Oct 2026 05:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792731753; x=1824267753;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8EUdWmdrnNcqi+GYr/topMI7Mf7654JwC+JHdRnAU7Y=;
 b=GqsRk/swbOcpXC+bvqDYuSjfS6+YJaJ6QR7Ahjh8MmubA++mrmYiBXYJ
 kdmxyW6s6QRaTc9DZUh253T/6hh3+Dx6WdPkCtHMmL3odILSX8MOH9ssI
 DgrE3tqAO1DqgpRq8OKWeuYro5Cn0Q63Jn8EbNshhkLnr7QNjnU5DW/9k
 1c90B2d0K6pjjlYDmoqQZ0i3Z+/e6ct8OTnDuavgGMTlr8UEkX4TPKF/B
 yFG2zYd33R2v4qMhs49KtvkAEPOCAEZws6MNncO4/R/nr/U/SeAtTEypt
 sEeAgy84/Mh/Z2d9gXaYehBKffyIoWejb4GUo4e+/aPjZ75W2j2ouM09B w==;
X-CSE-ConnectionGUID: Qyf7xYjsQeeYyAHDWKHC9A==
X-CSE-MsgGUID: pgpyr6mlSY+rDlp+bFzskw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1499147"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1499147"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:02:32 -0700
X-CSE-ConnectionGUID: NiaGBNZ3S3OeHwM3dxnTng==
X-CSE-MsgGUID: RNoyh+TJRaaUPRWsWskXbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3926555"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 22 Oct 2026 22:02:30 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v8 00/14] Implement Wa_14021768792 to bypass m_n ratio limit
Date: Fri, 23 Oct 2026 10:32:13 +0530
Message-Id: <20261023050227.2068466-1-suraj.kandpal@intel.com>
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Ankit Nautiyal (7):
  drm/i915/display: Add helper to compute link M/N ratio for reuse
  drm/i915/dp_mst: Limit M/N ratio for MST
  drm/i915/dp: Add M/N ratio check for DP link config
  drm/i915/display: Add bits for link_n_extended for DISPLAY >= 14
  drm/i915/display_wa: Add support for Wa_14021768792
  drm/i915/display: Implement Wa_14021768792 for BMG DP for link_m/n
    ratio > 10
  drm/i915/dp: Extend intel_dp_can_support_m_n() for BMG M/N bypass

Suraj Kandpal (7):
  drm/i915/dp: Limit M/N ratio for DP
  drm/i915/display_wa: Add support for Wa_14014191401
  drm/i915/display: Add bits for Wa_14021768792 for linkm/n ratio > 10
  drm/i915/display: Program Wa_14021768792 for linkm/n ratio > 10
  drm/i915/display: Read back and compare Wa_14021768792 state
  drm/i915/display: Dump bypass_m_n_ratio_limit in the crtc state dump
  drm/i915/dp: Bump the max Link M/N ratio to 22 for DISPLAY_VER >= 35

 .../drm/i915/display/intel_crtc_state_dump.c  |   6 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 113 +++++++++++-
 drivers/gpu/drm/i915/display/intel_display.h  |   4 +
 .../gpu/drm/i915/display/intel_display_regs.h |  12 ++
 .../drm/i915/display/intel_display_types.h    |   2 +
 .../gpu/drm/i915/display/intel_display_wa.c   |  11 ++
 .../gpu/drm/i915/display/intel_display_wa.h   |   2 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 173 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp.h       |   8 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   7 +
 10 files changed, 329 insertions(+), 9 deletions(-)

-- 
2.34.1

