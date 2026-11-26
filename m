Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DEE606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 12:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DsxqvxIC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB2610E3A2;
	Thu, 26 Nov 2026 12:43:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB9710E3A2
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 12:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795697004; x=1827233004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aHB4/hHwWxtL7jlzA/vKXHoXyco2oE5TkPg3Bgu5sgo=;
 b=DsxqvxICCfxfSe94k9Te9EmZ1qpWPyzLGbnQ1xWyz7IrOuDEgxAOuUmg
 0/4B3e4irLmnouOhj8r1XIZd8QbghxFiRol64So3thnWN1OmsGXE7E8mN
 QjUwsRt5BW+z4tgDH0rwBu8KCE+jPolpnmXpUf9D63ePi8suyE7AlA5hk
 HEDQyq/wz6REH9CLUIwUlgrpHo5oAFvczVIp5+UYsdfaHL3JmPM+MIOf2
 /THDYMEL7tmrYqgLv8DCBYjLNG8tjIqRNDOaDInNWyowJTmyCw0M+5DKd
 tvAD8Q2af/CPazUD5jGg/k2vU4ue4aF/+Px7RABYC6oihRqrQXb+a9ug+ Q==;
X-CSE-ConnectionGUID: BB/5ReAaRqKggy15EAOBCg==
X-CSE-MsgGUID: uQZJewZkRDikofGmW46xUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4559387"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4559387"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 04:43:23 -0800
X-CSE-ConnectionGUID: JWy0RwRVTt+HorFAokI3XQ==
X-CSE-MsgGUID: 3/NcYJdQSoO8SZdoF61c9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12055540"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 04:43:21 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com
Subject: [PATCH v2 1/2] drm/xe/ras: Wedge device if page offline list is full
 during offlining
Date: Thu, 26 Nov 2026 18:13:12 +0530
Message-ID: <20261126124310.2187015-5-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126124310.2187015-4-soham.purkait@intel.com>
References: <20261126124310.2187015-4-soham.purkait@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When a page offline request is sent to the firmware, it response with
OUT_OF_RESOURCES if its offline list in flash is full and cannot hold
any more pages.

Wedge the device with an unknown recovery method in this case, as
manual intervention is required.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
v1:
 - Add consistent dmesg. (Riana)
---
 drivers/gpu/drm/xe/xe_ras.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 0fb891d00b36..754514412694 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -80,6 +80,7 @@ enum xe_ras_response_status {
 	XE_RAS_STATUS_TIMEOUT,
 	XE_RAS_STATUS_HARDWARE_FAILURE,
 	XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
+	XE_RAS_STATUS_OUT_OF_RESOURCES = 0x9,
 	XE_RAS_STATUS_MAX
 };
 
@@ -226,6 +227,7 @@ static int ras_status_to_errno(u32 status)
 	case XE_RAS_STATUS_HARDWARE_FAILURE:
 		return -EIO;
 	case XE_RAS_STATUS_INSUFFICIENT_RESOURCES:
+	case XE_RAS_STATUS_OUT_OF_RESOURCES:
 		return -ENOSPC;
 	default:
 		return -EPROTO;
@@ -299,6 +301,10 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
 	if (ret) {
 		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
 			   response.status);
+		if (response.status == XE_RAS_STATUS_OUT_OF_RESOURCES) {
+			xe_err(xe, "[RAS]: page offline list is full\n");
+			xe_wedge_declare(xe, 0);
+		}
 		return ret;
 	}
 
-- 
2.43.0

