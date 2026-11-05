Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2436B606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 23:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D7NdXd/9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08A2112A2B;
	Thu,  5 Nov 2026 23:32:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F87A112A2F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 23:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793921555; x=1825457555;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=5UBYajHedbfp4mEE3I35hnMGGXUURVft+dfJ/qbqoV8=;
 b=D7NdXd/935zuyQFJw+o5oKXbBnrLnJ3sqV54TiYPtZhkEvKoDs128xWY
 6ItPDMXLvRNjRcaiYv1C3eaY1QxBL9/PNrlCADJ7IAvbaoznFNEIN+irW
 hODsf6o63Vep2AVZv6U3MtJA8LORFvYcvWRvH51LvVbhe8Yd/yi2GCKOZ
 MpPyLqq6XDT/Bpi8KM+EMpNDU61nIsSdyndczEfBRnbAHC53ZyhyL0FT/
 GPl+3BIGYq68Byc3dbftLSZJ/85lSqjTf4e951j3loZtB2aOgfw3MaC4M
 da0ayOAPa/uUaAkQbyT6BsXL9f6MYR210BIBjoVOG8FRqRdEj/kxEmoWZ w==;
X-CSE-ConnectionGUID: eg+tOUZ/TaC5lpOYnx5YyQ==
X-CSE-MsgGUID: goGV5RiaQQqG3RLtwaIuZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2769913"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2769913"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:32:33 -0800
X-CSE-ConnectionGUID: mnfUEcvSQ6SkbnAIClyIbA==
X-CSE-MsgGUID: pkPmDV8iQViDVAClY2af4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7187007"
Received: from gabaabhi-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:32:31 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Nov 2026 20:31:55 -0300
Subject: [PATCH v3 08/10] drm/xe/guc: Increment regset size for
 Wa_1607983814 inside hwe loop
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-wa_16031259911-v3-8-da6ec790aa29@intel.com>
References: <20261105-wa_16031259911-v3-0-da6ec790aa29@intel.com>
In-Reply-To: <20261105-wa_16031259911-v3-0-da6ec790aa29@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>
X-Mailer: b4 0.15-dev
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The regset size increment for Wa_1607983814 is correct with today's
hardware, because the maximum number RCS per GT is one.  That said, it
is arguably more accurate to make that calculation inside the
for_each_hw_engine() loop, where we can mimic the same conditions used
by guc_mmio_regset_write().

Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index c3ce3c8c905a..84fd02ae5fff 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -220,14 +220,15 @@ static size_t calculate_regset_size(struct xe_gt *gt)
 	enum xe_hw_engine_id id;
 	unsigned int count = 0;
 
-	for_each_hw_engine(hwe, gt, id)
+	for_each_hw_engine(hwe, gt, id) {
 		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
 			count++;
 
-	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
+		if (XE_GT_WA(gt, 1607983814) && hwe->class == XE_ENGINE_CLASS_RENDER)
+			count += LNCFCMOCS_REG_COUNT;
+	}
 
-	if (XE_GT_WA(gt, 1607983814))
-		count += LNCFCMOCS_REG_COUNT;
+	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
 
 	return count * sizeof(struct guc_mmio_reg);
 }

-- 
2.56.0

