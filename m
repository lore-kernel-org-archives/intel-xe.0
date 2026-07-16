Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CB1C44507
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 03:07:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F89010F1B4;
	Thu, 16 Jul 2026 03:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MP+DOOyL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F80B10E2CE;
 Thu, 16 Jul 2026 03:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784171228; x=1815707228;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UXqEkW0csH2IHTwQEElkpEFWz45sA9DiRtlMzWxq8L8=;
 b=MP+DOOyLcKp08PzQXi14U/iG5Zh7DM5HDQmPn8fF7Oy0b1ADBE6InPGA
 tjuPwVlHqSZ9FTnQx8Il7ejqCsDPtHjeDlAn4gy7J5TWd/ptpvMAgTeKU
 qTi0VLDcsn+QTmcOjkqRPhSRW3TYLCTAviZzu51RC8IMoY82aSfG23YvE
 zGuL6itspI2OXUkd3NccqKjKbref5rnzLmUtOcBsQksVMQMMI8MYX3s86
 hm0JuYpoP4wFWaio4WmM2vfGhoAGSMRSHsnS/fjuhx1g+7+Rd1ll9RzKJ
 qvix4vpiCnVB1eDW+84q/CrEWYvK2OrtitW5csxnxni82qevMPd3JeW8j g==;
X-CSE-ConnectionGUID: 0Ov9tU5QQGyTdRP/vr6lCw==
X-CSE-MsgGUID: oSHanq9KSZSlLckz7cBwJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88499984"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="88499984"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 20:07:07 -0700
X-CSE-ConnectionGUID: 7CAKm396S/mDwDWo/7Gs7A==
X-CSE-MsgGUID: XnNMjbx3Tgex8MybXCgjnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="255240670"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 15 Jul 2026 20:07:05 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/backlight: Remove DP_EDP_BACKLIGHT_AUX_ENABLE_CAP
 check for DPCD backlight
Date: Thu, 16 Jul 2026 08:37:01 +0530
Message-Id: <20260716030701.432951-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

Turns out Some panels allow only backlight AUX based backlight
by just setting the DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP and
not setting the DP_EDP_BACKLIGHT_AUX_ENABLE_CAP.
If we make DP_EDP_BACKLIGHT_AUX_ENABLE_CAP a necessity for AUX
based DPCD backlight these panels loose the ability to manipulate
backlight via AUX, specially ones with no PWM controller.
Remove this check from function so that panels who do not advertise
DP_EDP_BACKLIGHT_AUX_ENABLE_CAP but advertise
DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP are able to manipulate
backlight again.

Fixes: ed8be780bdbc ("drm/i915/backlight: Fix VESA backlight possible check condition")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16507
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 7a6c07f6aaeb..b859d5d0613c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -619,8 +619,7 @@ check_if_vesa_backlight_possible(struct intel_dp *intel_dp)
 	 * Since we only support Fully AUX Based VESA Backlight interface make sure
 	 * backlight enable is possible via AUX along with backlight adjustment
 	 */
-	if (!(intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP &&
-	      intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP))
+	if (!intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP)
 		return false;
 
 	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &bit_min);
-- 
2.34.1

