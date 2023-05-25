Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0F3C7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 16:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA4110E6BE;
	Thu, 25 May 2023 16:18:53 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950B510E6BE
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 16:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685031531; x=1716567531;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gVvTSAhaKmcKBMaes7aOWiAUxgqVY8RcDVuHQ9hcZc0=;
 b=CAqtJko09c0Ocq7ndzWLlbb3X5s/bmCYhvbqiZfPAf9yCaozEubhApIk
 Fml0rucIUvSlqmwmGNo7dWrFu4DdGScJUAATduLSgZjENoDMTzo67+gJM
 rXLKAPRhqdMxReCMWZuzDh8tm1J1WlpdC1wJRoN9FrFeVsr+RBDnO5cr7
 vnWOvFmj0hUya2XzPXoQG6WUk8If9wdYgnQ/mMIsLWHQfWMgTT5To9W1a
 3MZaD7LH5sFUFb8AVZ1NTHKXOnCkWDU9Qgyox5Nm7erFeAMyPtx6WAuJa
 YNjp8dx+/q///PSf0JQThYJdOJOU6bu8kDwO9R+6ik/L5FfKzZKMQ7M1B w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="353958727"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="353958727"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 09:17:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="769961794"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="769961794"
Received: from jhaapako-mobl.ger.corp.intel.com (HELO 3d932cc93223.intel.com)
 ([10.249.39.26])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 09:17:05 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 16:16:43 +0000
Message-Id: <20230525161643.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Prevent flooding the kernel log with
 XE_IOCTL_ERR
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

Lower log level of XE_IOCTL_ERR macro to debug in order to prevent
flooding kernel log. Rely on drm_dbg macro output which includes
function name, so removing file and name macros.

Reported-by: Oded Gabbay <ogabbay@kernel.org>
Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_macros.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index 0d24c124d202..2b8a46ffb93e 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -13,8 +13,8 @@
 #define XE_BUG_ON BUG_ON
 
 #define XE_IOCTL_ERR(xe, cond) \
-	((cond) && (drm_info(&(xe)->drm, \
-			    "Ioctl argument check failed at %s:%d: %s", \
-			    __FILE__, __LINE__, #cond), 1))
+	((cond) && (drm_dbg(&(xe)->drm, \
+			    "Ioctl argument check failed: %s", \
+			    #cond), 1))
 
 #endif
-- 
2.34.1

