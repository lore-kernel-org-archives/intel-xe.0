Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9CBC5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 19:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889FA10EC9C;
	Fri,  6 Jun 2025 19:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JEnQCvNi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E6510EC9C
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 19:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749239468; x=1780775468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ty0Qc4evGZ+PTx+O2tzCT5iPGXXHkjOjXMnHPM6XJgQ=;
 b=JEnQCvNiUCyaHYvP7M//BURu1WHyBRVs1lbZ6kndskTz847ztXsNxCDm
 DLkpUAIkGMUtpWCeKokb9Aou3eDUQxKYa00VYRKLpZgyjK9jrimXA+DLs
 IIPtrqNm4UvTSUPlCkp7CA7QVnp+Niwzaj3Hla3yWSLqqfP9nLguQmFeT
 rmmIbmyjohovgQemqE9P5akU0N+3+cTq3eUvv3AYdDVZcNlKVjKwK7g4K
 dqOtiyusmbYEHw4r7AcFDY4x6Hq0brCVVmUMLJO0CVyMaOrKw5FS1zEhv
 4DMQJ3YCqlVDD8metyZ4V0BvMP+eGd9XgXUiYUQLyrUsPnDmBujIZU3Kh A==;
X-CSE-ConnectionGUID: LtPVUcNdSUuuE2ymJZnqlA==
X-CSE-MsgGUID: RmOd7OqSRwG2yRhYzBmOnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51277286"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="51277286"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 12:51:08 -0700
X-CSE-ConnectionGUID: AjYJKMGkRmqXTxUV4n3kTw==
X-CSE-MsgGUID: r0qC2mQdRiW9ZOGfrana+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="145796015"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa006.fm.intel.com with ESMTP; 06 Jun 2025 12:51:07 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 1/9] drm/i915/xe3lpd: Add support for display version 30.02
Date: Sat,  7 Jun 2025 01:20:56 +0530
Message-Id: <20250606195104.1771715-2-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

Display version 30.02 should be treated the same as other Xe3 IP, but
will have a slightly different set of workarounds.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index 1d8c2036d967..d398b9086116 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -1479,6 +1479,7 @@ static const struct {
 	{ 14,  1, &xe2_hpd_display },
 	{ 20,  0, &xe2_lpd_display },
 	{ 30,  0, &xe2_lpd_display },
+	{ 30,  2, &xe2_lpd_display },
 };
 
 static const struct intel_display_device_info *
-- 
2.34.1

