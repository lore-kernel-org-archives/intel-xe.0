Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A508E7C4E2
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 17:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE5810E39F;
	Wed,  4 Oct 2023 17:47:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF9810E395
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 17:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696441631; x=1727977631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oc8Jl7IWNxb+Mm65Te96GS3lxw6yGYnCCcW5URL6QXI=;
 b=VaN6C+Nh/oJDdSyRKTwIkQ7Sn90CK1LopOJqbtUbA4+RsrqBtj1qFF/e
 6q72mLO+a0tEOEsd/eR+KzBJEzybcDMX25ubxFrCSCeE3l5553AJ0vKUB
 Nwbj/CeUbZ9aorPTDPVBs8PUSHrHhkPzg2PUzp2W9HKs+EfAyGtchSciz
 6hD61d7sEEL3uPPdfFilE8L2WCOGa95ZK0kXTLmdSFRkBwIthKQYg233j
 hrldT99hbCr+7JFmmB8WI1BVsz7CS0ek/pF1GuHKKKitF2Ew+YQeNPM/z
 PmgY+XPiy3jAjBOe/Ls2RYUUP6lhS3CiQuYVk/hN24+p/NDiJBG32r9TX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380527389"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="380527389"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:46:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="755037082"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="755037082"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:46:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  4 Oct 2023 10:47:14 -0700
Message-Id: <20231004174714.3491013-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004160931.3490464-1-lucas.demarchi@intel.com>
References: <20231004160931.3490464-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/hwmon: Expose power attributes
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add missing static to fixup build with W=1

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 1 +
 drivers/gpu/drm/xe/xe_hwmon.c        | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index fd87fbb6306f..7abfab0261a8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -378,6 +378,7 @@ struct xe_device {
 	/** @pmu: performance monitoring unit */
 	struct xe_pmu pmu;
 
+	/** @hwmon: hwmon subsystem integration */
 	struct xe_hwmon *hwmon;
 
 	/* private: */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 1deb5007e1e2..734fcca9f71f 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -123,7 +123,8 @@ static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_
 	}
 }
 
-int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, u64 *value)
+static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
+				       enum xe_hwmon_reg hwmon_reg, u64 *value)
 {
 	struct xe_reg reg;
 
-- 
2.40.1

