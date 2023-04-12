Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A700C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0029210E835;
	Wed, 12 Apr 2023 14:25:38 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A624510E835
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309537; x=1712845537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3DPHe/PUvo/CL6q0eSRdZxu+gar0c1puCD7ZWKUEVK8=;
 b=TQC3EBKth2BmFZnkUjZkZGz8MKAsCyPOjRhUXGzM44phmTj1/Amtcf+b
 VH9laSKiwfXpmkvV6kwtPVWfvbPcThuiiZxmpi96RpYFF8Xys/sGUZ5LC
 1LS2ymhhDHBvCu2VHrjdPLz46bWoF0xuAwngijc2tGj3evVQhPWIXpVTk
 zWJclJ/Vf7bNP1hGiIEhzJjeBKF+ZUb7hbaZpf+mQ9Ew1uUZlGvnTN5dT
 a4glZbqpXUr45Wp214MGpXAq8OPCa/Lp3uJRpcbKcDIMarEftWM3TxqqG
 mr5Sozw1eeLM6jK2XCOD2iqq465EgWxQdPX4YML+Xv1noHaPxxggc9Uaw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="342667677"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="342667677"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="719390940"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="719390940"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:25:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:48 +0300
Message-Id: <20230412142006.877109-24-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 23/41] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

drop ifdefs

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 442f791b5f7f..32c057351d37 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -76,7 +76,6 @@ struct gpio_map {
 	bool init;
 };
 
-#ifdef I915
 static struct gpio_map vlv_gpio_table[] = {
 	{ VLV_GPIO_NC_0_HV_DDI0_HPD },
 	{ VLV_GPIO_NC_1_HV_DDI0_DDC_SDA },
@@ -91,7 +90,6 @@ static struct gpio_map vlv_gpio_table[] = {
 	{ VLV_GPIO_NC_10_PANEL1_BKLTEN },
 	{ VLV_GPIO_NC_11_PANEL1_BKLTCTL },
 };
-#endif
 
 struct i2c_adapter_lookup {
 	u16 slave_addr;
@@ -244,7 +242,6 @@ static const u8 *mipi_exec_delay(struct intel_dsi *intel_dsi, const u8 *data)
 	return data;
 }
 
-#ifdef I915
 static void vlv_exec_gpio(struct intel_connector *connector,
 			  u8 gpio_source, u8 gpio_index, bool value)
 {
@@ -373,7 +370,6 @@ static void bxt_exec_gpio(struct intel_connector *connector,
 
 	gpiod_set_value(gpio_desc, value);
 }
-#endif
 
 static void icl_exec_gpio(struct intel_connector *connector,
 			  u8 gpio_source, u8 gpio_index, bool value)
@@ -495,14 +491,12 @@ static const u8 *mipi_exec_gpio(struct intel_dsi *intel_dsi, const u8 *data)
 		icl_native_gpio_set_value(dev_priv, gpio_number, value);
 	else if (DISPLAY_VER(dev_priv) >= 11)
 		icl_exec_gpio(connector, gpio_source, gpio_index, value);
-#ifdef I915
 	else if (IS_VALLEYVIEW(dev_priv))
 		vlv_exec_gpio(connector, gpio_source, gpio_number, value);
 	else if (IS_CHERRYVIEW(dev_priv))
 		chv_exec_gpio(connector, gpio_source, gpio_number, value);
 	else
 		bxt_exec_gpio(connector, gpio_source, gpio_index, value);
-#endif
 
 	return data;
 }
-- 
2.39.2

