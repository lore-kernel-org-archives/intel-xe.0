Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DB8606A321
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 11:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LbEBoom5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5773F112394;
	Thu, 26 Nov 2026 11:57:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5F5112303;
 Thu, 26 Nov 2026 11:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795694225; x=1827230225;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FOH1J24hRsQv5Fi16IceUN8ASCSVf0Z34iWTPpgr8gQ=;
 b=LbEBoom5j030J2zRKa/OumegAbQ1nEVo6u21WzdH5vtPSg70ZZEMqB6B
 ACRid4jOhcVj8hHoNsng3CVua3cJpKdg7ZEju+S19reC9hwpluCbKNnPb
 x6qRPCrcFwyQNMw162U2/8EJhr7TfRqBD7A3jVD3XULQPIT074SB1DAht
 5kPvq19JIliXNeWf5GF8s5szVVNz/uA3fOHeLA1RtgETjJmM+S4QuIwmW
 Uq5eI9FBk3NMcptc0aTCeqSEg3a1UWMknLL9U6gdgJFYm8L2XsuWokIca
 4j7cEbUPFaQ6mwGjQUKgHIB8FkdAy13dvvzxluqOhRv5e3EadWk/B2pdc w==;
X-CSE-ConnectionGUID: kH+dVx/OQI+6pi8r+YRIpw==
X-CSE-MsgGUID: vk7YLTqkQNKVyG7rXXTluw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4527184"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4527184"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 03:57:04 -0800
X-CSE-ConnectionGUID: jvDSzakUSt+5JJvgZetXdA==
X-CSE-MsgGUID: WaLDJnUwSEek3Yz4OljVCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12183167"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa002.jf.intel.com with ESMTP; 26 Nov 2026 03:57:02 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 0/2] Account for 2 PPC horizontal downscale inefficiency in
 min CDCLK
Date: Thu, 26 Nov 2026 17:48:25 +0530
Message-ID: <20261126121827.1951200-1-uma.shankar@intel.com>
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

The horizontal scaler filter works at 2 PPC, but still needs a full
clock for a fractional shift of just one pixel. It doesn't shift by
two pixels and re-align the taps, so the extra clock doesn't average
out. Without accounting for this, CDCLK may end up too low for certain
horizontal downscale factors, which leads to underruns.

Implement the Bspec formula for the downscale amount, used for both
plane and pipe scalers when computing the min CDCLK

Uma Shankar (2):
  Revert "drm/i915/cdclk: Deal with 2 PPC hscale issues when calculating
    min CDCLK"
  drm/i915/cdclk: Account for 2 PPC horizontal downscale inefficiency in
    min CDCLK

 drivers/gpu/drm/i915/display/intel_plane.c | 54 +++++++++-------------
 1 file changed, 22 insertions(+), 32 deletions(-)

-- 
2.50.1

