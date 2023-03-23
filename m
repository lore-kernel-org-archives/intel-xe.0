Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECB2C761AF
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 22:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D91410EB81;
	Thu, 23 Mar 2023 22:48:06 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303C310E4C4
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 22:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679611684; x=1711147684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rEDe5cmU4BkgJTtmTyPLFeVC3TgT9nQmLa4uZcq8Wxg=;
 b=PcjK7dXGBlAmNwWwG1R19xHDEOmpWsJ+4qxy20b1gBOkPcmTieVf4Evd
 rnjmwyphhw3gCyp4ko/Kwa63WISohPMOPevIK0Iek3l7pHGOm66IMdQTg
 hk10nMIQxEItW6PF478iDFNQghQ/jl9GvPdFX5V4lOrgXJXeHj4BPvY1k
 V6/cicVWCEzNLof0EJ7VvETBU9iHBE5Sien7ShQhURgMeo5OuL4eg0VHT
 wzuhkYIFFP7nTYHusfgcguTUr7ZPXNAfQZUp0l8f47Cmd6c+SO6m/e4cq
 o8sFNboCRRy2gK2Yl5mS0xEEg1S1h3XzD3yGOVUlNJPpcnTBzO9tuJER3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="402224177"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="402224177"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 15:48:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="682460272"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="682460272"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 15:48:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Mar 2023 15:46:51 -0700
Message-Id: <20230323224651.1187366-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230323224651.1187366-1-lucas.demarchi@intel.com>
References: <20230323224651.1187366-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Load HuC on Alderlake S
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Anusha Srivatsa <anusha.srivatsa@intel.com>

Alderlake S uses TGL HuC.

Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 35187f35e7f2..e9b30e620fd9 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -51,6 +51,7 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
 	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 5, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def, huc_ver) \
+	fw_def(ALDERLAKE_S,  0, huc_def(tgl)) \
 	fw_def(DG1,          0, huc_def(dg1)) \
 	fw_def(TIGERLAKE,    0, huc_def(tgl))
 
-- 
2.39.0

