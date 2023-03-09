Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D1FC64EC4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 12:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA6510E7FF;
	Thu,  9 Mar 2023 12:21:45 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B214710E7FF
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 12:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678364502; x=1709900502;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GyfeFFzcymFHtAyBcaq04wZk+kU20Y92ILu8GEotsUg=;
 b=byTd+LdqARl70m9ENJLzuShECj+OTG9bDNLKwfCNum7rNXHLNQjsZRmv
 Ztlqac4lNgWMwtreX6maBblKMzIdpZOzzWRVw+A58S++L+VN6OV2kpsGc
 tlldPlgYMuDsqPNksA1AGKgAwdoW9BNYX1yi4Hq2gGi8SK7NMKAl27KIh
 nmFKcp9dLJaXh9zuf7OwhJFpAQlVvcYLlapYimOcb64LJmTKBrvPVIGf+
 h4H3PwlZaRvzPbgDeKdxXwNbXmMmXzHZOT9WPbHcd9Qqiur9DRZ7hKthY
 mJTRis3nOXYMI2va7Tr+IjgNhpwmHOrNIf+F9ZFIrd8bCoOkEj2pIg8G+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="338768095"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="338768095"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 04:21:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="766414036"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="766414036"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.145])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 04:21:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Mar 2023 14:21:33 +0200
Message-Id: <20230309122133.486044-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/irq: the irq handler local variable need
 not be static
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It's just a local variable.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index ae2f65c00fa6..529b42d9c9af 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -529,7 +529,7 @@ static void irq_uninstall(struct drm_device *drm, void *arg)
 int xe_irq_install(struct xe_device *xe)
 {
 	int irq = to_pci_dev(xe->drm.dev)->irq;
-	static irq_handler_t irq_handler;
+	irq_handler_t irq_handler;
 	int err;
 
 	irq_handler = xe_irq_handler(xe);
-- 
2.39.1

