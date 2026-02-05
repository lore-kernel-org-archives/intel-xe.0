Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A357FECD9AA
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 23:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEF610E175;
	Thu,  5 Feb 2026 23:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VF6fJVSs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBA710E1E1;
 Thu,  5 Feb 2026 23:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770334840; x=1801870840;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=UUArj/0pt07ylK0OyhZjWz0qCJf+Y+/7+qmItZ0FqiY=;
 b=VF6fJVSsGKCsYCjKirYTF2j6JQ/f6PZYCRx0RzUOub57z7glN8EpN4/c
 lpa+F43r0Vy4LsbKubFMylP5kx9q6n81IFNj7K147yNZ3VIIPyHZMIO4w
 XAFH/JwYrwi+sq/yvjELLkbLOAxzwmzBz4Cm4cXUBQtG2dtmY3ItdVvpa
 0R2EEn/RQaOLbiKWi4pfM0FRVqDfQfin83O93YZqNfy/AIQ1GCksMIxZl
 6ZHxD52AcTAbwFhilMhkJtW685aNsrld8QtsdQJX4CQiU2Zs8OpnWb6oH
 TJ1+d/KLu3njKYjsPI36qRZOYi97kkt2moaQKyddLpN5g7KnXOzM1nHJW Q==;
X-CSE-ConnectionGUID: Ze4hieUwRpOjmCfVXiQFXQ==
X-CSE-MsgGUID: GnzXi9jNSs2Kz0a+vW2z4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82658694"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="82658694"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 15:40:40 -0800
X-CSE-ConnectionGUID: Z+gBAmotQKWNQZ0m9gtyow==
X-CSE-MsgGUID: e5EcnSbeSHuKswDruCc7WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210500160"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.82])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 15:40:38 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Feb 2026 20:39:42 -0300
Subject: [PATCH v2 14/15] drm/i915/nvlp: Hook up display support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-nvl-p-upstreaming-v2-14-9ec14f00cc6c@intel.com>
References: <20260205-nvl-p-upstreaming-v2-0-9ec14f00cc6c@intel.com>
In-Reply-To: <20260205-nvl-p-upstreaming-v2-0-9ec14f00cc6c@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Suraj Kandpal <suraj.kandpal@intel.com>
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

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
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

