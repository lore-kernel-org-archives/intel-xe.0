Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54730CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:27:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A91E11262B;
	Fri, 16 Oct 2026 07:27:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3546611262B
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135641; x=1823671641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nWGLkDBFUQTtiYt7HkTWaZCzzblt1zXAgriEJhnhajQ=;
 b=gGnJBhn4lMnZRIR9kj4sSWl4iPFKUCx1TbZlSIADDZ7kTsil+B3I6JQQ
 DuKHy0RniajrcLWUV6US45qIQsJsPEIbdAFNcQfzQhbK/vZ2dsE0K0Iwb
 3itni91HQqNSsRavS+CsdxTKSkgpveBM4p/Ya8TrnrusP4xeXxggEPZUT
 gDRpH7QETbmfxtKB4Ue7WV1PIgWnC2xOj6H4xKujB4x9N3CLznLW+fznq
 WHuxCxKY6BEfjbXexrdhAG7MuGM5SB5CcpwqjaxKY8g390FWwJFUhfpfN
 hspKge0KnKvlgZSTqkj3NKMnwH91VUUMU3waO9Cx54u4CHd4CuI9VdxGz w==;
X-CSE-ConnectionGUID: cTbMuhH9QFGq9iNW8rlLbg==
X-CSE-MsgGUID: uJjIXUVFSBiVNA4eSww1WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="806156"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="806156"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:27:21 -0700
X-CSE-ConnectionGUID: lSCd/VcuT/+HEUZOkfoyJw==
X-CSE-MsgGUID: MboWK58tR+q9snJ9p62n9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="3673965"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa013.fm.intel.com with ESMTP; 16 Oct 2026 00:27:18 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v10 7/9] drm/xe/amc: Guard xe_amc_work() with runtime PM
Date: Fri, 16 Oct 2026 12:56:01 +0530
Message-ID: <20261016072623.457392-8-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016072623.457392-1-raag.jadav@intel.com>
References: <20261016072623.457392-1-raag.jadav@intel.com>
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

xe_device_declare_wedged() callers are expected to hold a runtime PM
reference. Fix it.

Fixes: a55b76b8bc2c ("drm/xe/i2c: Fix the interrupt handling")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v10: Guard wedge callers with runtime PM (Sashiko)
---
 drivers/gpu/drm/xe/xe_amc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
index b7390a4ee3ce..b13aa539e888 100644
--- a/drivers/gpu/drm/xe/xe_amc.c
+++ b/drivers/gpu/drm/xe/xe_amc.c
@@ -113,6 +113,8 @@ static void xe_amc_work(struct work_struct *work)
 	struct i2c_client *client;
 	int ret;
 
+	guard(xe_pm_runtime)(xe);
+
 	client = amc->i2c->client[XE_I2C_CLIENT_AMC];
 	if (IS_ERR_OR_NULL(client))
 		goto out_reassert_interrupt;
-- 
2.43.0

