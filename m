Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB62D10379
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 03:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0B510E502;
	Wed, 26 Nov 2025 03:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NpzAeSoR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A355110E4FF
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 03:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764129145; x=1795665145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uy3+9G/2FclTwkernj/g4jR0SfnzhrlH98ErhXUNueA=;
 b=NpzAeSoRo435UZFb6kZHDc/eXjnep9Lg86Fsl0I75yw3tL2bLOLCrpHG
 8L0Ghib4khidaRBbMyWypl3KiuC3QfXYym3VWgXhb2KvgFCyIoU5U5tNH
 YbEgCdTXeR7qoBEHOFiUtYF7Ray2nCyQcVWtLHbXAQmLhaSKHZ1k271vb
 AUaxHq20/JkWPcRSgWpyuXHOtTobb4nqZmftRDUxkvo4pEktpZu3HSerr
 cmmfElm0kJwoPctLoFeFA50SrrexePhzF8v2xHe5MiFa1BB7x1YjkklZ7
 e89G+VjmQrmjOCP0RcqUJhRV17XBRtAMn0bytSd62dPbhwimULpbM2mhB Q==;
X-CSE-ConnectionGUID: fmByu9UATS2mWo+T77zuxA==
X-CSE-MsgGUID: EprKk+QWREC/WlF08yv9Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76778736"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="76778736"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:52:25 -0800
X-CSE-ConnectionGUID: kgx3w3D2RqqugLZAX00Qrw==
X-CSE-MsgGUID: mAuxNeXOQ6S1xXMhbLeSEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="193260128"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:52:25 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 3/5] drm/xe/oa: Allow exec_queue's to be specified only for
 OAG OA unit
Date: Tue, 25 Nov 2025 19:52:18 -0800
Message-ID: <20251126035220.13089-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251126035220.13089-1-ashutosh.dixit@intel.com>
References: <20251126035220.13089-1-ashutosh.dixit@intel.com>
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

Exec_queue's are only used for OAR/OAC functionality for OAG unit. Make
this requirement explicit, which avoids complications in the code for
other (non-OAG) OA units.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 75db5530cb557..d63c04e2d4922 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2032,6 +2032,10 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 		return ret;
 
 	if (param.exec_queue_id > 0) {
+		/* An exec_queue is only needed for OAR/OAC functionality on OAG */
+		if (XE_IOCTL_DBG(oa->xe, param.oa_unit->type != DRM_XE_OA_UNIT_TYPE_OAG))
+			return -EINVAL;
+
 		param.exec_q = xe_exec_queue_lookup(xef, param.exec_queue_id);
 		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
 			return -ENOENT;
-- 
2.48.1

