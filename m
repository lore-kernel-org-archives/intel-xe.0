Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4D6C52CD8
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 22:10:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9378310E8D9;
	Thu, 25 Jul 2024 22:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cD4mdtti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCB210E8D2
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 22:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721945405; x=1753481405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ja+9O0TZszu+3bslcBvUviPJIEmtw5zqZyQF7kY6MlA=;
 b=cD4mdttiHr8VNSQVPWJlqtZ+vTcJ+rDpeUuyQ1pAXduvsxvdm/FZ3/G3
 gNwGvPNBn0Qa/eApnGQCEmN0XBXRhLMQu4CIdXiMvha6WGUyovs0j+k41
 4iruJ+rN1dTOfuOBcbwOsarLqk0v2gMe27y9DiqMtbAVBP3Y3KZVtOw7F
 ztuKo2Umk59l8Lt7d5Vr06hEdqA5ge4KdRw+HFe/gbTrFO7PyG0K/KRZo
 ta3N5YOVzaJnrfjpvRMRN8/dCwZaemRw04cllZkVs5/iJURyC9DEQYJKj
 ZSBV2LSRpEHTuTXNaVeJhZA4S7NRL2CMSJaXrLEgEXCeCVo7MM5veIP8G Q==;
X-CSE-ConnectionGUID: ADPAkw19QHSDW6LxqaOOIA==
X-CSE-MsgGUID: dnp0o6efRR6UDnjET7TvMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19853168"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="19853168"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 15:10:04 -0700
X-CSE-ConnectionGUID: AcPKVCiCQmKPfpkgC9xtzw==
X-CSE-MsgGUID: OeGRuHkXRQSH72vvLaddzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="57346277"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 15:10:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: gustavo@freedesktop.org,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/5] drm/xe/kunit: Test WAs for BMG
Date: Thu, 25 Jul 2024 15:09:54 -0700
Message-ID: <20240725220956.737987-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725220956.737987-1-lucas.demarchi@intel.com>
References: <20240725220956.737987-1-lucas.demarchi@intel.com>
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

Add one variant for BMG to make sure the workarounds do not conflict.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 9d0c715142b9..8d6a77fbc716 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -74,6 +74,7 @@ static const struct platform_test_case cases[] = {
 	GMDID_CASE(METEORLAKE, 1274, A0, 1300, A0),
 	GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
 	GMDID_CASE(LUNARLAKE, 2004, B0, 2000, A0),
+	GMDID_CASE(BATTLEMAGE, 2001, A0, 2000, A1),
 };
 
 static void platform_desc(const struct platform_test_case *t, char *desc)
-- 
2.43.0

