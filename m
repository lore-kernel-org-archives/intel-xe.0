Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD00C2FC18
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 04:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81E310E3E9;
	Thu, 17 Aug 2023 04:31:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031CF10E138
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 04:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692246705; x=1723782705;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Npddnxdpz35I+7y6abtwlfGCCgoMZkEIDFUgz44hddw=;
 b=DtNA1308w4Fy7SQUGp7bgBpiCxg8NxKtLX1a1z+QIp6cq+NqTBZjSTWR
 vmsWnY4CScHqLc/JTi6zoTxdJycdXr44LB0epsq9+EMX3GKRB2p/jX1NA
 bPEIWd+W48gsMUDhWNVBEOxBGPalMo7T4vFMPjKQhFOvErXdyOGCnWuTA
 +MKRVXH5eBtgUrZmQYvG4me7J3Ov27ZV18arMzpt8XTEg5itx0Dpyy2+x
 x4LkHEno7Ko4o9QlAdC7cApw9qI0i5EMDs49AZF1JiNQsAOS9cNFCrxFP
 NBmxR+TR+MNx1H6bu3iNbF5VYoi8ysHFkG2VmfOqyeGGBCRGFNhLNUWLw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371608918"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="371608918"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 21:31:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799875021"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="799875021"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 21:31:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 16 Aug 2023 21:31:45 -0700
Message-Id: <20230817043148.740495-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] Fix array of binds
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

Patches should explain the issue, fixes:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/528

Matthew Brost (3):
  drm/xe: Fixup unwind on VM ops errors
  drm/gpuva: Add drm_gpuva_for_each_op_reverse
  drm/xe: Fix array of binds

 drivers/gpu/drm/xe/xe_vm.c       | 422 ++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_vm_types.h |  10 +-
 include/drm/drm_gpuva_mgr.h      |  10 +
 3 files changed, 236 insertions(+), 206 deletions(-)

-- 
2.34.1

