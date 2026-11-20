Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32A6606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 05:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LGuXdXVd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5B610FF2B;
	Fri, 20 Nov 2026 05:47:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762AE10FF2B
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 05:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795153656; x=1826689656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2nLwTBavkKvxpOqCzfYAqxNdCIywEFp4EPS5tlMQJSY=;
 b=LGuXdXVdCbNiWC+28KH5qZo25jlUjeLT1SBoC8+fXwh/OA32PLNgLmdl
 of7683wBKSpOyXx4QNkY6BKn1Yb1Zg3FL8gFeJn5h3NsLc9KLFKUcVFIK
 w+KEwZi1T/a3uIAdrYYTjVp+sH7UdSP2M2VvcJedalROX/iaz4BIv4hBx
 tfNh2hupxZm8kRYa5ZGfuovEGGSRJzpzxidX+za1lHn9xjxvRq639Jkqu
 RhxrGkKnIUGq3ohhesURkNLdSk0+lkOFfLnmFnMt2+DMJH9h3D8AHB5jW
 6zbJXSzUZUpDxAXe7qNrTP+URJXWbKQt/6t8ZoSNQe9Fja+5UCyNB4Iii A==;
X-CSE-ConnectionGUID: 30aWuoXBRFGyvCgmiH/p9A==
X-CSE-MsgGUID: Hwe3ZqfsSNO9l8MI7pQtag==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4018533"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4018533"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:47:17 -0800
X-CSE-ConnectionGUID: LM8RRAz7T9OJoJqsMfAk7w==
X-CSE-MsgGUID: N9RD1FYaR4ixp5xb2mCSnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10617157"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:47:17 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 12/16] drm/xe: Document that gt_types_allowed=media now probes
Date: Fri, 20 Nov 2026 05:47:23 +0000
Message-ID: <20261120054712.377573-30-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120054712.377573-18-stuart.summers@intel.com>
References: <20261120054712.377573-18-stuart.summers@intel.com>
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

The media only configuration no longer fails probe, so drop the warning
that said it would.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 43950f499a89..91356cbbb826 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -114,15 +114,14 @@
  *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
  *
  * Allow only the media GT of each tile to be initialized and used,
- * effectively disabling the primary GT.  **This configuration will cause
- * device probe failure on all current platforms, but may be allowed on
- * igpu platforms in the future**::
+ * effectively disabling the primary GT.  Note that only media workloads
+ * are usable in this configuration::
  *
  *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
  *
  * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
  * **This configuration will cause device probe failure on all current
- * platforms, but may be allowed on igpu platforms in the future**::
+ * platforms**::
  *
  *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
  *
-- 
2.43.0

