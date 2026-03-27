Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCE610BA432
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 06:43:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400A510ECB3;
	Fri, 27 Mar 2026 06:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mddef8yg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B90E10ECB0;
 Fri, 27 Mar 2026 06:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774593821; x=1806129821;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Na9Jw6O92e7pjim6EkjpR4Gt/6but0+vGj0eZmOD6jA=;
 b=mddef8ygC2DFT+o1UA6wDuZO3D2Ji+Nr85TRC4F938y2Rey8EiIPzI3J
 y9KRk+BZERaYJ4TgcufQdXkUUxI1lxUwCfADRswtOFe8B+giJJ3ergXqd
 jFRTdqSa6OwUlIGxGZhR60C9W6+FlBE4HbzvAtaj9Cgq4NuC9IwSELG2i
 r+Kli7BJcvV3u44iI3Ay4eq1Axkiel2UBexzsVup91FKUtKe+HaikVRAb
 ESu0fyxQlESmP194XbenkjnjUHQl2Ymt/eqPCq9dDobPtEDvzwvyU/u8R
 sNk7hSgkkaNpTtnAvrrGUfdcdUcBSR20XaCu6HYXQkilV8QnzDjjk4oYL Q==;
X-CSE-ConnectionGUID: AwWHk4gvRbyKshcHZvHRrA==
X-CSE-MsgGUID: OdoLo35qT9Kl40tHE2Rk8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75684249"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="75684249"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 23:43:41 -0700
X-CSE-ConnectionGUID: r2/XiO1JT2SGEfdM52pI+w==
X-CSE-MsgGUID: /FZeL1CTRrOLAUAz4MyvYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="222313846"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 23:43:39 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com
Subject: [PATCH v5 0/2] drm/i915/dmc: Update PIPEDMC interrupt mask
Date: Fri, 27 Mar 2026 12:14:51 +0530
Message-ID: <20260327064453.2241523-1-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
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

On display version 35+ the PIPEDMC_ATS_FAULT and
PIPEDMC_GTT_FAULT interrupt bits are no longer defined.
Update the interrupt mask accordingly and enable the
PIPEDMC_ERROR interrupt.

Changes in v2:
- Move PIPEDMC_ERROR interrupt enable to a separate patch (Ville Syrjala)
Changes in v3:
- Add Bspec reference (Suraj Kandpal)
Changes in v4:
- Add TODO to check the enablement of PIPEDMC_ERROR on PTL (Suraj Kandpal)
Changes in v5:
- Move TODO to the beginning of pipedmc_interrupt_mask() (Suraj Kandpal)

Dibin Moolakadan Subrahmanian (2):
  drm/i915/dmc: Remove invalid PIPEDMC interrupt bits
  drm/i915/dmc: Enable PIPEDMC_ERROR interrupt

 drivers/gpu/drm/i915/display/intel_dmc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.43.0

