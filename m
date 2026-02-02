Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF23E7FDF5
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 21:44:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9304F10E406;
	Mon,  2 Feb 2026 21:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XcaOo9HT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B5210E406;
 Mon,  2 Feb 2026 21:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770068668; x=1801604668;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=92CxvIt7QvuNV6bEJ5hY2tokrJqoCYNf7K7pgUFJl4g=;
 b=XcaOo9HTD94YmF0gOj9eMLEadZsFFGac6ywoX1BT5aFyIrExee/+8TVH
 u+ZbzRw8TChbEVc44lZRKkKWxcR1pS/5eHGRSsWfmTup04a0mD982djYp
 FEy1Uin4/chHDy+83ZBRuSSgGpWrp69Dfm75sPTM9NaCr0riSlGavttQY
 BkMO0i/ClnyRWCXf0ZdcYVORGT0ezDPISQ/rw73VVMvJbyYTqqvUbnmW7
 8u8yNLMSWNo0b8WDlhy0WwFtLrRMNYUiwX3s6TqJokpKOBIiDfAvOTbIj
 hlvLkyBozelWEqKuFvQ+NkTCdYsKOixgu8MSY37n7jXJP3R69PAlU2ENF w==;
X-CSE-ConnectionGUID: dn5sLxBVSZ2/WCBzztuKZw==
X-CSE-MsgGUID: tzEKSpuhQXK6brixtPD6aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58814366"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="58814366"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:27 -0800
X-CSE-ConnectionGUID: G3QOq7h+RN6WwoiAhHxgPw==
X-CSE-MsgGUID: wP9Rk28DRmCcO4WP5LzgXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209646886"
Received: from smoehrl-linux.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.51])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:26 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 02 Feb 2026 18:43:21 -0300
Subject: [PATCH 15/16] drm/i915/nvlp: Hook up display support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-nvl-p-upstreaming-v1-15-653e4ff105dc@intel.com>
References: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
In-Reply-To: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

From: Matt Roper <matthew.d.roper@intel.com>

Although NVL-S and NVL-P are quite different on the GT side, they use
identical Xe3p_LPD display IP and should take all the same codepaths.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index 471f236c9ddf..1a7f3ca079e8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -1500,6 +1500,7 @@ static const struct {
 	INTEL_PTL_IDS(INTEL_DISPLAY_DEVICE, &ptl_desc),
 	INTEL_WCL_IDS(INTEL_DISPLAY_DEVICE, &ptl_desc),
 	INTEL_NVLS_IDS(INTEL_DISPLAY_DEVICE, &nvl_desc),
+	INTEL_NVLP_IDS(INTEL_DISPLAY_DEVICE, &nvl_desc),
 };
 
 static const struct {

-- 
2.52.0

