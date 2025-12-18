Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B869D6E2A5
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 15:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D50810EA1B;
	Thu, 18 Dec 2025 15:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XG/fzRvn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E35710E84E
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766072131; x=1797608131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p8bwTTg6I3hD2ZJPt/OQVPvLZ1ZEE/J9YZH1KuaBvkk=;
 b=XG/fzRvnFA/LfV3BWUgw2DqcopyPUpItMA3EH6umQs7fKfxEgvg9VKLJ
 BXpQI7dFkzd7QbWRU5zF3ME0XA4D6o5+EMhUBld1lMl73ULvUnGMLzSTV
 DGb9NCduzslq74elzWqr1ThMYtNcmUTcCpd48ENuG7Zq+/1/NVmlbHzK8
 FggEbtx8GVoTFMzC2Snby+ipoXdccIcwBLHCM+oWmynh0H2yBZCUD1OB1
 kOh2G52r+UCv4LKSroV55/X5IjNoBSMZsTQLLbMwYJJh3DIl6Ur7ajjyP
 HyqDXRreQoSI1aKW+xnK6NCrxinHiR94JkRvOkblLMTWFZXK6s2WC1YCb g==;
X-CSE-ConnectionGUID: BFehHEi5Rve6g+CKB/LZkg==
X-CSE-MsgGUID: WW8xb+gCQGaaoSM6Q4mtZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67906275"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="67906275"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 07:35:31 -0800
X-CSE-ConnectionGUID: i7omUrVMQdONz5wzS1udng==
X-CSE-MsgGUID: 8UjwW7ZQQoSFY7ln2rikSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="236042229"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 07:35:31 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, daniele.ceraolospurio@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH 4/6] drm/xe/xe_guc_ct: READ_ONCE ct state in
 xe_guc_ct_initialized
Date: Thu, 18 Dec 2025 15:35:32 +0000
Message-ID: <20251218153527.6436-12-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218153527.6436-8-jonathan.cavitt@intel.com>
References: <20251218153527.6436-8-jonathan.cavitt@intel.com>
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

Use READ_ONCE when reading ct->state in xe_guc_ct_initialized to prevent
the compiler from ignoring this operation.

Fixes: 0b93b7dcd9eb ("drm/xe: Fix early wedge on GuC load failure")
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 5599939f8fe1..d4c9cb4dbcb5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -30,7 +30,7 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 
 static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
 {
-	return ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED;
+	return READ_ONCE(ct->state) != XE_GUC_CT_STATE_NOT_INITIALIZED;
 }
 
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
-- 
2.43.0

