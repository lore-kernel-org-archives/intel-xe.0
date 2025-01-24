Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C40C02181
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 19:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF94810EA21;
	Fri, 24 Jan 2025 19:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PqRwQrrt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9370510EA17
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jan 2025 19:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737748689; x=1769284689;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0GuQCSdgrMNTFLhUhsYOPG3bQVMsBX+AC5T3PE+ZhBw=;
 b=PqRwQrrt1dcTq7n4zaH0DokLsFxgslAq8PokGTg2KvVhhKFHVYDD8Mph
 kayr8EeP6XuD7yg8csuBF5J4bv9mh0qs2IW2J5vm3MzPxYWzDgTHgxQRV
 MPN5g4AzXnsvvQhy1zYogOOrxo3a9h6qhzGRlpsC3cYAGWmVlQ8mTtC57
 XxzCgwXg8H8kN1c51J2DBlR9e2jyChDECYQgAJrTZxaO4EkSiqApLzmvj
 tSyxCXz6n6RO99ukR6BGeLEzHnVGfw25GUUSzD+BHJBVZll9uFGWkICqy
 An5mV3N6JAZyeTOo9OlL4JS/PHUbd3rOwx8jtYpj+63yMoIPlW0GDE0BO A==;
X-CSE-ConnectionGUID: rZeN1L6GS4y1h1knofzIFg==
X-CSE-MsgGUID: a1bf9/MNTF+4P93CSKdYnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38183759"
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; d="scan'208";a="38183759"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 11:58:09 -0800
X-CSE-ConnectionGUID: CtEqvLc3SwSrBxsSC4IJoQ==
X-CSE-MsgGUID: KV5ClweFR32CqWFuHjq8Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="112796784"
Received: from rchatre-mobl4.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.111.30])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 11:58:08 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe2LPD DMC v2.27
Date: Fri, 24 Jan 2025 16:54:44 -0300
Message-ID: <20250124195752.62014-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.48.1
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

NOT TO BE REVIEWED/MERGED

Hardcode path to DMC firmware for CI purposes only.

Re-sending this because I failed to get back to the previous one in a timely
manner and its CI results should be considered stale by now.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 221d3abda791..7a20ac9640d6 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -116,7 +116,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
 MODULE_FIRMWARE(XE3LPD_DMC_PATH);
 
-#define XE2LPD_DMC_PATH			DMC_PATH(xe2lpd)
+#define XE2LPD_DMC_PATH			"i915/xe2lpd_dmc_ver2_27.bin"
 MODULE_FIRMWARE(XE2LPD_DMC_PATH);
 
 #define BMG_DMC_PATH			DMC_PATH(bmg)
-- 
2.48.1

