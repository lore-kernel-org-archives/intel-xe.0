Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089CCC282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 13:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DEC10E9F8;
	Fri, 14 Mar 2025 13:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9fXC9vT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9103F10E9F8
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 13:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741960496; x=1773496496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dbnkGtnokGLZaJgNEwHBLPgOj+xRaPtDx5Gjfs5+N24=;
 b=m9fXC9vTxVZVLMdVfkj+trxY4932+umhQL08h1SrPRnM6BxklZ3Vi9X7
 VwZuUrbScFNwYQtwXIhcJ0FvpbOpAp9APlTewV0X3HthZqrjmU5E0Uxzo
 REsAeC2FOKrJWbfgoGD1vGJfXNX58PV32AC3bZYZerH3g8nhbTKb1tHKv
 SarkDoQEESTIfAl9EKY0/b4HezqY/FX+j0ZYdRY7EuarYZMv4AhhvFrl5
 ZHtHrMoTC1vl5B+mbbQVSm6yImM5i6mfiHASX0Sn19qff8ZzhHQ1Z5klU
 39weQn2bBhsh99gbdm7gE1OyW+7DznifbqRL2FsbCf8XggQLQjmCNTB2P g==;
X-CSE-ConnectionGUID: AYRAYJPAR3ix9Jrokq3d+A==
X-CSE-MsgGUID: icpiVyrcQNizrhtOq4X01w==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43000752"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43000752"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 06:54:55 -0700
X-CSE-ConnectionGUID: GNYDPt31QCOuSNhnSptDbw==
X-CSE-MsgGUID: jJ1zo170RLa4X8zeTe2k6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121333190"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 06:54:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v5 2/3] drm/xe: Set survivability mode before heci init
Date: Fri, 14 Mar 2025 06:54:26 -0700
Message-ID: <20250314-fix-survivability-v5-2-fdb3559ea965@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314-fix-survivability-v5-0-fdb3559ea965@intel.com>
References: <20250314-fix-survivability-v5-0-fdb3559ea965@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-c25d1
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

Commit d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
tried to follow the logic: initialize everything needed and if
everything succeeds, set the flag that it's enabled. While it fixed some
corner cases of those calls failing, it was wrong for setting the flag
after the call to xe_heci_gsc_init(): that function does a different
initialization for survivability mode.

Fix that and add comments about this being done on purpose.

Suggested-by: Riana Tauro <riana.tauro@intel.com>
Fixes: d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 7b1ec643f0f09..cb813b337fd33 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -155,13 +155,21 @@ static int enable_survivability_mode(struct pci_dev *pdev)
 	if (ret)
 		return ret;
 
+	/* Make sure xe_heci_gsc_init() knows about survivability mode */
+	survivability->mode = true;
+
 	ret = xe_heci_gsc_init(xe);
-	if (ret)
+	if (ret) {
+		/*
+		 * But if it fails, device can't enter survivability
+		 * so move it back for correct error handling
+		 */
+		survivability->mode = false;
 		return ret;
+	}
 
 	xe_vsec_init(xe);
 
-	survivability->mode = true;
 	dev_err(dev, "In Survivability Mode\n");
 
 	return 0;

-- 
2.48.1

