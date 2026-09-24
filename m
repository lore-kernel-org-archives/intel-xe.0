Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E7EC98321
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 15:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC3910F66C;
	Thu, 24 Sep 2026 15:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNqWfYwH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC34510F668;
 Thu, 24 Sep 2026 15:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790263694; x=1821799694;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AkSvh0LEaYEcW/FixuO82bV4NVTKunGYDCdPYq5RWHk=;
 b=gNqWfYwH1c37V6o1sqUW0/ca1Xq2z3OO8BoT2U0zN1AN6bB8alNvt4sk
 Z8tEL31P5lbpZDfmIzPAR2flRN9NlRULeyOfc+pGcoqXvONdf9KTrGSfq
 b26b7y2Lxg7YUmQytnudOXew2aP6l+lV0S0GuTncv9Gn9Z9lUEl0B1hc8
 xGEVCzixskgP+5Ien6/zWsQ2GsWDWctVop418b3PzojxG1nkwSSRk8c8c
 nNLr5/2Qv5JD7V/8aMBmtqg3C7Pn9ZV3sa9H8jgT01GXWk0H5azf7fd+6
 HGPXUqfPzXVRaFoZmUDRGfMgYWXOi21J8leP3ZBhmW02G0n5LzDSU9cqH Q==;
X-CSE-ConnectionGUID: 61v7wlh+S0KH3ZYIJ4Ihuw==
X-CSE-MsgGUID: 3yY+RubCSf+P11enrkeFoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90903140"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="90903140"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 08:28:13 -0700
X-CSE-ConnectionGUID: juzxnYDDS0GtAvlqd5eo8w==
X-CSE-MsgGUID: lAU8BDnERvauwYr5UQdSVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="274158677"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 08:28:12 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, jani.nikula@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v2 0/1] drm/i915/gmbus: Add bit-banging debugfs control
Date: Thu, 24 Sep 2026 20:58:11 +0530
Message-ID: <20260924152812.439986-1-ramanaidu.naladala@intel.com>
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

 .../drm/i915/display/intel_display_debugfs.c  |  3 +
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_gmbus.c    | 61 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_gmbus.h    |  3 +
 4 files changed, 68 insertions(+)

-- 
2.43.0

