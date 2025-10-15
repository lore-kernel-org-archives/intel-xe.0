Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0A8CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAF610E16D;
	Wed, 15 Oct 2025 22:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hnzo6mYW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F2F10E0DA
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760566030; x=1792102030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TlvADS57r27sXPkVqLTh+VKbI+/0DTs/OLSzwJ7X3CA=;
 b=Hnzo6mYWLPW4tQuqGXXXRFwqzmHWXktaXA86gmaRmN2HSmXq6GSl8sC2
 4gjnNHU0tnsnFkAzFkMpushqC/yrFNkBjRQa2HsYn6+itUwyItmqY1MSX
 2DGP+Se+z5Uk0C2PO87ny1Ol9OYT0Wb5J/UwZeM9T+ZQ10xj1qRX7uwCc
 AosVCZ+eN7rxZ6Sx4dqf4KsJ0mTbH/TEJou/ddC/rilf1O+RhfWMf630g
 o+3VEZl042O3NnP0mvC8mRxhWMqPav8uR8OEd0NKyTk6OZlxg9VWonmQM
 ZEmmL5SOyG+xWgPkxEAVDiWuP6uDleM6RE1JEQeSXvW7p+DMPcSb1FgVV A==;
X-CSE-ConnectionGUID: 7KgKx29oQKemspdNxlYwag==
X-CSE-MsgGUID: Gi5nl5pxTiWkq6EsXkCScw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62794047"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62794047"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
X-CSE-ConnectionGUID: 636WdGPrS2aEbII1io2Wkw==
X-CSE-MsgGUID: 7lW1HQZyTNmB5JwmrvsQ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186298264"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2 02/22] drm/xe/xe3p_lpm: Add support for media IP versions
 35.00 & 35.03
Date: Wed, 15 Oct 2025 15:06:17 -0700
Message-ID: <20251015-xe3p-v2-2-b9189b3056a2@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

Xe3p_LPM is very similar to Xe3_LPM on the kmd interface, so it can use
the same descriptor structure. Add both 35.00 and 35.03 IP versions.

BSpec: 74201, 74202, 77977, 77979
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3ea8ccfcbca55..b72f71b0f52c9 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -151,6 +151,8 @@ static const struct xe_ip media_ips[] = {
 	{ 2000, "Xe2_LPM", &media_xelpmp },
 	{ 3000, "Xe3_LPM", &media_xelpmp },
 	{ 3002, "Xe3_LPM", &media_xelpmp },
+	{ 3500, "Xe3p_LPM", &media_xelpmp },
+	{ 3503, "Xe3p_LPM", &media_xelpmp },
 };
 
 static const struct xe_device_desc tgl_desc = {

-- 
2.51.0

