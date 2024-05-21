Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B18C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 14:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E4310EB36;
	Tue, 21 May 2024 14:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jr/iEZcE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0693110E876
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 14:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716301392; x=1747837392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LXKhFN08/b6GvMfW/xGxcYudkWiyShhBZo6K48w7zhA=;
 b=Jr/iEZcEAX8BjtK0Peme3VCGOmKqxr+94322pY9r/sKEMVIY2PxQKzwK
 +8QZPQ23ZOpp8wm2buJVa3UC9r/BNUnr8I5YEm1N4BtEzY6Q5V2KylKwH
 jpsTj4pJCRDXyS67kwQ033Ll8YYzNK2XYnQDfIiXDH/Rq1YlzfnTJ5r2L
 Ph/7Oo8DCioJUdCTf/CQmLDpyt0uLMWp7JXIrM0X9g61RkH7TXeV+UDxT
 tGV2DHEKknthIrOj8AzdOmHrQroNK0HIx+isdOdzb2Vvk4umPONUrwpXs
 LNhr2o44Xo3C2vHvryV0r+7rSt0Lhg4Wk3itcfcG3HfrWVxeYrKcMr92+ Q==;
X-CSE-ConnectionGUID: 9J2rt4T1Qw+bGoqzS0Dv4A==
X-CSE-MsgGUID: nv2reQGyRJGxsx/4t9KsYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23075819"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="23075819"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 07:23:12 -0700
X-CSE-ConnectionGUID: JbhbE80PSLmBj4iQvWqRrg==
X-CSE-MsgGUID: ySbN72g1Tqa5CpWNntvyEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="37711474"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.128])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 07:23:11 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/3] drm/xe: Store platform name in xe_device.info
Date: Tue, 21 May 2024 16:22:55 +0200
Message-Id: <20240521142257.756-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240521142257.756-1-michal.wajdeczko@intel.com>
References: <20240521142257.756-1-michal.wajdeczko@intel.com>
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

We already maintain the platform name as part of the device
descriptor, but in xe_device.info we only store platform enum,
which is not the best for use in any user-facing messages.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5c5e36de452a..99edaebfcbfd 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -218,6 +218,8 @@ struct xe_device {
 
 	/** @info: device info */
 	struct intel_device_info {
+		/** @info.platform_name: platform name */
+		const char *platform_name;
 		/** @info.graphics_name: graphics IP name */
 		const char *graphics_name;
 		/** @info.media_name: media IP name */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 682eafd84901..b30fe4849038 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -561,6 +561,7 @@ static int xe_info_init_early(struct xe_device *xe,
 {
 	int err;
 
+	xe->info.platform_name = desc->platform_name;
 	xe->info.platform = desc->platform;
 	xe->info.subplatform = subplatform_desc ?
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
-- 
2.43.0

