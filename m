Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F0CE70708
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 10:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F1210E595;
	Thu, 21 Sep 2023 10:18:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A5210E595
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 10:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695291489; x=1726827489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=385VMAn+M4OrwIPdKqOnyZaSJds0bdqdEu9WTREgEbs=;
 b=RteUNzA/8mBnzHMEfz1K38Z373ZACQmrop8uBEE/MEWgESFn1Yh3RPGx
 cvMC0Y5iFz40Di4c9QXAbBS4aplMJJTnEYX/5AjzLRyIhBgTXsUf+V3qZ
 q8RwKn2zr3l6ptPOHMP3uMo4LTusg7LocgKShZ8+VL/c8Jh9hpfzWYPSf
 azuJvOb5IpK7CSFNnYUYiCwwVVJAerGK50u0xH66h61/B2J2ehOUIjl3V
 2O04W6/NpaPPBwJ/787STYgz6G8rFwsTbPMrGoiYLrwhQM+xdxwwVKOGc
 33/f8uz8BgKAOTB2jXX9VBg1vhGayiH6j2mpJy8O1NEsX6QroLCLart1r g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466788341"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="466788341"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 03:18:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="740573618"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="740573618"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 03:18:06 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org
Date: Thu, 21 Sep 2023 15:55:14 +0530
Message-Id: <20230921102519.3355538-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921102519.3355538-1-badal.nilawar@intel.com>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 1/6] drm/xe: Add XE_MISSING_CASE macro
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
Cc: linux@roeck-us.net, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add XE_MISSING_CASE macro to handle missing switch case

v2: Add comment about macro usage (Himal)

Cc: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_macros.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index daf56c846d03..6c74c69920ed 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -15,4 +15,8 @@
 			    "Ioctl argument check failed at %s:%d: %s", \
 			    __FILE__, __LINE__, #cond), 1))
 
+/* Parameter to macro should be a variable name */
+#define XE_MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
+				__stringify(x), (long)(x))
+
 #endif
-- 
2.25.1

