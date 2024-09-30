Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6600DCF6491
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 05:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC6510E2C8;
	Mon, 30 Sep 2024 05:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ULH7Hmxs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2A110E2C7
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 05:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727673253; x=1759209253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ErV/DtFNcQleteBUyBTtvu4JuneiPvVGJhkXWBZh4VM=;
 b=ULH7Hmxspach7pLrBXHyBrXfrxPmwAs9adVRsGsq1KbwIgLflfYBiPo+
 RS8gdMZRI9egzOvInIXf0OWzHaOdLE7SMPg7Z9kPOIn3qfJrrjqSmt7or
 Zh9XpYB0HA4qlEyvYC3Xy5N4ZcU/Yx/j5lElgNX0cRIuai7ORF9M4nrVa
 LMpZOh+QUvMzE3TIRPyAKD5fviCfPXbstiS9QhQxicLUONpy7Yfen6CYs
 frrNuHF/nBd0sRayfdLYx/FBrCymkXf0cRZuhiXNZzGk8bxgPXvu5cIy5
 3m1/lagQaax/4QOvLXXpX+Z14Kc18sdQTntCH3fpV+vcr6TIACTEXSQ14 w==;
X-CSE-ConnectionGUID: YuA8dJzmQ7OMW43uwJBxfg==
X-CSE-MsgGUID: X89QS5pwR6WswYwvVgvcOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14368004"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="14368004"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 22:14:13 -0700
X-CSE-ConnectionGUID: Zcy26t4fRkGX6HninxfUNw==
X-CSE-MsgGUID: 66KyxuacQ2WNI6Mvs0mLGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="72752286"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 22:14:10 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v6 24/25] drm/xe: Ensure __must_check for xe_force_wake_get()
 return
Date: Mon, 30 Sep 2024 11:01:48 +0530
Message-Id: <20240930053149.1246339-25-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
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
index 372ea43b0d06..6a89d3c7929d 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -175,8 +175,8 @@ static int domain_sleep_wait(struct xe_gt *gt,
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
index b5a75544d86a..9026d17a751d 100644
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

