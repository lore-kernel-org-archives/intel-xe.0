Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37B3606A321
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 07:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H5pi78hR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CE410FA0A;
	Wed, 28 Oct 2026 07:14:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4B210E529;
 Wed, 28 Oct 2026 07:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793171650; x=1824707650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SqKllC9jgTnkqxdWg2PSU/JgGUPmz4G2mSjflupGQY8=;
 b=H5pi78hR2d9IgnZgEYcrl2yugT/IqW3i6nrsexQxZcrq6timvXxtMFgU
 81tKre949TAdSlxhQRjkyo2dHydmnHrq0rXuXlDcRsFiJqefClN5iT5mb
 19GhyZMg2qz2Eq5sglPkxYBp/ALXMM2FCl4mDAsO0sg4rveaz/rJEfQu1
 8gbKzpl40iHLxeStQtqI39yLYFerkwQCMB90hEYLh1hS09weMi2BYkSx2
 jtMg18xX3lxJI4rOQK1VWV4DseFrUqecY/I9bv5xeN2I9Jp9+TDpjwejA
 TzxKG3UEDpn0rJ2rMKcyNTyzABDB+kIqfzgWZtJIcxQ97a8eTQl2bQ0KP Q==;
X-CSE-ConnectionGUID: bNAaSB98SMuPmCErjUFf1A==
X-CSE-MsgGUID: 2NoXZ91YRtukA42MztjYbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1765952"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1765952"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 00:14:09 -0700
X-CSE-ConnectionGUID: 3K9x5UX3Rwaj2kFGYhvT5Q==
X-CSE-MsgGUID: 5r22pNxXRACSwssw/SCSfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4868263"
Received: from vsrini4-xps-8920.iind.intel.com ([10.223.167.75])
 by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2026 00:14:01 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org,
 uma.shankar@intel.com, jani.nikula@linux.intel.com,
 Vidya Srinivas <vidya.srinivas@intel.com>
Subject: [PATCH v4 0/2] drm/i915/display: Limit scaler count and disable pipe
 joiner on WCL
Date: Wed, 28 Oct 2026 12:34:02 +0530
Message-ID: <20261028070404.1913843-1-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261007072334.1801956-1-vidya.srinivas@intel.com>
References: <20261007072334.1801956-1-vidya.srinivas@intel.com>
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

Pipe joining is not supported in the WCL display configuration.
Modes that would require joining are rejected, matching the
4k 60Hz maximum resolution documented for the platform.

Also, WCL supports a single pipe scaler instead of two.

Vidya Srinivas (2):
  drm/i915/display: Single scaler per pipe on WCL
  drm/i915/display: Disable pipe joiner on WCL

 drivers/gpu/drm/i915/display/intel_display_device.c | 5 ++++-
 drivers/gpu/drm/i915/display/intel_dp.c             | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.45.2

