Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07E1C282DE
	for <intel-xe@archiver.kernel.org>; Thu, 13 Mar 2025 20:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64E710E93C;
	Thu, 13 Mar 2025 20:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nO+5iwbo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0E310E93E
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Mar 2025 20:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741898474; x=1773434474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UG/gF4RRkS2rL3SLTcnRFOA1i+iPkCJtX6rRvkCHKhc=;
 b=nO+5iwbo4h9l084il6VAQLCc5MpZAC7jNFJfi+1RS3ajF3Lw/pi/c3PL
 bQtjdFbZI/31LN+/hmMwKUX+qKL8L1SyxCoMAvfZUxWTVVnLag58uVrKp
 RZruT59tjQ1CqDDv+1Zi/EnIYHEP9VPABVh+dJx8JOkCirnDJgqEkkAra
 u2/lYXBsPv7meq00aC3p/Xgl1+bIzyTisqcVLLZocI9tjHF8viK+Igg2a
 /e0tkSrG58Z2utu2E/HE9t84Jcy6TanmszUuoehTXhTqT4qSrIve/hUUN
 W4tcM64iYLjnfpvmBpgC/mNaBRJgtycIwuEijBnFUE/lPKMZhfnkSKd+u Q==;
X-CSE-ConnectionGUID: TKUrnoGzQSOz95Thwqz12A==
X-CSE-MsgGUID: 2ahOXxKFQvS0MjcrhuvHHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="42764615"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="42764615"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 13:41:14 -0700
X-CSE-ConnectionGUID: 7XHjo1PUSee2jr2UYDT6pQ==
X-CSE-MsgGUID: 5QMwMSKoTDi3b7CYrz1Rlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="121574275"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 13:41:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4 2/3] drm/xe: Set survivability mode before heci init
Date: Thu, 13 Mar 2025 13:41:00 -0700
Message-ID: <20250313-fix-survivability-v4-2-5e90efdede99@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313-fix-survivability-v4-0-5e90efdede99@intel.com>
References: <20250313-fix-survivability-v4-0-5e90efdede99@intel.com>
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

