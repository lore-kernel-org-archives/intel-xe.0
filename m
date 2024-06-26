Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FC9C3064D
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 02:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7255210E2DF;
	Wed, 26 Jun 2024 02:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTdongBQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B67A10E2DF
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 02:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719368030; x=1750904030;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LCSXNkHSFdkuxePRHhsjb8jMTX0IPlSgfaPFXfPEXgw=;
 b=eTdongBQSk7Hu7tFNfXMC8aF2OWRbJb2lEs0Y1wSkybs/dp2e3F9B53b
 bj4ykBVczkPwlNWbGSMGGnCLxb7sMrPWlhGBzy8R6ji5OgdAjHYaIXsR3
 swljXPgTiNDZra0+U3R2xhDWJIfIMjtYq8Je4qUky4PeOv2p7ipoS4fre
 Gcotb6XFISMeqAx6uCI82dITSEVfMs3aihJdPFvfDiGL3gV9edGQ1Nb/8
 X6IztWTdt2S6tiCGmPiPLXQ4jyS99JRUebgp5xQrrnh4m4c2yTg8P9ESl
 lF98VrWrl+5NLMCWlAvPnoxorcBc1Tg+vP7IOtmfrlMizMBX0+ikeNxfN Q==;
X-CSE-ConnectionGUID: kAuGGXsNT0O5WHvXRwjw9Q==
X-CSE-MsgGUID: Vx5p7kKmSA6OPyKZKi89kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="12249515"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="12249515"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 19:13:49 -0700
X-CSE-ConnectionGUID: 1Vr8/+t0TRuQL6/TTrobiA==
X-CSE-MsgGUID: 5SmPZTsJTAaD6wT7AIFu/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="74610016"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 19:13:49 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v5 0/2] drm/xe/oa: Add NO_PREEMPT property
Date: Tue, 25 Jun 2024 19:13:41 -0700
Message-ID: <20240626021343.1054590-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Add DRM_XE_OA_PROPERTY_NO_PREEMPT property. This is intended to be Xe GuC
equivalent of i915 property DRM_I915_PERF_PROP_HOLD_PREEMPTION.

v2: Introduce no_preempt exec queue op
v3: Introduce set_no_preempt and clear_no_preempt exec queue op's
v4: Revert to v1, which doesn't add new exec queue op's
v5: Same as v4, except added 'uapi' to Patch 2/2 title

Ashutosh Dixit (2):
  drm/xe/oa: Allow stream enable/disable functions to return error
  drm/xe/oa/uapi: Allow preemption to be disabled on the stream exec
    queue

 drivers/gpu/drm/xe/xe_oa.c       | 104 ++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_oa_types.h |   3 +
 include/uapi/drm/xe_drm.h        |   6 ++
 3 files changed, 98 insertions(+), 15 deletions(-)

-- 
2.41.0

