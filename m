Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AC0606A327
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 08:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NJTHnPya
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19A710E282;
	Wed, 25 Nov 2026 08:06:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58F210E282
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 08:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795594001; x=1827130001;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QcEcWq0T3gMTtz4k3SAG98H8tYzr9av+hu/soHBb6yw=;
 b=NJTHnPyard8TOJU7iF7TOg6kIWoYK1finx17HsJfR2jtPxQBYG2G66uU
 4ast9i5Z7HYKC5k2KCacitrN2ZFMWNatnw4FINGQRxn5fIzqftmmzymbi
 yLNIBDOSVN6hXcwrLZTuN0U/H7TRj2cB2Tv+82Y7SsMiKnQMmVapgcXYb
 V5aGBhr7St1RCt5jKhnlrXLA87tqbuMF+w9DkFjqAiEO7nTzE/i9OpVKE
 U8MKgrQSpHBgvCIN8iM7PoEsjRGljYEfYMjxEXAWUSF3cXlbPpvZnic1t
 R45n8nSmbkcm4PNEXiaPU5i5gVxtgQxivN65jQ23gJtP37JF3VOQTynLw Q==;
X-CSE-ConnectionGUID: es3yWqjcQg2iZ14FME3UVg==
X-CSE-MsgGUID: le8k+CVOSF6my5HeXSiTRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4460168"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4460168"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 00:06:40 -0800
X-CSE-ConnectionGUID: nJWz/Jj/RU+u1Ahwzg6J+w==
X-CSE-MsgGUID: F7eYs2jYRSO4PEqspkP0Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="11692756"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 00:06:39 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com, raag.jadav@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v3 1/2] drm/xe/guc: Tear down exec queues on VF FLR prepare
Date: Wed, 25 Nov 2026 09:06:19 +0100
Message-ID: <20261125080621.599255-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125080621.599255-1-lukasz.laguna@intel.com>
References: <20261125080621.599255-1-lukasz.laguna@intel.com>
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

xe_guc_flr_prepare() returns early if the GuC firmware is not loadable.
This check excludes VFs, where the GuC firmware is preloaded by the PF,
so their exec queues would not be torn down during FLR preparation.
Check whether GuC submission is enabled instead. This is done only for
consistency, as it's currently always true.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index fe3381602a82..00df83460022 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1771,7 +1771,7 @@ void xe_guc_sanitize(struct xe_guc *guc)
  */
 void xe_guc_flr_prepare(struct xe_guc *guc)
 {
-	if (!xe_uc_fw_is_loadable(&guc->fw))
+	if (!xe_device_uc_enabled(guc_to_xe(guc)))
 		return;
 
 	xe_guc_submit_stop(guc);
-- 
2.43.0

