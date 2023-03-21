Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7100BC6FD20
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 23:42:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A38010E1D4;
	Tue, 21 Mar 2023 23:42:16 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5D210E130
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 23:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679442133; x=1710978133;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7xgZe/Bi5A8XzRFrxU18DaSEagvaZ8wizgjgcNU1Hjg=;
 b=my8NfcTMjuMgSDgiG6Q2G0yflVU9bK4JTNfLJbIj3YYfUpKp8IpMSnil
 ihZTyOGXcFQ4F9t+6ByOlAlVFhERwEL94u/j0jBj9+Ow4CWJijfvliVge
 TpgMEL22eqeOTuY9vVX/b9YoiUxF112mehbMbF2v7Biv36stZXDkSdfKG
 t098DFIS2zh4RffujGuPojSqYdeBNFrzxz5L4X+IUMlpxv3U1LK9xlL+M
 7++uI5SDnBGADdXHc+B/XRb2iydLzf76/xEdHqddCUTmyStEfEX5Umz4P
 EPuZgpHrFINzpDcokn80AXGC5QFnWAzbaeckdIob2wjdE1KWxcL3+C24L w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="322926679"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="322926679"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 16:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="631780114"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="631780114"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 16:42:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 21 Mar 2023 16:42:15 -0700
Message-Id: <20230321234217.692726-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] USM locking fixes
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

Patches explain everything.

Matthew Brost (2):
  drn/xe: Drop usm lock around ASID xarray
  drm/xe: Move in fault mode / non-fault mode check to xe_vm_create

 drivers/gpu/drm/xe/xe_gt_pagefault.c |  4 ---
 drivers/gpu/drm/xe/xe_vm.c           | 49 ++++++++++++++++------------
 2 files changed, 28 insertions(+), 25 deletions(-)

-- 
2.34.1

