Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C836CAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 20:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E93B10E7CE;
	Wed, 24 Sep 2025 20:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PCzZu5yj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DD310E7CE
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 20:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758744546; x=1790280546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZLyR50MORu3NZxhQD97J6dOonHFGlJiiwqLuE+JlPco=;
 b=PCzZu5yjMlC0Z1jm+VvzJV7wCA2m87lFR8fMDYnREFw8yseL+0fRKqNO
 u6Zq806Nvayhvb1MTEe8QfJNMCQRwjmse+CI7wy48wvKtWvAhmJfP74v+
 NH3vE4YwePrF/ofUx3FC3SVyRa8dtCH/vlYjPskRNVNZRl3bNHP5EA6S4
 NOPYgeqD/5rgR4sg6kCENGQmyUo746TenrSjTo04mLk9yTZsTHbZ4f6YU
 DauXZCi9z+Ip3P/UX7ynsuF0wYMY241b9Mr2Du64ghpjd+AfToPpLBucw
 l+HW2jc81dsmikl6rjat4eecEWLy2vEalrD8yLduGSlmImJIIbGaIATVo Q==;
X-CSE-ConnectionGUID: 3nSxT0WoQZCzL5Y1EG4orw==
X-CSE-MsgGUID: zYCAPkbRQqC48YxlsrIJvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="86498793"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="86498793"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:09:06 -0700
X-CSE-ConnectionGUID: ZM8mYtEyQ5y210U85nekdA==
X-CSE-MsgGUID: hKoaLCTlRCihDozcO0sGjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="182402410"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 24 Sep 2025 13:09:04 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 heikki.krogerus@linux.intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 1/2] drm/xe/i2c: Introduce xe_i2c_irq_present()
Date: Thu, 25 Sep 2025 01:38:34 +0530
Message-Id: <20250924200835.3143173-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924200835.3143173-1-raag.jadav@intel.com>
References: <20250924200835.3143173-1-raag.jadav@intel.com>
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

