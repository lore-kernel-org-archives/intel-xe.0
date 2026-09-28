Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D5FCA5FA2
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 12:19:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948C610E4F1;
	Mon, 28 Sep 2026 12:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCoVtP28";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225CA10E08D;
 Mon, 28 Sep 2026 12:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790597983; x=1822133983;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3V/HJga3MIvCr+TZ/FwxerPzUaXZMtx0HBJWv5NO9DM=;
 b=WCoVtP28y5WXpEj+/itw0+9+X6tchbTTgkMUMNrynul4itFz2dYNnrPb
 +IuasxUW6WZ9UFFyx/9e0KkwgFrQsWJgVvqmOwT0U0PJ9g7+uXePOcn0G
 PyHLPoXz779SHLoPns+dZim6/liAifHsXVL/248dKk5xd4AM4JmCeodcP
 q294xtazgGOKUUlUS9nuIcP2vgSXu5WLLGTqlGLzLEzCrILNt9E77dqpN
 lOBzv0O231a4INdudVMLYb4tvcuwcCJU1qLnXjuPAHFkBJtRqlkqlvWm3
 dv+pT6fwL/8GbR1juUslMOu5KntX3gTP84wm7wSLgRdnkVD+ilq6oUedi A==;
X-CSE-ConnectionGUID: nN46/e07RY2mFUvH+GhiYg==
X-CSE-MsgGUID: uo2o9w0kShSt73HlDtlCtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="102666269"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="102666269"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 05:19:42 -0700
X-CSE-ConnectionGUID: 56S2CGPHT5mLDW+P+OMlbA==
X-CSE-MsgGUID: qoBB+g2TRPWdyLYvUVmBlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="278854441"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 05:19:41 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, jani.nikula@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v3 0/1] drm/i915/gmbus: Add bit-banging debugfs control
Date: Mon, 28 Sep 2026 17:49:39 +0530
Message-ID: <20260928121940.728102-1-ramanaidu.naladala@intel.com>
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

Add a connector debugfs file that forces EDID reads to use GPIO bit-banging.

Naladala Ramanaidu (1):
  drm/i915/gmbus: Add bit-banging debugfs control

 .../drm/i915/display/intel_display_debugfs.c  |  2 +
 .../drm/i915/display/intel_display_types.h    |  1 -
 drivers/gpu/drm/i915/display/intel_gmbus.c    | 67 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_gmbus.h    |  2 +
 4 files changed, 71 insertions(+), 1 deletion(-)

-- 
2.43.0

