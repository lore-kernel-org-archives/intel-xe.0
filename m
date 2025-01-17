Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5FFC02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 07:47:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E8F10EA7C;
	Fri, 17 Jan 2025 07:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXrPFmUx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C277F10EA7C
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 07:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737100055; x=1768636055;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RL+AqLJx739NdBvp6ohaOQINzCHVPc1HxU4k1DKIJpI=;
 b=aXrPFmUxKPMOQBBVALUU/w99yPfblU3sZPCftASYW6QfeQEGm2QRcz1M
 i5WY869iHHPtlY1ozV8UEwP6f7fT1IJqWCpTZiIb2VY1o3pA3WtpnM1Jm
 eWVo1+xRJ+GCoRy9ZWL8lAQ8C8OFY7eg30v/1k7UkOYTkjcSJbOnWetMo
 EjyoLLHyWJH6i8SaX0PGyccVmDKd203WdTBy4EtPxizf4n07k4j278ljN
 t1K2IZ+aXPxySVQOCCoZO2bQtjlj5JvKIUtPZBQ/GiIUpq+ntemRP34oJ
 bf4CIZgUYZ6u8JWwtBg+MHndtbQzGs03lDGKSEWzamN7npAAF1IdnCXV9 Q==;
X-CSE-ConnectionGUID: RWmy2UemT0eVXuG13Bv4Jg==
X-CSE-MsgGUID: ZbJWXWSRQLu46rw72xCUqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37760742"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="37760742"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 23:47:34 -0800
X-CSE-ConnectionGUID: 0uPKDNcITd2/AaLZOVJxTA==
X-CSE-MsgGUID: 324qmn7ARNCifD4yZJs0aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="105687933"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa007.fm.intel.com with ESMTP; 16 Jan 2025 23:47:33 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 0/7] Check Scaler and DSC Prefill Latency Against Vblank
Date: Fri, 17 Jan 2025 13:14:14 +0530
Message-ID: <20250117074422.3965519-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
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

Compute and check if dsc and scaler prefill latency is sufficient with
respect to vblank.

Previous Revision Reference:
https://patchwork.freedesktop.org/series/141203/
https://patchwork.freedesktop.org/series/142745/

Mitul Golani (7):
  drm/i915/scaler: Add and compute scaling factors
  drm/i915/scaler: Use crtc_state to setup plane or pipe scaler
  drm/i915/scaler: Refactor max_scale computation
  drm/i915/scaler: Compute scaling factors for pipe scaler
  drm/i915/scaler: Limit pipe scaler downscaling factors for YUV420
  drm/i915/scaler: Check if vblank is sufficient for scaler
  drm/i915/dsc: Check if vblank is sufficient for dsc prefill

 .../drm/i915/display/intel_display_types.h    |   2 +
 drivers/gpu/drm/i915/display/skl_scaler.c     | 123 ++++++++++++------
 drivers/gpu/drm/i915/display/skl_watermark.c  |  82 +++++++++++-
 3 files changed, 169 insertions(+), 38 deletions(-)

-- 
2.48.1

