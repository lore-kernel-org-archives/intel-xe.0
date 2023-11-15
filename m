Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864B2C47074
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 11:38:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5341B10E543;
	Wed, 15 Nov 2023 11:38:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9158E10E543
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 11:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700048284; x=1731584284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bH0EaCBuswinExgvWqPpOZtc/j9jgVzj0tWk1PX3rQc=;
 b=VAcWJ0XO4mhSRYzUKCABm0f1+4jOUEVhm3nzUuxWF1To20PNCvBdJdFj
 oksRl2yKLb4h0uHmK/L8xP9C+pp2iz9Q379yeAF06ODxnkUzpbs0EYYWm
 Vl7alC2hLe1KyjkyOV191QUiQPy2AudGUvJFfxILdWVLue2Uw49Y6izlq
 ncJYX8NDIDj2uDBnuGj4HxuuobWb/AbVvup9vB2IrghMChcGnWlY+TRH3
 OcgHNbNr4qzr7JR8WgXCnOKXzUTUC/UNjnCDBmU9tjJQUkTebe8qQG8oJ
 0dMBfPU6jI8tX/LrSagldTJD+pQImu1i2lWqM2WYsYvXNxdiwDxLMenOI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381255315"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="381255315"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 03:38:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="714863112"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="714863112"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.24])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 03:38:02 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 12:37:48 +0100
Message-Id: <20231115113748.1949-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231115113748.1949-1-michal.wajdeczko@intel.com>
References: <20231115113748.1949-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/xe/guc: Use valid scratch register for
 posting read
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

There are only 4 scratch registers VF_SW_FLAG(0..3) on each GuC.
We shouldn't use non-existing register VF_SW_FLAG(4) for posting
read.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 16c233f120c6..c05858847919 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -627,7 +627,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	u32 header, reply;
 	struct xe_reg reply_reg = xe_gt_is_media_type(gt) ?
 		MED_VF_SW_FLAG(0) : VF_SW_FLAG(0);
-	const u32 LAST_INDEX = VF_SW_FLAG_COUNT;
+	const u32 LAST_INDEX = VF_SW_FLAG_COUNT - 1;
 	int ret;
 	int i;
 
-- 
2.25.1

