Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FB6E7545A
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 12:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2297410E2AB;
	Tue,  3 Oct 2023 12:52:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E16310E05D
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 12:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696337523; x=1727873523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zI+8rDWMLVdOrrvUxJ2OfVnjFt1i+8XrpKRP+0VoG8I=;
 b=mPzZ5uzIN0wBpKIyKHMRVbo1NZLIzbdOHKeZ57r3cwgoEZfElrwuxyN2
 /CxAWUKCK0IourcWqlDPfHbMVhiqAnJzJHabN9MVTTShIdWCWM9+GtkAp
 Aru7XnKm8cg4lOdghBVev2QzYdBpPKW5M/8ipaaprNQy45KYMiFztYV3z
 bHllak7ofjlssBn6IfJzNdK0hF8JLr1I5CotsKhEPYhdbxMVSu0XAu4Zd
 eksYfR+obO3vkLyzRACpd+G0Fih+ywyvuPUqpmUxJQofx+7kxqbppqop9
 ZUyJcOpKZuFkNmidUcB5FXtJxSrOAzW44fhfePqty35/3EtLAqd+tb1xn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="447022075"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="447022075"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 05:52:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="998005515"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="998005515"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 05:51:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 05:52:17 -0700
Message-Id: <20231003125217.3350838-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003125217.3350838-1-lucas.demarchi@intel.com>
References: <20231003125217.3350838-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 7/7] drm/xe/gt: Dump PAT table when failing to
 initialize
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When failing on early initialization, one cause may be that the PAT
configuration is not correct. Dump it for ease of debugging.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 68cd9a7ee087..c63e2e4750b1 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -307,6 +307,17 @@ int xe_gt_init_early(struct xe_gt *gt)
 	return 0;
 }
 
+static void dump_pat_on_error(struct xe_gt *gt)
+{
+	struct drm_printer p;
+	char prefix[32];
+
+	snprintf(prefix, sizeof(prefix), "[GT%u Error]", gt->info.id);
+	p = drm_debug_printer(prefix);
+
+	xe_pat_dump(gt, &p);
+}
+
 static int gt_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
@@ -360,6 +371,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	return 0;
 
 err_force_wake:
+	dump_pat_on_error(gt);
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
-- 
2.40.1

