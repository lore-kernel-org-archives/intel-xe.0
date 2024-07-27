Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD00C3DA70
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 01:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6306C10E93B;
	Sat, 27 Jul 2024 01:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFqhnSGy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA56610E8D2
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 01:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722045564; x=1753581564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1zYdmhS7OWFBrBZY7+GnjthWJUZM1SPHIjBQtc8hFTE=;
 b=nFqhnSGyeU7pGERj36aVLzEV21ppXpB9QLwnm3ThS7Sfpe/ArQMlNBYX
 LtINM/oFd1OgTYx1GvAWqTsS+2zhrdgbjlj5t8ZyGlbEuoA1nxdgnUd3t
 SJwCcANrZIfdXNvw7JQ9YtrtCC1zSx84vVEbWQkwrgRCEdSffdAcaf5J6
 Kka6MiemfNGm6TIXJ0OIwrC5ZgQA+LxOr7bohLMCqnzp74+b+Ngm2/5tV
 CgvUutV5YvAWxc6RVwjirzAtuPR0WeJwPa9GjN1oIUnjzoEFGXmF7cYFh
 zr97TP0dQgmoDNywpZjR0JzJsoSjBgs1eOlIiERe4y8IDrf8p60JveBjB w==;
X-CSE-ConnectionGUID: HAFmqaVWR0uDfP9gk3WHOA==
X-CSE-MsgGUID: zYDOISsbSC2XkwCHReGaOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19460255"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="19460255"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:59:23 -0700
X-CSE-ConnectionGUID: iJ13KtdmREuShyhMKDicrA==
X-CSE-MsgGUID: YJSYFE0dRxKZDIutt8T+yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="53108375"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:59:22 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 1/8] drm/xe/kunit: Test WAs for BMG
Date: Fri, 26 Jul 2024 18:59:00 -0700
Message-ID: <20240727015907.899192-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240727015907.899192-1-lucas.demarchi@intel.com>
References: <20240727015907.899192-1-lucas.demarchi@intel.com>
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
This matches the machine with BMG in CI:

        BATTLEMAGE e20b:0000 dgfx:1
		gfx:Xe2_LPG / Xe2_HPG (20.01)
		media:Xe2_LPM / Xe2_HPM (13.01)
		display:yes dma_m_s:46 tc:1 gscfi:0 cscfi:1
        Stepping = (G:A0, M:A1, D:**, B:**)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 9d0c715142b9..c96d1fe34151 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -74,6 +74,7 @@ static const struct platform_test_case cases[] = {
 	GMDID_CASE(METEORLAKE, 1274, A0, 1300, A0),
 	GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
 	GMDID_CASE(LUNARLAKE, 2004, B0, 2000, A0),
+	GMDID_CASE(BATTLEMAGE, 2001, A0, 1301, A1),
 };
 
 static void platform_desc(const struct platform_test_case *t, char *desc)
-- 
2.43.0

