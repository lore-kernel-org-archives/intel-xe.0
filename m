Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B72EED61A
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 17:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAF810E668;
	Fri, 15 Sep 2023 17:46:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9037310E663;
 Fri, 15 Sep 2023 17:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694800010; x=1726336010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0IvrU6G3MbD7LutKWjGiaAlR8TMQPtdz6/qjdb8DGpM=;
 b=NZ4e96ez/ta8+sXa+ZbJ0FrAlbGnjMfphnXnVyuMU13/aYpKd/akLaUt
 XLOY8F6JNkHSjhVQLjhKewawlXE96X/yud9W3P2HuBzes+cCKL2Bsxo9I
 5GQx46l88PnMkGx4yCC/bJ65GSqamzqjea5NDtnf3Y28s50w8HwXyOoC+
 qD1xYjV39XhU9uXk5w6phQGZt8S1JxGrCy2SeWXGCVTYxjOSJdEFm1UaA
 uyqIEHRPwrlQPmcr5yXN8KnR2kEfVLD/7F+iiXQY2b1U2BtCDHWjAdnAY
 63kINAKtbNK13driiFdhOi1PoyNlY23ZXVxeHOqHo9EXbwageeIGRdOdf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="445779261"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="445779261"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 10:46:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="868818243"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="868818243"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 10:46:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 15 Sep 2023 10:46:26 -0700
Message-Id: <20230915174651.1928176-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230915174651.1928176-1-lucas.demarchi@intel.com>
References: <20230915174651.1928176-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 05/30] drm/i915: Re-order if/else ladder in
 intel_detect_pch()
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Follow the convention of checking the last platform first and reword the
comment to convey there are more platforms than just DG1.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/soc/intel_pch.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/soc/intel_pch.c b/drivers/gpu/drm/i915/soc/intel_pch.c
index 19a8f27c404e..dfffdfa50b97 100644
--- a/drivers/gpu/drm/i915/soc/intel_pch.c
+++ b/drivers/gpu/drm/i915/soc/intel_pch.c
@@ -218,13 +218,16 @@ void intel_detect_pch(struct drm_i915_private *dev_priv)
 	unsigned short id;
 	enum intel_pch pch_type;
 
-	/* DG1 has south engine display on the same PCI device */
-	if (IS_DG1(dev_priv)) {
-		dev_priv->pch_type = PCH_DG1;
-		return;
-	} else if (IS_DG2(dev_priv)) {
+	/*
+	 * South display engine on the same PCI device: just assign the fake
+	 * PCH.
+	 */
+	if (IS_DG2(dev_priv)) {
 		dev_priv->pch_type = PCH_DG2;
 		return;
+	} else if (IS_DG1(dev_priv)) {
+		dev_priv->pch_type = PCH_DG1;
+		return;
 	}
 
 	/*
-- 
2.40.1

