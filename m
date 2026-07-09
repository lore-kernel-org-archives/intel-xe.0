Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621D8C44501
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 12:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDAD10F56D;
	Thu,  9 Jul 2026 12:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MRJ7jO4N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF83210F56D;
 Thu,  9 Jul 2026 12:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783598634; x=1815134634;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oUN6f8AQcg79mdk4hWVhS7a7NM5OxxHsbIRwubZWlEA=;
 b=MRJ7jO4NfqcvJrUUuxgg/XajKibXs/L+hogxKxxJ8BGncKNRPjlyrd9z
 yZi5bhOxSY7ida2mvvhGFoCGh+p4GfnxgRiidWyC5vrBSvnNM3zLfSN7k
 foIlTWt0uwTEUNBBfxJNorgVOphPgC4OZo8LshpdbONUJj9svgstGgDR9
 yzX3bkMENG3nC5wTKbP6z/s9xlu1tr3EGxLdN23lJJkqVP0UAFPh2rjzn
 EZ3OEwIbgVEzTbWhtrdV07qi1jIjJo7Z6IIlTHa2tNpcZ16myzob3Yw52
 nJA1D1AnXV/h6g6F709XHhAoqmZ+7ZG6HUD7Yz+of6RFqABO0UPby70RS g==;
X-CSE-ConnectionGUID: 4YqQE7CcSh2IhGtlT6r28Q==
X-CSE-MsgGUID: 6kdiv0y3TdSLbah3GJaodQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84468976"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84468976"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 05:03:54 -0700
X-CSE-ConnectionGUID: cXW4rpUTTuaWrTnmTZChyA==
X-CSE-MsgGUID: myLUazLlSnODH0GDitn5vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="254686955"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa007.jf.intel.com with ESMTP; 09 Jul 2026 05:03:52 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 0/2] drm/i915/dp: fix MSA VSC_SDP delegation for colorimetry
Date: Thu,  9 Jul 2026 17:09:49 +0530
Message-Id: <20260709113951.3557968-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When a eDP/DP sink does not advertise DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED,
intel_ddi_set_dp_msa() still sets DP_MSA_MISC_COLOR_VSC_SDP, telling the
sink to defer colorimetry to a VSC SDP that will never be sent. A second bug
allows the has_psr bypass in intel_dp_compute_vsc_sdp() to send a colorimetry
payload to incapable sinks when PSR is active.

Both are fixed by folding the colorimetry_support check into
intel_dp_needs_vsc_colorimetry() so all call sites share a consistent gate.

Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Jouni Högander <jouni.hogander@intel.com>

Chaitanya Kumar Borah (2):
  drm/i915/dp: s/intel_dp_needs_vsc_sdp/intel_dp_needs_vsc_colorimetry
  drm/i915/dp: set VSC_SDP MSA delegation only for capable sinks

 drivers/gpu/drm/i915/display/intel_ddi.c |  4 +++-
 drivers/gpu/drm/i915/display/intel_dp.c  | 20 +++++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp.h  |  4 ++--
 3 files changed, 18 insertions(+), 10 deletions(-)

-- 
2.25.1

