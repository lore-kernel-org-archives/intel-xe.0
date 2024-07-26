Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F610C52CD9
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 06:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0D610E190;
	Fri, 26 Jul 2024 06:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gi/wOdvx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5EB10E097
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 06:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721976232; x=1753512232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ja+9O0TZszu+3bslcBvUviPJIEmtw5zqZyQF7kY6MlA=;
 b=Gi/wOdvxQyPZ1I1EoVag5ff0TwJ3WZJW32WsC1n84HidHD/YP7RJ/0mq
 9NZdydt0B/yC/ql7HkRkfCldxMXS14R6SoAm3XUn06mueNqhTyojhLp1F
 KOtC6bUxu07CF3eSxsH/X2yXl6E05c1JMi53MSTiCIhOIjWscpWb64Xg3
 P8YBosvzIguuc95FGnbewAGJPeLe2Rc1xLFvW+E1f2wjkR4I0RjJTP6dC
 OxRj2w6F/3A1chLMCeWs7nto5L47m6cd+BT+HgOiDbsvHZQ0LFmmGjanL
 XNLmfI75G63krC1rot8c6ZYm+ve8Kz5hQjZu4XiPYBoH8EaLjJnSDUT3U w==;
X-CSE-ConnectionGUID: 4IwaNPVGQVKQRsvGhvOeVA==
X-CSE-MsgGUID: xcdw2UUwTfOeFtUTfEnTEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="37270582"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="37270582"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 23:43:51 -0700
X-CSE-ConnectionGUID: Qo189BpCREee8aES7VFYyA==
X-CSE-MsgGUID: jc2tPQOjSsqgRu6RDYrQlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="83799463"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 23:43:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 1/7] drm/xe/kunit: Test WAs for BMG
Date: Thu, 25 Jul 2024 23:43:31 -0700
Message-ID: <20240726064337.797576-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240726064337.797576-1-lucas.demarchi@intel.com>
References: <20240726064337.797576-1-lucas.demarchi@intel.com>
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

