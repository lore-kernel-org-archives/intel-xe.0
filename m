Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0A5E77198
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 15:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0251410E328;
	Tue,  7 Jan 2025 15:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYFO584k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0BE10E710;
 Tue,  7 Jan 2025 15:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736264559; x=1767800559;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fA7CMA11Qw4DTDub+jfMpSojxEdXHZaLNnYyCHIeSfo=;
 b=jYFO584kmL9p5M/UC0lmAUrt9is8MXcJr06imNqyAA58Nz4L9OIQ2W+d
 s/WmWsrIUnhSGC34mTauN5go/2+GLy2oRkPNmDwaiSjIS2mQys+lzxINN
 dHpPNRr9akYnbmf5Nxw00MS24phQDK4dNJ+1evmetLrlVdRHNNPI7Cm/S
 FMWkqY8To9J3JJViw8QEacz63bPL4bkB19dmUjycLDwHW5ZteQ6kTH3Ay
 MZf3kCMBCImIWj7NUbzH1oTb+2D2I3kyQTF5i+0dXdQU5JhAWh+vTssQm
 ArvqhBwVdroC4oGrkjtF8g0rxY8pOH18NlO4euUCHxSb4z5Yi5jCFESD3 Q==;
X-CSE-ConnectionGUID: zMmcGvvCSTm6FxEnkWsuWg==
X-CSE-MsgGUID: BxXVrXhPRia6xJEfqJEQNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="46950251"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="46950251"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 07:42:39 -0800
X-CSE-ConnectionGUID: aXFzjChES+GakfutdCUdNg==
X-CSE-MsgGUID: IbXgNmH5TSyXLFRDCnu3tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="102867507"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 07:42:36 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V6 0/1] Add mmap support for pci membarrier
Date: Tue,  7 Jan 2025 21:17:49 +0530
Message-Id: <20250107154750.2942358-1-tejas.upadhyay@intel.com>
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

Test-with: 20250107140023.2940684-1-tejas.upadhyay@intel.com

Tejas Upadhyay (1):
  drm/xe/mmap: Add mmap support for PCI memory barrier

 drivers/gpu/drm/xe/xe_bo.c     |  16 ++++-
 drivers/gpu/drm/xe/xe_bo.h     |   2 +
 drivers/gpu/drm/xe/xe_device.c | 103 ++++++++++++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h      |  29 +++++++++-
 4 files changed, 147 insertions(+), 3 deletions(-)

-- 
2.34.1

