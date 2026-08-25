Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7087C61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 23:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6627C10EB87;
	Tue, 25 Aug 2026 23:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LiJh4FWQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4302610EB77
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 23:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787699782; x=1819235782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Fkn15mm3B7NGp2pg4POrMoqNT/3XPf7QNR9mA+cwL0=;
 b=LiJh4FWQrp1sMyyadtS2DPXvp1tKnHzjRk2HyaWESwT9lXeeIVapjlNM
 T45v6S7z0J3IMJ07rG0t2m3l+Sb22uWMDZwGlTUBnwS7XIRct0bYOefd+
 KVpor6k3GCXyIZJJrqEXpxbhrs5+RIFeDMEw5rHsGQjWIfSiPcxeSwzbE
 u3LCMyQdwf8k8i07BLD6ed811qIU2GAoDYW1UL+VGtEbunT3jjfev10nP
 PD0O34/hZ/TlOIyD9OKl6kcyo7ewR8Av91ZnGG2uZoxj60oFf+WtHBSs5
 6knJXNktADzSjdfDaYOMrYHFTW6Ym2Nt5mPsb86+emg6fdpR1AFEzisaV g==;
X-CSE-ConnectionGUID: Q5l/+7zxT82yMMDnp7dNjg==
X-CSE-MsgGUID: fuRWUPn/REOpb2j078Gqyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="91857242"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="91857242"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 16:16:22 -0700
X-CSE-ConnectionGUID: DdpIQrQLSCelwgYKaQi+RA==
X-CSE-MsgGUID: jXRizSbkRxGkoSGWTgayxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="270906919"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.189])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 16:16:22 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 6/6] DO NOT MERGE: drm/xe/guc: add a mock newer GuC file for
 LNL
Date: Tue, 25 Aug 2026 23:16:04 +0000
Message-ID: <20260825231604.651906-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825231604.651906-1-daniele.ceraolospurio@intel.com>
References: <20260825231604.651906-1-daniele.ceraolospurio@intel.com>
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

This is for testing only, to have CI do a full run when FW fall-back
happens.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 051889a635af..469d09236dbb 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -125,6 +125,7 @@ struct fw_blobs_by_type {
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	guc,	nvl,	70, 71, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	99, 99, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 53, 0))	\
 	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
-- 
2.53.0

