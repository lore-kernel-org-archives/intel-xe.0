Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF53D14886
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 01:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B1110E2F5;
	Thu,  8 Jan 2026 01:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCaqe9iW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0CC10E2F5
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 01:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767834837; x=1799370837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xj5f7auektuSKsCigpap8HGFC8KYdsMIBU1UVr5daWg=;
 b=iCaqe9iWInABJ6HFIPHTdaqIfkohEtmDjUlcKiUuWXK95qqiZfcJQS+8
 htI+1H4CqnzdlVWilN2OLSZ87TdikfOoZju/7OZCcvWx87tB54uIV2uAs
 8qxfY0jWG7BE+3j/VjoPAFWNQNWZH6dHOLU6BA6y3wFPrnpdPPPb8jkkJ
 z4mtq6XfS1J+sd8Ax2JhbB2sOJKvmYYiik77RYWTFXbXdw3CXn3q2dXrg
 6YQnA933aPHxwzDl+DFRy/TLZpHZoVFlXSfrKrCdp0VGIEtoz3+9XJ4hY
 nRKEw8LeYyiHU2ZVVkg3CAjH1TBSodeNktJxEh3D5wwMGKH11pO54ziv+ w==;
X-CSE-ConnectionGUID: t1GKpNJ/TSGAYXdz4k4amw==
X-CSE-MsgGUID: Lg2wpkWwQ4GJZFiOpJdrOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="73066461"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="73066461"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 17:13:56 -0800
X-CSE-ConnectionGUID: iA4ck5+1R32TTMhyWu0nqg==
X-CSE-MsgGUID: xG9C/xOaReK1uJQ/wcRA5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="207915178"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 17:13:56 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 3/3] drm/xe/ptl: Enable PXP for PTL
Date: Wed,  7 Jan 2026 17:13:44 -0800
Message-ID: <20260108011340.2562349-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108011340.2562349-5-daniele.ceraolospurio@intel.com>
References: <20260108011340.2562349-5-daniele.ceraolospurio@intel.com>
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

Now that the GSC FW is defined, we can enable PXP for PTL. The feature
will only be turned on if the binary is found on disk.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 91e0553a8163..38dd6ee9db12 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -392,6 +392,7 @@ static const struct xe_device_desc ptl_desc = {
 	.has_sriov = true,
 	.has_mem_copy_instr = true,
 	.has_pre_prod_wa = 1,
+	.has_pxp = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 	.needs_shared_vf_gt_wq = true,
-- 
2.43.0

