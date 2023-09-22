Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6A4E7D0D3
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 06:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B43810E54C;
	Fri, 22 Sep 2023 06:44:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCE310E416
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 06:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695365093; x=1726901093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1JpHGwO37oDYggxJ8ym53vWlVH1Andc8RLPQ80U2rA4=;
 b=lxT6x3QEUKpHVc4Me0ZPCze/xc4Q28JcCWWWGbvhiWGYFnkTvW+wseGr
 xbxMtQdjMmBIraocD/kYdRuQb+x1qNRtLMqpPEaEyClTD8eICiRGvRE6O
 QOGV6goCOHL82CUfGgL56CsU68PBwGIhIk44jy8hag3w8X6g0oCtQ5pMz
 TWifvDH3eySgBNOc2KfT7xmipLhZ0HD2FW3cHn8cN4pPUZw0VDLjZOLVn
 hOeAnPnfwMQIa1KXfJcRze4vWhceJsvR7w6rDLjp1rEMu3wbQphnZymgt
 iZbU7Hz4J/HNB8rtHzIqtBsujwWiuklLYnSD2P/l5kPUViBQgoZ2dxJvj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="365814861"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="365814861"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 23:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="697055429"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="697055429"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orsmga003.jf.intel.com with ESMTP; 21 Sep 2023 23:44:51 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 12:12:47 +0530
Message-Id: <20230922064247.329994-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230922064247.329994-1-suraj.kandpal@intel.com>
References: <20230922064247.329994-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8\
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/i915/hdcp: Move common message filling
 function to its own file
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

Create a new file intel_hdcp_gsc_message that contain functions
which fill the hdcp messages we send to gsc cs this refactor will
help us reuse code for Xe later on

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c | 618 +-----------------
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h |   1 +
 .../drm/i915/display/intel_hdcp_gsc_message.c | 588 +++++++++++++++++
 .../drm/i915/display/intel_hdcp_gsc_message.h |  56 ++
 5 files changed, 663 insertions(+), 601 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index c1af90153f61..f16cc2ec4e55 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -264,6 +264,7 @@ i915-y += \
 	display/intel_global_state.o \
 	display/intel_hdcp.o \
 	display/intel_hdcp_gsc.o \
+	display/intel_hdcp_gsc_message.o \
 	display/intel_hotplug.o \
 	display/intel_hotplug_irq.o \
 	display/intel_hti.o \
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
index 69af416cffe6..9c6cf0b13603 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
@@ -3,14 +3,12 @@
  * Copyright 2023, Intel Corporation.
  */
 
-#include <drm/i915_hdcp_interface.h>
-
 #include "gem/i915_gem_region.h"
 #include "gt/intel_gt.h"
 #include "gt/uc/intel_gsc_uc_heci_cmd_submit.h"
-#include "i915_drv.h"
 #include "i915_utils.h"
 #include "intel_hdcp_gsc.h"
+#include "intel_hdcp_gsc_message.h"
 
 bool intel_hdcp_gsc_check_status(struct drm_i915_private *i915)
 {
@@ -26,604 +24,6 @@ bool intel_hdcp_gsc_check_status(struct drm_i915_private *i915)
 	return true;
 }
 
-static int
-gsc_hdcp_initiate_session(struct device *dev, struct hdcp_port_data *data,
-			  struct hdcp2_ake_init *ake_data)
-{
-	struct wired_cmd_initiate_hdcp2_session_in session_init_in = { { 0 } };
-	struct wired_cmd_initiate_hdcp2_session_out
-						session_init_out = { { 0 } };
-	struct drm_i915_private *i915;
-	ssize_t byte;
-
-	if (!dev || !data || !ake_data)
-		return -EINVAL;
-
-	i915 = kdev_to_i915(dev);
-	if (!i915) {
-		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
-		return -ENODEV;
-	}
-
-	session_init_in.header.api_version = HDCP_API_VERSION;
-	session_init_in.header.command_id = WIRED_INITIATE_HDCP2_SESSION;
-	session_init_in.header.status = FW_HDCP_STATUS_SUCCESS;
-	session_init_in.header.buffer_len =
-				WIRED_CMD_BUF_LEN_INITIATE_HDCP2_SESSION_IN;
-
-	session_init_in.port.integrated_port_type = data->port_type;
-	session_init_in.port.physical_port = (u8)data->hdcp_ddi;
-	session_init_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
-	session_init_in.protocol = data->protocol;
-
-	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&session_init_in,
-				       sizeof(session_init_in),
-				       (u8 *)&session_init_out,
-				       sizeof(session_init_out));
-	if (byte < 0) {
-		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
-		return byte;
-	}
-
-	if (session_init_out.header.status != FW_HDCP_STATUS_SUCCESS) {
-		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X Failed. Status: 0x%X\n",
-			    WIRED_INITIATE_HDCP2_SESSION,
-			    session_init_out.header.status);
-		return -EIO;
-	}
-
-	ake_data->msg_id = HDCP_2_2_AKE_INIT;
-	ake_data->tx_caps = session_init_out.tx_caps;
-	memcpy(ake_data->r_tx, session_init_out.r_tx, HDCP_2_2_RTX_LEN);
-
-	return 0;
-}
-
-static int
-gsc_hdcp_verify_receiver_cert_prepare_km(struct device *dev,
-					 struct hdcp_port_data *data,
-					 struct hdcp2_ake_send_cert *rx_cert,
-					 bool *km_stored,
-					 struct hdcp2_ake_no_stored_km
-								*ek_pub_km,
-					 size_t *msg_sz)
-{
-	struct wired_cmd_verify_receiver_cert_in verify_rxcert_in = { { 0 } };
-	struct wired_cmd_verify_receiver_cert_out verify_rxcert_out = { { 0 } };
-	struct drm_i915_private *i915;
-	ssize_t byte;
-
-	if (!dev || !data || !rx_cert || !km_stored || !ek_pub_km || !msg_sz)
-		return -EINVAL;
-
-	i915 = kdev_to_i915(dev);
-	if (!i915) {
-		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
-		return -ENODEV;
-	}
-
-	verify_rxcert_in.header.api_version = HDCP_API_VERSION;
-	verify_rxcert_in.header.command_id = WIRED_VERIFY_RECEIVER_CERT;
-	verify_rxcert_in.header.status = FW_HDCP_STATUS_SUCCESS;
-	verify_rxcert_in.header.buffer_len =
-				WIRED_CMD_BUF_LEN_VERIFY_RECEIVER_CERT_IN;
-
-	verify_rxcert_in.port.integrated_port_type = data->port_type;
-	verify_rxcert_in.port.physical_port = (u8)data->hdcp_ddi;
-	verify_rxcert_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
-
-	verify_rxcert_in.cert_rx = rx_cert->cert_rx;
-	memcpy(verify_rxcert_in.r_rx, &rx_cert->r_rx, HDCP_2_2_RRX_LEN);
-	memcpy(verify_rxcert_in.rx_caps, rx_cert->rx_caps, HDCP_2_2_RXCAPS_LEN);
-
-	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&verify_rxcert_in,
-				       sizeof(verify_rxcert_in),
-				       (u8 *)&verify_rxcert_out,
-				       sizeof(verify_rxcert_out));
-	if (byte < 0) {
-		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed: %zd\n", byte);
-		return byte;
-	}
-
-	if (verify_rxcert_out.header.status != FW_HDCP_STATUS_SUCCESS) {
-		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X Failed. Status: 0x%X\n",
-			    WIRED_VERIFY_RECEIVER_CERT,
-			    verify_rxcert_out.header.status);
-		return -EIO;
-	}
-
-	*km_stored = !!verify_rxcert_out.km_stored;
-	if (verify_rxcert_out.km_stored) {
-		ek_pub_km->msg_id = HDCP_2_2_AKE_STORED_KM;
-		*msg_sz = sizeof(struct hdcp2_ake_stored_km);
-	} else {
-		ek_pub_km->msg_id = HDCP_2_2_AKE_NO_STORED_KM;
-		*msg_sz = sizeof(struct hdcp2_ake_no_stored_km);
-	}
-
-	memcpy(ek_pub_km->e_kpub_km, &verify_rxcert_out.ekm_buff,
-	       sizeof(verify_rxcert_out.ekm_buff));
-
-	return 0;
-}
-
-static int
-gsc_hdcp_verify_hprime(struct device *dev, struct hdcp_port_data *data,
-		       struct hdcp2_ake_send_hprime *rx_hprime)
-{
-	struct wired_cmd_ake_send_hprime_in send_hprime_in = { { 0 } };
-	struct wired_cmd_ake_send_hprime_out send_hprime_out = { { 0 } };
-	struct drm_i915_private *i915;
-	ssize_t byte;
-
-	if (!dev || !data || !rx_hprime)
-		return -EINVAL;
-
-	i915 = kdev_to_i915(dev);
-	if (!i915) {
-		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
-		return -ENODEV;
-	}
-
-	send_hprime_in.header.api_version = HDCP_API_VERSION;
-	send_hprime_in.header.command_id = WIRED_AKE_SEND_HPRIME;
-	send_hprime_in.header.status = FW_HDCP_STATUS_SUCCESS;
-	send_hprime_in.header.buffer_len = WIRED_CMD_BUF_LEN_AKE_SEND_HPRIME_IN;
-
-	send_hprime_in.port.integrated_port_type = data->port_type;
-	send_hprime_in.port.physical_port = (u8)data->hdcp_ddi;
-	send_hprime_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
-
-	memcpy(send_hprime_in.h_prime, rx_hprime->h_prime,
-	       HDCP_2_2_H_PRIME_LEN);
-
-	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&send_hprime_in,
-				       sizeof(send_hprime_in),
-				       (u8 *)&send_hprime_out,
-				       sizeof(send_hprime_out));
-	if (byte < 0) {
-		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
-		return byte;
-	}
-
-	if (send_hprime_out.header.status != FW_HDCP_STATUS_SUCCESS) {
-		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X Failed. Status: 0x%X\n",
-			    WIRED_AKE_SEND_HPRIME, send_hprime_out.header.status);
-		return -EIO;
-	}
-
-	return 0;
-}
-
-static int
-gsc_hdcp_store_pairing_info(struct device *dev, struct hdcp_port_data *data,
-			    struct hdcp2_ake_send_pairing_info *pairing_info)
-{
-	struct wired_cmd_ake_send_pairing_info_in pairing_info_in = { { 0 } };
-	struct wired_cmd_ake_send_pairing_info_out pairing_info_out = { { 0 } };
-	struct drm_i915_private *i915;
-	ssize_t byte;
-
-	if (!dev || !data || !pairing_info)
-		return -EINVAL;
-
-	i915 = kdev_to_i915(dev);
-	if (!i915) {
-		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
-		return -ENODEV;
-	}
-
-	pairing_info_in.header.api_version = HDCP_API_VERSION;
-	pairing_info_in.header.command_id = WIRED_AKE_SEND_PAIRING_INFO;
-	pairing_info_in.header.status = FW_HDCP_STATUS_SUCCESS;
-	pairing_info_in.header.buffer_len =
-					WIRED_CMD_BUF_LEN_SEND_PAIRING_INFO_IN;
-
-	pairing_info_in.port.integrated_port_type = data->port_type;
-	pairing_info_in.port.physical_port = (u8)data->hdcp_ddi;
-	pairing_info_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
-
-	memcpy(pairing_info_in.e_kh_km, pairing_info->e_kh_km,
-	       HDCP_2_2_E_KH_KM_LEN);
-
-	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&pairing_info_in,
-				       sizeof(pairing_info_in),
-				       (u8 *)&pairing_info_out,
-				       sizeof(pairing_info_out));
-	if (byte < 0) {
-		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
-		return byte;
-	}
-
-	if (pairing_info_out.header.status != FW_HDCP_STATUS_SUCCESS) {
-		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X failed. Status: 0x%X\n",
-			    WIRED_AKE_SEND_PAIRING_INFO,
-			    pairing_info_out.header.status);
-		return -EIO;
-	}
-
-	return 0;
-}
-
-static int
-gsc_hdcp_initiate_locality_check(struct device *dev,
-				 struct hdcp_port_data *data,
-				 struct hdcp2_lc_init *lc_init_data)
-{
-	struct wired_cmd_init_locality_check_in lc_init_in = { { 0 } };
-	struct wired_cmd_init_locality_check_out lc_init_out = { { 0 } };
-	struct drm_i915_private *i915;
-	ssize_t byte;
-
-	if (!dev || !data || !lc_init_data)
-		return -EINVAL;
-
-	i915 = kdev_to_i915(dev);
-	if (!i915) {
-		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
-		return -ENODEV;
-	}
-
-	lc_init_in.header.api_version = HDCP_API_VERSION;
-	lc_init_in.header.command_id = WIRED_INIT_LOCALITY_CHECK;
-	lc_init_in.header.status = FW_HDCP_STATUS_SUCCESS;
-	lc_init_in.header.buffer_len = WIRED_CMD_BUF_LEN_INIT_LOCALITY_CHECK_IN;
-
-	lc_init_in.port.integrated_port_type = data->port_type;
-	lc_init_in.port.physical_port = (u8)data->hdcp_ddi;
-	lc_init_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
-
-	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&lc_init_in, sizeof(lc_init_in),
-				       (u8 *)&lc_init_out, sizeof(lc_init_out));
-	if (byte < 0) {
-		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
-		return byte;
-	}
-
-	if (lc_init_out.header.status != FW_HDCP_STATUS_SUCCESS) {
-		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X Failed. status: 0x%X\n",
-			    WIRED_INIT_LOCALITY_CHECK, lc_init_out.header.status);
-		return -EIO;
-	}
-
-	lc_init_data->msg_id = HDCP_2_2_LC_INIT;
-	memcpy(lc_init_data->r_n, lc_init_out.r_n, HDCP_2_2_RN_LEN);
-
-	return 0;
-}
-
-static int
-gsc_hdcp_verify_lprime(struct device *dev, struct hdcp_port_data *data,
-		       struct hdcp2_lc_send_lprime *rx_lprime)
-{
-	struct wired_cmd_validate_locality_in verify_lprime_in = { { 0 } };
-	struct wired_cmd_validate_locality_out verify_lprime_out = { { 0 } };
-	struct drm_i915_private *i915;
-	ssize_t byte;
-
-	if (!dev || !data || !rx_lprime)
-		return -EINVAL;
-
-	i915 = kdev_to_i915(dev);
-	if (!i915) {
-		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
-		return -ENODEV;
-	}
-
-	verify_lprime_in.header.api_version = HDCP_API_VERSION;
-	verify_lprime_in.header.command_id = WIRED_VALIDATE_LOCALITY;
-	verify_lprime_in.header.status = FW_HDCP_STATUS_SUCCESS;
-	verify_lprime_in.header.buffer_len =
-					WIRED_CMD_BUF_LEN_VALIDATE_LOCALITY_IN;
-
-	verify_lprime_in.port.integrated_port_type = data->port_type;
-	verify_lprime_in.port.physical_port = (u8)data->hdcp_ddi;
-	verify_lprime_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
-
-	memcpy(verify_lprime_in.l_prime, rx_lprime->l_prime,
-	       HDCP_2_2_L_PRIME_LEN);
-
-	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&verify_lprime_in,
-				       sizeof(verify_lprime_in),
-				       (u8 *)&verify_lprime_out,
-				       sizeof(verify_lprime_out));
-	if (byte < 0) {
-		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
-		return byte;
-	}
-
-	if (verify_lprime_out.header.status != FW_HDCP_STATUS_SUCCESS) {
-		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X failed. status: 0x%X\n",
-			    WIRED_VALIDATE_LOCALITY,
-			    verify_lprime_out.header.status);
-		return -EIO;
-	}
-
-	return 0;
-}
-
-static int gsc_hdcp_get_session_key(struct device *dev,
-				    struct hdcp_port_data *data,
-				    struct hdcp2_ske_send_eks *ske_data)
-{
-	struct wired_cmd_get_session_key_in get_skey_in = { { 0 } };
-	struct wired_cmd_get_session_key_out get_skey_out = { { 0 } };
-	struct drm_i915_private *i915;
-	ssize_t byte;
-
-	if (!dev || !data || !ske_data)
-		return -EINVAL;
-
-	i915 = kdev_to_i915(dev);
-	if (!i915) {
-		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
-		return -ENODEV;
-	}
-
-	get_skey_in.header.api_version = HDCP_API_VERSION;
-	get_skey_in.header.command_id = WIRED_GET_SESSION_KEY;
-	get_skey_in.header.status = FW_HDCP_STATUS_SUCCESS;
-	get_skey_in.header.buffer_len = WIRED_CMD_BUF_LEN_GET_SESSION_KEY_IN;
-
-	get_skey_in.port.integrated_port_type = data->port_type;
-	get_skey_in.port.physical_port = (u8)data->hdcp_ddi;
-	get_skey_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
-
-	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&get_skey_in, sizeof(get_skey_in),
-				       (u8 *)&get_skey_out, sizeof(get_skey_out));
-	if (byte < 0) {
-		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
-		return byte;
-	}
-
-	if (get_skey_out.header.status != FW_HDCP_STATUS_SUCCESS) {
-		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X failed. status: 0x%X\n",
-			    WIRED_GET_SESSION_KEY, get_skey_out.header.status);
-		return -EIO;
-	}
-
-	ske_data->msg_id = HDCP_2_2_SKE_SEND_EKS;
-	memcpy(ske_data->e_dkey_ks, get_skey_out.e_dkey_ks,
-	       HDCP_2_2_E_DKEY_KS_LEN);
-	memcpy(ske_data->riv, get_skey_out.r_iv, HDCP_2_2_RIV_LEN);
-
-	return 0;
-}
-
-static int
-gsc_hdcp_repeater_check_flow_prepare_ack(struct device *dev,
-					 struct hdcp_port_data *data,
-					 struct hdcp2_rep_send_receiverid_list
-							*rep_topology,
-					 struct hdcp2_rep_send_ack
-							*rep_send_ack)
-{
-	struct wired_cmd_verify_repeater_in verify_repeater_in = { { 0 } };
-	struct wired_cmd_verify_repeater_out verify_repeater_out = { { 0 } };
-	struct drm_i915_private *i915;
-	ssize_t byte;
-
-	if (!dev || !rep_topology || !rep_send_ack || !data)
-		return -EINVAL;
-
-	i915 = kdev_to_i915(dev);
-	if (!i915) {
-		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
-		return -ENODEV;
-	}
-
-	verify_repeater_in.header.api_version = HDCP_API_VERSION;
-	verify_repeater_in.header.command_id = WIRED_VERIFY_REPEATER;
-	verify_repeater_in.header.status = FW_HDCP_STATUS_SUCCESS;
-	verify_repeater_in.header.buffer_len =
-					WIRED_CMD_BUF_LEN_VERIFY_REPEATER_IN;
-
-	verify_repeater_in.port.integrated_port_type = data->port_type;
-	verify_repeater_in.port.physical_port = (u8)data->hdcp_ddi;
-	verify_repeater_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
-
-	memcpy(verify_repeater_in.rx_info, rep_topology->rx_info,
-	       HDCP_2_2_RXINFO_LEN);
-	memcpy(verify_repeater_in.seq_num_v, rep_topology->seq_num_v,
-	       HDCP_2_2_SEQ_NUM_LEN);
-	memcpy(verify_repeater_in.v_prime, rep_topology->v_prime,
-	       HDCP_2_2_V_PRIME_HALF_LEN);
-	memcpy(verify_repeater_in.receiver_ids, rep_topology->receiver_ids,
-	       HDCP_2_2_RECEIVER_IDS_MAX_LEN);
-
-	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&verify_repeater_in,
-				       sizeof(verify_repeater_in),
-				       (u8 *)&verify_repeater_out,
-				       sizeof(verify_repeater_out));
-	if (byte < 0) {
-		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
-		return byte;
-	}
-
-	if (verify_repeater_out.header.status != FW_HDCP_STATUS_SUCCESS) {
-		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X failed. status: 0x%X\n",
-			    WIRED_VERIFY_REPEATER,
-			    verify_repeater_out.header.status);
-		return -EIO;
-	}
-
-	memcpy(rep_send_ack->v, verify_repeater_out.v,
-	       HDCP_2_2_V_PRIME_HALF_LEN);
-	rep_send_ack->msg_id = HDCP_2_2_REP_SEND_ACK;
-
-	return 0;
-}
-
-static int gsc_hdcp_verify_mprime(struct device *dev,
-				  struct hdcp_port_data *data,
-				  struct hdcp2_rep_stream_ready *stream_ready)
-{
-	struct wired_cmd_repeater_auth_stream_req_in *verify_mprime_in;
-	struct wired_cmd_repeater_auth_stream_req_out
-					verify_mprime_out = { { 0 } };
-	struct drm_i915_private *i915;
-	ssize_t byte;
-	size_t cmd_size;
-
-	if (!dev || !stream_ready || !data)
-		return -EINVAL;
-
-	i915 = kdev_to_i915(dev);
-	if (!i915) {
-		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
-		return -ENODEV;
-	}
-
-	cmd_size = struct_size(verify_mprime_in, streams, data->k);
-	if (cmd_size == SIZE_MAX)
-		return -EINVAL;
-
-	verify_mprime_in = kzalloc(cmd_size, GFP_KERNEL);
-	if (!verify_mprime_in)
-		return -ENOMEM;
-
-	verify_mprime_in->header.api_version = HDCP_API_VERSION;
-	verify_mprime_in->header.command_id = WIRED_REPEATER_AUTH_STREAM_REQ;
-	verify_mprime_in->header.status = FW_HDCP_STATUS_SUCCESS;
-	verify_mprime_in->header.buffer_len = cmd_size  - sizeof(verify_mprime_in->header);
-
-	verify_mprime_in->port.integrated_port_type = data->port_type;
-	verify_mprime_in->port.physical_port = (u8)data->hdcp_ddi;
-	verify_mprime_in->port.attached_transcoder = (u8)data->hdcp_transcoder;
-
-	memcpy(verify_mprime_in->m_prime, stream_ready->m_prime, HDCP_2_2_MPRIME_LEN);
-	drm_hdcp_cpu_to_be24(verify_mprime_in->seq_num_m, data->seq_num_m);
-
-	memcpy(verify_mprime_in->streams, data->streams,
-	       array_size(data->k, sizeof(*data->streams)));
-
-	verify_mprime_in->k = cpu_to_be16(data->k);
-
-	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)verify_mprime_in, cmd_size,
-				       (u8 *)&verify_mprime_out,
-				       sizeof(verify_mprime_out));
-	kfree(verify_mprime_in);
-	if (byte < 0) {
-		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
-		return byte;
-	}
-
-	if (verify_mprime_out.header.status != FW_HDCP_STATUS_SUCCESS) {
-		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X failed. status: 0x%X\n",
-			    WIRED_REPEATER_AUTH_STREAM_REQ,
-			    verify_mprime_out.header.status);
-		return -EIO;
-	}
-
-	return 0;
-}
-
-static int gsc_hdcp_enable_authentication(struct device *dev,
-					  struct hdcp_port_data *data)
-{
-	struct wired_cmd_enable_auth_in enable_auth_in = { { 0 } };
-	struct wired_cmd_enable_auth_out enable_auth_out = { { 0 } };
-	struct drm_i915_private *i915;
-	ssize_t byte;
-
-	if (!dev || !data)
-		return -EINVAL;
-
-	i915 = kdev_to_i915(dev);
-	if (!i915) {
-		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
-		return -ENODEV;
-	}
-
-	enable_auth_in.header.api_version = HDCP_API_VERSION;
-	enable_auth_in.header.command_id = WIRED_ENABLE_AUTH;
-	enable_auth_in.header.status = FW_HDCP_STATUS_SUCCESS;
-	enable_auth_in.header.buffer_len = WIRED_CMD_BUF_LEN_ENABLE_AUTH_IN;
-
-	enable_auth_in.port.integrated_port_type = data->port_type;
-	enable_auth_in.port.physical_port = (u8)data->hdcp_ddi;
-	enable_auth_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
-	enable_auth_in.stream_type = data->streams[0].stream_type;
-
-	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&enable_auth_in,
-				       sizeof(enable_auth_in),
-				       (u8 *)&enable_auth_out,
-				       sizeof(enable_auth_out));
-	if (byte < 0) {
-		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
-		return byte;
-	}
-
-	if (enable_auth_out.header.status != FW_HDCP_STATUS_SUCCESS) {
-		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X failed. status: 0x%X\n",
-			    WIRED_ENABLE_AUTH, enable_auth_out.header.status);
-		return -EIO;
-	}
-
-	return 0;
-}
-
-static int
-gsc_hdcp_close_session(struct device *dev, struct hdcp_port_data *data)
-{
-	struct wired_cmd_close_session_in session_close_in = { { 0 } };
-	struct wired_cmd_close_session_out session_close_out = { { 0 } };
-	struct drm_i915_private *i915;
-	ssize_t byte;
-
-	if (!dev || !data)
-		return -EINVAL;
-
-	i915 = kdev_to_i915(dev);
-	if (!i915) {
-		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
-		return -ENODEV;
-	}
-
-	session_close_in.header.api_version = HDCP_API_VERSION;
-	session_close_in.header.command_id = WIRED_CLOSE_SESSION;
-	session_close_in.header.status = FW_HDCP_STATUS_SUCCESS;
-	session_close_in.header.buffer_len =
-				WIRED_CMD_BUF_LEN_CLOSE_SESSION_IN;
-
-	session_close_in.port.integrated_port_type = data->port_type;
-	session_close_in.port.physical_port = (u8)data->hdcp_ddi;
-	session_close_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
-
-	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&session_close_in,
-				       sizeof(session_close_in),
-				       (u8 *)&session_close_out,
-				       sizeof(session_close_out));
-	if (byte < 0) {
-		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
-		return byte;
-	}
-
-	if (session_close_out.header.status != FW_HDCP_STATUS_SUCCESS) {
-		drm_dbg_kms(&i915->drm, "Session Close Failed. status: 0x%X\n",
-			    session_close_out.header.status);
-		return -EIO;
-	}
-
-	return 0;
-}
-
-static const struct i915_hdcp_ops gsc_hdcp_ops = {
-	.initiate_hdcp2_session = gsc_hdcp_initiate_session,
-	.verify_receiver_cert_prepare_km =
-				gsc_hdcp_verify_receiver_cert_prepare_km,
-	.verify_hprime = gsc_hdcp_verify_hprime,
-	.store_pairing_info = gsc_hdcp_store_pairing_info,
-	.initiate_locality_check = gsc_hdcp_initiate_locality_check,
-	.verify_lprime = gsc_hdcp_verify_lprime,
-	.get_session_key = gsc_hdcp_get_session_key,
-	.repeater_check_flow_prepare_ack =
-				gsc_hdcp_repeater_check_flow_prepare_ack,
-	.verify_mprime = gsc_hdcp_verify_mprime,
-	.enable_hdcp_authentication = gsc_hdcp_enable_authentication,
-	.close_hdcp_session = gsc_hdcp_close_session,
-};
-
 /*This function helps allocate memory for the command that we will send to gsc cs */
 static int intel_hdcp_gsc_initialize_message(struct drm_i915_private *i915,
 					     struct intel_hdcp_gsc_message *hdcp_message)
@@ -676,6 +76,22 @@ static int intel_hdcp_gsc_initialize_message(struct drm_i915_private *i915,
 	return err;
 }
 
+static const struct i915_hdcp_ops gsc_hdcp_ops = {
+	.initiate_hdcp2_session = intel_hdcp_gsc_initiate_session,
+	.verify_receiver_cert_prepare_km =
+				intel_hdcp_gsc_verify_receiver_cert_prepare_km,
+	.verify_hprime = intel_hdcp_gsc_verify_hprime,
+	.store_pairing_info = intel_hdcp_gsc_store_pairing_info,
+	.initiate_locality_check = intel_hdcp_gsc_initiate_locality_check,
+	.verify_lprime = intel_hdcp_gsc_verify_lprime,
+	.get_session_key = intel_hdcp_gsc_get_session_key,
+	.repeater_check_flow_prepare_ack =
+				intel_hdcp_gsc_repeater_check_flow_prepare_ack,
+	.verify_mprime = intel_hdcp_gsc_verify_mprime,
+	.enable_hdcp_authentication = intel_hdcp_gsc_enable_authentication,
+	.close_hdcp_session = intel_hdcp_gsc_close_session,
+};
+
 static int intel_hdcp_gsc_hdcp2_init(struct drm_i915_private *i915)
 {
 	struct intel_hdcp_gsc_message *hdcp_message;
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
index dcbf9b0b22c6..c58d8198b44e 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
+++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
@@ -8,6 +8,7 @@
 
 #include <linux/err.h>
 #include <linux/types.h>
+
 #include "i915_drv.h"
 
 struct intel_hdcp_gsc_message {
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c b/drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c
new file mode 100644
index 000000000000..7a697d0dd6cb
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c
@@ -0,0 +1,588 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2023, Intel Corporation.
+ */
+
+#include "intel_hdcp_gsc_message.h"
+
+int
+intel_hdcp_gsc_initiate_session(struct device *dev, struct hdcp_port_data *data,
+				struct hdcp2_ake_init *ake_data)
+{
+	struct wired_cmd_initiate_hdcp2_session_in session_init_in = { { 0 } };
+	struct wired_cmd_initiate_hdcp2_session_out
+						session_init_out = { { 0 } };
+	struct drm_i915_private *i915;
+	ssize_t byte;
+
+	if (!dev || !data || !ake_data)
+		return -EINVAL;
+
+	i915 = kdev_to_i915(dev);
+	if (!i915) {
+		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
+		return -ENODEV;
+	}
+
+	session_init_in.header.api_version = HDCP_API_VERSION;
+	session_init_in.header.command_id = WIRED_INITIATE_HDCP2_SESSION;
+	session_init_in.header.status = FW_HDCP_STATUS_SUCCESS;
+	session_init_in.header.buffer_len =
+				WIRED_CMD_BUF_LEN_INITIATE_HDCP2_SESSION_IN;
+
+	session_init_in.port.integrated_port_type = data->port_type;
+	session_init_in.port.physical_port = (u8)data->hdcp_ddi;
+	session_init_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
+	session_init_in.protocol = data->protocol;
+
+	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&session_init_in,
+				       sizeof(session_init_in),
+				       (u8 *)&session_init_out,
+				       sizeof(session_init_out));
+	if (byte < 0) {
+		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
+		return byte;
+	}
+
+	if (session_init_out.header.status != FW_HDCP_STATUS_SUCCESS) {
+		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X Failed. Status: 0x%X\n",
+			    WIRED_INITIATE_HDCP2_SESSION,
+			    session_init_out.header.status);
+		return -EIO;
+	}
+
+	ake_data->msg_id = HDCP_2_2_AKE_INIT;
+	ake_data->tx_caps = session_init_out.tx_caps;
+	memcpy(ake_data->r_tx, session_init_out.r_tx, HDCP_2_2_RTX_LEN);
+
+	return 0;
+}
+
+int
+intel_hdcp_gsc_verify_receiver_cert_prepare_km(struct device *dev,
+					       struct hdcp_port_data *data,
+					       struct hdcp2_ake_send_cert *rx_cert,
+					       bool *km_stored,
+					       struct hdcp2_ake_no_stored_km
+					       *ek_pub_km,
+					       size_t *msg_sz)
+{
+	struct wired_cmd_verify_receiver_cert_in verify_rxcert_in = { { 0 } };
+	struct wired_cmd_verify_receiver_cert_out verify_rxcert_out = { { 0 } };
+	struct drm_i915_private *i915;
+	ssize_t byte;
+
+	if (!dev || !data || !rx_cert || !km_stored || !ek_pub_km || !msg_sz)
+		return -EINVAL;
+
+	i915 = kdev_to_i915(dev);
+	if (!i915) {
+		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
+		return -ENODEV;
+	}
+
+	verify_rxcert_in.header.api_version = HDCP_API_VERSION;
+	verify_rxcert_in.header.command_id = WIRED_VERIFY_RECEIVER_CERT;
+	verify_rxcert_in.header.status = FW_HDCP_STATUS_SUCCESS;
+	verify_rxcert_in.header.buffer_len =
+				WIRED_CMD_BUF_LEN_VERIFY_RECEIVER_CERT_IN;
+
+	verify_rxcert_in.port.integrated_port_type = data->port_type;
+	verify_rxcert_in.port.physical_port = (u8)data->hdcp_ddi;
+	verify_rxcert_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
+
+	verify_rxcert_in.cert_rx = rx_cert->cert_rx;
+	memcpy(verify_rxcert_in.r_rx, &rx_cert->r_rx, HDCP_2_2_RRX_LEN);
+	memcpy(verify_rxcert_in.rx_caps, rx_cert->rx_caps, HDCP_2_2_RXCAPS_LEN);
+
+	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&verify_rxcert_in,
+				       sizeof(verify_rxcert_in),
+				       (u8 *)&verify_rxcert_out,
+				       sizeof(verify_rxcert_out));
+	if (byte < 0) {
+		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed: %zd\n", byte);
+		return byte;
+	}
+
+	if (verify_rxcert_out.header.status != FW_HDCP_STATUS_SUCCESS) {
+		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X Failed. Status: 0x%X\n",
+			    WIRED_VERIFY_RECEIVER_CERT,
+			    verify_rxcert_out.header.status);
+		return -EIO;
+	}
+
+	*km_stored = !!verify_rxcert_out.km_stored;
+	if (verify_rxcert_out.km_stored) {
+		ek_pub_km->msg_id = HDCP_2_2_AKE_STORED_KM;
+		*msg_sz = sizeof(struct hdcp2_ake_stored_km);
+	} else {
+		ek_pub_km->msg_id = HDCP_2_2_AKE_NO_STORED_KM;
+		*msg_sz = sizeof(struct hdcp2_ake_no_stored_km);
+	}
+
+	memcpy(ek_pub_km->e_kpub_km, &verify_rxcert_out.ekm_buff,
+	       sizeof(verify_rxcert_out.ekm_buff));
+
+	return 0;
+}
+
+int
+intel_hdcp_gsc_verify_hprime(struct device *dev, struct hdcp_port_data *data,
+			     struct hdcp2_ake_send_hprime *rx_hprime)
+{
+	struct wired_cmd_ake_send_hprime_in send_hprime_in = { { 0 } };
+	struct wired_cmd_ake_send_hprime_out send_hprime_out = { { 0 } };
+	struct drm_i915_private *i915;
+	ssize_t byte;
+
+	if (!dev || !data || !rx_hprime)
+		return -EINVAL;
+
+	i915 = kdev_to_i915(dev);
+	if (!i915) {
+		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
+		return -ENODEV;
+	}
+
+	send_hprime_in.header.api_version = HDCP_API_VERSION;
+	send_hprime_in.header.command_id = WIRED_AKE_SEND_HPRIME;
+	send_hprime_in.header.status = FW_HDCP_STATUS_SUCCESS;
+	send_hprime_in.header.buffer_len = WIRED_CMD_BUF_LEN_AKE_SEND_HPRIME_IN;
+
+	send_hprime_in.port.integrated_port_type = data->port_type;
+	send_hprime_in.port.physical_port = (u8)data->hdcp_ddi;
+	send_hprime_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
+
+	memcpy(send_hprime_in.h_prime, rx_hprime->h_prime,
+	       HDCP_2_2_H_PRIME_LEN);
+
+	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&send_hprime_in,
+				       sizeof(send_hprime_in),
+				       (u8 *)&send_hprime_out,
+				       sizeof(send_hprime_out));
+	if (byte < 0) {
+		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
+		return byte;
+	}
+
+	if (send_hprime_out.header.status != FW_HDCP_STATUS_SUCCESS) {
+		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X Failed. Status: 0x%X\n",
+			    WIRED_AKE_SEND_HPRIME, send_hprime_out.header.status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int
+intel_hdcp_gsc_store_pairing_info(struct device *dev, struct hdcp_port_data *data,
+				  struct hdcp2_ake_send_pairing_info *pairing_info)
+{
+	struct wired_cmd_ake_send_pairing_info_in pairing_info_in = { { 0 } };
+	struct wired_cmd_ake_send_pairing_info_out pairing_info_out = { { 0 } };
+	struct drm_i915_private *i915;
+	ssize_t byte;
+
+	if (!dev || !data || !pairing_info)
+		return -EINVAL;
+
+	i915 = kdev_to_i915(dev);
+	if (!i915) {
+		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
+		return -ENODEV;
+	}
+
+	pairing_info_in.header.api_version = HDCP_API_VERSION;
+	pairing_info_in.header.command_id = WIRED_AKE_SEND_PAIRING_INFO;
+	pairing_info_in.header.status = FW_HDCP_STATUS_SUCCESS;
+	pairing_info_in.header.buffer_len =
+					WIRED_CMD_BUF_LEN_SEND_PAIRING_INFO_IN;
+
+	pairing_info_in.port.integrated_port_type = data->port_type;
+	pairing_info_in.port.physical_port = (u8)data->hdcp_ddi;
+	pairing_info_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
+
+	memcpy(pairing_info_in.e_kh_km, pairing_info->e_kh_km,
+	       HDCP_2_2_E_KH_KM_LEN);
+
+	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&pairing_info_in,
+				       sizeof(pairing_info_in),
+				       (u8 *)&pairing_info_out,
+				       sizeof(pairing_info_out));
+	if (byte < 0) {
+		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
+		return byte;
+	}
+
+	if (pairing_info_out.header.status != FW_HDCP_STATUS_SUCCESS) {
+		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X failed. Status: 0x%X\n",
+			    WIRED_AKE_SEND_PAIRING_INFO,
+			    pairing_info_out.header.status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int
+intel_hdcp_gsc_initiate_locality_check(struct device *dev,
+				       struct hdcp_port_data *data,
+				       struct hdcp2_lc_init *lc_init_data)
+{
+	struct wired_cmd_init_locality_check_in lc_init_in = { { 0 } };
+	struct wired_cmd_init_locality_check_out lc_init_out = { { 0 } };
+	struct drm_i915_private *i915;
+	ssize_t byte;
+
+	if (!dev || !data || !lc_init_data)
+		return -EINVAL;
+
+	i915 = kdev_to_i915(dev);
+	if (!i915) {
+		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
+		return -ENODEV;
+	}
+
+	lc_init_in.header.api_version = HDCP_API_VERSION;
+	lc_init_in.header.command_id = WIRED_INIT_LOCALITY_CHECK;
+	lc_init_in.header.status = FW_HDCP_STATUS_SUCCESS;
+	lc_init_in.header.buffer_len = WIRED_CMD_BUF_LEN_INIT_LOCALITY_CHECK_IN;
+
+	lc_init_in.port.integrated_port_type = data->port_type;
+	lc_init_in.port.physical_port = (u8)data->hdcp_ddi;
+	lc_init_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
+
+	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&lc_init_in, sizeof(lc_init_in),
+				       (u8 *)&lc_init_out, sizeof(lc_init_out));
+	if (byte < 0) {
+		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
+		return byte;
+	}
+
+	if (lc_init_out.header.status != FW_HDCP_STATUS_SUCCESS) {
+		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X Failed. status: 0x%X\n",
+			    WIRED_INIT_LOCALITY_CHECK, lc_init_out.header.status);
+		return -EIO;
+	}
+
+	lc_init_data->msg_id = HDCP_2_2_LC_INIT;
+	memcpy(lc_init_data->r_n, lc_init_out.r_n, HDCP_2_2_RN_LEN);
+
+	return 0;
+}
+
+int
+intel_hdcp_gsc_verify_lprime(struct device *dev, struct hdcp_port_data *data,
+			     struct hdcp2_lc_send_lprime *rx_lprime)
+{
+	struct wired_cmd_validate_locality_in verify_lprime_in = { { 0 } };
+	struct wired_cmd_validate_locality_out verify_lprime_out = { { 0 } };
+	struct drm_i915_private *i915;
+	ssize_t byte;
+
+	if (!dev || !data || !rx_lprime)
+		return -EINVAL;
+
+	i915 = kdev_to_i915(dev);
+	if (!i915) {
+		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
+		return -ENODEV;
+	}
+
+	verify_lprime_in.header.api_version = HDCP_API_VERSION;
+	verify_lprime_in.header.command_id = WIRED_VALIDATE_LOCALITY;
+	verify_lprime_in.header.status = FW_HDCP_STATUS_SUCCESS;
+	verify_lprime_in.header.buffer_len =
+					WIRED_CMD_BUF_LEN_VALIDATE_LOCALITY_IN;
+
+	verify_lprime_in.port.integrated_port_type = data->port_type;
+	verify_lprime_in.port.physical_port = (u8)data->hdcp_ddi;
+	verify_lprime_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
+
+	memcpy(verify_lprime_in.l_prime, rx_lprime->l_prime,
+	       HDCP_2_2_L_PRIME_LEN);
+
+	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&verify_lprime_in,
+				       sizeof(verify_lprime_in),
+				       (u8 *)&verify_lprime_out,
+				       sizeof(verify_lprime_out));
+	if (byte < 0) {
+		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
+		return byte;
+	}
+
+	if (verify_lprime_out.header.status != FW_HDCP_STATUS_SUCCESS) {
+		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X failed. status: 0x%X\n",
+			    WIRED_VALIDATE_LOCALITY,
+			    verify_lprime_out.header.status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int intel_hdcp_gsc_get_session_key(struct device *dev,
+				   struct hdcp_port_data *data,
+				   struct hdcp2_ske_send_eks *ske_data)
+{
+	struct wired_cmd_get_session_key_in get_skey_in = { { 0 } };
+	struct wired_cmd_get_session_key_out get_skey_out = { { 0 } };
+	struct drm_i915_private *i915;
+	ssize_t byte;
+
+	if (!dev || !data || !ske_data)
+		return -EINVAL;
+
+	i915 = kdev_to_i915(dev);
+	if (!i915) {
+		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
+		return -ENODEV;
+	}
+
+	get_skey_in.header.api_version = HDCP_API_VERSION;
+	get_skey_in.header.command_id = WIRED_GET_SESSION_KEY;
+	get_skey_in.header.status = FW_HDCP_STATUS_SUCCESS;
+	get_skey_in.header.buffer_len = WIRED_CMD_BUF_LEN_GET_SESSION_KEY_IN;
+
+	get_skey_in.port.integrated_port_type = data->port_type;
+	get_skey_in.port.physical_port = (u8)data->hdcp_ddi;
+	get_skey_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
+
+	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&get_skey_in, sizeof(get_skey_in),
+				       (u8 *)&get_skey_out, sizeof(get_skey_out));
+	if (byte < 0) {
+		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
+		return byte;
+	}
+
+	if (get_skey_out.header.status != FW_HDCP_STATUS_SUCCESS) {
+		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X failed. status: 0x%X\n",
+			    WIRED_GET_SESSION_KEY, get_skey_out.header.status);
+		return -EIO;
+	}
+
+	ske_data->msg_id = HDCP_2_2_SKE_SEND_EKS;
+	memcpy(ske_data->e_dkey_ks, get_skey_out.e_dkey_ks,
+	       HDCP_2_2_E_DKEY_KS_LEN);
+	memcpy(ske_data->riv, get_skey_out.r_iv, HDCP_2_2_RIV_LEN);
+
+	return 0;
+}
+
+int
+intel_hdcp_gsc_repeater_check_flow_prepare_ack(struct device *dev,
+					       struct hdcp_port_data *data,
+					       struct hdcp2_rep_send_receiverid_list
+					       *rep_topology,
+					       struct hdcp2_rep_send_ack
+					       *rep_send_ack)
+{
+	struct wired_cmd_verify_repeater_in verify_repeater_in = { { 0 } };
+	struct wired_cmd_verify_repeater_out verify_repeater_out = { { 0 } };
+	struct drm_i915_private *i915;
+	ssize_t byte;
+
+	if (!dev || !rep_topology || !rep_send_ack || !data)
+		return -EINVAL;
+
+	i915 = kdev_to_i915(dev);
+	if (!i915) {
+		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
+		return -ENODEV;
+	}
+
+	verify_repeater_in.header.api_version = HDCP_API_VERSION;
+	verify_repeater_in.header.command_id = WIRED_VERIFY_REPEATER;
+	verify_repeater_in.header.status = FW_HDCP_STATUS_SUCCESS;
+	verify_repeater_in.header.buffer_len =
+					WIRED_CMD_BUF_LEN_VERIFY_REPEATER_IN;
+
+	verify_repeater_in.port.integrated_port_type = data->port_type;
+	verify_repeater_in.port.physical_port = (u8)data->hdcp_ddi;
+	verify_repeater_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
+
+	memcpy(verify_repeater_in.rx_info, rep_topology->rx_info,
+	       HDCP_2_2_RXINFO_LEN);
+	memcpy(verify_repeater_in.seq_num_v, rep_topology->seq_num_v,
+	       HDCP_2_2_SEQ_NUM_LEN);
+	memcpy(verify_repeater_in.v_prime, rep_topology->v_prime,
+	       HDCP_2_2_V_PRIME_HALF_LEN);
+	memcpy(verify_repeater_in.receiver_ids, rep_topology->receiver_ids,
+	       HDCP_2_2_RECEIVER_IDS_MAX_LEN);
+
+	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&verify_repeater_in,
+				       sizeof(verify_repeater_in),
+				       (u8 *)&verify_repeater_out,
+				       sizeof(verify_repeater_out));
+	if (byte < 0) {
+		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
+		return byte;
+	}
+
+	if (verify_repeater_out.header.status != FW_HDCP_STATUS_SUCCESS) {
+		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X failed. status: 0x%X\n",
+			    WIRED_VERIFY_REPEATER,
+			    verify_repeater_out.header.status);
+		return -EIO;
+	}
+
+	memcpy(rep_send_ack->v, verify_repeater_out.v,
+	       HDCP_2_2_V_PRIME_HALF_LEN);
+	rep_send_ack->msg_id = HDCP_2_2_REP_SEND_ACK;
+
+	return 0;
+}
+
+int intel_hdcp_gsc_verify_mprime(struct device *dev,
+				 struct hdcp_port_data *data,
+				 struct hdcp2_rep_stream_ready *stream_ready)
+{
+	struct wired_cmd_repeater_auth_stream_req_in *verify_mprime_in;
+	struct wired_cmd_repeater_auth_stream_req_out
+					verify_mprime_out = { { 0 } };
+	struct drm_i915_private *i915;
+	ssize_t byte;
+	size_t cmd_size;
+
+	if (!dev || !stream_ready || !data)
+		return -EINVAL;
+
+	i915 = kdev_to_i915(dev);
+	if (!i915) {
+		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
+		return -ENODEV;
+	}
+
+	cmd_size = struct_size(verify_mprime_in, streams, data->k);
+	if (cmd_size == SIZE_MAX)
+		return -EINVAL;
+
+	verify_mprime_in = kzalloc(cmd_size, GFP_KERNEL);
+	if (!verify_mprime_in)
+		return -ENOMEM;
+
+	verify_mprime_in->header.api_version = HDCP_API_VERSION;
+	verify_mprime_in->header.command_id = WIRED_REPEATER_AUTH_STREAM_REQ;
+	verify_mprime_in->header.status = FW_HDCP_STATUS_SUCCESS;
+	verify_mprime_in->header.buffer_len = cmd_size  - sizeof(verify_mprime_in->header);
+
+	verify_mprime_in->port.integrated_port_type = data->port_type;
+	verify_mprime_in->port.physical_port = (u8)data->hdcp_ddi;
+	verify_mprime_in->port.attached_transcoder = (u8)data->hdcp_transcoder;
+
+	memcpy(verify_mprime_in->m_prime, stream_ready->m_prime, HDCP_2_2_MPRIME_LEN);
+	drm_hdcp_cpu_to_be24(verify_mprime_in->seq_num_m, data->seq_num_m);
+
+	memcpy(verify_mprime_in->streams, data->streams,
+	       array_size(data->k, sizeof(*data->streams)));
+
+	verify_mprime_in->k = cpu_to_be16(data->k);
+
+	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)verify_mprime_in, cmd_size,
+				       (u8 *)&verify_mprime_out,
+				       sizeof(verify_mprime_out));
+	kfree(verify_mprime_in);
+	if (byte < 0) {
+		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
+		return byte;
+	}
+
+	if (verify_mprime_out.header.status != FW_HDCP_STATUS_SUCCESS) {
+		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X failed. status: 0x%X\n",
+			    WIRED_REPEATER_AUTH_STREAM_REQ,
+			    verify_mprime_out.header.status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int intel_hdcp_gsc_enable_authentication(struct device *dev,
+					 struct hdcp_port_data *data)
+{
+	struct wired_cmd_enable_auth_in enable_auth_in = { { 0 } };
+	struct wired_cmd_enable_auth_out enable_auth_out = { { 0 } };
+	struct drm_i915_private *i915;
+	ssize_t byte;
+
+	if (!dev || !data)
+		return -EINVAL;
+
+	i915 = kdev_to_i915(dev);
+	if (!i915) {
+		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
+		return -ENODEV;
+	}
+
+	enable_auth_in.header.api_version = HDCP_API_VERSION;
+	enable_auth_in.header.command_id = WIRED_ENABLE_AUTH;
+	enable_auth_in.header.status = FW_HDCP_STATUS_SUCCESS;
+	enable_auth_in.header.buffer_len = WIRED_CMD_BUF_LEN_ENABLE_AUTH_IN;
+
+	enable_auth_in.port.integrated_port_type = data->port_type;
+	enable_auth_in.port.physical_port = (u8)data->hdcp_ddi;
+	enable_auth_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
+	enable_auth_in.stream_type = data->streams[0].stream_type;
+
+	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&enable_auth_in,
+				       sizeof(enable_auth_in),
+				       (u8 *)&enable_auth_out,
+				       sizeof(enable_auth_out));
+	if (byte < 0) {
+		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
+		return byte;
+	}
+
+	if (enable_auth_out.header.status != FW_HDCP_STATUS_SUCCESS) {
+		drm_dbg_kms(&i915->drm, "FW cmd 0x%08X failed. status: 0x%X\n",
+			    WIRED_ENABLE_AUTH, enable_auth_out.header.status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int
+intel_hdcp_gsc_close_session(struct device *dev, struct hdcp_port_data *data)
+{
+	struct wired_cmd_close_session_in session_close_in = { { 0 } };
+	struct wired_cmd_close_session_out session_close_out = { { 0 } };
+	struct drm_i915_private *i915;
+	ssize_t byte;
+
+	if (!dev || !data)
+		return -EINVAL;
+
+	i915 = kdev_to_i915(dev);
+	if (!i915) {
+		dev_err(dev, "DRM not initialized, aborting HDCP.\n");
+		return -ENODEV;
+	}
+
+	session_close_in.header.api_version = HDCP_API_VERSION;
+	session_close_in.header.command_id = WIRED_CLOSE_SESSION;
+	session_close_in.header.status = FW_HDCP_STATUS_SUCCESS;
+	session_close_in.header.buffer_len =
+				WIRED_CMD_BUF_LEN_CLOSE_SESSION_IN;
+
+	session_close_in.port.integrated_port_type = data->port_type;
+	session_close_in.port.physical_port = (u8)data->hdcp_ddi;
+	session_close_in.port.attached_transcoder = (u8)data->hdcp_transcoder;
+
+	byte = intel_hdcp_gsc_msg_send(i915, (u8 *)&session_close_in,
+				       sizeof(session_close_in),
+				       (u8 *)&session_close_out,
+				       sizeof(session_close_out));
+	if (byte < 0) {
+		drm_dbg_kms(&i915->drm, "intel_hdcp_gsc_msg_send failed. %zd\n", byte);
+		return byte;
+	}
+
+	if (session_close_out.header.status != FW_HDCP_STATUS_SUCCESS) {
+		drm_dbg_kms(&i915->drm, "Session Close Failed. status: 0x%X\n",
+			    session_close_out.header.status);
+		return -EIO;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.h b/drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.h
new file mode 100644
index 000000000000..8da3c50d759f
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __INTEL_HDCP_GSC_MESSAGE_H__
+#define __INTEL_HDCP_GSC_MESSAGE_H__
+
+#include <drm/i915_hdcp_interface.h>
+
+#include "intel_hdcp_gsc.h"
+
+bool intel_hdcp_gsc_check_status(struct drm_i915_private *i915);
+int
+intel_hdcp_gsc_initiate_session(struct device *dev, struct hdcp_port_data *data,
+				struct hdcp2_ake_init *ake_data);
+int
+intel_hdcp_gsc_verify_receiver_cert_prepare_km(struct device *dev,
+					       struct hdcp_port_data *data,
+					       struct hdcp2_ake_send_cert *rx_cert,
+					       bool *km_stored,
+					       struct hdcp2_ake_no_stored_km
+					       *ek_pub_km,
+					       size_t *msg_sz);
+int
+intel_hdcp_gsc_verify_hprime(struct device *dev, struct hdcp_port_data *data,
+			     struct hdcp2_ake_send_hprime *rx_hprime);
+int
+intel_hdcp_gsc_store_pairing_info(struct device *dev, struct hdcp_port_data *data,
+				  struct hdcp2_ake_send_pairing_info *pairing_info);
+int
+intel_hdcp_gsc_initiate_locality_check(struct device *dev,
+				       struct hdcp_port_data *data,
+				       struct hdcp2_lc_init *lc_init_data);
+int
+intel_hdcp_gsc_verify_lprime(struct device *dev, struct hdcp_port_data *data,
+			     struct hdcp2_lc_send_lprime *rx_lprime);
+int intel_hdcp_gsc_get_session_key(struct device *dev,
+				   struct hdcp_port_data *data,
+				   struct hdcp2_ske_send_eks *ske_data);
+int
+intel_hdcp_gsc_repeater_check_flow_prepare_ack(struct device *dev,
+					       struct hdcp_port_data *data,
+					       struct hdcp2_rep_send_receiverid_list
+					       *rep_topology,
+					       struct hdcp2_rep_send_ack
+					       *rep_send_ack);
+int intel_hdcp_gsc_verify_mprime(struct device *dev,
+				 struct hdcp_port_data *data,
+				 struct hdcp2_rep_stream_ready *stream_ready);
+int intel_hdcp_gsc_enable_authentication(struct device *dev,
+					 struct hdcp_port_data *data);
+int
+intel_hdcp_gsc_close_session(struct device *dev, struct hdcp_port_data *data);
+
+#endif /* __INTEL_HDCP_GSC_MESSAGE_H__ */
-- 
2.25.1

