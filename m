Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ACCC001DE
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 16:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389A710E3AE;
	Wed,  5 Jul 2023 16:08:29 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EA210E3AE
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 16:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688573303; x=1720109303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xJeWlwYtf7NgqLLEqWd2/VlWYk69+Hjse7jMUVmL/XU=;
 b=KpcJCej+uoebVpdx9pRC81iaNv7+rqRFPzgh8GFpy+mxH+lG19QDHHeX
 J94BWMoFnoYPA3XKSP9w/e27SSIKxbLL69v4eoPfNM1+qPVbwCiW1RwU/
 i4fXlYt+wOglRWqmJhKVNn5uKyJ/FFjvq6ugH71WYCzcOWu57kmULQkU3
 04tFPZOlT3DmKuL8cQekcXQ0acNeREU/WcCj29h4CIwvZyTTRNK40MSO+
 R6zdEl1fCvU0f2bvR1FYE/0J+A73wiO2DCpqn7Mcm5cAYRaIozO2rHvRh
 wo0KOT1xUQteW4yq6JTFj8WLlF+PfssVf/nUfEV1X2hB7OCRg0TMQnZjL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="362248957"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="362248957"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 09:06:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="965879894"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="965879894"
Received: from peterhox-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.10.156])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 09:06:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Jul 2023 17:06:08 +0100
Message-ID: <20230705160602.237213-14-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705160602.237213-9-matthew.auld@intel.com>
References: <20230705160602.237213-9-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 5/7] drm/xe/gt: tweak placement for signalling
 TLB fences after GT reset
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

Assumption here is that submission is disabled along with CT, and full
GT reset will also nuke TLBs, so should be safe to signal all in-flight
TLB fences, but only after the actual reset so move the placement
slightly.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index bc76678a8276..a21d44bfe9e8 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -519,7 +519,6 @@ static int gt_reset(struct xe_gt *gt)
 
 	xe_uc_stop_prepare(&gt->uc);
 	xe_gt_pagefault_reset(gt);
-	xe_gt_tlb_invalidation_reset(gt);
 
 	err = xe_uc_stop(&gt->uc);
 	if (err)
@@ -529,6 +528,8 @@ static int gt_reset(struct xe_gt *gt)
 	if (err)
 		goto err_out;
 
+	xe_gt_tlb_invalidation_reset(gt);
+
 	err = do_gt_restart(gt);
 	if (err)
 		goto err_out;
-- 
2.41.0

