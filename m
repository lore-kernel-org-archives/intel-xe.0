Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC987C982D0
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 22:30:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6800A10E779;
	Thu, 17 Sep 2026 22:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LA4/LLYQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7525710E4D8
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 22:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789684246; x=1821220246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Bzf1y3/c/PDLznW8F75YwQVs9vVjSEvks0Rzof9TpY=;
 b=LA4/LLYQ2t0jjs73BzFvOZTBYrgOY9fFNYtMQKBWmojgFeRl91l2gKM2
 bE7zT3yr7vc/4e+3pj4ZDsKOwSC7uS+p93mXkh8yom05BYAFNBvwcoheF
 ebuK78b5/pnuqGTyquvipnjfO3CLKDs3sE8qfWRoWM2k51IkllxhrM2It
 RazzRSCsyLPl8eztWkF3iP4DQznKPpRpZpZT9MnDu0Xf+zHR/MC6aMnfF
 W5x2Pq5XlpDfOScRqPkbwYFM7BBLh+AR8Krm5xDUtMxRsyuPT1DsMzVjc
 qybw6vVjBU9isoKjvEbSBnjEGzMOhrHS7evUswkp33gOxBE+kaNvNAm0I w==;
X-CSE-ConnectionGUID: tfErZDkvQQmCeNLxWtiOEQ==
X-CSE-MsgGUID: /bcCdE9OTsS6tUdXVDTPwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92665118"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="92665118"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 15:30:46 -0700
X-CSE-ConnectionGUID: cM1Tia3+QGelP5sDiiU3yw==
X-CSE-MsgGUID: 5lmlkLPESI+549GvaMmQqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="279297692"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by fmviesa005.fm.intel.com with ESMTP; 17 Sep 2026 15:30:46 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/2] drm/xe/nvl-p: Enable PXP for NVL-P
Date: Thu, 17 Sep 2026 15:30:43 -0700
Message-ID: <20260917223042.715286-6-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917223042.715286-4-alan.previn.teres.alexis@intel.com>
References: <20260917223042.715286-4-alan.previn.teres.alexis@intel.com>
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

Now that the GSC FW is defined, we can enable PXP for NVL-P. The feature
will only be turned on if the binary is found on disk.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d10633f74aa4..f155ec7028cb 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -499,6 +499,7 @@ static const struct xe_device_desc nvlp_desc = {
 	.has_page_reclaim_hw_assist = true,
 	.has_pre_prod_wa = true,
 	.has_sriov = true,
+	.has_pxp = true,
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
 	.require_force_probe = true,
-- 
2.43.0

