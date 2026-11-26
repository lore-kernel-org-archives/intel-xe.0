Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2669E606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 09:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D+ZV3Daf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE4F10E218;
	Thu, 26 Nov 2026 09:54:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D74E10E218
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795686850; x=1827222850;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m8pVHrk0+FlMec7N7mlgth+SWghBmQpvqplS6cRdn74=;
 b=D+ZV3DafPY4JxIBjvvZkdxbzT2P5ZZG7WExzrgAA0hvk0rfB6pWTj8Wi
 7OfB25ZyYcgzknvj8Hm1It8ArV6SN47wXVeMxxBThkhHbfY2Uie+/Qe0I
 cq0HoKpB78oMHSAmXzQdPMFgqrxFTGsvF4PHU7clzLevesfMkbdzrZQnS
 WKjS7cHzno5XytwP8RjQDw8S2Ai+qeo+LdI+pCGJBPk6PYAR3S/zPE0w4
 y3zNKEMt3FkqpV+AR5Cdz7QJv8l1PSVkxJ/tjkkHqBM63kUWxrDF+V1mu
 UNzi9jRGH+EZua5ASaRuM5bDxMrARG/UvUaguNU4WI4/QduX8eGdQKWlJ Q==;
X-CSE-ConnectionGUID: QKG6MaT5QOG3MRoV8lN/Nw==
X-CSE-MsgGUID: kAkYXuOvR2O6gqEpgcVizw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4579512"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4579512"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:54:10 -0800
X-CSE-ConnectionGUID: yYZTdxx3S+ChtDDekvGUKQ==
X-CSE-MsgGUID: +hvkhIkPR1qOip9ui2opYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12623754"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:54:07 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH] drm/xe/ras: Add SIGID logging for fabric errors
Date: Thu, 26 Nov 2026 15:23:57 +0530
Message-ID: <20261126095356.2153941-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Fabric errors reported by the system controller fall through to the
default case without being logged and without generating a CPER
record.

Add SIGID logging for fabric errors, which also generates a CPER
record.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 9b04be3405ca..87e721a7fd74 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -888,6 +888,11 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 			case XE_RAS_COMP_DEVICE_MEMORY:
 				action = handle_device_memory_errors(xe, arr);
 				break;
+			case XE_RAS_COMP_FABRIC:
+				xe_log_comp(xe, ras_sev_to_cper_sev(severity), FABRIC,
+					    &arr->counter, sizeof(arr->counter),
+					    "error detected\n");
+				fallthrough;
 			default:
 				/* For any other component, reset */
 				action = XE_RAS_RECOVERY_ACTION_RESET;
-- 
2.47.1

