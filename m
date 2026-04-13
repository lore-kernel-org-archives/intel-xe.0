Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEF3E93813
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 04:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD2010E300;
	Mon, 13 Apr 2026 04:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kv3onHqF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F68610E2FD;
 Mon, 13 Apr 2026 04:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776053340; x=1807589340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pl+6R7BxH83LFAwthxNf1YQesXw0kCvB+ozt0SVLQ68=;
 b=Kv3onHqFC+Exrad8iMbyG6jwXR3QlPnvkIfjZU/KfVOt1Bcf1xtbCiJp
 9/WHUF12YnEYVMNfHwyf6EPmfuNEtTSoJJAQbSVobsABzKZLb8GoPjlpl
 DTNMIZtfRz4jgbVoSGyitIiF9xTD+6XXyunuPw5WOCMelDclQDcS7NvJe
 RsCaPuLmhpuLRB5rFdHbR8ljiBkbsA9NmVk6t6uBqRrcmBi/qMOC+64us
 2rotfBNzJjg92Ii4QqBYyKvvvWqhnMbfcsIVyNy+5nbVtG4SQ+x8dWgjf
 h22UDXqftCYHpQFWd2mkVtzsZdITzeEQoKFZT/YUQGjzMKkbL/9BrdScZ A==;
X-CSE-ConnectionGUID: JvwTe/ePSHW4+nl6V369GQ==
X-CSE-MsgGUID: TcGlYR1ITqOxp7np6lCnFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="80568780"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="80568780"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 21:09:00 -0700
X-CSE-ConnectionGUID: w9IOuDAaRL22bo9q3wzi8Q==
X-CSE-MsgGUID: 1Y38kRWUQ4qD4JHjrHQrag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="229546630"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 21:08:58 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 08/12] drm/i915/display: Add HAS_CMN_SDP_TL macro
Date: Mon, 13 Apr 2026 09:23:45 +0530
Message-ID: <20260413035349.1730312-9-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260413035349.1730312-1-ankit.k.nautiyal@intel.com>
References: <20260413035349.1730312-1-ankit.k.nautiyal@intel.com>
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

Add a helper macro to detect CMN SDP TL support on platforms with display
version 35 and above.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 9338ea087e92..36a8a956f54a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -154,6 +154,7 @@ struct intel_display_platforms {
 #define HAS_CASF(__display)		(DISPLAY_VER(__display) >= 20)
 #define HAS_CDCLK_CRAWL(__display)	(DISPLAY_INFO(__display)->has_cdclk_crawl)
 #define HAS_CDCLK_SQUASH(__display)	(DISPLAY_INFO(__display)->has_cdclk_squash)
+#define HAS_CMN_SDP_TL(__display)	(DISPLAY_VER(__display) >= 35)
 #define HAS_CMRR(__display)		(DISPLAY_VER(__display) >= 20)
 #define HAS_CMTG(__display)		(!(__display)->platform.dg2 && DISPLAY_VER(__display) >= 13)
 #define HAS_CUR_FBC(__display)		(!HAS_GMCH(__display) && IS_DISPLAY_VER(__display, 7, 13))
-- 
2.45.2

