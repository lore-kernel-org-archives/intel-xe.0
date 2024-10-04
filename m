Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76144CF8862
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 22:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322AE10E125;
	Fri,  4 Oct 2024 22:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eaq/e5Kg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1163010E0CB
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 22:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728079563; x=1759615563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wxjrI/fxNpE87xBESZE7rtq36hu3UztIm6VD4oqXezw=;
 b=eaq/e5KgCs+aQsx3irtcy1LNdH785XO4VWrsvGLq/JtbmEtXwyQ9fxUF
 B+sDIozzXl9sPYW7l3icV0wiaDsNidzuyF8tbdFOITX11rAqw7JWSX7AZ
 vZaCha8UQaRDywsVsBY0KSqDK7WxV2IFQTthzIBJ5EWY9depRdsKe72uA
 W6MR6NnkdU308wj54WzWIRMMWOcffcpKOnPrzpQgqRppUwHVCALn2y8py
 9dVZQartlPTvj1sJZJdpILLiC7FvmYaXb+l6vW/kmVX9/2k8a2QKHNbWC
 Q9if8urid8pdnlND6F9gRQ4Rf2GNJk1XmdjWcCUNf5FInLM4sP1zvujmm w==;
X-CSE-ConnectionGUID: NxsqWDj2TCK+Le/m4uGERA==
X-CSE-MsgGUID: JmL2wROLStW7/9jfaNf2vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="30199419"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="30199419"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 15:06:03 -0700
X-CSE-ConnectionGUID: Eh5SebI9T2qPVrFGE/jv6g==
X-CSE-MsgGUID: j1BiLDaoSpCCS3IU9kEVOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="74836986"
Received: from msatwood-mobl.jf.intel.com ([10.24.12.132])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 15:06:02 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 4/6] drm/xe/ptl: PTL re-uses Xe2 MOCS table
Date: Fri,  4 Oct 2024 15:05:48 -0700
Message-ID: <20241004220550.94308-5-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241004220550.94308-1-matthew.s.atwood@intel.com>
References: <20241004220550.94308-1-matthew.s.atwood@intel.com>
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

From: Haridhar Kalvala <haridhar.kalvala@intel.com>

PTL is Xe3 architecture but there is no difference between LNL and PTL
in MOCS table.  So, PTL uses the same MOCS table as LNL.

Bpsec: 71582

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 8df41cd12d51..231d0e86ed83 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -576,6 +576,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 	memset(info, 0, sizeof(struct xe_mocs_info));
 
 	switch (xe->info.platform) {
+	case XE_PANTHERLAKE:
 	case XE_LUNARLAKE:
 	case XE_BATTLEMAGE:
 		info->ops = &xe2_mocs_ops;
-- 
2.45.0

