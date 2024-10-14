Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FFCCFC501
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 07:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B4E10E3A6;
	Mon, 14 Oct 2024 07:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MeDsHTmb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6A010E3AA
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 07:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728891446; x=1760427446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o7dj4tgPKJTyyTQfM+wDIxJpDUNJC6Ym8K2PUdLL3nM=;
 b=MeDsHTmbg4Sdd3MbSqvdTRZJLD6blO83YR9phMKJLqY9+AkTce0bE1w4
 HLiME7NtHUGXrWUpVntgdPvqi1NwB8sxudXdqnizvW2di1FGm8VgiJVi9
 q3vqCPC9BHmOG+Gmx/zRT6r3FtsiR1lDN9lzzgoH/D6/5sAtssNdP4ont
 e7P8OuHHzdgrDwV65Lj4vFz4azhZ7MlGTAXYOlhGiwjZa0BQJdj1WG1jI
 YpVRLDfbpOfniIG+9TmFKzcCXr2yEuNaMvc663/oNLmvdGwESZF6PWOJe
 HMZlNq2/zZU9tyvRkWeQBpxOcTgKTrbwXQWVb0r8L8VqQyCSWIE1kB1wg g==;
X-CSE-ConnectionGUID: gZNyvc6NSjuGYrkK9k1X2A==
X-CSE-MsgGUID: V8JzAdBsRAuAh15E3sEVqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="27686717"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="27686717"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 00:37:25 -0700
X-CSE-ConnectionGUID: YuSj65YvQCOHTQF/UvEPZw==
X-CSE-MsgGUID: VfLDS6fEQWK/nhRYeYSBBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="82268583"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa005.jf.intel.com with ESMTP; 14 Oct 2024 00:37:24 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v9 03/26] drm/xe/forcewake: Add a helper
 xe_force_wake_ref_has_domain()
Date: Mon, 14 Oct 2024 13:25:38 +0530
Message-Id: <20241014075601.2324382-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
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

The helper xe_force_wake_ref_has_domain() checks if the input domain
has been successfully reference-counted and awakened in the reference.

v2
- Fix commit message and kernel-doc (Michal)
- Remove unnecessary paranthesis (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index a2577672f4e3..1608a55edc84 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -46,4 +46,20 @@ xe_force_wake_assert_held(struct xe_force_wake *fw,
 	xe_gt_assert(fw->gt, fw->awake_domains & domain);
 }
 
+/**
+ * xe_force_wake_ref_has_domain - verifies if the domains are in fw_ref
+ * @fw_ref : the force_wake reference
+ * @domain : forcewake domain to verify
+ *
+ * This function confirms whether the @fw_ref includes a reference to the
+ * specified @domain.
+ *
+ * Return: true if domain is refcounted.
+ */
+static inline bool
+xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains domain)
+{
+	return fw_ref & domain;
+}
+
 #endif
-- 
2.34.1

