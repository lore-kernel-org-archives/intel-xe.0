Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED5DC369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 05:06:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6260E10E4EA;
	Tue, 22 Apr 2025 05:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqHm1+f5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B3A10E4EA
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 05:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745298401; x=1776834401;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jS4co2g35xfu0DnXDo7s50M8w16xq60lhIxpiqdkyP0=;
 b=kqHm1+f5Fx/R1ulFE5Mx8SrofJ45MQk2D7Qmj0jEl7q31b/pn+Ik62HO
 bdo1w3ddUipewKE4bUfQXUiOO911jELH2J6PQP57RtNbCtzN5fHIMWnL2
 55wUzrbY1Kv3iwTvXPp2X3DUCzFBW4fu4vTZi+Zk3zlX/6VP+rmlKGaG0
 KsPr4vNN8Kr3F8r5p+hy384AzFOqQue2cEZawwUOB/5APId1+mNiFWbeN
 bEQ5u8k2lVS+uXy4QGOSRd3bLlwYiWl5v7fnv1KMHX/bvYnDYff8nlNde
 tcr1Tg1eKJtd7i2+vSVrTSnqVprxsbe0yeKblhOBCP654bJjVWJ8L7Dn8 g==;
X-CSE-ConnectionGUID: y+k6D8mbS/GXzdKA7JioHw==
X-CSE-MsgGUID: J7mw1eqLRqaJD4yF1MlOAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46972987"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="46972987"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 22:06:41 -0700
X-CSE-ConnectionGUID: UETGL+c5RVezCm4lnhaC5A==
X-CSE-MsgGUID: q3K+sQONRuevDJFb0VQnYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="169107484"
Received: from intelmailrelay-02.habana-labs.com ([10.111.11.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 22:06:39 -0700
Received: internal info suppressed
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 53M56UhH1077178
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 08:06:30 +0300
Received: (from dhirschfeld@localhost)
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id
 53M56T3m1077099; Tue, 22 Apr 2025 08:06:29 +0300
From: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: xe_svm_range_alloc should return NULL upon error
Date: Tue, 22 Apr 2025 08:06:06 +0300
Message-Id: <20250422050606.1074334-1-dafna.hirschfeld@intel.com>
X-Mailer: git-send-email 2.34.1
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

replace error pointer with NULL upon failure.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index c7424c824a14..d927f50f2a68 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -80,7 +80,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
 
 	range = kzalloc(sizeof(*range), GFP_KERNEL);
 	if (!range)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	INIT_LIST_HEAD(&range->garbage_collector_link);
 	xe_vm_get(gpusvm_to_vm(gpusvm));
-- 
2.34.1

