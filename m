Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335B8C3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 11:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6E610E127;
	Tue, 23 Jul 2024 11:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8ChxB91";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A4B10E127
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 11:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721734340; x=1753270340;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KIn3ZTTHvl4vCvmmUAh8Q6orJ/0GkUkfbuPTe2sFNWM=;
 b=T8ChxB9110b58cBWdxebh75skEkAwW8GcBMeuu3VEILRGKguF0vqe57M
 WLmhhubO3Y5ftS8KBjv7yFM9e7GU497VN+F13B5V5K8zYpea695hV3tDv
 oTe16B5JUQVO7VI61ODvhvBpOK0SJ50fgzuPac3rap9yAUDQuyV0cWmxu
 SNrOPhNTslGMDYPVin6UGTs+ngw+PUWf9WZ0NF6F2dhG7jaZN7dC00vfB
 AF4gogySY4FBu525hyCi6AxwbWnHjbAQfT9voPqGQiveOMlGtGhdT5OBh
 Nww3VeDwPnUvGFE/S2M4DcQ0Z0mCFn3NhAydbYLnGJqh3UPN4rbzA4W9g Q==;
X-CSE-ConnectionGUID: WOtsZXEEToC3caFlZru2Pg==
X-CSE-MsgGUID: ErL4J31HShC320oR9jENXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="29942654"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="29942654"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 04:32:17 -0700
X-CSE-ConnectionGUID: cOLH7HH2QWmbukmHdK6e0w==
X-CSE-MsgGUID: EmrjeYwmS0OD4X4BkC+fug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="89671672"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 04:32:14 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: [PATCH 0/2] Add debugfs file to dump tlb inval stats
Date: Tue, 23 Jul 2024 13:16:08 +0200
Message-ID: <20240723111610.21564-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

TLB inval stats should be useful for IGT tests as requested 
by Sai.

With this series the output looks like: 

sudo cat  /sys/kernel/debug/dri/0/gt0/tlb_stats; sudo cat  /sys/kernel/debug/dri/0/gt1/tlb_stats
GT0, TLB Requests sent: 321, received: 321
GT1, TLB Requests sent: 212, received: 212

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Nirmoy Das (2):
  drm/xe: Add sent and recv counters for tlb invalidations
  drm/xe: Create debugfs for tlb inval stats

 drivers/gpu/drm/xe/xe_gt_debugfs.c          |  9 +++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 44 +++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  2 +
 drivers/gpu/drm/xe/xe_gt_types.h            |  4 ++
 4 files changed, 48 insertions(+), 11 deletions(-)

-- 
2.42.0

