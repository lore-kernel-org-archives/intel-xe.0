Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33273E7C4DA
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 16:11:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E523710E11F;
	Wed,  4 Oct 2023 16:11:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B63D10E131
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 16:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696435916; x=1727971916;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b0luOlNRaDpgVABE6JCQA1HYwsLZ/ikwbWNqwT0CdIo=;
 b=iYn5+KpAQmr9NCWdAqeehkBfPnBIOHShI2y+lCKEFgolGMD8C6QKVzd9
 X9syNITtX/6Phwk9m8GleY9xoPl3U5bKF95OmQD22aKbzosVBYUNOkwEN
 bRk4l01i1vwHPKtAeFex6QxmMRpx9viVIRNBLaV+5Z2qCRYg/I8lBAC2C
 2y2zZBMHme7WoBAOjvWXKEfIdIymY9hIq5Xi0nv5X08lgfPBC/12FupBL
 470h9ZIJXIY0tlnEafkYUGoXX+TS+ZpCQZccECV2aHaN6om+VlUvpHsi+
 9Wxp5qP+XdkSmz5yBXQx2XzYvTWeJKm3y13IQBOXNeVCRVyR/EmC5tUeu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="362572535"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="362572535"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:09:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="728078119"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="728078119"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:09:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  4 Oct 2023 09:09:32 -0700
Message-Id: <20231004160931.3490464-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/hwmon: Expose power attributes
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add missing static to fixup build with W=1

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

Also I see in the changelog a change adding xe_ prefix to the static
funtions... that is not the convention most of the driver follow and I
don't think it should had been done. Anyway, just fixing the more
immediate issue here.

 drivers/gpu/drm/xe/xe_hwmon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 1deb5007e1e2..734fcca9f71f 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -123,7 +123,8 @@ static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_
 	}
 }
 
-int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, u64 *value)
+static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
+				       enum xe_hwmon_reg hwmon_reg, u64 *value)
 {
 	struct xe_reg reg;
 
-- 
2.40.1

