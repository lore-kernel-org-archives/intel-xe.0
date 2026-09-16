Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CE5C88E75
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 02:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61ABF10E101;
	Wed, 16 Sep 2026 02:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZjlNw8f1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADBE10E101;
 Wed, 16 Sep 2026 02:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789527436; x=1821063436;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nsp6cNsTw7lLEm46G5I56c+V4qmlPWT+zKr0AH7ktfA=;
 b=ZjlNw8f1epv6nCeSOB75f3hcxW9VugvtDVEaNpBJ8OVr0xth4liTIgNv
 Zn9WH4jJnN4+dyBe+nhscPtURZRl29WFHpmxER8/rBTWrP7ZWeJMqJHAP
 /Mf8MtF07nC3Qk0zH1jZc2HaZM/aMjhFMWm2XJH32R2/RexUv61ey9EyY
 r1APlzNXSNahb4gOrl+jQuFi1IzfkuGJLrMYPQ42F+BvJSN1h3CdFRw16
 4onQ8qSpH4cSDuZWvnuDSenFUXNw0elkTm6ehwVW1ptTVqzKgFjIQ94Hn
 y3DUM7b6fHIAqsH0drDu10GkKKSKvgyTl/k8ncMsxej1LsvLtnY91DPE3 w==;
X-CSE-ConnectionGUID: 1POlOBCsS7SMNQjjANcaRg==
X-CSE-MsgGUID: MgVNTb98R0+Oi7AIuNNxkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100498324"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100498324"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 19:57:14 -0700
X-CSE-ConnectionGUID: J79f97TQSb6kVSXDlhQyQw==
X-CSE-MsgGUID: AzK6Yk5DQgGg8dSFv7cY6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="311473387"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 15 Sep 2026 19:57:13 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 00/10] Implement Wa_14021768792 to bypass m_n ratio limit
Date: Wed, 16 Sep 2026 08:27:00 +0530
Message-Id: <20260916025710.432281-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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
  drm/i915/dp: Add M/N ratio check with warning for DP link config
  drm/i915/display: Add bits for link_n_extended for DISPLAY >= 14
  drm/i915/display_wa: Add support for Wa_14021768792
  drm/i915/display: Add bits for Wa_14021768792 for linkm/n ratio > 10
  drm/i915/display: Implement Wa_14021768792 for BMG DP for link_m/n
    ratio > 10
  drm/i915/dp: Extend intel_dp_can_support_m_n() for BMG M/N bypass

Suraj Kandpal (2):
  drm/i915/dp: Limit M/N ratio for DP SST
  drm/i915/dp: Bump the max Link M/N ratio to 22 for DISPLAY_VER >= 35

 drivers/gpu/drm/i915/display/intel_display.c  | 122 +++++++++++++--
 drivers/gpu/drm/i915/display/intel_display.h  |   4 +
 .../gpu/drm/i915/display/intel_display_regs.h |  12 ++
 .../drm/i915/display/intel_display_types.h    |   2 +
 .../gpu/drm/i915/display/intel_display_wa.c   |   9 ++
 .../gpu/drm/i915/display/intel_display_wa.h   |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 147 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp.h       |   7 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  13 ++
 9 files changed, 306 insertions(+), 11 deletions(-)

-- 
2.34.1

