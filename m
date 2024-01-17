Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFB7C47DA2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 12:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3720710E112;
	Wed, 17 Jan 2024 12:28:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F40410E640
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 12:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705494489; x=1737030489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W/wjM0pxhFpRcq+iGtmcHdcRkS4gqxAJIldVufmxN48=;
 b=ipIVT9I4UBLO7fvbxBiFE+PQKtDrZ68r38fDFcdtC7onFb66LQRfh3b3
 +Ud7L5wBbTdDICgd6SOFTVu8bYvbwjlF1afti9EujkxTY1OOFyEndaTJd
 SqOyPy4qjwMfnuMKN7lmuY/JOkvOWY4CDPlRukl9Dsmlhn5Q+lmpd5T8F
 Z6dRrwjG3ExukMrorwnws3050o2agvIeVda9G/fQ6QhjvYdwX4e1QSeGP
 KP56HnkGNyUk4pTsI+/nXY83FM2WSLEs4FLLtokFQzxW3QMepsX5Cke0T
 u1p8zlM+WQJxHPGD26r/sWpvN0g+XG1BXSO2Ly6mFYZVJvuLKcEc7gx3V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="43980"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="43980"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:21:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="784502337"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="784502337"
Received: from msznigir-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.230])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:21:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/5] drm/xe: make hwmon_info const
Date: Wed, 17 Jan 2024 14:20:42 +0200
Message-Id: <20240117122044.1544174-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240117122044.1544174-1-jani.nikula@intel.com>
References: <20240117122044.1544174-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Make hwmon_info a const array of const pointers, and let it be placed in
rodata.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Note: Lots more in this file will end up in rodata with the hwmon change:

https://lore.kernel.org/r/20240117114405.1506775-1-jani.nikula@intel.com
---
 drivers/gpu/drm/xe/xe_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 6ef2aa1eae8b..e6acdf682d2a 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -402,7 +402,7 @@ static const struct attribute_group *hwmon_groups[] = {
 	NULL
 };
 
-static const struct hwmon_channel_info *hwmon_info[] = {
+static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
-- 
2.39.2

