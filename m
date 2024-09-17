Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DA2CAC594
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 17:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A8910E4ED;
	Tue, 17 Sep 2024 17:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hfIZecfH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA68910E4F0
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 17:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726595825; x=1758131825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D1r/gAiwVQPhqr0EBTmBJ4vXiRucNC0Hm8z3kIDtrHg=;
 b=hfIZecfHT2EWJm23UOumqsnmyuszsw8Aqx3F3dwOk4A4oKG1IeQhcHpE
 DVJ6at5wcujakxDEO7BDbzqVhr/xXk1QVGGQTF8geJy/bF1+xzIIbX3p/
 jfSdooyDdX8RJb3F8YlKJtDJW36S8j3mSG6t+oEJTGR672weDUd2hiOFg
 /QW87CofjLudaT4Pw04XMQW6i7cn6fuSx8zIDhyP958pokwNxTx4HqDhX
 62GdTq1k0WYPlneeaZ9wcz26P3aTcwteQvmEfd35YGZ5qOIQQuYye3uq0
 PV2UVRBuDfq5303ge5v+utqOk19W5X2ObgGtSoVvOcNYe3CR/76n0KOLo Q==;
X-CSE-ConnectionGUID: xOcfugRbTp+9BNA/mol98w==
X-CSE-MsgGUID: KoMXKrOsS7WJaV4niRoq8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13562029"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="13562029"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:57:05 -0700
X-CSE-ConnectionGUID: 1r251CE2SAWyKQu2CENDlg==
X-CSE-MsgGUID: kFaVGzoVRPGFSms+GwO5Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="68926548"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2024 10:57:03 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v4 22/23] drm/xe: Ensure __must_check for xe_force_wake_get()
 return
Date: Tue, 17 Sep 2024 23:44:24 +0530
Message-Id: <20240917181425.515871-23-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
References: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
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

Add __must_check attribute for xe_force_wake_get().

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (#rev1)
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 4 ++--
 drivers/gpu/drm/xe/xe_force_wake.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 802e5927dd81..48aa4fca34b5 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -164,8 +164,8 @@ static int domain_sleep_wait(struct xe_gt *gt,
  * the caller should handle the failure case, potentially returning
  * -ETIMEDOUT.
  */
-xe_wakeref_t xe_force_wake_get(struct xe_force_wake *fw,
-			       enum xe_force_wake_domains domains)
+xe_wakeref_t __must_check xe_force_wake_get(struct xe_force_wake *fw,
+					    enum xe_force_wake_domains domains)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 6c8c46777b79..43e7aa7bead8 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
 			   struct xe_force_wake *fw);
 void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
-xe_wakeref_t xe_force_wake_get(struct xe_force_wake *fw,
-			       enum xe_force_wake_domains domains);
+xe_wakeref_t __must_check xe_force_wake_get(struct xe_force_wake *fw,
+					    enum xe_force_wake_domains domains);
 int xe_force_wake_put(struct xe_force_wake *fw,
 		      xe_wakeref_t domains_mask);
 
-- 
2.34.1

