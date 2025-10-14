Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733B3CCD192
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30A410E526;
	Tue, 14 Oct 2025 03:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WcKpJbP9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F2F10E129
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412329; x=1791948329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TMj6lq5EaC9deKivZa1TSWUvMYDJbrJOdJ9EFhHbp2s=;
 b=WcKpJbP94e6djVZ2plPB7Ri1sEHdcF6aVptlNguqT9CkigTtIjzQS5lc
 N75b//PxdYGltBkCfaYjP7E5N0B+kh7XAny6Jl9DWpFlWTjnujI9DwfYe
 tDZo/gnxqoK0E4Itk3jyXx9/2zua+KryfpxXkWm2i+fZWtpm5iU1bbbNa
 DTBheg4zwAOHnselsk5jjRqevh7RUrx56uZHcUMbFo2KvdlizxyjSwzvQ
 Awd/YBCthmezQyrjOVUbT/dFKd0fCohYQBuVHJPHueEjh/Lzcn1KQ3Ec5
 8Vx8a8cUsf0lhOoJUOyE9IiMubewqPpCLAqxOykNh8qqupB2DmiJo5Zbr g==;
X-CSE-ConnectionGUID: H0ihE8MUQCWdgqg39s4INA==
X-CSE-MsgGUID: uB+h5uGCSEKOGP4JFJH5bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414866"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414866"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:28 -0700
X-CSE-ConnectionGUID: aDNr+k4BR6aN5jiO4s2/Sg==
X-CSE-MsgGUID: hNnWIe5YTdGHED7OOhIoCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567268"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 02/23] drm/xe/xe3p_lpm: Add support for media IP versions
 35.00 & 35.03
Date: Mon, 13 Oct 2025 20:24:34 -0700
Message-ID: <20251013-xe3p-v1-2-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
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

BSpec: 74201, 74202, 77977
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c1e89689953b7..8480e53990031 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -164,6 +164,8 @@ static const struct xe_ip media_ips[] = {
 	{ 2000, "Xe2_LPM", &media_xelpmp },
 	{ 3000, "Xe3_LPM", &media_xelpmp },
 	{ 3002, "Xe3_LPM", &media_xelpmp },
+	{ 3500, "Xe3p_LPM", &media_xelpmp },
+	{ 3503, "Xe3p_LPM", &media_xelpmp },
 };
 
 static const struct xe_device_desc tgl_desc = {

-- 
2.51.0

