Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04917C64EC7
	for <intel-xe@archiver.kernel.org>; Tue, 28 Feb 2023 10:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73B210E687;
	Tue, 28 Feb 2023 10:42:01 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AD610E03C
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Feb 2023 10:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677580919; x=1709116919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nk1QokgXYb2qHSBBbQDdJzsjonWBtHYtBAz0ei9/g4g=;
 b=K0et7fJBo0olEnA5O/KHI42u0PUwz1+eyEULUEwDUXnZxwTg8gbswJCt
 FSPhD0MWnLeXYv5DVbm1Lxvx8/Jpv5C/ct58y5FV45ilSXOpczVHXwWli
 7EGR6CqOr4rucrnS81w231GUMb9AuoYC7GAc3BHMOsuwCpkj6OGx1VsVP
 50GhdlA3PGVfcEf8uD1HSwU6emFD5OVA7j7ZbZI7B8M/piKr1iw4Jpc57
 hZxpwjks2KlCwd1rN6JPCQMUa0wRY/EnhJgnTbrI7uFLDINLQJLTvqnyn
 hnpkEPfj0wzIXoi+KB9AEAgGfrQEXXgyzFcamVuEHmnQjO6b0JJVkXPeo w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="398884675"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="398884675"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:41:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="738108946"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="738108946"
Received: from mistoan-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.9.93])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:41:58 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Feb 2023 10:41:24 +0000
Message-Id: <20230228104137.80965-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104137.80965-1-matthew.auld@intel.com>
References: <20230228104137.80965-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 01/14] drm/xe/display: fix IS_ALDERLAKE_P()
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

On ADL-P we currently trigger:

xe 0000:00:02.0: drm_WARN_ON(!((dev_priv)->info.platform == XE_ALDERLAKE_S) && !(dev_priv && 0))
WARNING: CPU: 3 PID: 338 at drivers/gpu/drm/xe/display/ext/intel_pch.c:32 intel_pch_type+0xce/0x2f0 [xe]

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/i915_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/i915_drv.h b/drivers/gpu/drm/xe/display/i915_drv.h
index da83a957dd86..06348cb03f44 100644
--- a/drivers/gpu/drm/xe/display/i915_drv.h
+++ b/drivers/gpu/drm/xe/display/i915_drv.h
@@ -73,7 +73,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 #define IS_ROCKETLAKE(dev_priv)	(dev_priv && 0)
 #define IS_DG1(dev_priv)        IS_PLATFORM(dev_priv, XE_DG1)
 #define IS_ALDERLAKE_S(dev_priv) IS_PLATFORM(dev_priv, XE_ALDERLAKE_S)
-#define IS_ALDERLAKE_P(dev_priv) (dev_priv && 0)
+#define IS_ALDERLAKE_P(dev_priv) IS_PLATFORM(dev_priv, XE_ALDERLAKE_P)
 #define IS_XEHPSDV(dev_priv) (dev_priv && 0)
 #define IS_DG2(dev_priv)	IS_PLATFORM(dev_priv, XE_DG2)
 #define IS_PONTEVECCHIO(dev_priv) IS_PLATFORM(dev_priv, XE_PVC)
-- 
2.39.2

