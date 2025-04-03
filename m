Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83ECC3601B
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 11:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CCB10E22D;
	Thu,  3 Apr 2025 11:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LpaNgzYy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAA410E22D
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 11:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743681045; x=1775217045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O1r1jNaGzYYLZ9vVcv9mULy8zRq7ECIP0pfXs5QgBa8=;
 b=LpaNgzYyYOtLVykPyCWP3gkmP0icnFVD1B/lCuDRUizq5TsU1uj/Yxn/
 kUB5Pzob5blCd2ElQa6aEBuNHQfEo0LXWg4DVDba50h8RF89XHIXS4sBE
 7Fq83sGsNp/B2EghW5yaxgQtB40/gWqD7ZdUA4hTo9r7p51FtN/OcQ+W1
 LgW42WtCYttNMHEbf4G/prao+O+hIp0qB9LHtkiZqrFv0dbpWJ4cWHtsH
 nTFjkxyWr+GJAWHwetkY58T6h4j6rxZeNLtnjgKgKgugZXz5OxTbvG7iF
 2Wb3GNx2igaGEbCnbVOy2dzMHOa4SAwg3jigrdMNoO3x9W04r7ysTjXUp w==;
X-CSE-ConnectionGUID: f9k8KaXYR1SWqlP3V8u1iw==
X-CSE-MsgGUID: EmYaDbY2SQ2Rgo+mk0OXmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55754791"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="55754791"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 04:50:45 -0700
X-CSE-ConnectionGUID: ZnA6Sw8QSfifDzr20WTwqw==
X-CSE-MsgGUID: QeoXP5Z4RQOIYzLpJpnicQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="126973789"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2025 04:50:44 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH 2/2] drm/xe: Introduce fault injection for guc CTB send/recv
Date: Thu,  3 Apr 2025 17:36:41 +0530
Message-Id: <20250403120641.7258-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250403120641.7258-1-satyanarayana.k.v.p@intel.com>
References: <20250403120641.7258-1-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fault can be injected with below steps.

FAILTYPE=fail_function
FAILFUNC=xe_guc_ct_send_recv

echo > /sys/kernel/debug/$FAILTYPE/inject
echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
printf %#x -19 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval

echo N > /sys/kernel/debug/$FAILTYPE/task-filter
echo 10 > /sys/kernel/debug/$FAILTYPE/probability
echo 0 > /sys/kernel/debug/$FAILTYPE/interval
echo -1 > /sys/kernel/debug/$FAILTYPE/times
echo 0 > /sys/kernel/debug/$FAILTYPE/space
echo 1 > /sys/kernel/debug/$FAILTYPE/verbose

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 686fe664c20d..4852f08dd370 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1088,6 +1088,7 @@ int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	KUNIT_STATIC_STUB_REDIRECT(xe_guc_ct_send_recv, ct, action, len, response_buffer);
 	return guc_ct_send_recv(ct, action, len, response_buffer, false);
 }
+ALLOW_ERROR_INJECTION(xe_guc_ct_send_recv, ERRNO);
 
 int xe_guc_ct_send_recv_no_fail(struct xe_guc_ct *ct, const u32 *action,
 				u32 len, u32 *response_buffer)
-- 
2.35.3

