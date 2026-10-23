Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C918606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 21:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VrtzxozN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3967710E6F8;
	Fri, 23 Oct 2026 21:10:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B16410E706
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 21:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792789842; x=1824325842;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Gnc15lQXffDk0xNsjUY8h2B+2mo2hpz5HJjZNonss+Q=;
 b=VrtzxozNFZGuavY+6UsIwsHXoVt4i0J1EZWcUgFsqPmlFAS3G963Pa4y
 jw2RQeCoF20koASzJnHTwapv5zepMRQFahG7IM0iw4y+bY9ckccMZ/E/6
 DLByiN26SYuMusvPzHX2641YE2SMCus43Oc5xAHEwM6vUdzsEhXrp4X/U
 YsI7kAubrpnWhFp7EqGwU98quOKgKJbjzpEyStAFvqCntWDrI/zeWDoKe
 atLZEPhDpiP1CVJMQ4XvWcHENTpsF75UF/hDbj5zFhUxIkozzFmnaQ54t
 +zqB6BRYi1LMOYV/fbITfXarjb9Ql9T5d8waK912QQgqdk6YbiYJ1SV1l A==;
X-CSE-ConnectionGUID: IQJK83f+QWOIT2alazz8OQ==
X-CSE-MsgGUID: QOVrkqEHS3u/ux++h4kEpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1562595"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1562595"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:10:39 -0700
X-CSE-ConnectionGUID: V/YqCFX4QWOrQGTSK6heVQ==
X-CSE-MsgGUID: FFUfvwPmSq2hqX8/fqoBtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3804785"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:10:37 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 23 Oct 2026 18:09:36 -0300
Subject: [PATCH 08/10] drm/xe/guc: Increment regset size for Wa_1607983814
 inside hwe loop
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-wa_16031259911-v1-8-b0453f79c4e1@intel.com>
References: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
In-Reply-To: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

The regset size increment for Wa_1607983814 is correct with today's
hardware, because the maximum number RCS per GT is one.  That said, it
is arguably more accurate to make that calculation inside the
for_each_hw_engine() loop, where we can mimic the same conditions used
by guc_mmio_regset_write().

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 43a2951a66d6..a67d3405b10f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -220,14 +220,15 @@ static size_t calculate_regset_size(struct xe_gt *gt)
 	enum xe_hw_engine_id id;
 	unsigned int count = 0;
 
-	for_each_hw_engine(hwe, gt, id)
+	for_each_hw_engine(hwe, gt, id) {
 		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
 			count++;
 
-	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
+		if (XE_GT_WA(gt, 1607983814) && hwe->class == XE_ENGINE_CLASS_RENDER)
+			count += LNCFCMOCS_REG_COUNT;
+	}
 
-	if (XE_GT_WA(gt, 1607983814))
-		count += LNCFCMOCS_REG_COUNT;
+	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
 
 	return count * sizeof(struct guc_mmio_reg);
 }

-- 
2.56.0

