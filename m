Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13592C531CB
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 08:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DB910E575;
	Thu, 23 Jul 2026 08:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dl8S9m5x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BAE10E575
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 08:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784795145; x=1816331145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OHwRt4KdoakSIT3gqEDuCbtIEG5GTEquw9+LKaDM0hw=;
 b=dl8S9m5x2wCQIskBAr1yzbrfSpvtHGuhNSIqqZorleE4q4m82gTB7sH4
 cxd8Nm0GFlBQAmoafqGggEYkcBzWn8WQ82tUNb7lUGJqumlFYQudx145w
 88gb9gRnY/K3DKuvK6igCa9rvSmQ12U2fIt1AKLrgGnpWnaABQrEcsirj
 g+5GatrGssjL7weD+pglPEyyJP1v1yd3a/4zackjJsMtacqd5XH31jgSA
 A/7jsCkRwfThw/bolKfNXVOxUN/uVEUz9nfM1WGuxjJHja6VcDXwf4+NE
 rMAFXAmKEpf5JmkhLsBBkSV1qmTe9J8ECkeYVWRWI9MtRCc26COUhz809 Q==;
X-CSE-ConnectionGUID: nWWCKXd8ThO+qYFCBhPpQQ==
X-CSE-MsgGUID: fkdZAgO5QJC5tCb5Ll92ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85389092"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85389092"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 01:25:45 -0700
X-CSE-ConnectionGUID: HkG8tZ8QShexQ4rLhMvtHQ==
X-CSE-MsgGUID: XQBT+sv+QbeLBS3YH1evYA==
X-ExtLoop1: 1
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 01:25:42 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, michael.j.ruhl@intel.com,
 daniele.ceraolospurio@intel.com, anoop.c.vijay@intel.com,
 shamim.begum@intel.com, anthony.giardina@intel.com
Subject: [PATCH v4 4/5] drm/xe/xe_late_bind_fw: Enable late binding support
 for CRI
Date: Thu, 23 Jul 2026 14:07:04 +0530
Message-ID: <20260723083659.716683-11-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260723083659.716683-7-badal.nilawar@intel.com>
References: <20260723083659.716683-7-badal.nilawar@intel.com>
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

Enable late binding support for CRI

Assisted-by: GitHub-Copilot:GPT-5.3
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v2: Moved %s/has_late_bind/late_bind_mask to saperate patch
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 283919fbbc04..2bb547c22309 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -482,6 +482,8 @@ static const struct xe_device_desc cri_desc = {
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
 	.has_sysctrl = true,
+	.late_bind_mask = BIT(XE_LB_FW_FAN_CONTROL) |
+			  BIT(XE_LB_FW_OCODE),
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
 	.require_force_probe = true,
-- 
2.54.0

