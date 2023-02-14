Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65791C61DA4
	for <intel-xe@archiver.kernel.org>; Tue, 14 Feb 2023 11:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E1F10E0D7;
	Tue, 14 Feb 2023 11:23:58 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05AAA10E0D7
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Feb 2023 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676373837; x=1707909837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SecrNSMUsfXp4jJss90HnHKJfrwAl46oyO6jO2uNh4o=;
 b=Q1TtQiAJ8N2+c6wOBAR4RRrgdfpvK/38J8G6Oq1I0aB2Vjkg0TbZktRx
 yi7ss+tXGaTXtb6WQ1m5NtER1ej60eNG6crzwzuXqbvVPWk1+9eNNOiV/
 PaFo/6uwrGPL4D0gbn7QpCZIBAc3lqYRdYcRRl6GFUimEE/yfseE37fL9
 tv+tei8ZxbsYnr6hvMH/2nlFyda3kQeapQnoYtyM2WhbSzQ73rnP9hWXH
 sJ6/KctDFwLdDl0SIFtvcnJS5J9R1XsJKJuiuWQSy4EuVPaW+xizl1v1X
 80JyvPh45ETg6aNcyMSxEVPrsbETdC09+myb+PbNcZ+YGHWdZwsUdB+Fm g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="332450049"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="332450049"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:23:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="732863197"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="732863197"
Received: from achurkin-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.18.173])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:23:47 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Feb 2023 11:21:23 +0000
Message-Id: <20230214112136.162380-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214112136.162380-1-matthew.auld@intel.com>
References: <20230214112136.162380-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 02/15] drm/xe/stolen: don't map stolen on
 small-bar
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

The driver should still be functional with small-bar, just that the vram
size is clamped to the BAR size (until we add proper support for tiered
vram). For stolen we shouldn't iomap anything if the BAR size doesn't
also also contain the stolen portion. Stolen should still be functional,
just that allocating CPU visible io memory will always return an error.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/209
Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index b4e9c88644e4..e5a992ce432a 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -150,7 +150,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
 		    stolen_size);
 
-	if (!xe_ttm_stolen_inaccessible(xe))
+	if (mgr->io_base && !xe_ttm_stolen_inaccessible(xe))
 		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, stolen_size);
 }
 
-- 
2.39.1

