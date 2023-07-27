Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D790C04A94
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 13:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3B410E582;
	Thu, 27 Jul 2023 13:26:50 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E9010E57C
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690464407; x=1722000407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r0atv7BlI7iD7w0d0aV5KvrQ1PEu0bFQf/TiO9+wnV8=;
 b=CUOS8Zl1s25FcAEw9cXKFs+Tdt77w+6hgaR4Wm+PA+zm7QsKRcY4JOT7
 sRLqHgAcrbBGveiWK1wCksK89sBoKWCLoG12A9RWxG3SkSaBR/gB3lVnm
 OKIpBS1LX7yo9AEFrDmGT8hCu3ZVc88MBHThBskyLTb9hL6K9g83+f0vp
 3eFffz4t3ClCEioFlvE9D+4AmpJY43RCo1izQt58gz+2pSsalc+BK/Kik
 kOQ+nDiX7p3+92v3sCjrWW9+gNQs3XXmbpv9bq9E7SFmQuFIUV2eYVZnw
 P4/cRAQ2NRvMnHHIuJfdybWBkrgTx6vzyHMGS39Av9gB7UN3pLqmf3o6n Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="365765652"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="365765652"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 06:26:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="973547853"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="973547853"
Received: from cweger-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.37.139])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 06:26:45 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jul 2023 13:26:30 +0000
Message-Id: <20230727132630.7-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727132630.7-1-francois.dugast@intel.com>
References: <20230727132630.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/3] drm/xe/macro: Display XE_WARN_ON messages
 only in debug mode
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
Cc: Francois Dugast <francois.dugast@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Make printing of XE_WARN_ON messages depend on Xe debug flag
CONFIG_DRM_XE_DEBUG, so that those messages are not printed in production
environments.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_macros.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index daf56c846d03..6ce86cf9605c 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -8,7 +8,14 @@
 
 #include <linux/bug.h>
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define XE_WARN_ON WARN_ON
+#else
+#define XE_WARN_ON(condition) ({					\
+	int __ret_warn_on = !!(condition);				\
+	unlikely(__ret_warn_on);					\
+})
+#endif
 
 #define XE_IOCTL_DBG(xe, cond) \
 	((cond) && (drm_dbg(&(xe)->drm, \
-- 
2.34.1

