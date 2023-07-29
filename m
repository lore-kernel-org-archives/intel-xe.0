Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84C8C04E69
	for <intel-xe@archiver.kernel.org>; Sat, 29 Jul 2023 04:02:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5096510E0AD;
	Sat, 29 Jul 2023 04:02:21 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9E110E0AD
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Jul 2023 04:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690603338; x=1722139338;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R/c+008isEPER8ua5igPWQUYPpY2ImWgqEHmcHV+DVk=;
 b=KzIlw4db6lXVjNHM9GPyKIHA87q6TWQduziVKaBxxE65UhYOlAbZg8Gu
 B9x5C65zAV4N2fXcWYSiHYyksbinQf7D36XZCx4a7y434z1A6up3xFIa5
 RQUyd77d96FFcUFhIE1glOu/JU+cdLUOwqWPvdUJVtmIVowEfw1X+wYHJ
 c1wt6bhX31wFiAnhnM0nnmZ3N8yT0c2NlvJjEdD2zCOSYVMm5BEikPjWq
 Hy8Gt7dth5YhljAiDFOg9/xop2wxfraLm0DmBJ592Z/jUif+pALAkXvsi
 1lQYlzlhHy1kMoUuzJkzS1z8/nEBq27V9k0CuWrd7xXCIMib0bgYck6ak w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="353633063"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; d="scan'208";a="353633063"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 21:02:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="793122562"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; d="scan'208";a="793122562"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 21:02:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 28 Jul 2023 21:02:11 -0700
Message-Id: <20230729040211.36143-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: remove header variable from parse_g2h_msg
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

The header variable is unused, remove it.

Suggested-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index d322eadbe75a..6c757efa88b8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -829,12 +829,11 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
 	struct xe_device *xe = ct_to_xe(ct);
-	u32 header, hxg, origin, type;
+	u32 hxg, origin, type;
 	int ret;
 
 	lockdep_assert_held(&ct->lock);
 
-	header = msg[0];
 	hxg = msg[1];
 
 	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg);
-- 
2.34.1

