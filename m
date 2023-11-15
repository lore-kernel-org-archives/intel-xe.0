Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B17C47074
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 11:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41F310E541;
	Wed, 15 Nov 2023 11:38:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7279C10E500
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 11:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700048280; x=1731584280;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e+IYruwkgsyJzWmXxrOxLX14Pwcs/vHYj4KvkVbdypw=;
 b=QGF9aOqDyPY4oiLZwXsYSAv0L5Ua7diuepK7rcCZoiC1MsZBI8fL6mii
 3NlT/DepznOXE0QUPo+ToslSpJ65Ejpk2+5Qb4gOJKAorYyNmJRRmjGjN
 SoLIkHmgpll7WxNn64iitMDxmW4sx9zMw2towOMbwyFeZkFM+QvNauad9
 UbTFRCmOt0W6ow9w6F/X336WdqNBOxK/0J8H4asnqUSt95Qhq/N4lSFSJ
 7F9xx8MO63IVkAF5+GNlaA2kriYqh0/5slov1Ibw5libWBUcK1kL2Fm0z
 99QmCm30PdAvDWEcB15Fd7arKZ69njFnEcKL1PAPOAG165b7Da9WXQRPD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381255310"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="381255310"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 03:37:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="714863071"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="714863071"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.24])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 03:37:58 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 12:37:45 +0100
Message-Id: <20231115113748.1949-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm/xe/guc: Fix wrong assert about full_len
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

This variable holds full length of the message, including header
length so it should be checked against GUC_CTB_MSG_MAX_LEN.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index a84e111bb36a..c44e75074695 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -419,7 +419,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	full_len = len + GUC_CTB_HDR_LEN;
 
 	lockdep_assert_held(&ct->lock);
-	xe_assert(xe, full_len <= (GUC_CTB_MSG_MAX_LEN - GUC_CTB_HDR_LEN));
+	xe_assert(xe, full_len <= GUC_CTB_MSG_MAX_LEN);
 	xe_assert(xe, tail <= h2g->info.size);
 
 	/* Command will wrap, zero fill (NOPs), return and check credits again */
-- 
2.25.1

