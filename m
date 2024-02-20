Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55993C54764
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 16:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2475310E4EE;
	Tue, 20 Feb 2024 16:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g566J10O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9824510E4ED
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 16:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708445984; x=1739981984;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LRm1GJQ3ftxAGLiG8dPXhTMd5EEbZu1Z/ER+sPQITaE=;
 b=g566J10Ou5CGKdBabceI6mw3NL67pXNQz8vrYJGvUnhCIhp88O0Bva/g
 Jwrvn6f+YNHPI4tjY92DgWEGjDQDRcHYdI2AGNufnqoljD7vNAQdF4s4B
 iy2vchGnvQhYi5SCeA0iDNlFL6f+b4vYBC76NGQCjOvtAN2KGiQuAMuD4
 /c56SR19GQW8lXQSQCa/BpMzXy2y7xVHemv7aNNjE1H1TNgpSXwAxcugJ
 xeVX+uR1Em/gOzqpY32keokPS36BurFid7RRTC59GiqI4e085jQmTK/qT
 8d5sm6i92DFb2JmSfcnxZdUpfGIg9HHW4DaTXWS+8ogGcyVWqLPlZbA/e Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13959815"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="13959815"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 08:19:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="42314439"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa001.jf.intel.com with ESMTP; 20 Feb 2024 08:19:43 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, Wajdeczko@freedesktop.org,
	Michal <Michal.Wajdeczko@intel.com>,
	Alan Previn <alan.previn.teres.alexis@intel.com>,
	Matt Roper <matthew.d.roper@intel.com>,
	Stuart Summers <stuart.summers@intel.com>,
	Jose Souza <jose.souza@intel.com>
Subject: [PATCH v10 0/1] drm/xe: Add helper macro to loop each dss
Date: Tue, 20 Feb 2024 08:19:36 -0800
Message-Id: <20240220161937.11714-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add helper macro to loop each dss. This is a precursor patch to allow
for easier iteration through MCR registers and other per-DSS uses.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Suggested-by: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Jose Souza <jose.souza@intel.com>

Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Changes from prior revs:
v10:Change macro pointer type for uint to u16.
    Fix macro parameter typo. Updated function kerneldoc text. 
v9: Updated function kerneldoc text.
v8: Chang range check to assertion. Add function kerneldoc
v7: Updated commit message
v6: Optimized for_each_dss_steering macro
v5: Reduced 2 checkpatch warnings
v4: Revert function name with mcr back
v3: Rename functions with mcr removed
v2: Resend with cover letter

Zhanjun Dong (1):
  drm/xe: Add helper macro to loop each dss

 drivers/gpu/drm/xe/xe_gt_mcr.c      | 40 ++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_gt_mcr.h      | 16 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.c | 31 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_topology.h |  1 +
 drivers/gpu/drm/xe/xe_gt_types.h    |  6 +++--
 5 files changed, 83 insertions(+), 11 deletions(-)

-- 
2.34.1

