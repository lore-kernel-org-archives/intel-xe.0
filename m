Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DC5C5B549
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 14:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C958E10E143;
	Wed,  4 Jun 2025 14:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YT5G4GN4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D9810E143
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749048764; x=1780584764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Cin8Ws7tDpKX+E14q0TLIjqjPTtguSp0NlG01Ou8+Y=;
 b=YT5G4GN4mAYhMFVlIlbctLd9f98wzext5N5IuSOEKonERG/HL5OrToCr
 U6U9UpSGA9AaC8Z/x6qvcNxXhxS/kAI3sBjN3WKjSOFUpfSOnqiLph1TW
 8yKmeC1c/koiLO8fP2VKGboUQG5d/NDaCRlCfatwGsOoZrmX0VFHl/dty
 UZ5Holfna9Hz96iI+ekt1AbFxbbqWoLVcXwJy+rzbFQv3mhySIqlZLVJB
 f7rja+eM4s2SKhNvNQrWQV5TcNZ0Wy9CP+MNHaHhF6mLnxOpidbEV00SJ
 UPpC4JfyIJHwlWUNEujXnZ/drJdTFC6GDtFVrwlWvgr6cLwNNL9kemMZu w==;
X-CSE-ConnectionGUID: QQPpYAMpS2uvUgAG3CUi8Q==
X-CSE-MsgGUID: 9lEjG79qSI6Xy0C7sOWrog==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51228684"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="51228684"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 07:52:44 -0700
X-CSE-ConnectionGUID: nyqHcw9yQauYJtgQ1ucVzw==
X-CSE-MsgGUID: DoBwuPyoScqr6XzHB4fuWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150004770"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa003.jf.intel.com with ESMTP; 04 Jun 2025 07:52:43 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 James Ausmus <james.ausmus@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 3/3] drm/xe/xe2_hpg: Define additional Xe2_HPG GMD_ID
Date: Wed,  4 Jun 2025 20:22:36 +0530
Message-Id: <20250604145236.1143122-4-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604145236.1143122-1-dnyaneshwar.bhadane@intel.com>
References: <20250604145236.1143122-1-dnyaneshwar.bhadane@intel.com>
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

From: Shekhar Chauhan <shekhar.chauhan@intel.com>

Add another GMD_ID for Xe2_HPG

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: James Ausmus <james.ausmus@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b68c90910d82..83f0a76a81a5 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -179,6 +179,7 @@ static const struct xe_ip graphics_ips[] = {
 	{ 1271, "Xe_LPG", &graphics_xelpg },
 	{ 1274, "Xe_LPG+", &graphics_xelpg },
 	{ 2001, "Xe2_HPG", &graphics_xe2 },
+	{ 2002, "Xe2_HPG", &graphics_xe2 },
 	{ 2004, "Xe2_LPG", &graphics_xe2 },
 	{ 3000, "Xe3_LPG", &graphics_xe2 },
 	{ 3001, "Xe3_LPG", &graphics_xe2 },
-- 
2.34.1

