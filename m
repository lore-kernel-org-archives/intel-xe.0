Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5EDC3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 06:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A8910E1F4;
	Fri, 26 Jul 2024 06:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kv2CbPah";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8241810E097
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 06:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721976232; x=1753512232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2NkRbFeqiZZIqh+alIEasx691FGs8UvmFcMIk/mkES0=;
 b=Kv2CbPah2IYh8blJHiFU/dlgQ3T3b9ru//z8lAuWw5OFN0Nat8YzaXt6
 bKwrvw++rSG+3a7L4dAj7ctm79zy7dNV5sDAU0BASIVfS7RSTIkqJXmEC
 cedf5Tp6qdNpEEMu6aW5iX/DoANg2kmikkEdR98q4r8GCLevsEdfhJWcw
 4P4kuM+AAMid/cBCYX2XAKXUTxRYPBiy+h8nRgwMww2MwLEDtaH1YgH6w
 CEl1JtOIq9jpUizJmPd7yTGAVwyvBpOto/VB4oxNIsssKtHd9fmbj7d77
 K5B2ntsDKx9zrxw0WLrbUeUD9UwVxCziJvLW7AS02MwNcflTn82zKy2CS A==;
X-CSE-ConnectionGUID: REFWziMkThen6SpYrTzHdA==
X-CSE-MsgGUID: ueaaS3BiRc6a9tF/mRpjIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="37270586"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="37270586"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 23:43:51 -0700
X-CSE-ConnectionGUID: 0Bz6YnaPSQS95gAo9J/MaQ==
X-CSE-MsgGUID: T3UFRysjRc6RqO4+rs8rBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="83799475"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 23:43:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 5/7] drm/xe/rtp: Fix off-by-one when processing rules
Date: Thu, 25 Jul 2024 23:43:35 -0700
Message-ID: <20240726064337.797576-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240726064337.797576-1-lucas.demarchi@intel.com>
References: <20240726064337.797576-1-lucas.demarchi@intel.com>
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

Gustavo noticed an odd "+ 2" in rtp_mark_active() while processing
rtp rules and pointed that it should be "+ 1". In fact, while processing
entries without actions (OOB workarounds), if the WA is activated and
has OR rules, it will also inadvertently activate the very next
workaround.

Test in a LNL B0 platform by moving 18024947630 on top of 16020292621,
makes the latter become active:

	$ cat /sys/kernel/debug/dri/0/gt0/workarounds
	...
	OOB Workarounds
		18024947630
		16020292621
		14018094691
		16022287689
		13011645652
		22019338487_display

In future a kunit test will be added to cover the rtp checks for entries
without actions.

Fixes: fe19328b900c ("drm/xe/rtp: Add support for entries with no action")
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index acb35b95a3f6..f054ac9cf06d 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -232,7 +232,7 @@ static void rtp_mark_active(struct xe_device *xe,
 	if (first == last)
 		bitmap_set(ctx->active_entries, first, 1);
 	else
-		bitmap_set(ctx->active_entries, first, last - first + 2);
+		bitmap_set(ctx->active_entries, first, last - first + 1);
 }
 
 /**
-- 
2.43.0

