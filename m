Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578D1606A32A
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f+2UpjTe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082D3112282;
	Thu, 26 Nov 2026 10:06:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF64112284
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 10:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795687585; x=1827223585;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZET7LPZC4S+W1kHuZxHbxhbKjEqhPjHzZ/fpTdS7rdg=;
 b=f+2UpjTejSXBeIvCEF/aGHKp+QDLIym7wk4EWrJ9Na+osvtq1cQxg0zl
 RJV7R/XEdDaA9IiFowEMjJPfmG2yxooErztm0cN6rk+3JvRG3yNuvKZrb
 Gu8MG0DvX7IvdjOt4qZy3ToglzwaniG9AlP/xq2sgvl59UOYxynjHWPQo
 h9GM3JFTGZ+KDWVthyEJm960xx7m3rMdAZutTLc/7jp+9SonFKpZ3U2tQ
 ZyuLVYXLJXcU+0XuZOof71CNhpbuOzScj/teIgQeUb2Pk5CqLGwHxQSsb
 3F1AmpQhEtn/Rze7BnnymC/entyFjJ09zOA2S22cztDhnXtXmA1BHcSM2 Q==;
X-CSE-ConnectionGUID: aAlKvJA+Q0eUs1Up+pbiYg==
X-CSE-MsgGUID: 5y/F9pOPQzSYw7vZNKJ4mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4559647"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4559647"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:06:03 -0800
X-CSE-ConnectionGUID: z0tlHta8Tv69+EsS/yFeCQ==
X-CSE-MsgGUID: wAd96GEiQSOosCJCDx/4SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12023758"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 26 Nov 2026 02:05:02 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 jani.nikula@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe: Unplug the drm device on probe failure
Date: Thu, 26 Nov 2026 15:34:46 +0530
Message-ID: <20261126100446.2167521-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Currently, xe_device_probe() failure unregisters the drm device
but doesn't unplug it. This is problematic for code paths that rely
on drm_dev_enter/exit() until the respective cleanup actions are
triggered on probe failure.

Explicitly unplug the drm device on probe failure and fix this.

Fixes: 60bfb8baf8f0 ("drm/xe: Unregister drm device on probe error")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 36693df65594..fccb0eff54ee 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1132,7 +1132,7 @@ int xe_device_probe(struct xe_device *xe)
 	xe_vsec_remove(xe);
 err_unregister_display:
 	xe_display_unregister(xe);
-	drm_dev_unregister(&xe->drm);
+	drm_dev_unplug(&xe->drm);
 
 	return err;
 }
-- 
2.43.0

