Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036E7C77B7E
	for <intel-xe@archiver.kernel.org>; Sat, 29 Apr 2023 06:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C9910E0D2;
	Sat, 29 Apr 2023 06:24:20 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1CA10E095
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Apr 2023 06:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682749458; x=1714285458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9aiMKglUgAFwKGncmGVEYEMqkBe37nRtP0zxORkfOp0=;
 b=NzANItnD81T+JB/XiE6CmoZi/faImzTabRmMxwMm512D5u0XI05f9/It
 ERLMnfXz0cEBVLzKjLHEMn8bZEpR2ThAquYBTSfT2zN10vyNlwx5a9bYM
 eqZCQd40+uYbPmx93+TL4ZFi6CMNCMWSCjLAET6Pho0osa7PzJ8IKNM+q
 g4mzuL1oVW7XkO0b5oqHWk7QiBoF9+d5u9jFUomVqvOxtfEnjP62pcyHT
 6j5uSDyFAzMkzaE+ESFPNsAx0rOzgD0Ni2FeZJk/5HBRIlN//Y7+3yjUg
 WCKUTaBf1LASFk95I3izswDnjndbWEX3JynyZjUOvJqGWY985XgJIaOQa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="375928424"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; d="scan'208";a="375928424"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 23:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="697829074"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; d="scan'208";a="697829074"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 23:24:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 28 Apr 2023 23:23:26 -0700
Message-Id: <20230429062332.354139-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230429062332.354139-1-lucas.demarchi@intel.com>
References: <20230429062332.354139-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/7] fixup! drm/xe: Drop gen afixes from registers
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Maybe an abuse of fixup, but easy enough not to deserve a separate
commit.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 566b62815dab..795302bcd3ae 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -573,7 +573,7 @@ void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p)
 		hw_engine_mmio_read32(hwe, IPEHR(0).reg));
 
 	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
-		drm_printf(p, "\tGEN12_RCU_MODE: 0x%08x\n",
+		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
 			xe_mmio_read32(hwe->gt, RCU_MODE.reg));
 
 }
-- 
2.40.1

