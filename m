Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA86E606A326
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 06:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ROhE3c1/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB6410EA80;
	Mon, 26 Oct 2026 06:05:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4E810EA80
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 06:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792994725; x=1824530725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CrbChOtAnT1EyEyXe9q6+HzEC8HhH8c0AaKU7mXHUNg=;
 b=ROhE3c1/U1Vh4ZXpdgpPDnaZJDE7F5gmTn3sJPEdZrTFeoPNowO/2D7V
 BAS5Rch6bJm+zibKvTjy9inYM0Qns6Rmjom9uVwxLNEMdb9nUGPxn7s3D
 0jtlEQKsUnsKDlCZggZvi3tj+D6444qwlXvR9Lr13w5mpj0OTMi0Tc4pQ
 G1NZDkqJHapPCSL/4+J0vTFJCZftCpVsFsI4K1/h4iOq6mZNFHpbOTrip
 kZMGgNtW6W48j8lecN5XjcgSD0USyo4TNRL9A9M6JnW2lKJSNb1N+yjig
 fExKTTmLVxIp1aWH45N177l47K0N3mWFjr4L4bobTy3NeLFmIu2QFJKmV Q==;
X-CSE-ConnectionGUID: Kq3kkJ1WQ4Or2iQqp+mU+A==
X-CSE-MsgGUID: 1IzfAEqERPWzM7DGrKWmJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1531020"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1531020"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:05:24 -0700
X-CSE-ConnectionGUID: Wuppl0YZSlm+Kf7WltFICg==
X-CSE-MsgGUID: 0QEo4t7WTMS2lnaKKnY5tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4557321"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:05:21 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com,
 Varun Gupta <varun.gupta@intel.com>
Subject: [PATCH v2 3/9] drm/xe: Add wa_14028434957 to Graphics Version 35.11
Date: Mon, 26 Oct 2026 11:35:02 +0530
Message-ID: <20261026060459.771448-14-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261026060459.771448-11-riana.tauro@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Varun Gupta <varun.gupta@intel.com>

Add wa_14028434957 for Graphics Version 35.11 to the table.

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index d8dc41851425..36b2567994db 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -7,3 +7,4 @@
 14026633728	PLATFORM(CRESCENTISLAND)
 14026746987	PLATFORM(CRESCENTISLAND)
 14026779378	PLATFORM(CRESCENTISLAND)
+14028434957	PLATFORM(CRESCENTISLAND)
-- 
2.47.1

