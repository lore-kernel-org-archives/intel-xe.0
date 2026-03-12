Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEF7FED2EA
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 08:07:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD00110E9AE;
	Thu, 12 Mar 2026 08:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ArRNV6+c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A0510E9A9;
 Thu, 12 Mar 2026 08:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773302830; x=1804838830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=29GBgUZU7DhVGLj1I9LQo0QA0eCYb5ZaivVtiTJQSBs=;
 b=ArRNV6+c5GASbrVNZNqtd/L38HmCG4qx8LWW9sFT1Kio0kMiPAbIo7h7
 C0CDEKb7mYpEJMZX8Um7mIm60hB2XYextQLfvTBuXKc41okgNBJH54cfa
 84gqJTcl64PPuXQ57rylEeAu3XTuU5Tehs7ZtsR0Wp9Z31hVwZ37GFeH2
 HZ8Eu/QDaHzHmurX7TY+yWDRkBYiCy+XdBV5RELSNsV8PIshT7bLtWs9d
 mszULLYnCDo0CAxYaXgHWiM8bEyapetZMeqgEuNjr+aJ6YQGocIiEFjka
 QFhZCeGPkl2WFl5qZ6kEdnmWW1bxj1EBe2XOwELFz2acD84D/ryvOj/7N w==;
X-CSE-ConnectionGUID: Kz48RnDcRqKNScqFQKUp0g==
X-CSE-MsgGUID: 5bszca20Q8+NJZkRK+YJSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85013723"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="85013723"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:07:09 -0700
X-CSE-ConnectionGUID: Cyz9XtU+Sm2iNeHXJDdMXw==
X-CSE-MsgGUID: 8GCZR5ZPRTmtUqA+aRj6XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="223206822"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2026 01:07:08 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [CI v3 08/24] drm/i915/lt_phy: Add xe3plpd .put_dplls hook
Date: Thu, 12 Mar 2026 08:06:41 +0000
Message-ID: <20260312080657.2648265-9-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080657.2648265-1-mika.kahola@intel.com>
References: <20260312080657.2648265-1-mika.kahola@intel.com>
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

Add .put_dplls function pointer to support xe3plpd platform
on dpll framework. Reuse ICL function pointer.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 9aa8eb0a7d4a..af2613eeaf92 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4654,6 +4654,7 @@ static const struct intel_dpll_mgr xe3plpd_pll_mgr = {
 	.dpll_info = xe3plpd_plls,
 	.compute_dplls = xe3plpd_compute_dplls,
 	.get_dplls = mtl_get_dplls,
+	.put_dplls = icl_put_dplls,
 };
 
 /**
-- 
2.43.0

