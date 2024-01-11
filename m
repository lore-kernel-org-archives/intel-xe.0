Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667DCC4707B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 09:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FC010E8A2;
	Thu, 11 Jan 2024 09:16:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134F210E879
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 09:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704964605; x=1736500605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nq5kic8I8De/j69Tyr6p2JNu8Qx/KT8gKuMRs7tyvF8=;
 b=liPmXcQR2iQUqYTwAMzUsa3T60kMgIbYd2IRn9O0zaPqjtKk5+xctJk1
 8gCouGfFwgLf9CaI0WyPgEkuFOzmchPDTljsToxpvBZYe08TAw1/HKJLT
 p0nYezzZobGBXSUrwo89XpOEHq0q/aOB0EXGhmgcVw1G85ckRuZmMtGcW
 pcldW+UqYdaZd46a6fU7Cz7iaiMS9sEp+0zBllhPV6mFweKIpFGNbCabe
 +NdWOn7GT9w91g6q14pwbaP06VLwmSx1eqb/ppYwHqsJ9qN0vaUAWKrgz
 Xb6vNybHXxNVBhRWRLMg9NQyV5ypaxP3EpInOppQCvNui6DRaX0P5v603 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="397663348"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="397663348"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 01:16:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="24568532"
Received: from kgdowskx-mobl1.ger.corp.intel.com (HELO
 hazy.ger.corp.intel.com) ([10.249.37.118])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 01:16:44 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC v2 4/4] drm/i915/display: use wakelock in the last write function
Date: Thu, 11 Jan 2024 11:16:22 +0200
Message-Id: <20240111091622.1110799-5-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240111091622.1110799-1-luciano.coelho@intel.com>
References: <20240111091622.1110799-1-luciano.coelho@intel.com>
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Finally, add the wakelock mechanism to the write functions.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 220907442bad..e815ccff0a7e 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -70,7 +70,11 @@ intel_de_posting_read(struct drm_i915_private *i915, i915_reg_t reg)
 static inline void
 intel_de_write(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
 {
+	intel_display_wl_get(i915, reg);
+
 	intel_uncore_write(&i915->uncore, reg, val);
+
+	intel_display_wl_put(i915, reg);
 }
 
 static inline u32
-- 
2.39.2

