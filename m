Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB5A606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 12:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hL2pKk0p
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FF410E3C8;
	Thu, 26 Nov 2026 12:43:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF86610E3B7
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 12:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795697006; x=1827233006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0rrbtlEi4aqvO5IGSD/qq2MxltDVq1X6afl7Yt/fRyw=;
 b=hL2pKk0pzqaF8OXXajj+ubkl2oxrcpvMUwKKoGuydJxMzl+en0nEfgAR
 C9QBSK6xwuemW7SVDAJ+fXO0CEL5K7QtLVuPRpb9Vxx0zopTACLfF2n7K
 zDybaz06YEGrMMk28+cR9/AZrrgAfsUZ/+WeDbKoo/FImjel8QCQc8/wc
 eI0g5YoN8ei/neaO8LbUwQPSRu06biw8QlSYQAuFWTQ3v+BYSzO3nUBQQ
 866jP3CuXyoFMoOCJvAvp1moD5oBn7y0fbHYYZsgzQD+3+RKSIylnU4sa
 0XYHTPpehacDgWD/M78PuWvnk4+fzkP1ylCZsUSP66+hBVktOrt8nAaSV Q==;
X-CSE-ConnectionGUID: JKqD34SUR/SlHw8pTb8QPA==
X-CSE-MsgGUID: Ezviq3VHTEmYPuOloXhL9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4559396"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4559396"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 04:43:26 -0800
X-CSE-ConnectionGUID: GsfXtRlCQe+g4I6vowWV6w==
X-CSE-MsgGUID: Nw7LyuPQRsWNkDVWQmD35w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12055547"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 04:43:23 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com
Subject: [PATCH v2 2/2] drm/xe/ras: Wedge device if page offline list is full
 at probe
Date: Thu, 26 Nov 2026 18:13:13 +0530
Message-ID: <20261126124310.2187015-6-soham.purkait@intel.com>
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

During probe, the driver reads the permanently offlined pages from the
firmware's offline list. If the list has reached its maximum number of
entries, the firmware cannot offline any more pages, so further memory
errors cannot be contained by page offlining.

Wedge the device with an unknown recovery method and fail probe in
this case, as manual intervention is required.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
v1:
 - Add consistent dmesg. (Riana)
 - Get total pages before post processing. (Riana)

v2:
 - Fail probe. (Badal)
---
 drivers/gpu/drm/xe/xe_ras.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 754514412694..ad62d5acc1a6 100644
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
@@ -1360,6 +1365,9 @@ int xe_ras_init(struct xe_device *xe)
 	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
 	if (ret)
 		return ret;
+
+	if (xe_wedged(xe))
+		return -ECANCELED;
 
 	return xe_cper_sysfs_init(xe);
 }
-- 
2.43.0

