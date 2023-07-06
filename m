Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781AAC0015E
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 14:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F40F10E414;
	Thu,  6 Jul 2023 14:27:50 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B6210E402
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 14:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688653667; x=1720189667;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rqAyP6a31rPWHJU1ljc+mh9Ixo+4Ur6H+QdYg+mEjqg=;
 b=jJ4Y2v1PmBYZSStp0Zp0j1rqfYvop3QJOHPHPP8Ot3q6ZH8jS9muuLWo
 flaokuddlW+mWkQYm8YEkSJ7fKDIpctpru1D2DXK/M7YfmX19gDO3AfkM
 Rwz6ISbipXFG4eWJn2BZbq48sTJFWguVbattmSKGXeSgKfBiRfua1umoh
 FcAiyB7MRtvWd6Ijsd17J2Rw3a9oIG78WLafEqfaM7SxlPxfXwhT3GpZ1
 40Ei4MS/hOGbv8uWvMPrbp79lS1fXeNwsX2/kGOqBl0ZM6j79t/fW0BBd
 izZ44N3kZ93fuUBngFxLEjp5r9687LOTT+FJJRonuVUr/g1V9ZmvMIm50 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="427293292"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="427293292"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 07:27:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="1050115778"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="1050115778"
Received: from rblanarx-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.33.198])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 07:27:45 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 14:27:26 +0000
Message-Id: <20230706142728.6-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Fix SPDX license identifiers
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some SPDX license strings were misspelled, incorrect or missing.

Francois Dugast (2):
  fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
  fixup! drm/xe/display: Implement display support

 .../xe/compat-i915-headers/soc/intel_dram.h   |  5 +++++
 .../xe/compat-i915-headers/soc/intel_pch.h    |  5 +++++
 .../drm/xe/display/ext/intel_clock_gating.c   | 20 +-----------------
 .../drm/xe/display/ext/intel_device_info.c    | 21 +------------------
 .../drm/xe/display/ext/intel_device_info.h    | 21 +------------------
 drivers/gpu/drm/xe/xe_map.h                   |  2 +-
 drivers/gpu/drm/xe/xe_trace.c                 |  2 +-
 drivers/gpu/drm/xe/xe_trace.h                 |  2 +-
 8 files changed, 16 insertions(+), 62 deletions(-)

-- 
2.34.1

