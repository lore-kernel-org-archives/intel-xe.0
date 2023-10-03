Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61C7E8FDB4
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 20:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0D210E0A1;
	Tue,  3 Oct 2023 20:37:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D91810E07D
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 20:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696365445; x=1727901445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hW/mcAYmX727bI2kYyAKcxFkH////mWyF4x7jeTqEYk=;
 b=d3oe6aYfsaYS597/Oyv7wXL1+WR7alWAHITDk4zLcfKSlZlJ6UVFqyXt
 HjrCa5q9x6BZJqgQW+vq+QyX06sio+e7tPpys+GNDCFhI5q//Hq5dQe4j
 hA0lIw53+9QFLCQlsErAp++APOheYrjXlc1dzOhojwnlwEgf9vDhsGGyb
 qc6XwWy7sJ6E667L27zZKcc/ZKZhUVmezxoVnIFrGiinucJD/AXgPpoN+
 ALkN9A+LY/2KYoefREgwtdOIvbRJgG387PXTV/JLjvnuKpNjlbUo/ORfp
 SnpPjUOcgKKeGDvoOmZfwRRnznmgJt/0mFFbcemrmQAGv9sxSTi7RHEuU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="382882322"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="382882322"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:37:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="821393961"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="821393961"
Received: from xuebinta-mobl.amr.corp.intel.com (HELO
 anushasr-mobl7.intel.com) ([10.212.207.176])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:37:24 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 13:37:13 -0700
Message-Id: <20231003203716.108979-3-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231003203716.108979-1-anusha.srivatsa@intel.com>
References: <20231003203716.108979-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/5] fixup! drm/xe/rplu: s/ADLP/ALDERLAKE_P
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Extend the change introduced in the previous patch to xe
driver.

Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 7c825f129166..918dd27868fa 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -146,7 +146,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 #define IS_DG2_G10(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G10)
 #define IS_DG2_G11(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G11)
 #define IS_DG2_G12(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G12)
-#define IS_RAPTORLAKE_U(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU)
+#define IS_RAPTORLAKE_U(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ALDERLAKE_P_RPLU)
 #define IS_ICL_WITH_PORT_F(xe) (xe && 0)
 #define HAS_FLAT_CCS(xe) (xe_device_has_flat_ccs(xe))
 #define to_intel_bo(x) gem_to_xe_bo((x))
-- 
2.25.1

