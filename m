Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159C2C25B6E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 17:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CF110E6C3;
	Wed, 25 Oct 2023 17:28:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DBF10E6C3
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 17:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698254930; x=1729790930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CMPFkZfwMZy53z9lMlBIccKNqqOtAJRpRSTDsu51PYQ=;
 b=C+grLotBNvaKoDckrAud82hxgMdZwioY3+4EbKt3grolH0M5TS5j3ls+
 nP7BqHpYMcELjjv68dYPHWPQZtst3wQWSC4cxtUI9hVzEu5wYMJZBmfEJ
 wf3mhi5pX6YjIJ7Z47czfiMcZjhN5++cnGHZ8Ttb+Ve9KPWhnoZXxtowc
 0531j8eBTQU5XBEKcnUejNCS1yzQuxt9u3fK+3NWUshWm/hWygPXTJzXv
 JJDceq4P9sIBLZ8+Immicie5ypVRe1gcXpaBmtua7kPdAE2XitoZUM56J
 YRAW14j4vA9BLRdS7JJYIDyFvPo/Yk9QHbXqfs4NEiABl1S8AzanHdeKb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="8914655"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="8914655"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="882508579"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="882508579"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.33.83])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:28:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 20:28:35 +0300
Message-Id: <20231025172836.770398-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025172836.770398-1-jani.nikula@intel.com>
References: <20231025172836.770398-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] Revert "drm/i915: Abstract display info away
 during probe"
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 7be6e33f2f47b7c2f7dbd8ecca25c204a2df5d07.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index ce55b968e658..a6a18eae7ae8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -926,7 +926,7 @@ void intel_display_device_probe(struct drm_i915_private *i915)
 	else
 		info = probe_display(i915);
 
-	DISPLAY_INFO(i915) = info;
+	i915->display.info.__device_info = info;
 
 	memcpy(DISPLAY_RUNTIME_INFO(i915),
 	       &DISPLAY_INFO(i915)->__runtime_defaults,
-- 
2.39.2

