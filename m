Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04DDEF36F7
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 07:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A9510E239;
	Mon,  9 Mar 2026 07:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2qj8pCD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D9510E0D8;
 Mon,  9 Mar 2026 07:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773041556; x=1804577556;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=0qNNpnP3lyZH3HdmWjAPRNRTyd2jswfseZV6vLDwdXM=;
 b=a2qj8pCDqIDmlO7i2L8y7VZ39nQn8/opSV2o2TQLzlf4bAA6rzHb9bOA
 nMhC5Paxn+ec/mUyMGz4aWej/VrsVw5gHPlGuzufK1ME75ohkXrznD1Fp
 AvrTWigLaxEI3sSLok6aLg5oJU5+Hz27CfcA5MBmcCdXKe0x9ynHAw/OG
 ue6DSkLE9Cv6HP9pH8f0mFrfChdvJrbNmFlhaS0b/vLAgoO+mA7EWco0y
 s8+CjiyVjwGJatBisRm9PuBKVy4yz6iS7tR3QyYwt4KwcUB7QggnhsEdT
 OpfU07wtSl4g9zJN0fERFcDTWsSidXyMD7cRSSXYxRfCjZOHZnzQAUf3Y A==;
X-CSE-ConnectionGUID: 5Sgpw1dWQXq3eeNYGF17cQ==
X-CSE-MsgGUID: lQQXfl/ARO2pWYrqFhHiew==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77935647"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77935647"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 00:31:06 -0700
X-CSE-ConnectionGUID: /iEYHDqqQSyCz+NV4+ewNg==
X-CSE-MsgGUID: zdJlzA9pTQSXq1tTIPc88Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="217286718"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 09 Mar 2026 00:31:01 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Mon, 09 Mar 2026 12:59:24 +0530
Subject: [PATCH RFC 1/3] drm/display/dp: Export function to wake the sink
 AUX_CH
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-dp_aux_timeout-v1-1-08c610a63a84@intel.com>
References: <20260309-dp_aux_timeout-v1-0-08c610a63a84@intel.com>
In-Reply-To: <20260309-dp_aux_timeout-v1-0-08c610a63a84@intel.com>
To: Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, ville.syrjala@linux.intel.com, 
 suraj.kandpal@intel.com, imre.deak@intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

On a native AUX_CH transaction timeout, as per Spec 2.1 Section 2.3.4
says that if the AUX Reply Timeout timer timesout, DPTX can rety for 3
times because the No Reply may be due to the DPRX waking up from
power-saving state.
Export a function to wake the DP sink AUX_CH.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 36 +++++++++++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  1 +
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index a697cc227e28964cd8322803298178e7d788e820..1b8aa543ec3dc5819948af6f2724f3514b96b918 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -701,6 +701,42 @@ void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered)
 }
 EXPORT_SYMBOL(drm_dp_dpcd_set_powered);
 
+/**
+ * drm_dp_wake_sink() - Try to wake up the sink device AUX_CH if in sleep
+ *
+ * @aux: DisplayPort AUX channel
+ */
+void drm_dp_wake_sink(struct drm_dp_aux *aux)
+{
+	const u8 wake_retry = 6;
+	u8 value = 0;
+	int ret = 0;
+
+	/*
+	 * Wake the sink device
+	 * Spec DP2.1 section 2.3.1.2 if AUX CH is powered down by writing 0x02
+	 * to DP_SET_POWER dpcd reg, 1ms time would be required to wake it up
+	 */
+	ret = poll_timeout_us(ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value),
+			      ret > 0,
+			      1000, wake_retry * 1000, true);
+
+	/*
+	 * If sink is in D3 then it may not respond to the AUX tx so
+	 * wake it up to D3_AUX_ON state
+	 * If the above poll_timeout_us fails, try waking the sink.
+	 */
+	if (value == DP_SET_POWER_D3 || ret < 0) {
+		/* After setting to D0 need a min of 1ms to wake(Spec DP2.1 sec 2.3.1.2) */
+		drm_dp_dpcd_writeb(aux, DP_SET_POWER,
+				   DP_SET_POWER_D0);
+		fsleep(1000);
+		drm_dp_dpcd_writeb(aux, DP_SET_POWER,
+				   DP_SET_POWER_D3_AUX_ON);
+	}
+}
+EXPORT_SYMBOL(drm_dp_wake_sink);
+
 /**
  * drm_dp_dpcd_set_probe() - Set whether a probing before DPCD access is done
  * @aux: DisplayPort AUX channel
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 1d0acd58f48676f60ff6a07cc6812f72cbb452e8..933428025c4d75ab7a0aa63039ed5f8e45ca625b 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -546,6 +546,7 @@ struct drm_dp_aux {
 	bool dpcd_probe_disabled;
 };
 
+void drm_dp_wake_sink(struct drm_dp_aux *aux);
 int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
 void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered);
 void drm_dp_dpcd_set_probe(struct drm_dp_aux *aux, bool enable);

-- 
2.25.1

