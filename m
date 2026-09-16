Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EDAC982C4
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 08:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C1610E846;
	Wed, 16 Sep 2026 08:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cVnsl6Le";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9E710E8A2;
 Wed, 16 Sep 2026 08:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789547415; x=1821083415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GBnJS8wvXbbPZ+eBMYEPg/fRRY68hpkU4tEGWlYQ4IA=;
 b=cVnsl6LeqiFpaQzG7tW7HKohjjMi5hri/mQOS+e0STGMlhuWna57lV8K
 x+l8vs0/nGFgrafnq+yRFtmDn773zweMws7dvWIbym0VJlfOmuj+J4N8o
 /7agXxKeO2oxaNTLrVNRwu6P8gF7wKw+1o+poxytPJ13j/3ZTEX4erm0D
 fZ7G6sNMRSbAT9Pm1QI2zcIkztlT4/itdpdqGJUizbtrQG06B1/eymuQ8
 TPXa9phsFe0yLQJ3Z14J8URoyh8/mMgldrEn3NrAQwTvPAVjwxNmrIuSp
 Bs3tFoAQ/FvRbmcXU/QzdJVXu/62qv5LSb9osWf0/JX61S5KBGLzZQwGU w==;
X-CSE-ConnectionGUID: j34jqWPuSdWDHVEVEJMRbA==
X-CSE-MsgGUID: ub+TdXv0RtCSAuxp09M+8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="429635"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="429635"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:30:15 -0700
X-CSE-ConnectionGUID: ioohG9g5TrCC2wauR37IGw==
X-CSE-MsgGUID: Nfibf1onTzeUHpQ01yePYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1496864"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:30:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 07/11] drm/i915/hdcp: switch to drm_dp_dpcd_{read_byte,
 read_data, write_data}()
Date: Wed, 16 Sep 2026 11:29:38 +0300
Message-ID: <e168dad72f78fdb74419da94b0a38d732159fc82.1789547331.git.jani.nikula@intel.com>
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

Switch to the modern DPCD access functions that return negative error
codes on errors, -EIO for incomplete access, and 0 on success.

This simplifies error handling all over the place. Convert the error
logging to use %pe and ERR_PTR() while at it.

Add comments to the read/write places that depend on the functions that
return the number of bytes read/written for incomplete access.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 173 +++++++++----------
 1 file changed, 86 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index 14ed0ea22dd3..5e23be05cb51 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -60,16 +60,15 @@ int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *dig_port,
 {
 	struct intel_display *display = to_intel_display(dig_port);
 	u8 aksv[DRM_HDCP_KSV_LEN] = {};
-	ssize_t dpcd_ret;
+	int ret;
 
 	/* Output An first, that's easy */
-	dpcd_ret = drm_dp_dpcd_write(&dig_port->dp.aux, DP_AUX_HDCP_AN,
+	ret = drm_dp_dpcd_write_data(&dig_port->dp.aux, DP_AUX_HDCP_AN,
 				     an, DRM_HDCP_AN_LEN);
-	if (dpcd_ret != DRM_HDCP_AN_LEN) {
+	if (ret < 0) {
 		drm_dbg_kms(display->drm,
-			    "Failed to write An over DP/AUX (%zd)\n",
-			    dpcd_ret);
-		return dpcd_ret >= 0 ? -EIO : dpcd_ret;
+			    "Failed to write An over DP/AUX (%pe)\n", ERR_PTR(ret));
+		return ret;
 	}
 
 	/*
@@ -79,14 +78,14 @@ int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *dig_port,
 	 * the destination address which will tickle the hardware to output the
 	 * Aksv on our behalf after the header is sent.
 	 */
-	dpcd_ret = drm_dp_dpcd_write(&dig_port->dp.aux, DP_AUX_HDCP_AKSV,
+	ret = drm_dp_dpcd_write_data(&dig_port->dp.aux, DP_AUX_HDCP_AKSV,
 				     aksv, DRM_HDCP_KSV_LEN);
-	if (dpcd_ret != DRM_HDCP_KSV_LEN) {
+	if (ret < 0) {
 		drm_dbg_kms(display->drm,
-			    "Failed to write Aksv over DP/AUX (%zd)\n",
-			    dpcd_ret);
-		return dpcd_ret >= 0 ? -EIO : dpcd_ret;
+			    "Failed to write Aksv over DP/AUX (%pe)\n", ERR_PTR(ret));
+		return ret;
 	}
+
 	return 0;
 }
 
@@ -94,15 +93,16 @@ static int intel_dp_hdcp_read_bksv(struct intel_digital_port *dig_port,
 				   u8 *bksv)
 {
 	struct intel_display *display = to_intel_display(dig_port);
-	ssize_t ret;
+	int ret;
 
-	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BKSV, bksv,
-			       DRM_HDCP_KSV_LEN);
-	if (ret != DRM_HDCP_KSV_LEN) {
+	ret = drm_dp_dpcd_read_data(&dig_port->dp.aux, DP_AUX_HDCP_BKSV, bksv,
+				    DRM_HDCP_KSV_LEN);
+	if (ret < 0) {
 		drm_dbg_kms(display->drm,
-			    "Read Bksv from DP/AUX failed (%zd)\n", ret);
-		return ret >= 0 ? -EIO : ret;
+			    "Read Bksv from DP/AUX failed (%pe)\n", ERR_PTR(ret));
+		return ret;
 	}
+
 	return 0;
 }
 
@@ -110,20 +110,21 @@ static int intel_dp_hdcp_read_bstatus(struct intel_digital_port *dig_port,
 				      u8 *bstatus)
 {
 	struct intel_display *display = to_intel_display(dig_port);
-	ssize_t ret;
+	int ret;
 
 	/*
 	 * For some reason the HDMI and DP HDCP specs call this register
 	 * definition by different names. In the HDMI spec, it's called BSTATUS,
 	 * but in DP it's called BINFO.
 	 */
-	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BINFO,
-			       bstatus, DRM_HDCP_BSTATUS_LEN);
-	if (ret != DRM_HDCP_BSTATUS_LEN) {
+	ret = drm_dp_dpcd_read_data(&dig_port->dp.aux, DP_AUX_HDCP_BINFO,
+				    bstatus, DRM_HDCP_BSTATUS_LEN);
+	if (ret < 0) {
 		drm_dbg_kms(display->drm,
-			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
-		return ret >= 0 ? -EIO : ret;
+			    "Read bstatus from DP/AUX failed (%pe)\n", ERR_PTR(ret));
+		return ret;
 	}
+
 	return 0;
 }
 
@@ -132,14 +133,13 @@ int intel_dp_hdcp_read_bcaps(struct drm_dp_aux *aux,
 			     struct intel_display *display,
 			     u8 *bcaps)
 {
-	ssize_t ret;
+	int ret;
 
-	ret = drm_dp_dpcd_read(aux, DP_AUX_HDCP_BCAPS,
-			       bcaps, 1);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_read_byte(aux, DP_AUX_HDCP_BCAPS, bcaps);
+	if (ret < 0) {
 		drm_dbg_kms(display->drm,
-			    "Read bcaps from DP/AUX failed (%zd)\n", ret);
-		return ret >= 0 ? -EIO : ret;
+			    "Read bcaps from DP/AUX failed (%pe)\n", ERR_PTR(ret));
+		return ret;
 	}
 
 	return 0;
@@ -166,16 +166,16 @@ int intel_dp_hdcp_read_ri_prime(struct intel_digital_port *dig_port,
 				u8 *ri_prime)
 {
 	struct intel_display *display = to_intel_display(dig_port);
-	ssize_t ret;
+	int ret;
 
-	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_RI_PRIME,
-			       ri_prime, DRM_HDCP_RI_LEN);
-	if (ret != DRM_HDCP_RI_LEN) {
+	ret = drm_dp_dpcd_read_data(&dig_port->dp.aux, DP_AUX_HDCP_RI_PRIME,
+				    ri_prime, DRM_HDCP_RI_LEN);
+	if (ret < 0) {
 		drm_dbg_kms(display->drm,
-			    "Read Ri' from DP/AUX failed (%zd)\n",
-			    ret);
-		return ret >= 0 ? -EIO : ret;
+			    "Read Ri' from DP/AUX failed (%pe)\n", ERR_PTR(ret));
+		return ret;
 	}
+
 	return 0;
 }
 
@@ -184,17 +184,18 @@ int intel_dp_hdcp_read_ksv_ready(struct intel_digital_port *dig_port,
 				 bool *ksv_ready)
 {
 	struct intel_display *display = to_intel_display(dig_port);
-	ssize_t ret;
 	u8 bstatus;
+	int ret;
 
-	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BSTATUS,
-			       &bstatus, 1);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_read_byte(&dig_port->dp.aux, DP_AUX_HDCP_BSTATUS,
+				    &bstatus);
+	if (ret < 0) {
 		drm_dbg_kms(display->drm,
-			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
-		return ret >= 0 ? -EIO : ret;
+			    "Read bstatus from DP/AUX failed (%pe)\n", ERR_PTR(ret));
+		return ret;
 	}
 	*ksv_ready = bstatus & DP_BSTATUS_READY;
+
 	return 0;
 }
 
@@ -203,23 +204,24 @@ int intel_dp_hdcp_read_ksv_fifo(struct intel_digital_port *dig_port,
 				int num_downstream, u8 *ksv_fifo)
 {
 	struct intel_display *display = to_intel_display(dig_port);
-	ssize_t ret;
+	int ret;
 	int i;
 
 	/* KSV list is read via 15 byte window (3 entries @ 5 bytes each) */
 	for (i = 0; i < num_downstream; i += 3) {
 		size_t len = min(num_downstream - i, 3) * DRM_HDCP_KSV_LEN;
-		ret = drm_dp_dpcd_read(&dig_port->dp.aux,
-				       DP_AUX_HDCP_KSV_FIFO,
-				       ksv_fifo + i * DRM_HDCP_KSV_LEN,
-				       len);
-		if (ret != len) {
+		ret = drm_dp_dpcd_read_data(&dig_port->dp.aux,
+					    DP_AUX_HDCP_KSV_FIFO,
+					    ksv_fifo + i * DRM_HDCP_KSV_LEN,
+					    len);
+		if (ret < 0) {
 			drm_dbg_kms(display->drm,
-				    "Read ksv[%d] from DP/AUX failed (%zd)\n",
-				    i, ret);
-			return ret >= 0 ? -EIO : ret;
+				    "Read ksv[%d] from DP/AUX failed (%pe)\n",
+				    i, ERR_PTR(ret));
+			return ret;
 		}
 	}
+
 	return 0;
 }
 
@@ -228,19 +230,19 @@ int intel_dp_hdcp_read_v_prime_part(struct intel_digital_port *dig_port,
 				    int i, u32 *part)
 {
 	struct intel_display *display = to_intel_display(dig_port);
-	ssize_t ret;
+	int ret;
 
 	if (i >= DRM_HDCP_V_PRIME_NUM_PARTS)
 		return -EINVAL;
 
-	ret = drm_dp_dpcd_read(&dig_port->dp.aux,
-			       DP_AUX_HDCP_V_PRIME(i), part,
-			       DRM_HDCP_V_PRIME_PART_LEN);
-	if (ret != DRM_HDCP_V_PRIME_PART_LEN) {
+	ret = drm_dp_dpcd_read_data(&dig_port->dp.aux, DP_AUX_HDCP_V_PRIME(i), part,
+				    DRM_HDCP_V_PRIME_PART_LEN);
+	if (ret < 0) {
 		drm_dbg_kms(display->drm,
-			    "Read v'[%d] from DP/AUX failed (%zd)\n", i, ret);
-		return ret >= 0 ? -EIO : ret;
+			    "Read v'[%d] from DP/AUX failed (%pe)\n", i, ERR_PTR(ret));
+		return ret;
 	}
+
 	return 0;
 }
 
@@ -258,14 +260,13 @@ bool intel_dp_hdcp_check_link(struct intel_digital_port *dig_port,
 			      struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(dig_port);
-	ssize_t ret;
 	u8 bstatus;
+	int ret;
 
-	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BSTATUS,
-			       &bstatus, 1);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_read_byte(&dig_port->dp.aux, DP_AUX_HDCP_BSTATUS, &bstatus);
+	if (ret < 0) {
 		drm_dbg_kms(display->drm,
-			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
+			    "Read bstatus from DP/AUX failed (%pe)\n", ERR_PTR(ret));
 		return false;
 	}
 
@@ -346,15 +347,14 @@ intel_dp_hdcp2_read_rx_status(struct intel_connector *connector,
 	struct intel_display *display = to_intel_display(connector);
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct drm_dp_aux *aux = &dig_port->dp.aux;
-	ssize_t ret;
+	int ret;
 
-	ret = drm_dp_dpcd_read(aux,
-			       DP_HDCP_2_2_REG_RXSTATUS_OFFSET, rx_status,
-			       HDCP_2_2_DP_RXSTATUS_LEN);
-	if (ret != HDCP_2_2_DP_RXSTATUS_LEN) {
+	ret = drm_dp_dpcd_read_data(aux, DP_HDCP_2_2_REG_RXSTATUS_OFFSET, rx_status,
+				    HDCP_2_2_DP_RXSTATUS_LEN);
+	if (ret < 0) {
 		drm_dbg_kms(display->drm,
-			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
-		return ret >= 0 ? -EIO : ret;
+			    "Read bstatus from DP/AUX failed (%pe)\n", ERR_PTR(ret));
+		return ret;
 	}
 
 	return 0;
@@ -474,8 +474,8 @@ int intel_dp_hdcp2_write_msg(struct intel_connector *connector,
 		len = bytes_to_write > DP_AUX_MAX_PAYLOAD_BYTES ?
 				DP_AUX_MAX_PAYLOAD_BYTES : bytes_to_write;
 
-		ret = drm_dp_dpcd_write(aux,
-					offset, (void *)byte, len);
+		/* Note: This may return < len for partial writes. */
+		ret = drm_dp_dpcd_write(aux, offset, byte, len);
 		if (ret < 0)
 			return ret;
 
@@ -493,14 +493,13 @@ ssize_t get_receiver_id_list_rx_info(struct intel_connector *connector,
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct drm_dp_aux *aux = &dig_port->dp.aux;
-	ssize_t ret;
 	u8 *rx_info = byte;
+	int ret;
 
-	ret = drm_dp_dpcd_read(aux,
-			       DP_HDCP_2_2_REG_RXINFO_OFFSET,
-			       (void *)rx_info, HDCP_2_2_RXINFO_LEN);
-	if (ret != HDCP_2_2_RXINFO_LEN)
-		return ret >= 0 ? -EIO : ret;
+	ret = drm_dp_dpcd_read_data(aux, DP_HDCP_2_2_REG_RXINFO_OFFSET,
+				    rx_info, HDCP_2_2_RXINFO_LEN);
+	if (ret < 0)
+		return ret;
 
 	*dev_cnt = (HDCP_2_2_DEV_COUNT_HI(rx_info[0]) << 4 |
 		   HDCP_2_2_DEV_COUNT_LO(rx_info[1]));
@@ -566,11 +565,11 @@ int intel_dp_hdcp2_read_msg(struct intel_connector *connector,
 					       hdcp2_msg_data->msg_read_timeout);
 		}
 
-		ret = drm_dp_dpcd_read(aux, offset,
-				       (void *)byte, len);
+		/* Note: This may return < len for partial reads. */
+		ret = drm_dp_dpcd_read(aux, offset, byte, len);
 		if (ret < 0) {
-			drm_dbg_kms(display->drm, "msg_id %d, ret %zd\n",
-				    msg_id, ret);
+			drm_dbg_kms(display->drm, "msg_id %d, ret %pe\n",
+				    msg_id, ERR_PTR(ret));
 			return ret;
 		}
 
@@ -660,11 +659,11 @@ int _intel_dp_hdcp2_get_capability(struct drm_dp_aux *aux,
 	 * declare a monitor not capable of HDCP 2.2.
 	 */
 	for (i = 0; i < 3; i++) {
-		ret = drm_dp_dpcd_read(aux,
-				       DP_HDCP_2_2_REG_RX_CAPS_OFFSET,
-				       rx_caps, HDCP_2_2_RXCAPS_LEN);
-		if (ret != HDCP_2_2_RXCAPS_LEN)
-			return ret >= 0 ? -EIO : ret;
+		ret = drm_dp_dpcd_read_data(aux,
+					    DP_HDCP_2_2_REG_RX_CAPS_OFFSET,
+					    rx_caps, HDCP_2_2_RXCAPS_LEN);
+		if (ret < 0)
+			return ret;
 
 		if (rx_caps[0] == HDCP_2_2_RX_CAPS_VERSION_VAL &&
 		    HDCP_2_2_DP_HDCP_CAPABLE(rx_caps[2])) {
-- 
2.47.3

