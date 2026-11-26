Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72365606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V3W+HKn6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F77211219D;
	Thu, 26 Nov 2026 09:43:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339B410E961
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 09:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795686214; x=1827222214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vhYsDp07mdYDQWAOlgW0JOtp9DgFb9q29WlGn22Zh7I=;
 b=V3W+HKn6NIklmW7j3MHSVE1t0TmZ3yCiH34kMpTKYLaDm3+5H2AQxY85
 Ot/AW1UpZcjZCcxw1ObDt3fSqaBvV22zlOlHNhbx74laYG82oxcwIh6tT
 H4XvHfSjCdZeAH/I620YQtLPDdxUcHMKQYnx1KSz8agr9n8T1RgSl2hy2
 4xyrx8x6GiJ3lK+5+ba/l/HJkq8E7SEwqh763JSWdGYoR46nc04/gRbB3
 39pejraP2xRONq+f5sZrE2lMSjFyX73476HDYw5OpcZtLvQZfPLF0oymq
 GiVvyPvVKAYKeuYZPugOj8vpPSqmtLGENqjEWz+LTTm4cNuRE3A1HW3ik g==;
X-CSE-ConnectionGUID: 3IFGa43/RpiE/8MaC8T4jw==
X-CSE-MsgGUID: hg+Vv0L3S+eDBVAemoo2Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4638566"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4638566"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:41:59 -0800
X-CSE-ConnectionGUID: h5OWSu9IS4CrE86E1EF5PA==
X-CSE-MsgGUID: I3vFKaPZSJe5T8ZVjgtBLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12447421"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:41:51 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com
Subject: [PATCH 1/2] drm/xe/ras: Wedge device if page offline list is full
 during offlining
Date: Thu, 26 Nov 2026 15:11:42 +0530
Message-ID: <20261126094140.2102442-5-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126094140.2102442-4-soham.purkait@intel.com>
References: <20261126094140.2102442-4-soham.purkait@intel.com>
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
index 0fb891d00b36..53fd6dcf8ee1 100644
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
+			xe_err(xe, "sysctrl: page offline list is full\n");
+			xe_wedge_declare(xe, 0);
+		}
 		return ret;
 	}
 
-- 
2.43.0

