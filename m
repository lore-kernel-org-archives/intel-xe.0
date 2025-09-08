Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8E5CA1013
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 10:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A7110E4B8;
	Mon,  8 Sep 2025 10:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLiuyJHc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D4D10E4B8
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 10:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757326863; x=1788862863;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H/lehthTW1w8R6UhUdvxEsvcqIxVB+8a1v2oFgXV+HA=;
 b=QLiuyJHchtgG/xkLUoZs3imqQA+CgHu0Id6jGO12RLb0FaEdW8thZj4t
 pQqkRVJOkdFIttVt1PX0JGCQ+HQeJys7UhyX5E541sw5PhDewuHvVUL88
 btmne0i7bNhOjx0knZViqtcLjLQJY4s74BUafBE2u3wxZGkYsbEiWSMpv
 IEixJm4afHQ8pMsnEhTPkgS7krlSMbEA2XKY0Rz9FBPDmwm0KzuRuaUH8
 H6/GcTjNIeE4KQPlHRO1SwJA700sGFPFNiNdazTFAbSTM2OYnwzRUajiG
 Iz8gXdViWkV/ZV2tzBXfF5ymf8ushaIrPNq6CM5uOb+hU9AkxLnFQPY2p A==;
X-CSE-ConnectionGUID: rtpjTL0pQxyt+SUUQGNb6Q==
X-CSE-MsgGUID: Yb54UBTkR3iM5EoTzzmcxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59276864"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59276864"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:21:02 -0700
X-CSE-ConnectionGUID: 8O6k7L5RRY2HUWyzumE5eA==
X-CSE-MsgGUID: eDwN+Uu+RxKoKwuEB104EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="177981282"
Received: from abaranow-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.83.253])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:21:01 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] GuC CT devm actions improvements
Date: Mon,  8 Sep 2025 12:20:50 +0200
Message-ID: <20250908102053.539-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Michal Wajdeczko (2):
  drm/xe/guc: Always add CT disable action during second init step
  drm/xe/guc: Don't invoke disable_ct action during replacement

 drivers/gpu/drm/xe/xe_guc_ct.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

-- 
2.47.1

