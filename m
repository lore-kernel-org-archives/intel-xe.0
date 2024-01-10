Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A889C4707C
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 15:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F0710E62A;
	Wed, 10 Jan 2024 15:57:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F8D10E628
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 15:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704902226; x=1736438226;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iTzZI0F/JznFAf5ljxtHERjM7Wf4d7TqOV7Wk/OEea8=;
 b=Uy85ZBv5frnuVlcgyDhXvujSY3Slrt+wsYVH0ogQfb1U/Moa9wpbY3gi
 nCclD9EfYEK9NQWjrJlBSBtskAw2f/DTZY5tqHThug5Ok04JL6pdz9V6I
 9YEk77t4vYdnYlBHi2HDkihTcaTymFHfs3ghaWqIkqoKs5gVVus124ksH
 yjErzoi7Sn2QiFVMrxyUfmUxxsRBeQn1IS/GxI/mA3mTVAuGFNiTCp69I
 ylpjLsm1wfvxrP2gs37Jew7LSPcyF3KPWAiGyqlVpMi/iKRRc97mtiyXB
 vfQiy6hTrGGZiaFIuATQfoGQatR01zDpMdoDy1a7LdanO1ZQs6Q63PCwg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="398249223"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="398249223"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 07:57:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="925680639"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="925680639"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.28])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 07:57:05 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 2/2] Revert "mei: gsc: add support for auxiliary device created
 by Xe driver"
Date: Wed, 10 Jan 2024 16:56:45 +0100
Message-ID: <20240110155645.523818-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110155645.523818-1-thomas.hellstrom@linux.intel.com>
References: <20240110155645.523818-1-thomas.hellstrom@linux.intel.com>
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

This reverts commit bea27d7369855e586d22c3e45b155e8e5eecaa7f.
---
 drivers/misc/mei/gsc-me.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/misc/mei/gsc-me.c b/drivers/misc/mei/gsc-me.c
index 9e558ec2ea1d..6be8f1cc052c 100644
--- a/drivers/misc/mei/gsc-me.c
+++ b/drivers/misc/mei/gsc-me.c
@@ -292,10 +292,6 @@ static const struct auxiliary_device_id mei_gsc_id_table[] = {
 		.name = "i915.mei-gscfi",
 		.driver_data = MEI_ME_GSCFI_CFG,
 	},
-	{
-		.name = "xe.mei-gscfi",
-		.driver_data = MEI_ME_GSCFI_CFG,
-	},
 	{
 		/* sentinel */
 	}
@@ -316,6 +312,5 @@ module_auxiliary_driver(mei_gsc_driver);
 MODULE_AUTHOR("Intel Corporation");
 MODULE_ALIAS("auxiliary:i915.mei-gsc");
 MODULE_ALIAS("auxiliary:i915.mei-gscfi");
-MODULE_ALIAS("auxiliary:xe.mei-gscfi");
 MODULE_DESCRIPTION("Intel(R) Graphics System Controller");
 MODULE_LICENSE("GPL");
-- 
2.43.0

