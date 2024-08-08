Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B047AC52D71
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 17:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF6A10E7A1;
	Thu,  8 Aug 2024 17:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KcK/bSmj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37A410E7A1
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 17:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723137265; x=1754673265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r6mwZdu2fZHV2u/+rUsnfAVWvypPW4yvYkomB7fjW4U=;
 b=KcK/bSmjv8vT7naCYY6bmn02/9GF7Q1sqSO4U0bHD0jEDvc4CqUy8Evw
 /0dCSSbNqGutHrbrKCYKMyY8GiYGo6/nYhxKG5vLCFPvB3ZmIoor4f2gY
 zsFE6FIPdheSUC6JnyUJbucoC9XF2RqMgVX3p/KuNCGk2vAj0FRKnaU3k
 +rZiEBQACig8+cSw7I3+nUTeNHsbm1YVksfR070Y6znWPF3zzP3Z5DqnY
 ONN2+4LSqyBIrXwPjp5ral1LJBMXCMleiAzVJ8KN/O/6CvKD4PNPutI7l
 xN4Iy5muUCPslWpfYERwGJoGSPqaGYc09t0aePzsvniJeM3eyP521oBCz A==;
X-CSE-ConnectionGUID: FzH10XOdQq2jpuDXgtKMlQ==
X-CSE-MsgGUID: uPvaT/jsSP+SWbq79ttdUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21405677"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="21405677"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:14:25 -0700
X-CSE-ConnectionGUID: nh37KVUjStqbd4jAEzwkUQ==
X-CSE-MsgGUID: C/FZEm9rSLKQ/ZETsAPcjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="57376309"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:14:23 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 ashutosh.dixit@intel.com, rodrigo.vivi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/hwmon: Fix xe_hwmon_pcode_write_i1 param from u32 to
 u16
Date: Thu,  8 Aug 2024 22:57:34 +0530
Message-Id: <20240808172734.2233594-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

WRITE_I1 sub command of pcode takes param of u16 compared to u32 for
READ_I1, so corrected it. Without this pcode shall return illegal
sub command errors.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
---
 drivers/gpu/drm/xe/xe_hwmon.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 832ea81faeee..617c8bdb8f28 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -446,11 +446,11 @@ static int xe_hwmon_pcode_read_i1(struct xe_gt *gt, u32 *uval)
 			     uval, NULL);
 }
 
-static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
+static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u16 uval)
 {
 	return xe_pcode_write(gt, PCODE_MBOX(PCODE_POWER_SETUP,
 			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
-			      uval);
+			      (u32)(uval & POWER_SETUP_I1_DATA_MASK));
 }
 
 static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
@@ -476,11 +476,11 @@ static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
 					  long value, u32 scale_factor)
 {
 	int ret;
-	u32 uval;
+	u16 uval;
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, scale_factor);
+	uval = DIV_ROUND_CLOSEST((u16)value << POWER_SETUP_I1_SHIFT, scale_factor);
 	ret = xe_hwmon_pcode_write_i1(hwmon->gt, uval);
 
 	mutex_unlock(&hwmon->hwmon_lock);
-- 
2.25.1

