Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86DFCA0EE4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 17:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4FC10E4BB;
	Mon, 18 Aug 2025 17:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BeC3Z59r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0827B10E4B6
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 17:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755538705; x=1787074705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X+ej5uvebfSYvSHUJOFTuBUKuQ91yWq7l2h1lpj2SIo=;
 b=BeC3Z59rFp7AtZSP2MRCwKrQ3a3D4qqY5PJpFQfW/OD7eA8y1GlCslMs
 zF55Ijv7OxafvVGaxljJ/D2RE1/nmnu04byRMPXbKQ9N6DJGXHYULjWDE
 vYtdZXRPV/cXe7RHVW98NK1zcOQhoaGF/xdMn/4P8hklfYFlOXV46mU9i
 M5EkoeZfBHMJog2qCtAu8toqmp78srRPA2wdFoMIUqiCnJdGehZl3IKt2
 QWC/yyVtZKAJO4xPjAi77YhZOYy92ZYhL9olXpuedsBjmdr4MS7ObwwvK
 fbzzqBy6HfjKGeLlrBhHWPfKraRoixVFeKOYbGBKjki6UitiXX2PzbcWW A==;
X-CSE-ConnectionGUID: 3NEWSVIsSeuVGcfNNKoZNA==
X-CSE-MsgGUID: cQ6ttaCGQ0GZoyQVhCYjtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57918654"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57918654"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:38:24 -0700
X-CSE-ConnectionGUID: DkhjYvcMRWabqfwnaArU6g==
X-CSE-MsgGUID: LgtIir7uRxOhuyDJzCIX2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172838881"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:38:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com
Subject: [PATCH v4 08/13] drm/xe/configfs: Use guard() for dev->lock
Date: Mon, 18 Aug 2025 10:37:33 -0700
Message-ID: <20250818-psmi-v4-8-a330783ce1c0@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
References: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

Instead of the manual lock()/unlock() pattern, use guard() which will
make things easier for handling errors or early returns.

Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 61376dfc74bb3..de73c4ff8f4f2 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitops.h>
 #include <linux/configfs.h>
+#include <linux/cleanup.h>
 #include <linux/find.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -164,9 +165,8 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
 	if (ret)
 		return ret;
 
-	mutex_lock(&dev->lock);
+	guard(mutex)(&dev->lock);
 	dev->config.survivability_mode = survivability_mode;
-	mutex_unlock(&dev->lock);
 
 	return len;
 }
@@ -248,9 +248,8 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 		val |= mask;
 	}
 
-	mutex_lock(&dev->lock);
+	guard(mutex)(&dev->lock);
 	dev->config.engines_allowed = val;
-	mutex_unlock(&dev->lock);
 
 	return len;
 }
@@ -272,9 +271,8 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
 	if (ret)
 		return ret;
 
-	mutex_lock(&dev->lock);
+	guard(mutex)(&dev->lock);
 	dev->config.enable_psmi = val;
-	mutex_unlock(&dev->lock);
 
 	return len;
 }
@@ -454,9 +452,8 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
 	if (!dev)
 		return;
 
-	mutex_lock(&dev->lock);
+	guard(mutex)(&dev->lock);
 	dev->config.survivability_mode = 0;
-	mutex_unlock(&dev->lock);
 
 	config_group_put(&dev->group);
 }

-- 
2.50.1

