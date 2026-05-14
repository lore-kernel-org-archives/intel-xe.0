Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425BBCD4F39
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 19:21:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B7F10E31E;
	Thu, 14 May 2026 19:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lfQzAExR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D5810E0B6;
 Thu, 14 May 2026 19:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778786504; x=1810322504;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=m9VAUGiyuMu0ayVGps3APZ8Jr6vHYeM7XdtfUhDkgnc=;
 b=lfQzAExR+ZTg5G0Qhxbfkpx+7nlA/pHeFDHKh8MjgojzR4YoARCDJn6/
 I/xrLcFbchXkQqwMoAYoP9QMRKHjVtifCD8VAexm4WxnZl9GRw7b5oaeG
 7ZCYni9rU0T+L3eTVJ+LNqZrq1QL5egabsYPEou3+RRkr6IvJbhgRDWM5
 mxLVJIMetNUIVZphGOakYwWuY4dCpB3krYd1rdxsvCDWEEJRdx00azx8A
 GwYAMd6hr8ge8MC9gl1NWfW9GpSWWJgRYmsMtUog02+GfEmvf+Y5juKKa
 INVJBCC43jdZquV1cg69lnM+/HIs82qN7C2/+yWA0YebI2AU0de7JwOPl Q==;
X-CSE-ConnectionGUID: 9wWr5Aq4RzGuFgOvIOSrpQ==
X-CSE-MsgGUID: lWzYgVuuTeKXoyjOSge1UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83351246"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="83351246"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 12:21:44 -0700
X-CSE-ConnectionGUID: DLVbVy9xTYibCyR/je04fQ==
X-CSE-MsgGUID: 5esvQLU6Q0qo/+xwHvsyIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="237611801"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.189])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 12:21:44 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 14 May 2026 16:19:30 -0300
Subject: [PATCH v3 1/5] drm/i915/bw: Don't call intel_dram_info() too early
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-separate-platform-from-diplay-ip-specific-bw-params-v3-1-68727d6fe3ec@intel.com>
References: <20260514-separate-platform-from-diplay-ip-specific-bw-params-v3-0-68727d6fe3ec@intel.com>
In-Reply-To: <20260514-separate-platform-from-diplay-ip-specific-bw-params-v3-0-68727d6fe3ec@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.15-dev
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

If we end-up bailing early from intel_bw_init_hw() due to
!HAS_DISPLAY(display), the call to intel_dram_info() to initialize
dram_info will be meaningless.  Move the call to be done after that
check.

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 9c3a9bbb49f6..7eef693b51ad 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -791,11 +791,13 @@ static unsigned int icl_qgv_bw(struct intel_display *display,
 
 void intel_bw_init_hw(struct intel_display *display)
 {
-	const struct dram_info *dram_info = intel_dram_info(display);
+	const struct dram_info *dram_info;
 
 	if (!HAS_DISPLAY(display))
 		return;
 
+	dram_info = intel_dram_info(display);
+
 	/*
 	 * Starting with Xe3p_LPD, the hardware tells us whether memory has ECC
 	 * enabled that would impact display bandwidth.  However, so far there

-- 
2.53.0

