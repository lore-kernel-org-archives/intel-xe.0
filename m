Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015A3CC6B1A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 19:07:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9175C10E401;
	Tue, 13 Oct 2026 19:07:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB6610E401;
 Tue, 13 Oct 2026 19:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791918440; x=1823454440;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n828se0AUFwLwWIXLBr/mgtNibeii4A7u3IucMUPWHs=;
 b=PjlMrirGo/gS0Tt+UH8VgW2sACOUXBfSaOBQINOkdq8KaPkavXiiugKn
 5clWEv3ieKQvzgTYanngF/inPvv9MtitoelNu6QvsaBedTeswK6wj/3cZ
 tqZm85M4q91Nz1nbVhLktaBec+nwX6NW9n339D7ahbouQfbPv1h5mAqHw
 YoFhs8+33gtVeRVOcUhJfhBx7VkNLKOhpsEVI6y1+4mRtxK1UJURnpV/o
 zcFGfFwxzQnN6/M3zTRdD9/3Y6LRLR2hnU7SxH5RLQYXOZvstsc4opVx9
 et9C/wGJeKQmhxvfptBP/HsehEFdsZ6eKQgMtqdEEKGOorTGZI1rtiESB A==;
X-CSE-ConnectionGUID: hbqGQleJQVWwgfO6OjKMzw==
X-CSE-MsgGUID: 3I53cc2DR4O9hGOTFOmC1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="687210"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="687210"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:07:20 -0700
X-CSE-ConnectionGUID: +3kIDSrvTQqAfT3CNckosw==
X-CSE-MsgGUID: ywWVq0l9SO+isgiUl6L72A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3004440"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:07:18 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, jani.nikula@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v4 0/1] drm/i915/gmbus: Add bit-banging debugfs control
Date: Wed, 14 Oct 2026 00:37:11 +0530
Message-ID: <20261013190712.2092093-1-ramanaidu.naladala@intel.com>
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

Add a connector debugfs file that forces EDID reads to use
GPIO bit-banging.

Naladala Ramanaidu (1):
  drm/i915/gmbus: Add bit-banging debugfs control

 .../drm/i915/display/intel_display_debugfs.c  |  2 +
 .../drm/i915/display/intel_display_types.h    |  1 -
 drivers/gpu/drm/i915/display/intel_gmbus.c    | 86 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_gmbus.h    |  2 +
 4 files changed, 90 insertions(+), 1 deletion(-)

-- 
2.43.0

