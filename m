Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F77C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 12:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6BF113BC7;
	Fri,  5 Apr 2024 12:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IAUvLYdE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF251113BCC
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 12:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712321473; x=1743857473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1cCTn1Q13sfRGZMGVzMG8VDW7wp+AgGa8oRfRlZerHk=;
 b=IAUvLYdEq8djDJoqNBDU+TVuLIxPAqghGhzcWsrhrrTCGiYqZATEjEb+
 Lg6Rl2PtX4SuENG4b1LdYbttBFDwZIWlpVyRUgzMhtHOLYg48xOTkY8wD
 hV2N41Z0yY8Vpce0RwFgPATKGbv4gUk27aDQnuVswebmYA6c+8anWvfAT
 mMViZxJ4rYtjB3onF2GQWxnJBzlkPfwMOKuyQhVRVd9ufI4Si4fqYlOng
 UIZAAt634EuTbqmuoMhlEYF7u1bZ2xKAOf5QvQ/pHUZOPlu61LMrhdQPb
 YuHB5ZZkNeUfVPhsazB4l9qI6mogXOqnjh3f2PbuTzzyigB/XstQqFvKe A==;
X-CSE-ConnectionGUID: JQ5mKL7uQYSsoYW/gW0QbA==
X-CSE-MsgGUID: AoXc8PHsQcuZ/XDlykpaFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7810094"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7810094"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 05:51:13 -0700
X-CSE-ConnectionGUID: eXM967A1SSWFdPwdXDTZXw==
X-CSE-MsgGUID: L/+SEmaFRKqOA9qGxJzS/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="23643876"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 05:51:10 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v7 4/4] drm/xe/hwmon: Cast result to output precision on left
 shift of operand
Date: Fri,  5 Apr 2024 18:31:27 +0530
Message-Id: <20240405130127.1392426-5-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405130127.1392426-1-karthik.poosa@intel.com>
References: <20240405130127.1392426-1-karthik.poosa@intel.com>
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

Address potential overflow in result of left shift of a
lower precision (u32) operand before assignment to higher
precision (u64) variable.

v2:
 - Update commit message. (Himal)

Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 19b32ff4615d..5210ff2bb919 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -295,7 +295,7 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	 * As y can be < 2, we compute tau4 = (4 | x) << y
 	 * and then add 2 when doing the final right shift to account for units
 	 */
-	tau4 = ((1 << x_w) | x) << y;
+	tau4 = (u64)((1 << x_w) | x) << y;
 
 	/* val in hwmon interface units (millisec) */
 	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
@@ -336,7 +336,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
 	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
 	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
-	tau4 = ((1 << x_w) | x) << y;
+	tau4 = (u64)((1 << x_w) | x) << y;
 	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
 
 	if (val > max_win)
-- 
2.25.1

