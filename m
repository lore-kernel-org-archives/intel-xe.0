Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08408D46C0F
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 23:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FA810E77D;
	Wed, 28 Jan 2026 23:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JUySYfAR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058F810E77D
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 23:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769642197; x=1801178197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zn5jTmerUNkrbCmXKfWSkBaKSE5gUrq1fv//SmwgjLk=;
 b=JUySYfAR2XRRg3IKedyNYGYhc++l7JYqhjn9MUaYQWM6+3z3IneeDTGN
 6EK6SJX1hc7qYWH4jGAcUb38qb1EJ1YfgvqCZoHrJagf3XplbphNgOkG/
 A8BwZfMJB7xP5cuzb3762EOftSm5UGF/MQHfFRbfUsmGdLy62/7dyX1gP
 ii4DA2IKxYaLhbM3lMVwls4ld+Mu/ZrfBsrI0zKoa2vey2RAU10iPKgZS
 QA6O8J2iQ0oyANoevZQ+dGbrQ24otGK2k6OgtNGT1Hv8o62TC+faCNbrg
 xDZTPCfxlC1myA/Q7Pd+MhpTirEVirRUhLaQ09PT4VmeNpBQHaU+b1uTv A==;
X-CSE-ConnectionGUID: /g70HPhpTvuETiWnGxQRNQ==
X-CSE-MsgGUID: 4UCQ8HqzT5iFvoI2mDny3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="73462224"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="73462224"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 15:16:36 -0800
X-CSE-ConnectionGUID: PPnKljjERk23IA6g8yVipA==
X-CSE-MsgGUID: Ji02KULyQliNLX1/zu4RQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="213266654"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa004.fm.intel.com with ESMTP; 28 Jan 2026 15:16:36 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v5 6/6] drm/xe/uc: Drop xe_guc_sanitize in favor of managed
 cleanup
Date: Wed, 28 Jan 2026 18:16:34 -0500
Message-Id: <20260128231634.982494-7-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128231634.982494-1-zhanjun.dong@intel.com>
References: <20260128231634.982494-1-zhanjun.dong@intel.com>
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

If the firmware fails to load in GT resets the device is wedged also
initiating a GuC state cleanup.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_uc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 3f63c2a7e86d..39101120d43a 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -171,7 +171,6 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
-	xe_guc_sanitize(&uc->guc);
 	return err;
 }
 
@@ -229,7 +228,6 @@ int xe_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
-	xe_guc_sanitize(&uc->guc);
 	return ret;
 }
 
-- 
2.34.1

