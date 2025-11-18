Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3317FCED624
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 11:50:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C958A10E0F8;
	Tue, 18 Nov 2025 11:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFpw+bD7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D947D10E0F8
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 11:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763466608; x=1795002608;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pGtZMTRa56pMWjqr2HMIYai2lstNx/fgk+tjegNe5Ok=;
 b=AFpw+bD7Uiaex91+WC4/oMVDvKr/tc6IPQbaNmFZlXSC33oERBruXrhC
 /hi+K8eXw4jsy0Wy+J0hoLsxjEAo63PXeBv5vqvxSa7eqWvyP5+Mb63xf
 UVkVaGeJUJNcNA1Q4EDOnCpcOCYbn3QXuZGVYamFh3wNHGZEvzjt1tiIr
 nXBMKKhQolTdoTKHBPb66So1CvkSMGmSTTY5zvi9UzbLraHLGQv50irLh
 tdn655y66ZyBqKQzVLcOz9bSuyIq2xNZfsXiAsBIwSTXpVBC7860wM1OO
 8fGfJvRdCxT9/DzyM0fBiPb6ILtfdHSSh65PTlbLXYk4W6zd2Ad6mUrYe g==;
X-CSE-ConnectionGUID: vu/axV34TQ2OIb/jPTnHrg==
X-CSE-MsgGUID: HlBsaCu9TmODpJ/ZZ50E2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="53055054"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="53055054"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 03:50:07 -0800
X-CSE-ConnectionGUID: UAz/HxPmTySJ+TDTlbIhUQ==
X-CSE-MsgGUID: O/6ip3shTFOaQBbpkUVY2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190003504"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 03:50:06 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	stable@vger.kernel.org
Subject: [PATCH v2] drm/xe/oa: Fix potential UAF in xe_oa_add_config_ioctl()
Date: Tue, 18 Nov 2025 17:19:00 +0530
Message-ID: <20251118114859.3379952-2-sanjay.kumar.yadav@intel.com>
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

In xe_oa_add_config_ioctl(), we accessed oa_config->id after dropping
metrics_lock. Since this lock protects the lifetime of oa_config, an
attacker could guess the id and call xe_oa_remove_config_ioctl() with
perfect timing, freeing oa_config before we dereference it, leading to
a potential use-after-free.

Fix this by caching the id in a local variable while holding the lock.

v2: (Matt A)
- Dropped mutex_unlock(&oa->metrics_lock) ordering change from
  xe_oa_remove_config_ioctl()

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6614
Fixes: cdf02fe1a94a7 ("drm/xe/oa/uapi: Add/remove OA config perf ops")
Cc: <stable@vger.kernel.org> # v6.11+
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 87a2bf53d661..890c363282ae 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2403,11 +2403,13 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
 		goto sysfs_err;
 	}
 
-	mutex_unlock(&oa->metrics_lock);
+	id = oa_config->id;
+
+	drm_dbg(&oa->xe->drm, "Added config %s id=%i\n", oa_config->uuid, id);
 
-	drm_dbg(&oa->xe->drm, "Added config %s id=%i\n", oa_config->uuid, oa_config->id);
+	mutex_unlock(&oa->metrics_lock);
 
-	return oa_config->id;
+	return id;
 
 sysfs_err:
 	mutex_unlock(&oa->metrics_lock);
-- 
2.43.0

