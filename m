Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E011CC6B1A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 18:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D140A10EC00;
	Tue, 13 Oct 2026 18:50:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330AE10E9C3
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 18:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791917442; x=1823453442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gh2PZrJhxf4AdY9Ewt67zl5VQzPTzM1XSsL4ituxwiE=;
 b=mL8602vfJvQFAf9YPU3ZOpd8RITC6T3lmOcVjqyaWptbGZh9C1jMVlup
 I76g9iRq+MVtSVrjSNFp96DZepgVG2i8wC7nvN6ktj+e4bh4nh81YwCSP
 Z0LCZaKWBcTVh2kxVhOwff+OCKqc08/Pq9AyV1SIXwNbEWggNW/GsaVj2
 OrStVzuLuKb2PCvaARzx48bGDsz6qIuvuU4GBt1BzWNI+sAHq2PQnRf5e
 Q2OQa5utB754Pe1IL7P35pS4FlZFACdkdV0Hg12peauMEMinSIcUvu/n/
 C8U2sXev/H6h2oG/QyNq96WGcJZCBQNbBnWKIhtpa6Mm+86wxQ1mMzN5O g==;
X-CSE-ConnectionGUID: jqrdZFZ9SECLuJeSOc5toQ==
X-CSE-MsgGUID: 6ffEV0xORwCtMej7J97POA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="545791"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="545791"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:50:39 -0700
X-CSE-ConnectionGUID: WargXR1UTYypCapguLD8OA==
X-CSE-MsgGUID: s054yjxLT7ShNKlLa6vsXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1596169"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:50:38 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v12 05/16] drm/xe/hwmon: Handle unavailable memory controller
 sensors
Date: Wed, 14 Oct 2026 00:19:28 +0530
Message-Id: <20261013184939.694945-6-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261013184939.694945-1-karthik.poosa@intel.com>
References: <20261013184939.694945-1-karthik.poosa@intel.com>
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

Skip memory controller sensors that report invalid readings when
computing the average temperature in get_mc_temp(). Return -ENXIO when
no valid sensor data is available, and allow the helper to be used as
an availability probe by making the output parameter optional.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 3a0cb885e111 ("drm/xe/hwmon: Expose memory controller temperature")
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 418e1c503eb5..2f92ec950614 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -856,8 +856,8 @@ static int mbx_temp_decode(u8 value)
 static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	int ret, i, count = 0;
 	s32 average = 0;
-	int ret, i;
 
 	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
 		u32 data = 0;
@@ -870,11 +870,23 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 		hwmon->temp.dword[i] = cpu_to_le32(data);
 	}
 
-	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
+	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
+		if (!mbx_temp_valid(hwmon, hwmon->temp.value[i]))
+			continue;
 		average += mbx_temp_decode(hwmon->temp.value[i]);
+		count++;
+	}
+
+	if (!count) {
+		drm_dbg(&hwmon->xe->drm, "Memory controller temperature unavailable!\n");
+		return -ENXIO;
+	}
+
+	average /= count;
+
+	if (val)
+		*val = average * MILLIDEGREE_PER_DEGREE;
 
-	average /= (hwmon->temp.count - TEMP_INDEX_MCTRL - 1);
-	*val = average * MILLIDEGREE_PER_DEGREE;
 	return 0;
 }
 
-- 
2.25.1

