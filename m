Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98339606A33A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 14:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VwmnFLPM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B6D11286A;
	Fri, 30 Oct 2026 14:46:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4C010E537
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 14:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793371560; x=1824907560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AEJNDLWJXah5gPpeOtTnZ2nofnyGkqrHhGFRO5owqJM=;
 b=VwmnFLPMBrhw7lJYyCAas5h9KsqUREfHf2f9EA9UhwBLMnZOvVD+kHfw
 plYRnoGaQodxVIbh75ftDnvQXUAt9kB7vKMPhGc9mNwxBVA0DakaB7sOF
 zLcWHBkkh4Wzo3MMgiwMbLCSw1jSy35LufLrM5190CiYfEnlLpRSuYto1
 OlT9MFJGwT9wQrV2MTqqKKZ+HPsXfxTS2VeDtDh4X8siuQVNgSJdEl5WL
 RyY0zhVzYAnf+oNtEuoW1q9MmMTsteoeqfhQfrwkkjTzWtO8l5Nhw31Xs
 3Zdy+HEZ9L2wpzchj3URaxghlvI9gsDZUd0cod77ZtfK3vYmaOl0l0/J9 Q==;
X-CSE-ConnectionGUID: AuIQbXReQM+g0uEAa7qtSA==
X-CSE-MsgGUID: kKOGSERXREq49v7O/lda8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2012660"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2012660"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 07:46:00 -0700
X-CSE-ConnectionGUID: MsE+p8AIT9ipO5Km1cfyTw==
X-CSE-MsgGUID: nlM+YtlpQ6GlNSZVg13U9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5588610"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 07:45:57 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, michael.j.ruhl@intel.com,
 alexander.usyskin@intel.com, anoop.c.vijay@intel.com,
 shamim.begum@intel.com, kelvin.gardiner@intel.com
Subject: [PATCH v6 2/6] drm/xe/xe_late_bind_fw: Add string mappings of status
 codes
Date: Fri, 30 Oct 2026 20:15:50 +0530
Message-ID: <20261030144547.2532309-10-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030144547.2532309-8-badal.nilawar@intel.com>
References: <20261030144547.2532309-8-badal.nilawar@intel.com>
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

The mei_lb driver introduced additional late binding status codes.
Add the corresponding string mappings in Xe for reporting these
statuses.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 1bddfaf0fb9f..b7957e255ccd 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -179,6 +179,32 @@ static const char *xe_late_bind_parse_status(uint32_t status)
 		return "Invalid Payload";
 	case INTEL_LB_STATUS_TIMEOUT:
 		return "Timeout";
+	case INTEL_LB_STATUS_INTERNAL_ERROR:
+		return "Internal Error";
+	case INTEL_LB_STATUS_INVALID_FPT_TABLE:
+		return "Invalid FPT Table";
+	case INTEL_LB_STATUS_SIGNED_PAYLOAD_VERIFICATION_ERROR:
+		return "Signed Payload Verification Error";
+	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_CPD:
+		return "Signed Payload Invalid CPD";
+	case INTEL_LB_STATUS_SIGNED_PAYLOAD_FW_VERSION_MISMATCH:
+		return "Signed Payload FW Version Mismatch";
+	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_MANIFEST:
+		return "Signed Payload Invalid Manifest";
+	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_HASH:
+		return "Signed Payload Invalid Hash";
+	case INTEL_LB_STATUS_SIGNED_PAYLOAD_BINDING_TYPE_MISMATCH:
+		return "Signed Payload Binding type Mismatch";
+	case INTEL_LB_STATUS_SIGNED_PAYLOAD_HANDLE_SVN_FAILED:
+		return "Signed Payload Handle SVN Failed";
+	case INTEL_LB_STATUS_DESTINATION_MBOX_FAILURE:
+		return "Destination MBOX Failure";
+	case INTEL_LB_STATUS_MISSING_LOADING_PATCH:
+		return "Missing Loading Patch";
+	case INTEL_LB_STATUS_INVALID_COMMAND:
+		return "Invalid Command";
+	case INTEL_LB_STATUS_INVALID_HECI_HEADER:
+		return "Invalid HECI Header";
 	default:
 		return "Unknown error";
 	}
-- 
2.56.0

