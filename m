Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA1A606A321
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 09:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZekLYzaZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291AC10E3A9;
	Thu, 26 Nov 2026 09:43:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B18D10E3EC
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 09:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795686213; x=1827222213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1xHWGRhKQG87juohjhIN/y04o/8C4ExOUhxKEbvOLrg=;
 b=ZekLYzaZbreF6ZWO6ymfSCG0a9iFvd0o6VxUAAv8LIbIbGffGLIE22Hc
 k6NXKOBk05S6ygA2M8/EPTOfIe2t+aGmufgQ6w0Q08hyc6UYLRsuN6M8j
 0TJQNPEifPDptQFJMLB6JH4INiAtyEBgYg4D1lfXvFO2bM/Ewe3ajnLdp
 JUloHgOxwob4x70n5m1M8pRxgJ636rnpGsRRv/kJwvYG/Zx6O5DMaicDU
 XAn8762cyV9dTXgiIEjhL9Js57p4vqLoV49Uvw0HCeWRJT9gExHi9CCwP
 JlDr76GlErxGJ4plC79Wskb1t08MbHxBIKdF7rPhVZAEw2marOZ6YL1v+ Q==;
X-CSE-ConnectionGUID: PhM6NIbVTcasVeXw3pKs8w==
X-CSE-MsgGUID: BosXJrehTaOLp7E6Ipd9Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4638570"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4638570"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:42:00 -0800
X-CSE-ConnectionGUID: 0K8ncupRTf2nVJZg0Mwh4g==
X-CSE-MsgGUID: Goeb5rzjQp22Tkj8Hs35Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12447425"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:41:53 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com
Subject: [PATCH 2/2] drm/xe/ras: Wedge device if page offline list is full at
 probe
Date: Thu, 26 Nov 2026 15:11:43 +0530
Message-ID: <20261126094140.2102442-6-soham.purkait@intel.com>
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

During probe, the driver reads the permanently offlined pages from the
firmware's offline list. If the list has reached its maximum number of
entries, the firmware cannot offline any more pages, so further memory
errors cannot be contained by page offlining.

Wedge the device with an unknown recovery method in this case, as
manual intervention is required.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
v1:
 - Add consistent dmesg. (Riana)
 - Get total pages before post processing. (Riana)
---
 drivers/gpu/drm/xe/xe_ras.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 53fd6dcf8ee1..1607550e9889 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -487,6 +487,11 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
 			return;
 		}
 	} while (common->additional_data);
+
+	if (!xe_wedged(xe) && list_req && state->max_pages && total_pages >= state->max_pages) {
+		xe_err(xe, "[RAS]: page offline list is full\n");
+		xe_wedge_declare(xe, 0);
+	}
 }
 
 /*
-- 
2.43.0

