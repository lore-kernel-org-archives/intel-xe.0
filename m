Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC07C28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 21:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E5710E7D3;
	Wed, 12 Mar 2025 21:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCz6fbjB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A88D10E7CB
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Mar 2025 21:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813928; x=1773349928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6XYYw9cxXpmnyum/HCnjLyGbivk0WQTDo89z6gx2kiE=;
 b=SCz6fbjBift0zsZC5PfAVHRm1JkMK8KWG/xKjTkIwjIEfhEODjcvxBsO
 nEgaQYczfItOThQP8hOCEtXYhT1WQs4uz4Vc2OLhScGw6wnRDvZ+XSUq8
 qv9/+PZ+b6ExJ0nWsIlkG2eqf98YVOcb1j21mdRjJqz3A/vl46K8NJWaV
 JihE2C7PaS1mc5lj8RSAX1pnzrnvNdPwqO4V/BsqU/GGL0nb/XouZ5CzX
 szhiCsJrPIlrj1vsh5Keb+zz+KdYVcDXoZgYYvEg7gau6E204t61Sct9Q
 SsAI6QCfc6M93lAbgu02AtvTPmLLPNl9Y+P8rnfW0wt0X8P6jlLcEG5qZ g==;
X-CSE-ConnectionGUID: MyOTpGJ9S5Wn+fPchKknMw==
X-CSE-MsgGUID: NpkJDX8pT6SxuV6r0UFLqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42167855"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="42167855"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:12:08 -0700
X-CSE-ConnectionGUID: hTITsuOBSr29aso10pfPrA==
X-CSE-MsgGUID: tJMZQoxvS8a0Rr8yfKCK9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="125825946"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:12:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 2/3] drm/xe: Set survivability mode before heci init
Date: Wed, 12 Mar 2025 14:11:50 -0700
Message-ID: <20250312-fix-survivability-v3-2-54620dbcbbd7@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312-fix-survivability-v3-0-54620dbcbbd7@intel.com>
References: <20250312-fix-survivability-v3-0-54620dbcbbd7@intel.com>
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
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 0d57ad1596edf..359d5b961c750 100644
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

