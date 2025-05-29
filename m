Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB66C5B543
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 12:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999DA10E1B2;
	Thu, 29 May 2025 12:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QT6JS7bY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0E910E12B
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 12:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748520342; x=1780056342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b4+OJ4p0xm/W5kQxVQIa312uSLdDTcfS/T5G26cwBQ8=;
 b=QT6JS7bYAjeBk85UqbpVUMcZGc9VO+mJuyL5cKSzjAfVypSnwHtiLH7W
 mhDmcW5kkqCZfr1UAwz50Lg5iP8RQJ6DzIP3Lx3HWb5+sYpH+lLm4OQEQ
 PkNFuNOptFOguniA15E7YFwTdGuhQzz8B/3YFC6Qb61U8lJlkVrvBWHSX
 09zp20jz+mJF3A5k7dB0p4+yPsRXom/Y8FXjfAJjTuyFkVnPdMeMiqdb4
 Pb1dIgdSHbAxN3KwlVofQ1O/MH/hLP7ET2AFLRp22wyGj1s8b5/Sx8+YR
 A54jhrNt2Q0nFQkh+um59ti3V2nrSSnxYSjZz71iPOaz/f1cn5kuCqPC1 g==;
X-CSE-ConnectionGUID: PlX4VlxnTR6xt4Sx3cc0WQ==
X-CSE-MsgGUID: W3rraioMT0OdujJvNEvCCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50461481"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="50461481"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 05:05:42 -0700
X-CSE-ConnectionGUID: HRwTZZm2Qsue3Yy3NwH6mw==
X-CSE-MsgGUID: Clg83NK4SAiOGwfggMy4lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="148585599"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa004.jf.intel.com with ESMTP; 29 May 2025 05:05:40 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 James Ausmus <james.ausmus@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 3/3] drm/xe/xe2_hpg: Define additional Xe2_HPG GMD_ID
Date: Thu, 29 May 2025 17:35:34 +0530
Message-Id: <20250529120534.531237-4-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529120534.531237-1-dnyaneshwar.bhadane@intel.com>
References: <20250529120534.531237-1-dnyaneshwar.bhadane@intel.com>
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

