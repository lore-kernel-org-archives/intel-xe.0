Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717ADC0015E
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 21:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172F210E432;
	Tue, 11 Jul 2023 21:27:37 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2162B10E431
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jul 2023 21:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689110855; x=1720646855;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bKw+bN7fw1vpEuiq4Bk7oqnxfztClzcSl9aq38KkJkM=;
 b=ABX5SBmp3t0M7WgtduzTxKVHdgcVe7eRCOqT20scygTqKMynSeHFmlYD
 R0REr1fcoBbYZd1bcuQqimLXjUtUjuuxxcNhW9hmf2PnxFy8AJJUdNG+1
 sVqwgOs37Vkkrk3reKHzve13WK2HI4TWZMSdjBEd9TgPW0YQeYZ03j7ub
 xIAjd/Np/KHysa032ECbhZsSgFydLjOPORFNxzmBc1VP9NFTP080HcWhw
 9zUPfeRPgivEG9KX18hHvThsYxNJ7V+eleXJzpI/IjWFaPcThNgutm1rx
 aJWEjSyPlzGsCuHQCFcZ8Y29DdFL6Icfa5RgV+ufA6zrdeDbr3pOBkF0r w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="451102343"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="451102343"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 14:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="786782144"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="786782144"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 14:27:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 11 Jul 2023 14:27:43 -0700
Message-Id: <20230711212748.2029455-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/5] More VM cleanups
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

Continuation of [1]. These are the last changes in [1] that will not
break the uAPI.

Matt

[1] https://patchwork.freedesktop.org/series/117156/

Matthew Brost (5):
  drm/xe: Avoid doing rebinds
  drm/xe: Reduce the number list links in xe_vma
  drm/xe: Change tile masks from u64 to u8
  drm/xe: Combine destroy_cb and destroy_work in xe_vma into union
  drm/xe: Only alloc userptr part of xe_vma for userptrs

 drivers/gpu/drm/xe/xe_bo.c       |   6 +-
 drivers/gpu/drm/xe/xe_exec.c     |   2 +-
 drivers/gpu/drm/xe/xe_pt.c       |   3 +-
 drivers/gpu/drm/xe/xe_vm.c       | 131 ++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm_types.h | 134 ++++++++++++++++---------------
 5 files changed, 163 insertions(+), 113 deletions(-)

-- 
2.34.1

