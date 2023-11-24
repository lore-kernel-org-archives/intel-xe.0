Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31371C61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 12:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05CB10E1C8;
	Fri, 24 Nov 2023 12:13:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CC510E1C8
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 12:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700828035; x=1732364035;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jdWQ2U0epMAWShxk1DiHjLyRt48WxPVsHYLA/Jzar9o=;
 b=f6DQ25f8xJTHtBBlCLGlH5yaQBU2C2NwJ6Pv4dI88B0ZGX19wLBTnxYc
 UnDr6R6Bc6hrPOHI9vFjcFKLkQKDh4UUImcJzeG4IGuCDAzDnCjXgEqpW
 EgJApxS8hPE2LqkA7AMOrjNh2vqfT/fyOmZALflcQS8pNR4CgBUTC9DXU
 IxUWtzLLPfdu7gPDwA4/9Uo/Pjwc/yPu68xJn8XFRFDhkbu+t3mBd1/Os
 6rAOcacvXnGxkSVoNhAquhRlWvLqJtbNRplWeJmmge6PiOOgwogfVqtm7
 tiKKK65iGV71+txSVXmZ2Rr1sv8Gy3EFxSBSP6wvPjaUhZbsQqN3MQp4N w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="396319883"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="396319883"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:13:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833679727"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="833679727"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmsmga008.fm.intel.com with ESMTP; 24 Nov 2023 04:13:51 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 17:57:53 +0530
Message-Id: <20231124122755.91279-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Add memory sysfs directory and attributes
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
related sysfs path. Also introduce the vram frequency sysfs under
a new sub directory.

Sujaritha Sundaresan (2):
  drm/xe: Add a new memory direcory under tile
  drm/xe: Add vram frequency sysfs attributes

 drivers/gpu/drm/xe/xe_pcode_api.h  |  8 +++
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 90 ++++++++++++++++++++++++++++--
 2 files changed, 94 insertions(+), 4 deletions(-)

-- 
2.25.1

