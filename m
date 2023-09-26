Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2DAE7E638
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 14:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0599610E3EF;
	Tue, 26 Sep 2023 14:29:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D7210E3EF
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 14:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695738563; x=1727274563;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zPUvn9mukoc2xZrkWCjjnTkrEcVkX6Ag+MD+wjHruEk=;
 b=WMT0YB3Db/1ERCXGHSIgtEcTD8FQs6BUmcldb1fodRsiF7VV8UXFH4NU
 gnE8pO0dLIft1/egmKAXG2PQyYQf6f2RRC0wHzAJHT3QtsTaDsGWrtsg2
 OId0cDduPgnOiJwNojLBL+pZLgM+4ZMSdcIpdzA8ezGsg1bdIcTUTMKuG
 qu4VjS4czCeiGrrE1Cr9aSCYikvKfuhHnwChaDIWEI/Kcq7pejSFjzbNf
 GvDp9NBD2r5VIAXzkiGboaxogoYr8eIzBAqk5d4U4RoFt1gxdE51sCJVW
 pwDUgNnuCRFtm2uT71hC/ez5wHCDoxpb9w/4zTm294zrhF4OPfdtiQ/hu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385425147"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="385425147"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 07:29:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="1079726662"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="1079726662"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmsmga005.fm.intel.com with ESMTP; 26 Sep 2023 07:29:21 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 20:11:18 +0530
Message-Id: <20230926144120.334009-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] Add some performance and frequency sysfs
 nodes
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Adding base performace and vram frequency attributes to sysfs.

Sujaritha Sundaresan (2):
  drm/xe: Add a couple of pcode helpers
  drm/xe: Add base performance and vram frequency sysfs attributes

 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/xe_gt_freq_sysfs.c | 218 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_freq_sysfs.h |  16 ++
 drivers/gpu/drm/xe/xe_gt_sysfs.c      |   3 +
 drivers/gpu/drm/xe/xe_pcode.c         |  28 ++++
 drivers/gpu/drm/xe/xe_pcode.h         |   3 +
 drivers/gpu/drm/xe/xe_pcode_api.h     |  19 +++
 7 files changed, 288 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_freq_sysfs.h

-- 
2.25.1

