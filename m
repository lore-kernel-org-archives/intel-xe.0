Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089ADC624D6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 08:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC2510F06E;
	Wed,  2 Sep 2026 08:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JTcsIsT+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DEB10F06E;
 Wed,  2 Sep 2026 08:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788337078; x=1819873078;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=j5FTH8pdH7UfDh7WnhuRF9TeQUGKW/WrS4djrylpDKQ=;
 b=JTcsIsT+rkGRxU0VPkyBgZGecfwIMjSSoQB7BLuoK3PlOAk3KtaiM+So
 KmcEx+dmXf5HtcPdJ1R3Fqp2hLZObYTyLT2kBXRH3E+4o2lFQsRf5P3n3
 QZQVu3fmwAqj00vsrJqvqqySS3Pu0zlor5B1YgvmffnGMJNi6P8DWP8Js
 Babz7I0K99KwOrZZpx59xku44Lm8gRsk/JPDrLYiE1ofkNvuGtZ7ZS6h0
 kPjXLw6IuguBfeGJGa22HjlenPWJy5wfNYErAKYDlml+W0x43GrGiBWaF
 u7qRtHeJvQYkKs3RiUgu3jVJmtckRBm4mIdG2oB7r2hNr9B5Rvt03dSxU A==;
X-CSE-ConnectionGUID: S7U+BhgsQ3Sv2MDjjw2c1g==
X-CSE-MsgGUID: mlnaLVItTQKbfhxqqz8xAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100299817"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="100299817"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 01:17:57 -0700
X-CSE-ConnectionGUID: Hqsq2J/zTVWiLGuemvR9eA==
X-CSE-MsgGUID: kpnZWHSUTEeKDe2JrWvDNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="263193675"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa009.fm.intel.com with ESMTP; 02 Sep 2026 01:17:57 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [CI 5/9] drm/i915/color: Add support for 1D LUT in SDR planes
Date: Wed,  2 Sep 2026 13:24:13 +0530
Message-ID: <20260902075417.656673-6-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260902075417.656673-1-chaitanya.kumar.borah@intel.com>
References: <20260902075417.656673-1-chaitanya.kumar.borah@intel.com>
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

Extend the SDR plane color pipeline to post-CSC 1D LUT block.

v2:
 - In preparation of a simple pipeline
	[YUV Full/Limited -> RGB] -> [1D LUT]
   Drop pre-CSC LUT from the pipeline as it has no use in a YUV -> RGB
   pipeline. This makes the pipeline simple since the block lies between
   the YUV range correct block and Fixed function CSC. It can be added back
   when [RGB709 -> RGB2020] capability is added. Then it can be used for
   linearization.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color_pipeline.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
index efd4375c4331..53e55ce0a5a3 100644
--- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -45,6 +45,7 @@ static const enum intel_color_block hdr_plane_pipeline[] = {
 
 static const enum intel_color_block sdr_plane_yuv_pipeline[] = {
 	INTEL_PLANE_CB_CSC_FF,
+	INTEL_PLANE_CB_POST_CSC_LUT,
 };
 
 static const u64 intel_plane_supported_csc_ff =
-- 
2.50.1

