Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B39C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 10:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4069810E040;
	Thu, 20 Jun 2024 10:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PulDQE5A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6BD10E040
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 10:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718877726; x=1750413726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DT6HG8q+YYaUVn5QlMPssLufGip8GGrIi5CFyIJqTIw=;
 b=PulDQE5AvxtgLerfYXG2bnUlAo8dRQCMbsNJKPmWyHOMIO7sBCBT99oX
 XcxzH3viIUrm6TMgu267QzfJN8WyiwBJ5T+nTY2nVJ/2R03YJZO3MMN28
 fcKFFY7+6u3jZhiBbY2hC/Fl97iPyIudBSj0E44JZj3ufdsc//xZgmDho
 /J8p6ZUJmD4YopFCGHGberaqR6hdRvcuIE2LNY6ndMskQQP2y/UTYN1MR
 WsafhnAFbxAJs5hCV0Uvmkd87tp8aLm9QUSkuyaV+ddspHK8RXX9k4DJP
 2SMywUAHmq+3VuU030Ze33/54kQSmuMSOT0zN5xwKxeaVl9C12vfqkz+x w==;
X-CSE-ConnectionGUID: 7Gr0OurpQuy/zh6OtndlpA==
X-CSE-MsgGUID: I8pbsM29SOm4k6A0snd6aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15674560"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15674560"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 03:02:06 -0700
X-CSE-ConnectionGUID: cQBCljJTQTaAssPSVLBvnA==
X-CSE-MsgGUID: XnGpayuaS56ZiLjtCrl5Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42289195"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.49.231])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 03:02:04 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 1/9] drm/xe/vf: Disable features that do not apply to VFs
Date: Thu, 20 Jun 2024 12:01:47 +0200
Message-Id: <20240620100147.949-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240619214557.905-2-michal.wajdeczko@intel.com>
References: <20240619214557.905-2-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We already maintain several flags that control the availability
of features on a given device. Disable features, like PCODE or
GuC PC or GSC, that do not apply to a VF device.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: also disable display (Piotr)
---
 drivers/gpu/drm/xe/xe_device.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 75d4c8ae9234..0d57eea8f083 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -486,6 +486,17 @@ static int wait_for_lmem_ready(struct xe_device *xe)
 	return 0;
 }
 
+static void update_device_info(struct xe_device *xe)
+{
+	/* disable features that are not available/applicable to VFs */
+	if (IS_SRIOV_VF(xe)) {
+		xe->info.enable_display = 0;
+		xe->info.has_heci_gscfi = 0;
+		xe->info.skip_guc_pc = 1;
+		xe->info.skip_pcode = 1;
+	}
+}
+
 /**
  * xe_device_probe_early: Device early probe
  * @xe: xe device instance
@@ -506,6 +517,8 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	xe_sriov_probe_early(xe);
 
+	update_device_info(xe);
+
 	err = xe_pcode_probe_early(xe);
 	if (err)
 		return err;
-- 
2.43.0

