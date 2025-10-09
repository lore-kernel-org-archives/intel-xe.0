Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1841CCD183
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 07:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CD110E92C;
	Thu,  9 Oct 2025 07:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1UZBtcB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9091B10E921
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 07:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759993440; x=1791529440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zIKlEcY8/UG9Y4nMPws1ZG2wKBkvKg1kDQnFtyXyPRQ=;
 b=h1UZBtcBtEtAjbA4hOaQzlmlKzL3RR0zdleCS7VAcMjylKsIXzs+Ky4Y
 O8Kb7TxAXleHsBVCJ9RIQaIuZCCSuU2i1UpECymXEIRlbOwPDz61X7uPH
 hiwKR1JHH3gZ7TfPGj2ZIrLX6/qbTG4NzuazhPlFwxVkU1yN6wbXKomCG
 DPC1E8dwRaCxwc5kfVVVws3y7RrHjfszPa9rXn9j3VdbfroYpHL3tmvZr
 xqB5+AVnNBW03BHe3ul63Y1Syv9vNaZS9KU63Ut7+ndH02RIQt7hkp4mr
 ZCYOCFwaFWhXSveEMCsPPgQaWxiT5bE0ZxC0PVXjIIHgV0ArsLS+kJjUg g==;
X-CSE-ConnectionGUID: YqEOYeMJT3iXuQIu2zcZOg==
X-CSE-MsgGUID: ZeYIBheNR5iQdSUT+1lAvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66023101"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66023101"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 00:04:00 -0700
X-CSE-ConnectionGUID: fQj+MvTxT6OQ6SY0o2+Haw==
X-CSE-MsgGUID: +ob3K/CnTCukVNVF0WzAIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="180579972"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2025 00:03:57 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 1/2] drm/xe/i2c: Introduce xe_i2c_irq_present()
Date: Thu,  9 Oct 2025 12:33:03 +0530
Message-Id: <20251009070304.3210101-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009070304.3210101-1-raag.jadav@intel.com>
References: <20251009070304.3210101-1-raag.jadav@intel.com>
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

In preparation of wider usecases which require checking for I2C IRQ
presence, introduce xe_i2c_irq_present() helper.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 48dfcb41fa08..25c6b8f3c0bb 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -160,6 +160,11 @@ bool xe_i2c_present(struct xe_device *xe)
 	return xe->i2c && xe->i2c->ep.cookie == XE_I2C_EP_COOKIE_DEVICE;
 }
 
+static bool xe_i2c_irq_present(struct xe_device *xe)
+{
+	return xe->i2c && xe->i2c->adapter_irq;
+}
+
 /**
  * xe_i2c_irq_handler: Handler for I2C interrupts
  * @xe: xe device instance
@@ -170,7 +175,7 @@ bool xe_i2c_present(struct xe_device *xe)
  */
 void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
 {
-	if (!xe->i2c || !xe->i2c->adapter_irq)
+	if (!xe_i2c_irq_present(xe))
 		return;
 
 	if (master_ctl & I2C_IRQ)
-- 
2.34.1

