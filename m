Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EE5CCD1BC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 18:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E70A10E940;
	Thu, 23 Oct 2025 18:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5DeAz2j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9404310E940
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 18:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761243215; x=1792779215;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=34F2bMODwA/QWNvJ48nKe8KeyAj2ElKoX4L9PGc+epc=;
 b=I5DeAz2jHJZrvc+C1DiY5/jt9lIi4nB7aOKkmLTjcIXO1qZ76IllTYDi
 UDMF1tzixSn2byZ0dir1Hri/KKk7c1DwgPpKgbAexh5/cqWFoE6XxJq4g
 J/iMTkIu/MsfbAbljRZe1HowZu3H45SAnRmvzU46dbjldRp361k3ijP3g
 ++GIzuOIRr8laQ9QbMHGzQAj3FSUNs0EONcvRs4RiYC3HJ0KXaqbVUb8X
 OLnVcLkb8y4PonTQUW84K/+wxLQR3i8Wf6YNDLuNrqh4mjvkS+aYyV6C/
 JfV91a5OSRqwHAO0Ont6y8dzeNV7l6Fd8JAAcAyot00R92ZDNGJdruoeh g==;
X-CSE-ConnectionGUID: REpsUWS3ROmk6uBK1sdFYQ==
X-CSE-MsgGUID: 2TS3esZpSAefTuy6391X4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74026695"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="74026695"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 11:13:34 -0700
X-CSE-ConnectionGUID: yu1GdgtnSqm/AXDNprql6Q==
X-CSE-MsgGUID: 4QfSpcqBQl63TQoxO3Momw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184703540"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa009.fm.intel.com with ESMTP; 23 Oct 2025 11:13:34 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v1] drm/xe/uc: Change assertion to error on huc authentication
 failure
Date: Thu, 23 Oct 2025 14:13:32 -0400
Message-Id: <20251023181332.2490921-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

There is only 1 place that HuC authentication is critical, changed it to
error to avoid tanited kernel on assertion failed.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_uc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 465bda355443..2ae48dd234ee 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -220,7 +220,7 @@ int xe_uc_load_hw(struct xe_uc *uc)
 
 	/* We don't fail the driver load if HuC fails to auth, but let's warn */
 	ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);
-	xe_gt_assert(uc_to_gt(uc), !ret);
+	xe_gt_err(uc_to_gt(uc), "Huc authentication failed:%d\n", ret);
 
 	/* GSC load is async */
 	xe_gsc_load_start(&uc->gsc);
-- 
2.34.1

