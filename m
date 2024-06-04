Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550A9C27C53
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 21:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21FD10E19A;
	Tue,  4 Jun 2024 21:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RbEzEe97";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A2010E19A
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 21:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717536162; x=1749072162;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lEKX3IiIJuhyx+nmkDRKj/ENqLUdiXYdIrLoK8tBu4M=;
 b=RbEzEe97MZHnQexZt1WfvCEhpo7IL4Kjgvb0VAVkwQi5ty4nFRVuPK1M
 iYGRjR9hunbx3mfWt1YE0bDIraQ1cEiBGezIR4BO0ywM9qSgCbprPqhUI
 vQWnDweNDx6RGfGaIm9g1gyz2YBAX9i9DMLWJJFrPJXSNjwCTN2Mgc1Rn
 fdGWoE+63FUdxXvAQ9dWJWdKwVizXPcIxJbN+Tgmet7kUsObDqV38wvdn
 AdO2RjYPokxsmYI4SGGrI89CVv/2FDrPKwi4Nlwzoudl8xZc49R/JncLF
 RKBNH6KYNaEFcIdHVTvmpiDd/tk2/z8cXBi5nxMH0ibzWbOwrtF9AGxmG A==;
X-CSE-ConnectionGUID: IZUlhORET7GdJm/v+m0wkw==
X-CSE-MsgGUID: sKzHZZmhSOSLZGatUj5HuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="13996092"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="13996092"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 14:22:42 -0700
X-CSE-ConnectionGUID: YCzxJdZgRVCvgo5zmjp14g==
X-CSE-MsgGUID: UbT+o+1/S9eWqwbYQBNwlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="41799402"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 14:22:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/4] drm/xe/vf: Support only GuC/HuC firmwares
Date: Tue,  4 Jun 2024 23:22:28 +0200
Message-Id: <20240604212231.1416-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240604212231.1416-1-michal.wajdeczko@intel.com>
References: <20240604212231.1416-1-michal.wajdeczko@intel.com>
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

Only GuC/HuC firmwares can be used by the VFs, don't claim support
for any other firmware (like GSC) even if the driver can support it.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 12346645a8e5..a69c61f6b064 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -657,6 +657,10 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 	uc_fw_auto_select(xe, uc_fw);
 
 	if (IS_SRIOV_VF(xe)) {
+		/* Only GuC/HuC are supported */
+		if (uc_fw->type != XE_UC_FW_TYPE_GUC &&
+		    uc_fw->type != XE_UC_FW_TYPE_HUC)
+			uc_fw->path = NULL;
 		/* VF will support only firmwares that driver can autoselect */
 		xe_uc_fw_change_status(uc_fw, uc_fw->path ?
 				       XE_UC_FIRMWARE_PRELOADED :
-- 
2.43.0

