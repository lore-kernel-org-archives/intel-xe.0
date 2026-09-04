Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34245C79F80
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 17:05:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBF510FA96;
	Fri,  4 Sep 2026 17:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CqkIlSHL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2293610E55D
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 17:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788541544; x=1820077544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4mJBUDTH417GEjWjI0AIW65hHHm/ZkFPKPBn/JWGK2c=;
 b=CqkIlSHL0Q8rETC6KjEKss6mME/dXy9fR8KcYakcdkCTjoOGapaadncw
 4oOlN51bvNZC5Isew0Xbc+MG0hAaBLRtaM022UMdzukEb0QkdGkXKvA5s
 ATa8X+0EWLr4D27M02E0FmT1/zoaOQNj5qe0e8ao0676L2hyHvAO012M+
 G5Olyri6NJHVr+Hb9dF2MOE0TLq8kWh8J2J6Fi6cPFJSyJH9eTKqjv0st
 IIGSLKOU6/5lUzqRv2gRI8RXnlrHMAeImNknQQiPWgcUxmzJezoDXyVPE
 oNcKxjfv9VxaOdzb80wWJCHWA/LLzxYme4d9s/507TWdL4j2tsXhJMYkf w==;
X-CSE-ConnectionGUID: PVoaIMqtSuyQezb0y07lww==
X-CSE-MsgGUID: 9t+wSS1ITqmvxAd4pDYB0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89082200"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89082200"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 10:05:44 -0700
X-CSE-ConnectionGUID: zFZCMD7uTjeo24higgiQUg==
X-CSE-MsgGUID: f9CfoHUnS82jx6OEY/4Pdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="273882658"
Received: from johndonn-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.174])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 10:05:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 1/6] drm/xe: Drop unused parameter from xe_info_init
Date: Fri,  4 Sep 2026 19:05:25 +0200
Message-ID: <20260904170531.516-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904170531.516-1-michal.wajdeczko@intel.com>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
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

We don't need anything from struct xe_device_desc in xe_info_init()

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 2 +-
 drivers/gpu/drm/xe/xe_pci.c       | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index bb0393475524..4965a01f6ba5 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -382,7 +382,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 		return err;
 
 	xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
-	xe_info_init(xe, desc, &probed_info);
+	xe_info_init(xe, &probed_info);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ab4da1d9a9f1..47fad696545c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1011,7 +1011,6 @@ static int xe_probe_info(struct xe_device *xe,
  * present in device info.
  */
 static int xe_info_init(struct xe_device *xe,
-			const struct xe_device_desc *desc,
 			struct xe_probed_info *probed_info)
 {
 	const struct xe_ip *graphics_ip;
@@ -1244,7 +1243,7 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
 	if (err)
 		return err;
 
-	err = xe_info_init(xe, desc, &probed_info);
+	err = xe_info_init(xe, &probed_info);
 	if (err)
 		return err;
 
-- 
2.47.1

