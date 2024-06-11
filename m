Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFA7C27C75
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 16:35:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BB410E1BB;
	Tue, 11 Jun 2024 16:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khlqmp9K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2A810E13F
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 16:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718123755; x=1749659755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cZEjucxJuFHnP/bWdClwi4PG7tQgAam/bD+WtHIBHMQ=;
 b=khlqmp9Kd3dzAvCKRzT9fG8DngA12StUH4GyBk3J8IyjQP8+5sOBwvcL
 mmyQ6uu1rTx4IFAPhKX8vWorHWIV+vfAOjHpOyPLq+uMXsVVbddbq89G0
 OXNmHLQmaCE6vWCi/F2i7CYlrO5dpEAJFAVjxFvuc1aSqIw87e+zVhYKC
 Sm9NqR40UJBRR5HhEi9VOjQctZSGu3m9hF5NNf9DPVuMt0CFBZuN//kVt
 rSQORmFp5+qoeEBsWoDOOLan92qTCv1IqorJ6uip5Lxqj6ZMnekWNvpO+
 LxXLKXorUb9SgKkSKU2JXMY2fb1QfSbaSbm0AhxozeIINxPgez7AUS0IG g==;
X-CSE-ConnectionGUID: l9LYCjbYTfmpQVffzAdCHg==
X-CSE-MsgGUID: 5P8SH6fQSSa0+t3C9Qii9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="40247879"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="40247879"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:35:54 -0700
X-CSE-ConnectionGUID: Imq4qgXbSzup2gLiDaORVw==
X-CSE-MsgGUID: cfN6UWBORsC0KvC2IG1cAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44388680"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.185])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:35:53 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 2/5] drm/xe: Kill fw_to_gt() helper
Date: Tue, 11 Jun 2024 18:35:34 +0200
Message-Id: <20240611163537.1944-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240611163537.1944-1-michal.wajdeczko@intel.com>
References: <20240611163537.1944-1-michal.wajdeczko@intel.com>
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

It's too simple to deserve separate helper.

Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 13ddabd90eed..8799a2544648 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -15,12 +15,6 @@
 
 #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
 
-static struct xe_gt *
-fw_to_gt(struct xe_force_wake *fw)
-{
-	return fw->gt;
-}
-
 static void domain_init(struct xe_force_wake_domain *domain,
 			enum xe_force_wake_domain_id id,
 			struct xe_reg reg, struct xe_reg ack)
@@ -130,7 +124,7 @@ static int domain_sleep_wait(struct xe_gt *gt,
 int xe_force_wake_get(struct xe_force_wake *fw,
 		      enum xe_force_wake_domains domains)
 {
-	struct xe_gt *gt = fw_to_gt(fw);
+	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
 	enum xe_force_wake_domains tmp, woken = 0;
 	unsigned long flags;
@@ -159,7 +153,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
 int xe_force_wake_put(struct xe_force_wake *fw,
 		      enum xe_force_wake_domains domains)
 {
-	struct xe_gt *gt = fw_to_gt(fw);
+	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
 	enum xe_force_wake_domains tmp, sleep = 0;
 	unsigned long flags;
-- 
2.43.0

