Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC5A103A9A9
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 11:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3045310E866;
	Wed, 25 Mar 2026 11:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h4jdKofK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EE010E866;
 Wed, 25 Mar 2026 11:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774436905; x=1805972905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yEFWSUAk307KvIkvgNIstfZhbHU1j00m/kGGIa6eQ6Y=;
 b=h4jdKofK0O0aS6g/BUBpc4/M4GL1oTN8IJNsHPaNTWt/of7vmBZ3GrSp
 BztY5IAcDMhg3vu5oIlRZfgqxJZtv4j26luPMnCTnV6SMUzFuQqrhAj4b
 9Chm3Ven4GA3pJrxOOSn/R4KYhgTGZyPHCPlljmCr329Qa596zu2jmaoQ
 IsDuKDQ1t03xHWk9xM8Xdt5gko5X07qmE97bbEX2YS/M7acKUs/ljF6Cr
 5Gbs+3ePo4MSNOyF7dfsU2GZKXERh7VIGuxeRjYW8AmilFRJvpE/hP7XT
 3ExOvfYj141IKaAKA9Zq0DQlP3q+OS5+t1SV4G14kCGeFX0rkKVx92RIm g==;
X-CSE-ConnectionGUID: ++EilWD2RYuzBxSfBLc+hA==
X-CSE-MsgGUID: iTk/ZwZNSjGWf2ZpoQIyWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93047526"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="93047526"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 04:08:25 -0700
X-CSE-ConnectionGUID: U47r62+QSiqSYVTQmOekYA==
X-CSE-MsgGUID: JLVpsIl2RSKss9JAHVoltA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="219798385"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 25 Mar 2026 04:08:23 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 14/26] drm/i915/writeback: Define function to destroy
 writeback connector
Date: Wed, 25 Mar 2026 16:37:32 +0530
Message-Id: <20260325110744.1096786-15-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325110744.1096786-1-suraj.kandpal@intel.com>
References: <20260325110744.1096786-1-suraj.kandpal@intel.com>
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

Define function to destroy the drm_writbeack_connector and
drm_connector associated with it.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_writeback.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index e677cdfa6207..86b53e4603ae 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -161,6 +161,12 @@ intel_writeback_detect(struct drm_connector *connector,
 	return connector_status_connected;
 }
 
+static void intel_writeback_connector_destroy(struct drm_connector *connector)
+{
+	drm_connector_cleanup(connector);
+	kfree(connector);
+}
+
 static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
@@ -170,6 +176,7 @@ const struct drm_connector_funcs conn_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = intel_digital_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.destroy = intel_writeback_connector_destroy,
 };
 
 static const struct drm_connector_helper_funcs conn_helper_funcs = {
-- 
2.34.1

