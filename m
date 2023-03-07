Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD9BC74A44
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 09:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7D510E3CB;
	Tue,  7 Mar 2023 09:25:32 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E0710E3C3
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678181130; x=1709717130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BuxPrOKM7qxQUwgpmDJFFhZwBcfqk+rM66tL1qJkR/Y=;
 b=amUwAoigRuEoacoTxHbGPw6USs/E0swksGP0B4/7IdrUy0ye3p7TP5al
 WRAOTPcwDMC5uUuZ38O2vTeR38xYMDxHlNRuXmhlAa7ypWdhEuT7+aDpw
 uJjT7YXFKIjdVzyGzJtZ/e60Yco65NinO5j/IhiwYZ2KTOcbnF7RCHerJ
 IGpKXxfH1Ll9wSNkZwxw/qevQ2lZnhbh4PPcFSPdbJVZuoZj3BigYiVF5
 jOezDnugf2MaxfIFcU/XYbW+AVkj3k+GW/W8jLUvdJajvB3ft/bBqw+Et
 yRvxreUchR1ZaCnUQPWKp6bHcDDxPzgWt6SIkjqLhqLHAnBc1Exqrxp2p g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="422079120"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="422079120"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005798817"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="1005798817"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  7 Mar 2023 01:24:36 -0800
Message-Id: <20230307092446.1263266-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307092446.1263266-1-lucas.demarchi@intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 09/19] drm/xe: Name LRC wa after the engine it
 belongs
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

This makes it easier when printing the register-save-restore values
to know what is the engine.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 343370b44506..daa433d0f2f5 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -318,7 +318,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 		if (gt->default_lrc[hwe->class])
 			continue;
 
-		xe_reg_sr_init(&hwe->reg_lrc, "LRC", xe);
+		xe_reg_sr_init(&hwe->reg_lrc, hwe->name, xe);
 		xe_wa_process_lrc(hwe);
 		xe_tuning_process_lrc(hwe);
 
-- 
2.39.0

