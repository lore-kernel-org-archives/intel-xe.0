Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9859FC5472F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 15:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CF010E36A;
	Tue, 27 Aug 2024 15:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwnwC4qt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9A610E359
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 15:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724773162; x=1756309162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xFRnjIIe/kCdwXJm5O/NlGUn6AXGX/mSbsfvSn4EoaE=;
 b=mwnwC4qtNfaQG2dUVvWCP4IMgPcv/pdu1d/uldBrgoAAhvzm7mOHRcVP
 MLMJ3DU5IxXs64p5rsExIMnj2C0D8bfDjWMcbfuzcSnSOUIyYlzbda69o
 UbGZaVyW4LRRIfXUFkYTweRxt1YnHWGwi/BIxRTJ1fAMRst7v6eRiqnR9
 ZTaVZNrV3XDscl12f2/YBsLtkwFrUJc3MtRIBs9gr+cBxzY5PSw4X1rE6
 +y9hgTXRjGnVHp6Nr/0I49JJ9KYKqS2GJBMNqOZCYbcGtJpBBHm3i928s
 wKwV+x8a2RklpdkNMPODpjI86jSYEJLU1ZoMdRt18vTTfPLtkKNnhawqm Q==;
X-CSE-ConnectionGUID: Z6ninYZFQaSNwop+OVwKYg==
X-CSE-MsgGUID: 3AgUllDvS1GPhp0/7qsrfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23387014"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="23387014"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 08:39:22 -0700
X-CSE-ConnectionGUID: yGduCQZ7QSaBNJZK+Ahsig==
X-CSE-MsgGUID: z6qDWX0gSLevjdF0VRnGxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="67246349"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 08:39:20 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, ashutosh.dixit@intel.com,
 rodrigo.vivi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3] drm/xe/hwmon: Fix WRITE_I1 param from u32 to u16
Date: Tue, 27 Aug 2024 21:23:01 +0530
Message-Id: <20240827155301.183383-1-karthik.poosa@intel.com>
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

WRITE_I1 sub-command of the POWER_SETUP pcode command accepts a u16
parameter instead of u32. This change prevents potential illegal
sub-command errors.

v2: Mask uval instead of changing the prototype. (Badal)

v3: Rephrase commit message. (Badal)

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
---
 drivers/gpu/drm/xe/xe_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 832ea81faeee..1faeca70900e 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -450,7 +450,7 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
 {
 	return xe_pcode_write(gt, PCODE_MBOX(PCODE_POWER_SETUP,
 			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
-			      uval);
+			      (uval & POWER_SETUP_I1_DATA_MASK));
 }
 
 static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
-- 
2.25.1

