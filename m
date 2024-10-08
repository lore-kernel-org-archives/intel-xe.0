Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F34CED272
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 06:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF80E10E0E8;
	Tue,  8 Oct 2024 06:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+LTciAC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7CA10E478
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 06:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728370417; x=1759906417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LcYc/4CPM8Ib89XKgIm4llqMVoyQpkT3V7xKMnNRzi0=;
 b=c+LTciACqEu/IoVtjjajekktU9zkTENnPaBso4L6owaw2XRN0lah0tnK
 T/+Ys59XUTXNaDzcnjz2n9/zyYfx7M/cPTRxPv+t/MFm2l5Tt4UuvHXpI
 YLGe8PYnghlsaTlkADO2agMCnZySl6idhF2h8mE5FvHhGXsFAd3XQFzdI
 Ny+s9C6so8dJaS7m3aDTitlWXP6p237dgTXMLE+kV/WQh7gchQG6vvjLi
 GsJ4o59ed7Nbwk3X2DcMk7/WidyVY8ZIGh31PfkFe1w/Hn6VVaxKCyaqq
 zLLK1OTPDglpO5rD+qrrtGNXvZ5aTZo+iIWGpB8yuK3mPZxs3MmyGN9LM g==;
X-CSE-ConnectionGUID: g9rlZpU4Sp++t3p2VTuCOw==
X-CSE-MsgGUID: Hxk1po7BSLWe6IB7i6xGiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31430491"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="31430491"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 23:53:37 -0700
X-CSE-ConnectionGUID: zhjd1wycQ0ynJYE8K6223A==
X-CSE-MsgGUID: cpc9XSGORmOh0bGzaoYsVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="106577799"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa002.jf.intel.com with ESMTP; 07 Oct 2024 23:53:35 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v8 25/26] drm/xe: Ensure __must_check for xe_force_wake_get()
 return
Date: Tue,  8 Oct 2024 12:41:14 +0530
Message-Id: <20241008071115.1862704-26-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
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
index 7ff2588a8c47..5d749bad9496 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -169,8 +169,8 @@ static int domain_sleep_wait(struct xe_gt *gt,
  * Return: opaque reference to woken domains or zero if none of requested
  * domains were awake.
  */
-unsigned int xe_force_wake_get(struct xe_force_wake *fw,
-			       enum xe_force_wake_domains domains)
+unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
+					    enum xe_force_wake_domains domains)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index f0b27dbe7581..70faec9ae2d9 100644
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
 		      unsigned int fw_ref);
 
-- 
2.34.1

