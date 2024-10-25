Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FFDD116FE
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 06:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A323410E02E;
	Fri, 25 Oct 2024 06:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+xpjrn1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E328C10E2A9;
 Fri, 25 Oct 2024 06:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729836121; x=1761372121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9XJ+i2Hc2FA9E1ovsmjZtMztvZmTFwGCJD7KNIQQDVc=;
 b=M+xpjrn1GgGnR8tFsa8aJISEAsFQyE+xaN0hWJBNKbg8wW9vRHA5zlWS
 i/lCqR9gxyLkh8L9I/1Hn6iLGH9s3CY+pPg4UCPl9eFJpRuI4Obixy2kk
 oqtvAY6Xi5h5brcY4opulAdsgih1kmXN9NY3sRV5dbLbKHM3kdzHRJmdM
 fpMO9FVY/KxqcpCeBd/MCG0n7QyFxjN2QAOXG33C9FU4ngUxNplowQ+bK
 PsqqAVbLnejRBZeEPDjq+7xgAv5cQ+/lFk+OtbhfEOv53X+0GDETW8ldf
 GLyIivo/doCJhtPxm7UzW+e3coCxnVpeIL2Ji2Dgt0W1u5dA5H8tAXk5L g==;
X-CSE-ConnectionGUID: sgW3j/1HQpC/FO6DGg1JmA==
X-CSE-MsgGUID: lCv8uPZ9QRu0Gnv7/A33YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29620690"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29620690"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 23:02:01 -0700
X-CSE-ConnectionGUID: v6eISAV7Sc+TRWsAoeZV4w==
X-CSE-MsgGUID: 6w3n+u3URceBqObY8AclqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80734415"
Received: from unknown (HELO kandpal-X299-UD4-Pro.iind.intel.com)
 ([10.190.239.10])
 by orviesa009.jf.intel.com with ESMTP; 24 Oct 2024 23:01:59 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, matthew.d.roper@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 3/5] drm/i915/psr: Increase psr size limits for Xe2
Date: Fri, 25 Oct 2024 11:31:34 +0530
Message-Id: <20241025060136.9884-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025060136.9884-1-suraj.kandpal@intel.com>
References: <20241025060136.9884-1-suraj.kandpal@intel.com>
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

Increase the psr max_h limit to 4096.

Bspec: 69885, 68858
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 4176163ec19a..c22386a31a63 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1453,7 +1453,11 @@ static bool intel_psr2_config_valid(struct intel_dp *intel_dp,
 		return false;
 	}
 
-	if (DISPLAY_VER(display) >= 12) {
+	if (DISPLAY_VER(display) >= 20) {
+		psr_max_h = 5120;
+		psr_max_v = 4096;
+		max_bpp = 30;
+	} else if (DISPLAY_VER(display) >= 12) {
 		psr_max_h = 5120;
 		psr_max_v = 3200;
 		max_bpp = 30;
-- 
2.34.1

