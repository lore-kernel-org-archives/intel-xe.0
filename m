Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F0EC55182
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 04:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D915310E14C;
	Wed,  5 Aug 2026 04:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVwSP5Ww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01AE10E14C;
 Wed,  5 Aug 2026 04:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785902846; x=1817438846;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5p8CutSbzCCjkSRtMtvI1BVz0L4EGACZ5dXry1AC+P4=;
 b=VVwSP5WwgAzKvzYkfBMIXAO9hdWOd8H6RaNcqSTN6rHw0SwX8XIOmfX5
 fsofTgBCyyQSMM+QaQnk2A3cKb5kIIyPrdx620Zk/RmBkWzT+nSYYh30a
 rHHZC0B2tjq4JRBDw2itzfU3ComWGGGo2gO5hdPqGVYuldJI5/LQCbPKR
 uJdLCZaLEdFD1hm5/fIjO3G05dtPNVd7wgT0pfX+c1Jk8kIgB9l5VpbvX
 piIUHetQmitvzJYFJJ0e+dMnf6gqwJWBVDsCw7aeliKUFSDwlDONKqkqb
 z4VNdYnDLQ/9IzZAlh/bqoGiSQUhWOdGg27vhxQP1WlCs+722xzuwTdLi w==;
X-CSE-ConnectionGUID: b4NWiAMWRdK/XxwYZdIgvA==
X-CSE-MsgGUID: 9T59fM50TmqapWr7xCXgZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90143519"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="90143519"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 21:07:26 -0700
X-CSE-ConnectionGUID: 8Ka4P5tuSSueCxeD86S4DQ==
X-CSE-MsgGUID: HRSXTm4aRYKo4KpZNrwXJw==
X-ExtLoop1: 1
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 21:07:23 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 0/5] drm/i915: HDMI/PCON DSC prep fixes
Date: Wed,  5 Aug 2026 09:20:22 +0530
Message-ID: <20260805035027.3473398-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
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

This series contains 4 patches split out from the PCON DSC fixes series:
https://patchwork.freedesktop.org/series/171345/

These patches are being sent separately to get independent CI coverage
and merge as a standalone subset.

Ankit Nautiyal (5):
  drm/i915/hdmi: Use correct type for output_format parameter
  drm/i915/display: Generalize intel_hdmi_dsc_get_num_slices helper
  drm/i915/{dp,hdmi}: Pass bpc in intel_hdmi_dsc_get_bpp
  drm/i915/hdmi: Add helper to get max FRL rate for an HDMI sink
  drm/i915/dp: Use helpers for getting max FRL rate

 drivers/gpu/drm/i915/display/intel_dp.c   | 26 +++++--------
 drivers/gpu/drm/i915/display/intel_hdmi.c | 45 +++++++++++++++++------
 drivers/gpu/drm/i915/display/intel_hdmi.h | 11 ++++--
 3 files changed, 51 insertions(+), 31 deletions(-)

-- 
2.50.1

