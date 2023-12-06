Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAB2C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 04:33:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A2810E00B;
	Wed,  6 Dec 2023 04:33:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9763D10E00B
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 04:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701837197; x=1733373197;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DO/yDu2XryktUGBuQnIhvZs1ZXzP9OeY4d/i2u7bPwA=;
 b=BzatrCq5D3DNlo6P/ak7CbIJ9TWI8wV12odmyWPBzdU50+6TTOejgdGO
 fNd+AtHBE13QnJyXg4rNZLNrJ2dpvABf6KqfiLNwVD0FKFwzJgEPqkguc
 7aBOAg5Q+PAgW77dScCIKEeLWREXjci9BW1b3D0ORvGF0G9awyGCo+aVU
 qazj2Qub/y/Ab4byeZCBE+pHtsmNTu+n9xCPpVOkAMAkO5kivBeREXsz9
 sb/fBHkYLK+cRcCrI8rV2p6vztbhoeXUxhT16aGdsjqqHHnQ9i5uOJ7tP
 NCizmiP39ZR+Gu6PbzzrFYA88ynp1QJeeEOlCNjPbdAhklE3hCbgMY3pw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="379023486"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="379023486"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 20:33:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="800216677"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="800216677"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga008.jf.intel.com with ESMTP; 05 Dec 2023 20:33:15 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 10:17:33 +0530
Message-Id: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [v2 0/2] Add memory sysfs directory and attributes
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

Create another layer of sub directories to clean up memory/vram
related sysfs path. Additionally, introduce the vram frequency sysfs 
under a the new path.

Sujaritha Sundaresan (2):
  drm/xe: Add a new memory directory under tile
  drm/xe: Add vram frequency sysfs attributes

 drivers/gpu/drm/xe/xe_pcode_api.h  |  8 +++
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 87 ++++++++++++++++++++++++++++--
 2 files changed, 92 insertions(+), 3 deletions(-)

-- 
2.25.1

