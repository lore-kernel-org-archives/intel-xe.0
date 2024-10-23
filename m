Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5B8D0BB46
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 23:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B4D10E874;
	Wed, 23 Oct 2024 23:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BDrL3XQF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861BC10E874;
 Wed, 23 Oct 2024 23:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729726760; x=1761262760;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YuZi8Imxyta+JSn6SVxhtiRt7udLfmutbgCLnSuvSyU=;
 b=BDrL3XQFzeTYHcDTn+zvEahPxIDPeGLw2M2DlemaXYYk73ob5vmV3fsy
 M8vNOc7dzXtPTJti3U/ssUllQKFvn+ApPB2Kfk2tX0stDSb1P7eNTdAVu
 tUhOJ5hPFhtSC2FCppH0tVCOdDu0nl/r0fi0YlHFoq61hSXd0d82z1LoM
 Jf2Onep8TuDw84i4EvwuBiW+OP75IpjnkzRgBmXYypn0iocuWPo185gl1
 uYQSytd6igtsRiZJVyZf861xu7AeLWhgtVIJlq/77K/SdcowjYDBnPjuy
 Wx4CncundXAjxh2FMZ0X3f1badGn6+M8VOBRKaRJ1ViOcYWl/ZkIPVUma A==;
X-CSE-ConnectionGUID: a4b7g18pSbGAsDh1hqc9tg==
X-CSE-MsgGUID: fbx97zrgRharSUZsFz1qZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="33251095"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="33251095"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 16:39:19 -0700
X-CSE-ConnectionGUID: dscCV+K0QqSBJQqAGimn7A==
X-CSE-MsgGUID: 0AXj2NDLQhKXIGnHF35phA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="80420922"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 16:39:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, simona.vetter@ffwll.ch,
 akpm@linux-foundation.org, felix.kuehling@amd.com, apopple@nvidia.com
Subject: [PATCH v3 0/1] mm/migrate: Add migrate_device_pfns
Date: Wed, 23 Oct 2024 16:39:43 -0700
Message-Id: <20241023233944.1798835-1-matthew.brost@intel.com>
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

Part of series [1]. Sending as individual patch ahead of that series as
this is a prerequisite for merging.

Matt

[1] https://patchwork.freedesktop.org/series/137870/

Matthew Brost (1):
  mm/migrate: Add migrate_device_pfns

 include/linux/migrate.h |  1 +
 mm/migrate_device.c     | 52 +++++++++++++++++++++++++++++------------
 2 files changed, 38 insertions(+), 15 deletions(-)

-- 
2.34.1

