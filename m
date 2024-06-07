Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65846C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 05:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2254610E20D;
	Fri,  7 Jun 2024 05:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MYjiXomJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D764610E20D
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 05:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717736785; x=1749272785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/OVLZo3Io47uyrW2aNscrE6fTMyA04lF03iVE312pBU=;
 b=MYjiXomJXyZrDlHm0nD1/r0RTnNsPPrhrvNR3AZLLflB8vJ6wf7+PNIy
 nXm4wVGii2Xf/rEwrad1lwQ1KDP9ohqcLw9GZXNh+RwLjvC6JbtssOPXf
 oqTbKoUkt16frTEepLNlIwODwD+GzylOyNC8Aplwd4ThkCr2i2kCrZ328
 GUj6zkn3O8xxF7jx47c/PgYXyS+eOvXjgzm2TwibmoRZxeHVLKL7YJZpH
 PAQUz3/y3KJLxQmEF0vkBw/BJZtZDt0iT8xvzhBpqqZA9lcX0Rd8exkRk
 poNifNPdaVgF0fFRzNKDdvBdgwGdbpBMpw8pq9N8K1fJvWeolTmmhqj4L w==;
X-CSE-ConnectionGUID: GWncPyotTFype/OtxGUNKA==
X-CSE-MsgGUID: 2v59Sc9PQhCiURbg69/s/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14183481"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="14183481"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 22:06:25 -0700
X-CSE-ConnectionGUID: PPUCKEk+RlGtN6gBl+I0rQ==
X-CSE-MsgGUID: DT5bkwO6T6Kb5T4UNEwktg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="38773089"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa008.jf.intel.com with ESMTP; 06 Jun 2024 22:06:23 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Ensure caller uses sole domain for
 xe_force_wake_assert_held
Date: Fri,  7 Jun 2024 10:52:12 +0530
Message-Id: <20240607052213.1391082-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607052213.1391082-1-himal.prasad.ghimiray@intel.com>
References: <20240607052213.1391082-1-himal.prasad.ghimiray@intel.com>
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
multiple domains. Make sure the caller doesn't input multiple
domains(XE_FORCEWAKE_ALL) as a parameter.

v2
- use domain != XE_FORCEWAKE_ALL (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 83cb157da7cc..651ea1e62c63 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -32,6 +32,7 @@ static inline void
 xe_force_wake_assert_held(struct xe_force_wake *fw,
 			  enum xe_force_wake_domains domain)
 {
+	xe_gt_assert(fw->gt, domain != XE_FORCEWAKE_ALL);
 	xe_gt_assert(fw->gt, fw->awake_domains & domain);
 }
 
-- 
2.25.1

