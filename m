Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777CCC25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 09:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C7C10E8B3;
	Thu,  6 Jun 2024 09:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XB1JUouL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6822A10E8B3
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 09:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717667523; x=1749203523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C4RNYokEa7I9skR65M9v7pW7Coja3rO61zqaXC6oJRI=;
 b=XB1JUouLPMWcTL3SAK8uCfyE9H+FGraGBasg6cXUZDjwMF3uZuehmwom
 FBGv5liM8GvPmL2hcY+WmU9bp6YtrmcHeY8J1jXKJ3ZjMqZ8GITHcHg2E
 16tgJAy2n85UaHgzXoNKI/+JxDyrO1HGQXKCUvuDIE5cWGDAFkvILHU9V
 pBnL5aKvFHRbuMeybaPh4Fb8M+zDXbzmoF++FnKr78v9H2s+dnnVzG8LT
 08c2BZU9c4eh9mN6Nfyp5Z3YBM90ARHgp2UylXegm615z1Zh+PnQ/1bh9
 yJmM5djN6FOcX1R76YidoUBMDqua4g2eXnTiVdmAdRfCPNRU863Wr+lRp w==;
X-CSE-ConnectionGUID: V6V7VshiQmymvd/kiBrwUQ==
X-CSE-MsgGUID: O3fjX07kSoCbh/ZZ1a+Ahw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="39728383"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="39728383"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 02:52:02 -0700
X-CSE-ConnectionGUID: 5oo5+dFeS8uzyfgoZygcIw==
X-CSE-MsgGUID: JazWctEyQAOKzkfzveisuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="43003553"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa004.jf.intel.com with ESMTP; 06 Jun 2024 02:52:00 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH 1/3] drm/xe: Ensure caller uses sole domain for
 xe_force_wake_assert_held
Date: Thu,  6 Jun 2024 15:38:02 +0530
Message-Id: <20240606100804.1346992-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240606100804.1346992-1-himal.prasad.ghimiray@intel.com>
References: <20240606100804.1346992-1-himal.prasad.ghimiray@intel.com>
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

xe_force_wake_assert_held() is designed to confirm a particular
forcewake domain's wakefulness; it doesn't verify the wakefulness of
multiple domains. Make sure the caller doesn't input multiple domains as
a parameter, this will ensure caller doesn't use xe_force_wake_assert_held
with XE_FORCEWAKE_ALL parameter.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 83cb157da7cc..cee8ff039f83 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -32,6 +32,9 @@ static inline void
 xe_force_wake_assert_held(struct xe_force_wake *fw,
 			  enum xe_force_wake_domains domain)
 {
+	/* Ensure caller is not passing multiple domains */
+	xe_gt_assert(fw->gt, !(domain & (domain - 1)));
+
 	xe_gt_assert(fw->gt, fw->awake_domains & domain);
 }
 
-- 
2.25.1

