Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8D5606A324
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 08:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cMrJvzqk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC09112A27;
	Fri, 23 Oct 2026 08:30:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B938B112A21
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 08:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792744195; x=1824280195;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lvqglni/HToCHTEwqs3w7Us56k1pS5rHDG3/r+eIwFk=;
 b=cMrJvzqkEzyWgjbu33iEeM4Gd1An5J8KpFxXqE7IcIC7VJog4sE0rDGI
 uZ+GkZ3PzNUA191asel4tGVaaEW46aMo8TxsHNBElygwbUZj6qBLADMKx
 LkXDM2vF8OpALe+R7x7K2+sS2Y2U1/vMwrRl523TCX0/fLW422ldX3mqd
 7EjXlMCceItqzEvrOjkpHT3lKrY1ZkpHfCuE53Reunxi+Rix+9tMnx1T8
 3S0a26/bWdlek0RRkCGxaQzNN+X2AfGu30OE7TYOUQpaZOi0tSFX6GJIr
 77tAOn/+gQpTKcw4x551VBVrAfbuHMFIkY4nlYZXB391hlHiqIqttG7Hw g==;
X-CSE-ConnectionGUID: hGrvvQQqRtCjojzNUFw6cw==
X-CSE-MsgGUID: aqrrugiBSVSRh2z6LF4jIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1378427"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1378427"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 01:29:55 -0700
X-CSE-ConnectionGUID: ffUUhGgFSyu0SiW6A7a8TA==
X-CSE-MsgGUID: UVd2887nRyew+v4Nl3FmpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3925732"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 23 Oct 2026 01:29:51 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH] drm/xe/hwmon: Restrict LONG_MAX overflow check to 32-bit
 builds
Date: Fri, 23 Oct 2026 13:59:40 +0530
Message-ID: <20261023082939.387258-2-mallesh.koujalagi@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The temperature decoding code stores the intermediate result in an
s64 and checks it against LONG_MAX before assigning it to a long.

This check is only needed on 32-bit architectures, where long is
narrower than s64. On 64-bit systems, long and s64 are both 64 bits,
so the condition can never be true.

Wrap the check with BITS_PER_LONG == 32 so it is only compiled where
it is needed, preserving the existing overflow protection on 32-bit
architectures while eliminating the dead branch on 64-bit builds.

Fixes: 24ec15d64617 ("drm/xe/hwmon: Decode CRI temperature registers as IEEE-754")
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 42acfeb8818c..2ee51921acf5 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -1322,9 +1322,14 @@ static int xe_hwmon_temperature_decode(u32 reg_val, long *temperature)
 		value = 0;
 	}
 
-	/* Ensure the magnitude fits in long, which is 32-bit on some arches. */
+#if BITS_PER_LONG == 32
+	/*
+	 * On 32-bit systems, long is smaller than s64, so the value may
+	 * still overflow long even if it fits in s64.
+	 */
 	if (value > LONG_MAX)
 		return -ERANGE;
+#endif
 
 	if (reg_val & IEEE754_SIGN)
 		value = -value;
-- 
2.48.1

