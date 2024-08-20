Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344E2C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 17:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0437810E4EF;
	Tue, 20 Aug 2024 17:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GxTUepoI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6729C10E467
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 17:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724174172; x=1755710172;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1Hl5Xr3DSZ5jfBeqkr/b7beJidvd19pMsV/YKNVYOCI=;
 b=GxTUepoIUk+vCBLbF17Ac9S/cA4undbuEk/fkNMEPfxTSO34Xw40qsGG
 rQLTrIxF6lvoWVbGcP6B4BXAKRibNdJsE+c39siIWYPRlozsi0x3yPAtk
 r3OYWryrOUXTEuaWuLDIxWa38/9liAPEGFiUFi/I45hgIeIcuvMQEpvrv
 niT3NVJ6wpmxTEKxH4u3NtBPCfDAlGNqRq9jbIOh9MS4wcWFktrj4JzwR
 baxF/TJ5rqc/ptOAUSR0YoEx0DfvVMX+e8m7nHfz8mu51ncGiSmtLgiug
 dqulGJZIoFqMn8JybG63dIgGa7lE96+fad21cSq7cj1im33CNqntiBfZR A==;
X-CSE-ConnectionGUID: Y22yhkYoStCr+gnWet+sRw==
X-CSE-MsgGUID: HC2rSbMJSPKBiKDcJkOmkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33114094"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="33114094"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:14:23 -0700
X-CSE-ConnectionGUID: pN8q1VlzSomlAIhL0fnXcg==
X-CSE-MsgGUID: 54MBKLrZS6SF5ziS+mvhbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60755922"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.143])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:14:20 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 arun.r.murthy@intel.com, rodrigo.vivi@intel.com, uma.shankar@intel.com,
 ville.syrala@intel.com
Subject: [PATCH v3 0/3] handle HPD polling on display pm runtime s/r
Date: Tue, 20 Aug 2024 20:14:05 +0300
Message-Id: <20240820171408.192309-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Switch to HPD polling on display pm runtime suspend to enable
HPDs on runtime suspend scenario.

While xe_display_pm_suspend/resume() performs steps during runtime
suspend/resume that shouldn't happen, like suspending MST and they are
missing other steps like enabling DC9, this patchset is meant to keep
the current behavior wrt. these, leaving the corresponding updates for
a follow-up

Imre Deak (2):
  drm/xe: Suspend/resume user access only during system s/r
  drm/xe: Handle polling only for system s/r in
    xe_display_pm_suspend/resume()

Vinod Govindapillai (1):
  drm/xe/display: handle HPD polling in display runtime suspend/resume

 drivers/gpu/drm/xe/display/xe_display.c | 40 ++++++++++++++++++-------
 drivers/gpu/drm/xe/display/xe_display.h |  4 +++
 drivers/gpu/drm/xe/xe_pm.c              |  8 +++--
 3 files changed, 39 insertions(+), 13 deletions(-)

-- 
2.34.1

