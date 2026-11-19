Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB96A606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 16:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PYHd1/vd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D607112608;
	Thu, 19 Nov 2026 16:40:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648F111260F
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 16:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795106414; x=1826642414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gUrK6xIRHZ9tNiyxLyj9CTvWI9InhVoWVb0dhycwRJo=;
 b=PYHd1/vd7k0dBKnqP6uPMZwjdGsOgH4N77rllYFaisJI288fAKOf2UEq
 NlfosHKZlW1+j1AAtLqyPmTnbXLagYf14MgUfA5SSDJKAMvl590LmCaOo
 1d7pmo8IY3c78Ci0gotOK85POdq9POQNAea6Sg8sm+avxGHLCBEz/4upB
 O+aAZzT/SVTkvNRl2jKhA8UaXxUGNFM4j6CN/e5stgWPEB4KbR+r290BE
 2CFXe93QK4JmLTw/qn6TjlGBZPK5bqHgcoSWTWHFidTk+ed8AUESyuJNs
 9BchBovI/TIbV7+9jtDXXyV35e32fpcDci+A42dJ/zbqAetLkDMqvqUWR A==;
X-CSE-ConnectionGUID: 3Sl6JSmNQOGrltSUnHReYw==
X-CSE-MsgGUID: I7fhfXhKR8yjFH3LBeS8Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3989851"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3989851"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 08:40:13 -0800
X-CSE-ConnectionGUID: 1uYU6VhPR0intiyGpxKvFQ==
X-CSE-MsgGUID: TcTLe+RER/+tSPZ1dQjGMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10842508"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 08:39:46 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, raag.jadav@intel.com,
 anshuman.gupta@intel.com, mallesh.koujalagi@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v1 1/1] drm/xe/xe_ras: Skip gpu_health sysfs commands during
 reset or wedged
Date: Thu, 19 Nov 2026 22:09:13 +0530
Message-Id: <20261119163913.1760721-2-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119163913.1760721-1-ravi.kishore.koppuravuri@intel.com>
References: <20261119163913.1760721-1-ravi.kishore.koppuravuri@intel.com>
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

Accessing gpu_health sysfs attribute sends a command to the system
controller. Add a guard to verify and skip if the device is wedged or in
reset. It protects against touching the fw or device when it is not in
usable state.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 0fb891d00b36..47f6b91edd9c 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -1134,6 +1134,12 @@ static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr
 	size_t rlen;
 	int ret;
 
+	if (xe_wedged(xe) || xe_device_is_in_reset(xe)) {
+		xe_err(xe, "[RAS]: GPU is wedged or in reset\n");
+		return -ECANCELED;
+	}
+
+
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
 				  &request, sizeof(request), &response, sizeof(response));
 	guard(xe_pm_runtime)(xe);
@@ -1177,6 +1183,11 @@ static ssize_t gpu_health_store(struct device *dev, struct device_attribute *att
 	if (state < 0)
 		return -EINVAL;
 
+	if (xe_wedged(xe) || xe_device_is_in_reset(xe)) {
+		xe_err(xe, "[RAS]: GPU is wedged or in reset\n");
+		return -ECANCELED;
+	}
+
 	request.health = state;
 
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
-- 
2.34.1

