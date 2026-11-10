Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F60606A320
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 23:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c8PAsAS5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BE910E9AE;
	Tue, 10 Nov 2026 23:15:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6605A10F598
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 23:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794352506; x=1825888506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jtI1zFPUctMfXYCKALs+zEJmhDbY79LzBRHF3nZj/L8=;
 b=c8PAsAS5XKhgn6CgAeUGoiewEAzN1EgVPy641P8ocG0TqKPaMRb3vwRx
 3o3e+wsSjmyucFLsf1WfjgGPtmBhKNsNoQ36GMXloMBP00qQ/YxFQZa2y
 SNnid2FWzgym2YrH8/q7CyBwiRNPFjy8dLhZgbdGJnhwBjm8HBgkRCtvC
 IEoqmTJBZ1nn4tyBzNWi6hk0gPI6H17vN3pH4QTAndgujNttVurCp+SfP
 QTRQj0LSgzv5ImCpXgLUsnrUkcqZ+zJ9AHbbQZavRNtYzRPzSEqyWAEOO
 /z3dZQs5q4HmslcJQkJu1EvpuOnFDsskV/e2QpOwvDOdwevtdP5RIWLYT w==;
X-CSE-ConnectionGUID: WoN2l3NnTDCDtiRNrnW+2g==
X-CSE-MsgGUID: rQ7v8robSdW9uYsjMSy6zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3120830"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3120830"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:51 -0800
X-CSE-ConnectionGUID: ZMEwD6eFRIifa9uOv/x2sg==
X-CSE-MsgGUID: USlLIWRZTeSU95m0RmcuMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8133969"
Received: from dut4463arlhx.fm.intel.com ([10.105.9.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:51 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, matthew.d.roper@intel.com, fei.yang@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 08/11] drm/xe: Document that gt_types_allowed=media now probes
Date: Tue, 10 Nov 2026 23:14:50 +0000
Message-ID: <20261110231442.218721-21-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110231442.218721-13-stuart.summers@intel.com>
References: <20261110231442.218721-13-stuart.summers@intel.com>
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
index 2ddd707a6dbd..95d5030e82a9 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -111,15 +111,14 @@
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

