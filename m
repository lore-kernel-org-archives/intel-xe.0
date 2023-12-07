Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B02C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 15:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFF910E8B5;
	Thu,  7 Dec 2023 15:03:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4058210E8B5
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 15:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701961408; x=1733497408;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wifSCoVZTP1lKmwlo6zx3gUNkMaNK6gotsjGjd0LO+w=;
 b=QNW8Oeb4wU4By06jWL0mQ2UXOmDvjP5zsBWuWI5ikHxXNUMPEEI6uunq
 Js2r94N4ogiSDXAh27O2j3t5d+GWk74geIi3KtLp6Tyus4yWT7gsZN4tp
 msqXEcujwEMGM/biheXyv1l4U1CJ2Qs2cEdBST2fKB95mhiNXkd5v6anR
 mhqhlOfRYFoMy9t73t74Q0JaDhNdvLZE3MXCu/ssrIa5oiCzUny3zwcVO
 Qozq4KYWRxLkgyl5VExZBhLAUk7Bv3hvkpNX1EiWzLKV7gDfmvmEbx6oP
 3Em1N3O636xXBOWzo3L4MWL72Z3mCjEqAK0nr9Tw6Qmb6z4mYG2naco92 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1348921"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1348921"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 07:03:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721491057"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="721491057"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga003.jf.intel.com with ESMTP; 07 Dec 2023 07:03:22 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [v3 0/2] Add memory sysfs directory and attributes
Date: Thu,  7 Dec 2023 20:47:37 +0530
Message-Id: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Create another layer of sub directories to clean up memory/vram
related sysfs path. Additionally, introduce the vram frequency sysfs 
under a the new path.

Sujaritha Sundaresan (2):
  drm/xe: Add a new memory directory under tile
  drm/xe: Add vram frequency sysfs attributes

 drivers/gpu/drm/xe/xe_pcode_api.h  |   8 +++
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 101 +++++++++++++++++++++++++++--
 2 files changed, 104 insertions(+), 5 deletions(-)

-- 
2.25.1

