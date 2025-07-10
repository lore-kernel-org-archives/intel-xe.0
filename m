Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CADAC83F1D
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 10:41:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5514E10E37F;
	Thu, 10 Jul 2025 10:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GzgEqAfN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8E210E37F
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 10:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752144083; x=1783680083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D3Xyvb9l8xtiyC4NnqkYK2QpfTnVZZct8rJQrmhI8N8=;
 b=GzgEqAfNZKGA22zy9XBpc5FA0ktQHvsAm4EJSs7+kG8h1b5V3/iXK14Y
 sqAe01ks52mP7QeHRHMalprGAMQA9gntbVbJ+gEfg1XWAMT5jk6McdMp4
 dhQexpvELyvyzMKhFIvfng1cmS5UOUKhhDsMVNbezEShaA1ziLOkviyAh
 fUAPjvC/6N2nHV8nFTiE4HQr91AIyR9Ly3q9VBIu/VztyLj4MaGdxTgPp
 GpwXoSBFtkDH0/58Lvahif5BIQOyE+1s/bl/7oS4MX6wfiTE2gTz/ibrX
 nUPqjvK/et0SvufaGWvhKLVGt2Q8kq5ldfdMUq9gauveGo47w9Pmqv7IR Q==;
X-CSE-ConnectionGUID: oDqIynSNQ5KRUMr0d+TXtA==
X-CSE-MsgGUID: FgL+sMx4SoKKc3J3RoihLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54351985"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54351985"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 03:41:23 -0700
X-CSE-ConnectionGUID: IL9d0zk8SAKYXaso+uei7g==
X-CSE-MsgGUID: VmFwW91FSaOBbqLxshf79A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160055163"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 03:41:22 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 2/2] drm/xe/sriov: Mark BMG as SR-IOV capable
Date: Thu, 10 Jul 2025 10:30:40 +0000
Message-Id: <20250710103040.375610-3-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710103040.375610-1-jakub1.kolakowski@intel.com>
References: <20250710103040.375610-1-jakub1.kolakowski@intel.com>
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

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

Enable SRIOV support for BMG platforms.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Tested-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
V1 -> V2:
- updated commit message (Satyanarayana K V P)
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e9c5d3150efc..0f5147e26ee4 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -331,6 +331,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_mbx_power_limits = true,
 	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
+	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 };
-- 
2.34.1

