Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101E9C3DA49
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jul 2024 14:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A9E10E002;
	Sat, 20 Jul 2024 14:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bRANzK6P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F2D10E057
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jul 2024 14:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721485543; x=1753021543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cS46iam5CtoFkGNGj4XkegPLPucGF+sTcBCDg6SZ+kA=;
 b=bRANzK6PIIFpVtYCbV0VPX/2pLTDCAZ/itHoBOxOa2o6ROFBDAC1D52c
 NFFL0MDETHIo76E1V+elyboEQsYXadEoW+xUCFCCQFz6TGJpSmAl4voEu
 K4E+25gX2lNfydRaSvmGb+UZwldiUSyCqfQGCC1y32hVa4w1QEK+L6RXH
 46IMWZYrVDZou1NOVKzmhNVIfHLbaRdm4S1SMIBC7zBMdAo6/uSENdSQU
 P6J8H33gMbdjmYHLlIVMAYgC7L1ebQQD9K+OKUgolqKr5SxMyw3T0EhQk
 kBcy6/qq1/NAKfw/QiUil6SrHfGUlYnUxxTqnl05wxRbliHdWYUByAB88 A==;
X-CSE-ConnectionGUID: 2Rt7fESCQaSzu/4I6Tm5xQ==
X-CSE-MsgGUID: 3IWlEPffTvCcyr5eG4Ud6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="41624488"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="41624488"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 07:25:43 -0700
X-CSE-ConnectionGUID: hfh8kTQKTrew/cV2d2lVZw==
X-CSE-MsgGUID: HqB+of5oRJikvX3e0YVSfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="55948455"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.48.8])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 07:25:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 1/7] drm/xe: Introduce const cast helper
Date: Sat, 20 Jul 2024 16:25:22 +0200
Message-Id: <20240720142528.530-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240720142528.530-1-michal.wajdeczko@intel.com>
References: <20240720142528.530-1-michal.wajdeczko@intel.com>
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

Typically we want to preserve pointer constness when converting
from one xe pointer to another, but in some rare cases, like kunit
parameter conversions, we might want to discard this constness.
Add a helper that we will use to clearly indicate our intention.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v1
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: use explicit cast (Lucas)
---
 drivers/gpu/drm/xe/xe_device.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 533ccfb2567a..db6cc8d0d6b8 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -20,6 +20,11 @@ static inline struct xe_device *pdev_to_xe_device(struct pci_dev *pdev)
 	return pci_get_drvdata(pdev);
 }
 
+static inline struct xe_device *xe_device_const_cast(const struct xe_device *xe)
+{
+	return (struct xe_device *)xe;
+}
+
 static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
 {
 	return container_of(ttm, struct xe_device, ttm);
-- 
2.43.0

