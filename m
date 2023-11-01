Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB468C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 15:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954A410E71F;
	Wed,  1 Nov 2023 15:14:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB13410E71F
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Nov 2023 15:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698851698; x=1730387698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7lh9Bcx3XsFBIG8AB54VXDTLcqhu34Om6NTVbkhrt20=;
 b=mra40hKPyvpWiBDPRQt5fUr4nrz4M7/6srPqYJTT5nNZh274IgmArF1i
 Pbowaz29j/EBp/8v90o6+DJsnJYgM48Om6jtxIAN8+TDep8xtNedrVjpd
 QKz8pYssRQCrhD1yQxQU/iUHoQTlMbNqGj4O1Mi55w5fzJoDABn8p8uqR
 V3WWamxFuvvhd1xbQUfOhku4hLqh1O2XvwbtIKq+o/yReKuM+/xafu0U0
 eISFMTyNYslBFdZm82JHr5THAXXqqOW3Z8uiuiQdsyvDOTmqQ/tlHpDJA
 p4uniIjIeENySV7oh0SsZ/eQI3HKktNAUhRwRN2Ala9gprwQ5jCniHCq6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="378896874"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; d="scan'208";a="378896874"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 08:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="831371934"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; d="scan'208";a="831371934"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 08:14:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Nov 2023 08:15:28 -0700
Message-Id: <20231101151528.1840900-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231101151528.1840900-1-lucas.demarchi@intel.com>
References: <20231101151528.1840900-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] fixup! drm/xe/display: Implement display
 support
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

---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index fe026a3792d2..1e79e996e11d 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -87,6 +87,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 #define IS_DG2(dev_priv)	IS_PLATFORM(dev_priv, XE_DG2)
 #define IS_PONTEVECCHIO(dev_priv) IS_PLATFORM(dev_priv, XE_PVC)
 #define IS_METEORLAKE(dev_priv) IS_PLATFORM(dev_priv, XE_METEORLAKE)
+#define IS_LUNARLAKE(dev_priv) IS_PLATFORM(dev_priv, XE_LUNARLAKE)
 
 #define IS_HASWELL_ULT(dev_priv) (dev_priv && 0)
 #define IS_BROADWELL_ULT(dev_priv) (dev_priv && 0)
-- 
2.40.1

