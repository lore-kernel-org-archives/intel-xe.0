Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A2FC46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 11:24:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CFD10E0E4;
	Tue,  9 Jan 2024 11:24:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB3D10E0E4
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 11:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704799477; x=1736335477;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ljLoo6s5U8jyEaD51F4HI2p081zYQnU8TqgCnB8GNME=;
 b=J26fmnV9N2mygr8TvXeuzGNTWCY47qnohVIFHMTb2MYDgwWYOQTm4XbN
 vp9iyut/eml9bufIlycAvCBbtrx2nV6AvjvKYdXC469D6K+XDoWNQH3TK
 NzFkuJ8AQB6hf1rc98wE7dpH8x+VLuSTRpNOpXnzkdl/jRbJQ4FLgWeSN
 0A9P/+He5nRO/32mLj7LctZ1vze4tL5ylLamIbQv0CbBZgAi+NrQfgOL5
 nbtZasXKWosPW+mnL9j4+90Yqu7jbPpKAfJC895cWPwniF9dplOxoKiKE
 3CRJkRyjnanEsAly9vTLF8pgjwflO4PpFhTFzn1v4EWnbzBZsshzqREhO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5537191"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="5537191"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 03:24:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="900737570"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="900737570"
Received: from djustese-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.147])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 03:24:20 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/4] drm/xe: Silence a number of sparse warnings
Date: Tue,  9 Jan 2024 12:24:01 +0100
Message-ID: <20240109112405.108136-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Sparse complains about a number of missing or conflicting __iomem
annotations. Fix them.

Thomas Hellström (4):
  drm/xe: Use __iomem for the regs pointer
  drm/xe: Annotate xe_mem_region::mapping with __iomem
  drm/xe: Annotate multiple mmio pointers with __iomem
  drm/xe: Annotate xe_ttm_stolen_mgr::mapping with __iomem

 drivers/gpu/drm/xe/xe_bo.c             | 4 ++--
 drivers/gpu/drm/xe/xe_device_types.h   | 8 ++++----
 drivers/gpu/drm/xe/xe_mmio.c           | 2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.43.0

