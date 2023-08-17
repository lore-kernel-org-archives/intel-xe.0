Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9C1C5479A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 20:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3639710E094;
	Thu, 17 Aug 2023 20:19:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D7710E090
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 20:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692303566; x=1723839566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RLBPbRktDl/qNnDXqel2Uq5EAwnyTLHOzxb4AWqnrI4=;
 b=KyS08M/R3aXS6Iw58D+5bHJKaPjFkKtuWDZR1xG7g88e+dZeY+t2oKUZ
 i1Eis+VqPvaVN6C3yN8tfwxZYUSzPNpUlAtZPYf7Y8isoJxqKT1yCTqZf
 X4KaNKOi56Jpkl4L71CM7M4N2WsXsy0Zusw93NNhRw2sudmhMWorQfGZt
 0w0kAysqkpHouNxlsb3vblEo8HncjAy+qunkbg3mkI0Ms0pv0QmQSx3+Q
 tLE9kWlUcsTq7J9vRHAAm/olh3HImBnhB7oxnlsEyB/YB+CrS6BZLkgLa
 q4UHGFtT7Ubx6WFUD7vE2glvCabT9msBucRoGVSZRsJ4LzdxpIezlAlS9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363077726"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="363077726"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 13:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="878379338"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 13:18:54 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 13:18:30 -0700
Message-ID: <20230817201831.1583172-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817201831.1583172-1-daniele.ceraolospurio@intel.com>
References: <20230817201831.1583172-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 6/7] drm/xe: don't expose the GSCCS to users
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The kernel is the only expected user of the GSCCS, so we don't want to
expose it to userspace.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 32a5bd9d8e6b..81281e9c02eb 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -795,6 +795,9 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 	struct xe_gt *gt = hwe->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 
+	if (hwe->class == XE_ENGINE_CLASS_OTHER)
+		return true;
+
 	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
-- 
2.41.0

