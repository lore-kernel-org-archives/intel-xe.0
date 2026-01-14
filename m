Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB40D31A0C
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 03:43:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C44010E002;
	Wed, 14 Jan 2026 03:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EybW0rCq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B0110E002;
 Wed, 14 Jan 2026 03:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768362185; x=1799898185;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4bjZg1soIfuDYnzf0DorcPXgdyRJvhoCUwC5/5VBecs=;
 b=EybW0rCq0cscuYkzuWUlADMRNVoG40mk1a/J5khmeJ6yXezIiht/WT94
 E3B4Cv9N8jfeJ/47I7ysKCU6Hedws5lLK2IMdW39oM4UrhkqmG3Ctqfgu
 sfOlBeZMim1MMJQWRrVCj3Mclv/FofszPxRUf4x+KLTHxpTYpEV/tcVLV
 a0uvWPGjCbn8JNbpXVlEtahiL3mfxj16v6n+e9tEe2c0InUtEHzqKjXls
 0XAbXTL5V1VxNOFTsXf3fz6HlLDavR86KuChAq1gwVkZ5CPLXjb4pfQbS
 KL/0lJvrhNSWT8+2EhIbs+inP7LbmjfKYOP0MYdN9qJ5pKyUVLfGjv6ln w==;
X-CSE-ConnectionGUID: p9k7r9VTQaqMwNDNoilxBQ==
X-CSE-MsgGUID: I5dR7stRRvm2jpW5Cez0ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68664590"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="68664590"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 19:43:04 -0800
X-CSE-ConnectionGUID: MtdhYcPxQ9q+t8ADHwOkYg==
X-CSE-MsgGUID: yfPv4PdFSPux5f9EfeJHiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204833737"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa008.fm.intel.com with ESMTP; 13 Jan 2026 19:43:03 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 0/3] Fix Cx0 Suspend Resume issue
Date: Wed, 14 Jan 2026 09:12:56 +0530
Message-Id: <20260114034259.466605-1-suraj.kandpal@intel.com>
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

CX0 PHY currently has two issues which cause a hang when we try
to suspend resume machine with a delay of 15mins and 1+ hour.
This happens due to two reasons:
1) We do not follow the Enablement sequence where we need to
enable our clock after PPS Enablement cycle
2) We do not make sure response ready and error bit are cleared
in P2M_MSGBUS_STATUS before writing the transaction pending bit.
This series aims to solve this.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Mika Kahola (1):
  drm/i915/cx0: Split PLL enabling/disabling in two parts

Suraj Kandpal (2):
  drm/i915/cx0: Clear response ready & error bit
  drm/i915/cx0: Rename intel_clear_response_ready flag

 drivers/gpu/drm/i915/display/intel_cx0_phy.c  | 134 +++++++++++-------
 drivers/gpu/drm/i915/display/intel_cx0_phy.h  |   4 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   7 +-
 drivers/gpu/drm/i915/display/intel_lt_phy.c   |   2 +-
 4 files changed, 92 insertions(+), 55 deletions(-)

-- 
2.34.1

