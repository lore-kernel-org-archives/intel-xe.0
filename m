Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8416EEDE98F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 08:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370F010E51D;
	Thu, 14 Sep 2023 08:06:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9935510E51D
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 08:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694678774; x=1726214774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1p71K//XQ9zZQYmDOllPeza8+3H0XOHh0PahGZw2m84=;
 b=ZSX7IcqGGOQ9cmy6onOrZsMf5+P4Db6/cuny9Mi1qzEHbCTzCYD6TmSr
 tulC7N71SAEfO4rjoU0URWjUFxSGs6H6wewlj+POWlzJ7iBY91UGhaULG
 x10lhofkLFCaXNhAX9QHMOjgAdDZ+8WduifzkiQhO3M/ezWnPZgR784cD
 SUC+dI6EZnSoggyQt5EMLfMTH1mK6jUoYiEYoIF7FhwerclzPyu4331nF
 sL9F2g+T+pbQtVpR3QB4uSKxOnoaps6ZNNb3bLwBy0ZIzULYHhz1joyLo
 Knn6TIO0pRJcN8BDmLsezk2Ox/mujCimjQnw1VZiHSO68HcenmNx6CxGB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="442917398"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="442917398"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 01:06:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="887691688"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="887691688"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 01:05:40 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 14 Sep 2023 11:01:38 +0300
Message-Id: <20230914080138.4178295-5-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914080138.4178295-1-alexander.usyskin@intel.com>
References: <20230914080138.4178295-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/4] mei: gsc: add support for auxiliary
 device created by Xe driver
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
Cc: linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Vitaly Lubart <vitaly.lubart@intel.com>

Add support for gsc mei auxiliary device created by Xe driver

Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/gsc-me.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/misc/mei/gsc-me.c b/drivers/misc/mei/gsc-me.c
index e63cabd0818d..63525778a4e0 100644
--- a/drivers/misc/mei/gsc-me.c
+++ b/drivers/misc/mei/gsc-me.c
@@ -292,6 +292,10 @@ static const struct auxiliary_device_id mei_gsc_id_table[] = {
 		.name = "i915.mei-gscfi",
 		.driver_data = MEI_ME_GSCFI_CFG,
 	},
+	{
+		.name = "xe.mei-gscfi",
+		.driver_data = MEI_ME_GSCFI_CFG,
+	},
 	{
 		/* sentinel */
 	}
@@ -312,4 +316,5 @@ module_auxiliary_driver(mei_gsc_driver);
 MODULE_AUTHOR("Intel Corporation");
 MODULE_ALIAS("auxiliary:i915.mei-gsc");
 MODULE_ALIAS("auxiliary:i915.mei-gscfi");
+MODULE_ALIAS("auxiliary:xe.mei-gscfi");
 MODULE_LICENSE("GPL");
-- 
2.34.1

