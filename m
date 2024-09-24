Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDDBCF9C77
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 11:59:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04E810E89A;
	Tue, 24 Sep 2024 11:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SwM3MFET";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7055C10E89B
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 11:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727179153; x=1758715153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S+hGujiIAS7w+uX3ipifmE9blr4SDvH44kHj2uhmp2U=;
 b=SwM3MFETcdu6mzGVNeolPBFvhzSQjQwHzVDKjyxGM06PvZ/sxmqx6OU8
 HA9enIEdsF8gY+TQz5HFevXn77NPY0lKuQCfdC47xujdffE0MJ5+xjq4h
 eIxPT+vIyQM00eGGqqyG5c3fc0DyRPLcP9vl6ZYHGM4Hok1Cp6t+lRpAo
 QTb1BifEwATOrCLM9MknJnCNFdAdNBN2Xh9bu5YJ4dMQOr97S8Lz5DWJD
 HbTPWQsKYkzsb3T9AYFXY7ERQwgfYiYlXswixMAB3wGjPvaQ40amOLOIf
 yBZtaCNGphAr7WMStYPE4ol4bpG5jN6Yf5neYrD/A/8kvMQrUK31XOubI A==;
X-CSE-ConnectionGUID: FQMzd4nTQriSR74I5e36pQ==
X-CSE-MsgGUID: SuQozfjVQ7ufhNasFtLncA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29957074"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="29957074"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 04:59:13 -0700
X-CSE-ConnectionGUID: 6oSvBffURb2cJD8Bdj40Ew==
X-CSE-MsgGUID: uPeVmxOCR1OlxsQBIUT7Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="76319374"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa004.jf.intel.com with ESMTP; 24 Sep 2024 04:59:10 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v5 22/23] drm/xe: Ensure __must_check for xe_force_wake_get()
 return
Date: Tue, 24 Sep 2024 17:46:40 +0530
Message-Id: <20240924121641.1045763-23-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
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
index c805214bc348..d2eb367da7c1 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -164,8 +164,8 @@ static int domain_sleep_wait(struct xe_gt *gt,
  * the caller should handle the failure case, potentially returning
  * -ETIMEDOUT.
  */
-unsigned int xe_force_wake_get(struct xe_force_wake *fw,
-			       enum xe_force_wake_domains domains)
+unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
+					    enum xe_force_wake_domains domains)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 731a9a5a29a4..0b676462c97b 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
 			   struct xe_force_wake *fw);
 void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
-unsigned int xe_force_wake_get(struct xe_force_wake *fw,
-			       enum xe_force_wake_domains domains);
+unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
+					    enum xe_force_wake_domains domains);
 int xe_force_wake_put(struct xe_force_wake *fw,
 		      unsigned int domains_mask);
 
-- 
2.34.1

