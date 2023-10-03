Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFF5E8FDBE
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 22:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A27610E0AE;
	Tue,  3 Oct 2023 22:21:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C84B10E0A8
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 22:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696371716; x=1727907716;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lVTFxbmibDHJunjapUKRqXlbAklL+xn5N3F1pIfoffQ=;
 b=P4M+/nImTyWF02yNsmD8b16nQsif0u+aIIWIReb4Mel9Z5f291Hc9VJ2
 g9HKmd9c22Rp+ygx5yq4RWOFvbO4owJF7aXWP42fxkxMuzpwvQnuqf/tc
 oTbZNtrCmF9uEAneZYzueCDskrpf+QsEZrjqMAWwa2QE+ACJTMNoTLYdo
 zN7x49chLKmh+zJuie3C4c5Y9Y6WuGk64lI41p2lotIEt/i+S+r/Whonj
 ymRiPlPX1UF1S6YOeHqnt417/Ska7eg+uBX5j441nTIOWNqVGsN5B6OaN
 cptQdFM4K0CbaoxwOG+hk7HZCMC0CWMbuOJDQx5/5PFmGlu+52jQZYf9H w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="380270378"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="380270378"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 15:21:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="894667586"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="894667586"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 15:20:30 -0700
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com, matthew.d.roper@intel.com,
 matthew.brost@intel.com, stuart.summers@intel.com,
 niranjana.vishwanathapura@intel.com
Date: Tue,  3 Oct 2023 18:21:45 -0400
Message-Id: <20231003222145.4090918-3-david.kershner@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20231003222145.4090918-1-david.kershner@intel.com>
References: <20231003222145.4090918-1-david.kershner@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/2] drm/xe/xe_hwmon.c: Add static to
 xe_hwmon_process_reg_read64
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

Add static to xe_hwmon_process_reg_read64 to avoid compile warning:

    ../drivers/gpu/drm/xe/xe_hwmon.c:126:5: error: no previous prototype
         for ‘xe_hwmon_process_reg_read64’ [-Werror=missing-prototypes]

Signed-off-by: David Kershner <david.kershner@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 1deb5007e1e2..172bb85edcf1 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -123,7 +123,7 @@ static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_
 	}
 }
 
-int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, u64 *value)
+static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, u64 *value)
 {
 	struct xe_reg reg;
 
-- 
2.35.1

