Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AE3C7EE30
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 12:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D191110E59D;
	Tue,  1 Jul 2025 12:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U9RoPHoy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2927C10E59D
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 12:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751372583; x=1782908583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xqnSqFWVDFEdXMupII25qfhOfaCrf8mtjfBCLWS3law=;
 b=U9RoPHoyUtNDNQOpHm2Uyw7QpLHkJAxatN/gjuWRkrtwWk+DHIfb2Cn4
 +BxFh3sMRxSUyC6N7wA1eYO8hTqSt7lAbtlBDNBd6VGIsKLXkMrBZfLGK
 luZhGRDHdp7II1ylh1rSHh7awXktobdKYMWiN+F3helliKrVK+FilbSUl
 JR7AJJ08XlNMNfuFEdvURqN9kuRgyNLo8fJR1UtCMGZit6mrUhjl0GldE
 f86rx6kxxlYh1bslhjs9Oij8gDt+3xLNd8b8BW2Zngl1vpAxlKrx29qP8
 LAA5ZjLfnSy0Z8nSLh4+vyf3eqjua1tJAWC9cRSmTAbldCItFqS6B7fTp w==;
X-CSE-ConnectionGUID: Dppss9pOQLOU3imMpB/U/A==
X-CSE-MsgGUID: iItxAb05Qki0AoWhtx5kNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71196711"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="71196711"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 05:23:03 -0700
X-CSE-ConnectionGUID: ++ucMJKlRuq50S7eA+Hx+A==
X-CSE-MsgGUID: T0PbFfzBRwSllAtX/se9AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153157409"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP; 01 Jul 2025 05:22:58 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/5] i2c: designware: Use polling by default when there is
 no irq resource
Date: Tue,  1 Jul 2025 15:22:48 +0300
Message-ID: <20250701122252.2590230-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
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

The irq resource itself can be used as a generic way to
determine when polling is needed.

This not only removes the need for special additional device
properties that would soon be needed when the platform may
or may not have the irq, but it also removes the need to
check the platform in the first place in order to determine
is polling needed or not.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Hi guys,

I found the thread with Jarkko's comments from my archives. He wanted
the local flags variable to be added because he wants the order of the
calls to remain as it is now - the device is allocated only after the
irq is checked.

thanks,
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 879719e91df2..3104f52e32be 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -205,25 +205,28 @@ static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
 
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
+	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
 	struct device *device = &pdev->dev;
 	struct i2c_adapter *adap;
 	struct dw_i2c_dev *dev;
 	int irq, ret;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq == -ENXIO)
+		flags |= ACCESS_POLLING;
+	else if (irq < 0)
 		return irq;
 
 	dev = devm_kzalloc(device, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
 
-	dev->flags = (uintptr_t)device_get_match_data(device);
 	if (device_property_present(device, "wx,i2c-snps-model"))
-		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
+		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
 
 	dev->dev = device;
 	dev->irq = irq;
+	dev->flags = flags;
 	platform_set_drvdata(pdev, dev);
 
 	ret = dw_i2c_plat_request_regs(dev);
-- 
2.47.2

