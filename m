Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F83D4336B
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 06:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EEB10E16F;
	Fri, 12 Dec 2025 06:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtZdPKOd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B61C10E422
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 06:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765520337; x=1797056337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uGXlLcgSFzMyWaUF6bI60jHRkY4aLcHodPXXdUUevNo=;
 b=gtZdPKOdYjlblJZN35oQeZaH9rONhFmaB8dH73LiWtgIXQbNzz118Jxj
 MSiMb+mDMzhcW/esZQrff9Qh5McLW+PSLvpsbR5rYxYdXGSUnpWAblKsG
 QnKFn2fGWuwRsVZSiPeeTk8gAjxpAtDdF4BsENy+9JJ5lQNbMVTpk2uRt
 Fbjl0U6ZAlO1nW9KbGPOR2thy8ht1Ewc0DlD9fDFXT9O4czOPHIr+BoOE
 ioqsM2F+nxX3hs74JZDpp+vXYZK5uSuadixCyIoezRmJyIOjrzW6yDsy5
 8dqDhJBgUcezs9m3uwG30s8a9uw+z01v2KxPokYqoAoqXCTI+WckrQ4zz g==;
X-CSE-ConnectionGUID: CBixfQvQSIq/cfmoible6A==
X-CSE-MsgGUID: VKXV/gNtSZWdKDjvgntDGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67557153"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67557153"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 22:18:56 -0800
X-CSE-ConnectionGUID: 7ChiT6dZSoCe3eh09dVSTg==
X-CSE-MsgGUID: 1hRFnr/HRJKxAKKVo8TKqQ==
X-ExtLoop1: 1
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 22:18:56 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>, peter.senna@intel.com
Subject: [PATCH 1/3] drm/xe/oa: Move default oa unit assignment earlier during
 stream open
Date: Thu, 11 Dec 2025 22:18:48 -0800
Message-ID: <20251212061850.1565459-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251212061850.1565459-1-ashutosh.dixit@intel.com>
References: <20251212061850.1565459-1-ashutosh.dixit@intel.com>
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

De-referencing param.oa_unit, when an OA unit id is not provided during
stream open, results in NPD below.

  Oops: general protection fault, probably for non-canonical address...
  KASAN: null-ptr-deref in range...
  RIP: 0010:xe_oa_stream_open_ioctl+0x169/0x38a0
   xe_observation_ioctl+0x19f/0x270
   drm_ioctl_kernel+0x1f4/0x410

Fix this by moving default oa unit assignment before the dereference.

Reported-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6840
Fixes: c7e269aa565f ("drm/xe/oa: Allow exec_queue's to be specified only for OAG OA unit")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index cc48663c2b48f..46a79b60585b8 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1962,10 +1962,6 @@ static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_param *param)
 	enum xe_hw_engine_id id;
 	int ret = 0;
 
-	/* If not provided, OA unit defaults to OA unit 0 as per uapi */
-	if (!param->oa_unit)
-		param->oa_unit = &xe_root_mmio_gt(oa->xe)->oa.oa_unit[0];
-
 	/* When we have an exec_q, get hwe from the exec_q */
 	if (param->exec_q) {
 		param->hwe = xe_gt_hw_engine(param->exec_q->gt, param->exec_q->class,
@@ -2031,6 +2027,10 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 	if (ret)
 		return ret;
 
+	/* If not provided, OA unit defaults to OA unit 0 as per uapi */
+	if (!param.oa_unit)
+		param.oa_unit = &xe_root_mmio_gt(oa->xe)->oa.oa_unit[0];
+
 	if (param.exec_queue_id > 0) {
 		/* An exec_queue is only needed for OAR/OAC functionality on OAG */
 		if (XE_IOCTL_DBG(oa->xe, param.oa_unit->type != DRM_XE_OA_UNIT_TYPE_OAG))
-- 
2.48.1

