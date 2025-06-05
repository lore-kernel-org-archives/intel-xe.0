Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC84C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 19:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD3F10E32D;
	Thu,  5 Jun 2025 19:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AkrSq+ep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D3E10E32D
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 19:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749150493; x=1780686493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lPSJzKkeSYbCTwj2Ah3HEhLLLRBJDNgi+P6YF7Cqk4w=;
 b=AkrSq+epMvByLfxPGIjSF72ItiUv6vs8KUmUKmu0DAlHXGqgggt4IqxU
 vj7nd5WArbSnO0Ylbt8Em+baE8aSV2YozCg2wMK/vingcGsZy/Roz6bk+
 OJzV1kBcQ+KHEQIM4lgOf8yqEubbKP2Wwpd+aQ20dOZ1le841yz8SzgA+
 sqX3TOxQaFvdUQpyxroXiq2EUI88YihpKU+jgZlPrg7gTfdgrzgE5hpmp
 LKt7XFcGPfZB7bqbyvcwwBUKw2dQk9laOkzPoCnHr1/+4TUnb9j6TF5b2
 t757vfUOkmfYljLHz+W9ze+TAEoX4hXUoYlS+9nXMOdcmHcaTBlS/JWK3 w==;
X-CSE-ConnectionGUID: 8Wlh/VYHSFuLXADKeKjStQ==
X-CSE-MsgGUID: 1ifP7mBGSwC5s7Zytndkrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51432760"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51432760"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 12:08:13 -0700
X-CSE-ConnectionGUID: OS4Ru16YTCmF26ocNbcAeA==
X-CSE-MsgGUID: Gewk7WnXTdSVmlAv+0XBZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="168761555"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa002.fm.intel.com with ESMTP; 05 Jun 2025 12:08:11 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 James Ausmus <james.ausmus@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 3/3] drm/xe/xe2_hpg: Define additional Xe2_HPG GMD_ID
Date: Fri,  6 Jun 2025 00:38:04 +0530
Message-Id: <20250605190804.1287289-4-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605190804.1287289-1-dnyaneshwar.bhadane@intel.com>
References: <20250605190804.1287289-1-dnyaneshwar.bhadane@intel.com>
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
index b5559800db7a..5d24cc320d72 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -180,6 +180,7 @@ static const struct xe_ip graphics_ips[] = {
 	{ 1271, "Xe_LPG", &graphics_xelpg },
 	{ 1274, "Xe_LPG+", &graphics_xelpg },
 	{ 2001, "Xe2_HPG", &graphics_xe2 },
+	{ 2002, "Xe2_HPG", &graphics_xe2 },
 	{ 2004, "Xe2_LPG", &graphics_xe2 },
 	{ 3000, "Xe3_LPG", &graphics_xe2 },
 	{ 3001, "Xe3_LPG", &graphics_xe2 },
-- 
2.34.1

