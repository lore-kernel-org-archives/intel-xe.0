Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C453C4345F
	for <intel-xe@archiver.kernel.org>; Wed,  1 May 2024 23:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F8210F366;
	Wed,  1 May 2024 23:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EWp7TBMs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DED10F366
 for <intel-xe@lists.freedesktop.org>; Wed,  1 May 2024 23:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714605522; x=1746141522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jRog52dozIlAgJh+YX7sIvQZyg/2J/DT4li8FyPOGco=;
 b=EWp7TBMsT4bpUnMBK7b9PFUK9rsWLmc0rQBtW9UGSXX7CavaR39FRsf/
 VJJFnQAWhZD4BQxWxkOW0fs9VNWwMTWg0oxfrGQuerIXlPdO1MbUOi0ew
 zKCaB9RN+idxFlOprWdt3WFwpg6QbWkHlEPMINPTIi3TvjmM8SMKP1usq
 6kt/xSZUXrQIoz9gLSSXX+mGpZyzHoLRQiYSOecwEXvcLSJu5s7E27eEZ
 cFGRhGzd3H+8ckjmu8uAkODxNCWEN8inlA9i2FGq+irA9oZoF2RljMDSr
 CKbDqt5cXWbRTbDmXKi6xMqSiegmxI0+dTj882glvMmyJGTuUHPxrsQHS g==;
X-CSE-ConnectionGUID: 9lqY++LqSbecvDzOYEHGVQ==
X-CSE-MsgGUID: pMtZI2gdSxyOezKEIsmqpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="14163348"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; d="scan'208";a="14163348"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 16:18:41 -0700
X-CSE-ConnectionGUID: 3i9+jvWXQE6IBz31i5qRCw==
X-CSE-MsgGUID: nyEmRMKkSzGpDzL/b6atjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; d="scan'208";a="31408583"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 16:18:41 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [xe-for-ci v3 1/2] mei: me: add lunar lake point M DID
Date: Wed,  1 May 2024 16:18:28 -0700
Message-ID: <20240501231829.2122219-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240501231829.2122219-1-daniele.ceraolospurio@intel.com>
References: <20240501231829.2122219-1-daniele.ceraolospurio@intel.com>
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

From: Alexander Usyskin <alexander.usyskin@intel.com>

Add Lunar (Point) Lake M device id.

xe-for-ci note: this patch is being reviewed for merge via the char-misc
tree [1]. We need this for LNL GSC proxy, so we're pulling it early to
the xe-for-ci tree to unblock our LNL execution.

[1] https://lore.kernel.org/all/20240421135631.223362-1-tomas.winkler@intel.com/T/
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1758
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/misc/mei/hw-me-regs.h | 2 ++
 drivers/misc/mei/pci-me.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/misc/mei/hw-me-regs.h b/drivers/misc/mei/hw-me-regs.h
index aac36750d2c5..c3a6657dcd4a 100644
--- a/drivers/misc/mei/hw-me-regs.h
+++ b/drivers/misc/mei/hw-me-regs.h
@@ -115,6 +115,8 @@
 #define MEI_DEV_ID_ARL_S      0x7F68  /* Arrow Lake Point S */
 #define MEI_DEV_ID_ARL_H      0x7770  /* Arrow Lake Point H */
 
+#define MEI_DEV_ID_LNL_M      0xA870  /* Lunar Lake Point M */
+
 /*
  * MEI HW Section
  */
diff --git a/drivers/misc/mei/pci-me.c b/drivers/misc/mei/pci-me.c
index c39718042e2e..7f59dd38c32f 100644
--- a/drivers/misc/mei/pci-me.c
+++ b/drivers/misc/mei/pci-me.c
@@ -122,6 +122,8 @@ static const struct pci_device_id mei_me_pci_tbl[] = {
 	{MEI_PCI_DEVICE(MEI_DEV_ID_ARL_S, MEI_ME_PCH15_CFG)},
 	{MEI_PCI_DEVICE(MEI_DEV_ID_ARL_H, MEI_ME_PCH15_CFG)},
 
+	{MEI_PCI_DEVICE(MEI_DEV_ID_LNL_M, MEI_ME_PCH15_CFG)},
+
 	/* required last entry */
 	{0, }
 };
-- 
2.43.0

