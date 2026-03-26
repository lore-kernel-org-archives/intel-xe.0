Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1CD10AB828
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 21:01:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDD710E315;
	Thu, 26 Mar 2026 21:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1o9n43a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E4B10EAEF
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 21:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774558884; x=1806094884;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QvthXe6CxDdsQNp+xRNLXQU4Alu1Ng4Ukz1F13duda4=;
 b=c1o9n43aR0O3UWg2AJhsB5azBYccnUY8ZiEB58VHcI15Csj4sPkxTHjD
 yz2bCF5JCwO5UEMNzgFAWkAlt8AQNegSZVca/fNKM3m28A4eeYcK+atmt
 U3S+pVuDsM/28SrKqqCx9yfrTSROOVL+egP0NfZDu0Vs6CEsf/AE1vQU+
 bXveANfvCAaR/R8rB+wgnDhIalbwjyM//tMxajGcxFxNUm+PUTJAnlEC8
 4ddSpMOxC1aExfrvM+V88CDZnJdMRmGCP7JrkVe6IYqnVpE2gPBbrTH9H
 AaDIVumpMLiZrcafibeoXFvY6kcXmlZANCgtjkhOiAiG1ZQ25YBe+umZl Q==;
X-CSE-ConnectionGUID: yjXz2uF0Rw2vufX/nEI9Gg==
X-CSE-MsgGUID: MXH1KQyCRDKYDfwchOdzdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="98251875"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="98251875"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 14:01:20 -0700
X-CSE-ConnectionGUID: 0n+D0omYTNSIRJ7OOYXmMA==
X-CSE-MsgGUID: c7ZGKc2xTA+0GJMSZXLFIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="229182394"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 14:01:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] Wedged memory reclaim fixes 
Date: Thu, 26 Mar 2026 14:01:14 -0700
Message-Id: <20260326210116.202585-1-matthew.brost@intel.com>
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

Annotating workqueues claim showed a few issues with wedging and reclaim
[1]. Fix these.

Matt

[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163245v1/shard-bmg-8/igt@xe_survivability@runtime-survivability.html

Matthew Brost (2):
  drm/xe: Avoid memory allocations in xe_device_declare_wedged()
  drm/xe: Drop registration of guc_submit_wedged_fini from
    xe_guc_submit_wedge()

 drivers/gpu/drm/xe/xe_device.c     | 27 ++++++++++++------------
 drivers/gpu/drm/xe/xe_guc_submit.c | 33 ++++++++----------------------
 2 files changed, 22 insertions(+), 38 deletions(-)

-- 
2.34.1

