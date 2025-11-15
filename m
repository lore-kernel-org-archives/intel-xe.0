Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B12CEB2DD
	for <intel-xe@archiver.kernel.org>; Sat, 15 Nov 2025 15:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DA710E0BE;
	Sat, 15 Nov 2025 15:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtW+vrCe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0511610E072
 for <intel-xe@lists.freedesktop.org>; Sat, 15 Nov 2025 15:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763220430; x=1794756430;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M6WnkzuSMGimXYRXw8NxukjHx/6YS8M0iO5ko/Vj/Wg=;
 b=PtW+vrCepefbSKEkPABI//Kcqo6yA/qFhaXbZPkE/RP0VowUWkgaG/45
 ufZgt1of1kpqDgcaMsq3i2JaDvSkyMb/IVeu25qecMAzuqPOMQEKuWGbq
 whQfZ/DhXaiDd63YQi3nadzj9i+cVIQmSlPFO3KMgUC2x8rGu7cCe59LH
 cXkhLpIb3k0oOvzya5sc7I6lK5qyJ2PMfoP7dfAj4HHwpqvzTu2TAdi5N
 Ds6Hdol868mMJPF2OaSDPpD58z7ArZSE4nk9txwBwr6+WXXCMPM3zZWEK
 nH6Lq+WNEjfUZXrWfb6rDyOcUFi3/PxH9fgZN7VwI+4Ee3BZb0ghpjnUp A==;
X-CSE-ConnectionGUID: aVtnie/xTy2snuasYtTLCA==
X-CSE-MsgGUID: FhGEPaSySnGWEy4bCwi5jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="75607961"
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; d="scan'208";a="75607961"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2025 07:27:09 -0800
X-CSE-ConnectionGUID: U1wpV3KDQDCewPCzPzoctA==
X-CSE-MsgGUID: 7RGlM8OeReKf5wpOJweSHg==
X-ExtLoop1: 1
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2025 07:27:08 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Fix .bulk_profile/sched_priority description
Date: Sat, 15 Nov 2025 16:26:58 +0100
Message-ID: <20251115152659.10853-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

The .bulk_profile/sched_priority file is always write-only, unlike
the profile/sched_priority files which can be either read-write or
read-only (in case of PF or VFs respectively).

Fixes: 6b514ed2d9a7 ("drm/xe/pf: Add documentation for sriov_admin attributes")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 Documentation/ABI/testing/sysfs-driver-intel-xe-sriov | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
index 2fd7e9b7bacc..7f5ef9eada53 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
@@ -119,7 +119,7 @@ Description:
 			The GT preemption timeout (PT) in [us] to be applied to all functions.
 			See sriov_admin/{pf,vf<N>}/profile/preempt_timeout_us for more details.
 
-		sched_priority: (RW/RO) string
+		sched_priority: (WO) string
 			The GT scheduling priority to be applied for all functions.
 			See sriov_admin/{pf,vf<N>}/profile/sched_priority for more details.
 
-- 
2.47.1

