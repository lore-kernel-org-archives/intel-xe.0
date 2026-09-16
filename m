Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DFCC88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 08:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C4210E4E9;
	Wed, 16 Sep 2026 08:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AgiKD7p+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947CF10E4E9;
 Wed, 16 Sep 2026 08:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789547391; x=1821083391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q29LIlsQVXv6z007U9sfBX2zs/XXZ9hXDfDUxaQSSf8=;
 b=AgiKD7p+Io5C51gtZH1xvJHC3OcJZF59PXFYpPvqpVKhg6qz4wRmvuvg
 9xMI3+hZFaH13q1zebcaKiHIEoww1/a7qkw275NVAZvuG1uB2TEyhnSTJ
 6DUnKbUr9CkVvM/63HyW/sz3TKyZgk1mjckA5ojwTTUcB4bW4hc/r4DDp
 R5wMaJBj/fsp0bdkOGwFTvyboZIu4+BtNhPomjI1cvfPIKogT8xlZkrET
 jeKsVy6rNl9bQeUCReRILAeT9m5NQxprH645lgIWlz8WZJDeSH8wIIory
 PwrRj9LIWmHNpePyra9D/sSK0NHHUeAFKp3+iBcy0CO8UHfHLR5nuxfK4 w==;
X-CSE-ConnectionGUID: QcEO1TrATQGOnlERKqE3ww==
X-CSE-MsgGUID: lTGokJz/TBqgM4e/Kzcmbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89858819"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89858819"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:29:51 -0700
X-CSE-ConnectionGUID: L9a6+MV4R36bo6kCqgjYEw==
X-CSE-MsgGUID: JibY11alTSSSLml5fOajyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277017957"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:29:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 01/11] drm/i915/lspcon: use u8 variable to hold 1-byte DPCD
 reads
Date: Wed, 16 Sep 2026 11:29:32 +0300
Message-ID: <66a74267a3da7619dda8dc2b1bb1bfcedc25df0d.1789547331.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789547331.git.jani.nikula@intel.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Passing a pointer to a u32 variable for a 1-byte reads is error prone,
and only works because it's always initialized to 0 before the read, and
the code's running on little-endian CPUs. Switch to u8 variables.

In _lspcon_write_avi_infoframe_mca(), add a separate variable to hold
the number of bytes written instead of reusing the same variable for two
purposes.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lspcon.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index 9ceabbc981a1..b306bf5f6130 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -435,14 +435,14 @@ static bool _lspcon_write_avi_infoframe_parade(struct drm_dp_aux *aux,
 static bool _lspcon_write_avi_infoframe_mca(struct drm_dp_aux *aux,
 					    const u8 *buffer, ssize_t len)
 {
-	int ret;
-	u32 val = 0;
+	int ret, written = 0;
 	u32 retry;
 	u16 reg;
 	const u8 *data = buffer;
+	u8 val;
 
 	reg = LSPCON_MCA_AVI_IF_WRITE_OFFSET;
-	while (val < len) {
+	while (written < len) {
 		/* DPCD write for AVI IF can fail on a slow FW day, so retry */
 		for (retry = 0; retry < 5; retry++) {
 			ret = drm_dp_dpcd_write(aux, reg, (void *)data, 1);
@@ -456,7 +456,9 @@ static bool _lspcon_write_avi_infoframe_mca(struct drm_dp_aux *aux,
 				return false;
 			}
 		}
-		val++; reg++; data++;
+		written++;
+		reg++;
+		data++;
 	}
 
 	val = 0;
@@ -612,8 +614,8 @@ void lspcon_set_infoframes(struct intel_encoder *encoder,
 static bool _lspcon_read_avi_infoframe_enabled_mca(struct drm_dp_aux *aux)
 {
 	int ret;
-	u32 val = 0;
 	u16 reg = LSPCON_MCA_AVI_IF_CTRL;
+	u8 val;
 
 	ret = drm_dp_dpcd_read(aux, reg, &val, 1);
 	if (ret < 0) {
@@ -627,8 +629,8 @@ static bool _lspcon_read_avi_infoframe_enabled_mca(struct drm_dp_aux *aux)
 static bool _lspcon_read_avi_infoframe_enabled_parade(struct drm_dp_aux *aux)
 {
 	int ret;
-	u32 val = 0;
 	u16 reg = LSPCON_PARADE_AVI_IF_CTRL;
+	u8 val;
 
 	ret = drm_dp_dpcd_read(aux, reg, &val, 1);
 	if (ret < 0) {
-- 
2.47.3

