Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D151C83F09
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 07:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A9C10E890;
	Thu, 10 Jul 2025 07:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eL8be6es";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A3810E891
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 07:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752131991; x=1783667991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HdZM+lCygRtcGKGdmfKOBD9czchBwnFeRqigzvpekUw=;
 b=eL8be6escSO2frYvWjopCaLb95jch1SQI6fCBMfhuHBN/a05fmgvnT+m
 Q3ByGcrtUDQAXDD7SrdNbrNmDZFrirFXJMjuM7Rf4oBq3yVS3lHiXVmKl
 /1KhnoxUAsqXfhDmbJL9qAXIVuyRnNogbVeteQxIS1KwAMB+PXZAGsw6m
 n3YIlSlLCRH9hamgJsuxUPcwHCc6wnHP5/OMnPdZjLmIzIOttnd993k4+
 WZVhj7c+BH+NgLv1+vgCBRDfbG6oxPrOiGSdT4b5dyT7rkFUg9yYb0//t
 A1DW38M/B4JKp4jzJPdHaVwd/Slgdl+20p5A6o3JXfiqAwtS4RUn8azKk A==;
X-CSE-ConnectionGUID: ZQfVHimoSY2/sUJc/Km3vA==
X-CSE-MsgGUID: 00iWzV3zR46xC0Nqi9qlyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54256707"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54256707"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 00:19:51 -0700
X-CSE-ConnectionGUID: Inayylf0T/qB4vO/rEigNQ==
X-CSE-MsgGUID: PGyU7bqgRJmu2PVMyfTE4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160323941"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 10 Jul 2025 00:19:45 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: jarkko.nikula@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
 jsd@semihalf.com, andi.shyti@kernel.org, raag.jadav@intel.com,
 riana.tauro@intel.com, srinivasa.adatrao@intel.com,
 michael.j.ruhl@intel.com, intel-xe@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v7 2/5] i2c: designware: Add quirk for Intel Xe
Date: Thu, 10 Jul 2025 12:46:09 +0530
Message-Id: <20250710071612.2714990-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710071612.2714990-1-raag.jadav@intel.com>
References: <20250710071612.2714990-1-raag.jadav@intel.com>
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

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

The regmap is coming from the parent also in case of Xe
GPUs. Reusing the Wangxun quirk for that.

Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 3104f52e32be..a35e4c64a1d4 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -101,7 +101,7 @@ static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
 }
 #endif
 
-static int txgbe_i2c_request_regs(struct dw_i2c_dev *dev)
+static int dw_i2c_get_parent_regmap(struct dw_i2c_dev *dev)
 {
 	dev->map = dev_get_regmap(dev->dev->parent, NULL);
 	if (!dev->map)
@@ -123,12 +123,15 @@ static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	int ret;
 
+	if (device_is_compatible(dev->dev, "intel,xe-i2c"))
+		return dw_i2c_get_parent_regmap(dev);
+
 	switch (dev->flags & MODEL_MASK) {
 	case MODEL_BAIKAL_BT1:
 		ret = bt1_i2c_request_regs(dev);
 		break;
 	case MODEL_WANGXUN_SP:
-		ret = txgbe_i2c_request_regs(dev);
+		ret = dw_i2c_get_parent_regmap(dev);
 		break;
 	default:
 		dev->base = devm_platform_ioremap_resource(pdev, 0);
-- 
2.34.1

