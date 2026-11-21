Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC69606A320
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 18:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JQLX66ZC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37F910E98D;
	Sat, 21 Nov 2026 18:23:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07B310E9F4
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 18:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795285422; x=1826821422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2nLwTBavkKvxpOqCzfYAqxNdCIywEFp4EPS5tlMQJSY=;
 b=JQLX66ZCbpW+po28Gv7aSOY3EpANUoiigB4DzkE+FNp6pVYsN68cX+TV
 iqzYReT/+dcGuQmr3rdoD2JQsrneyeNKwb+ptMsssS2FmkJ1bYrWAn9ck
 4foh1vbXo0HD2vqBo/XCI3VqRawQjhUDmC8yjT4GsxP2o996bw3Km37Ag
 iym0c0Y+X078qaeFnCoOIF1NUuDvl5VkpMpC4nc9bZsDm9Fbb9ycrWtLr
 fr2BtbGpVOd8wFp0084MNj8M/cnLVBXdgMGSz09sXHlKyhy2AZfVGZwlq
 Kt8WzrnMJbPBssJBDp85HPPDFKGfKCR/WgbMDWpWacMGAux0yWwZjxvvi w==;
X-CSE-ConnectionGUID: qz98prIeQiWT+XahPWYNIQ==
X-CSE-MsgGUID: rVUcax/ZSvWJ+MiEtz80Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4034068"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4034068"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:21 -0800
X-CSE-ConnectionGUID: yOfi4yCzR+GiI3Z1cck6ug==
X-CSE-MsgGUID: K4W825DdTT2iqqUDqjXwQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; d="scan'208";a="10934436"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:20 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 12/17] drm/xe: Document that gt_types_allowed=media now probes
Date: Sat, 21 Nov 2026 18:23:28 +0000
Message-ID: <20261121182317.48981-31-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121182317.48981-19-stuart.summers@intel.com>
References: <20261121182317.48981-19-stuart.summers@intel.com>
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

