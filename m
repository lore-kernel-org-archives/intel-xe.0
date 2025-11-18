Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4E4CCD19A
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 09:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7018110E454;
	Tue, 18 Nov 2025 09:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OrgvWrn5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC63D10E454
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 09:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456529; x=1794992529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RyXgkYCZ43y71e148PQXEYf3jlAXUY7BhWK14Tn1jVc=;
 b=OrgvWrn55N1AjXQWD3Q70Nb5AWEOlWDyBHnzJIdgxcyKkemI2bL3MFLK
 U+ey4sKOlf7avCMIoWq4qZq7sxHTvA8CyaA55BAnd2gRyyb/Q/d+Stz6F
 MiGriT5CvWuLEJMMrYvNVn21WdEBVdFReh1gx1WR0Zi1O2H9FoZ/0u5dA
 WIaaWfcbV3Ekg8KaJiuRbrKSaI/F40Wi1WG8VNiS9tspFWI333WoiwWYa
 tQU3jNU3WU8xVKL/ZNPsV0hpjg5F6F81dYB85lCk6rPKnpmXLw1mhQo8x
 QLlDkuVa1NS4heB2St/XHlek2feXvp9Ib2U/d6j2qCxfvSw65UiTRGbNV Q==;
X-CSE-ConnectionGUID: hzgz0SD+QJWnm9ErajBdJg==
X-CSE-MsgGUID: AVUtsdG3TNy5WNNkJrD3+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="53042286"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="53042286"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:02:09 -0800
X-CSE-ConnectionGUID: 4PXk6w1SSOiTnibH1PYHSA==
X-CSE-MsgGUID: B3R5PRGYQKOwwQQ2ZO9L0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="228042523"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 18 Nov 2025 01:02:05 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com,
	jani.nikula@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com, ville.syrjala@linux.intel.com,
 karthik.poosa@intel.com, anshuman.gupta@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 2/4] drm/xe/sysfs: Use xe_pcode_read_probe() to check for
 mailbox command support
Date: Tue, 18 Nov 2025 14:29:18 +0530
Message-ID: <20251118090012.608250-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118090012.608250-1-raag.jadav@intel.com>
References: <20251118090012.608250-1-raag.jadav@intel.com>
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

Use xe_pcode_read_probe() to check for mailbox command support on the
device while exposing respective sysfs attributes.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index ec9c06b06fb5..30326de826a7 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -168,8 +168,8 @@ static umode_t late_bind_attr_is_visible(struct kobject *kobj,
 	u32 cap = 0;
 	int ret;
 
-	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
-			    &cap, NULL);
+	ret = xe_pcode_read_probe(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
+				  &cap, NULL);
 	if (ret)
 		return 0;
 
-- 
2.43.0

