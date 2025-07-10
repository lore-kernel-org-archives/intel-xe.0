Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C08C83F1D
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 09:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E063F10E0C3;
	Thu, 10 Jul 2025 09:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RpxeBUso";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FF110E0C3
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752140237; x=1783676237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DtGncLCptuI1/N4Bd9HOr7NNYsDdDd27pYchs/FecFM=;
 b=RpxeBUsoZn0wdwwjVUo59KGAw0W3W6S9A4U1xotRIlO0/pOb6MWdSxHj
 romnvfOISb1gdbC0YM7btfLcxxT3C68c2r49QD8bJYHtqSBKLXfMwfaAT
 OKBmtpyMP8s8yWwKdZam6Cl/PrmXTprWIUSgpD5MzdhiUpaaBtx2SDRJY
 /2K2M1EoBdoP3/Hv5SZ0Nszfo0Kt1hdikt28vmJ1jd0WccLhcGbbOKGWZ
 qPFGwcsKBB523jNf8bu9O8eGTxe60AUGekmfOVPd0Vlo7+z5nddCt31VU
 yTlnpodF8pHJ6EeDpZje0MEO7HPCZ68RTNk7kMzPJ6gIzIgNHZXz5bdDp A==;
X-CSE-ConnectionGUID: ASwBmxxbQfOxlZnWTDsdkQ==
X-CSE-MsgGUID: Ut/JhKr7S1KdlQXKpJ85fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="79851272"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="79851272"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 02:37:17 -0700
X-CSE-ConnectionGUID: 2yZD+ziEQRyGdyia3W2/mw==
X-CSE-MsgGUID: QYgBv+fnQyKPyiiDTNC+0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160038317"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 02:37:16 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/2] drm/xe/sriov: Mark BMG as SR-IOV capable
Date: Thu, 10 Jul 2025 09:26:30 +0000
Message-Id: <20250710092630.370341-3-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710092630.370341-1-jakub1.kolakowski@intel.com>
References: <20250710092630.370341-1-jakub1.kolakowski@intel.com>
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

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

Some BMG platforms will have SR-IOV enabled.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e9c5d3150efc..0f5147e26ee4 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -331,6 +331,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_mbx_power_limits = true,
 	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
+	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 };
-- 
2.34.1

