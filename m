Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886BDC83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 20:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AAE10E02D;
	Wed, 23 Jul 2025 20:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ru4OEeLq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A167210E069
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 20:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753302049; x=1784838049;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=vVNXUDN9HaOXCGg8yKdEOKegK53eiDOPYT+RdjWAQ6Y=;
 b=Ru4OEeLqy/yuguGgGbYX5OUgoZAj5MwpCvGbTbu790XAs0knugBIrFTj
 kuW1FsnYEwawNyllTo3hr1DlEXYwOqVYaLnLpb9/+dfp7MhbTzy87SmMj
 CNvg62caryCouqLo5lvx1Nzt2rvkU85dXmIFg1Gkcbgw1XLaDgnrhZr8T
 6s1Yg2NLcGBolbjXEwJpTfmOUp5XO1Hbs7hoCDftf8WTFkBmxztkMHA28
 SyVhHZfbyZq1XrgEdfsJHWwB1Pi4sqxweyFa9T7A86fOQRVj4mbxlRZsB
 3P+PiiXbxMNyE3tLOx9w1JUYszS7IvMl5HRKpOQdCwMCThFK154QeWSyW w==;
X-CSE-ConnectionGUID: 4GMKGTLkSeGRr9+aePU5Tg==
X-CSE-MsgGUID: S09SIn/zSjmBpbFgC9a/ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55558266"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="55558266"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 13:20:48 -0700
X-CSE-ConnectionGUID: ojA+nG3CQ2qZMR6qLEROlw==
X-CSE-MsgGUID: hwjgk7lsSqKye4DkelMewQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="190651572"
Received: from uaeoff-desk2.amr.corp.intel.com (HELO
 gjsousa-mobl2.amr.corp.intel.com) ([10.125.108.176])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 13:20:47 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 0/2] Tile and GT counting improvements
Date: Wed, 23 Jul 2025 17:20:08 -0300
Message-Id: <20250723-gt_count-improvements-v1-0-3016134db9ea@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPhDgWgC/x3MSwqAIBRA0a3IGyf4IYS2EhGVr3oDP6hJEO09a
 XgG9z6QMRFmGNgDCStlCr5Bdgy2c/EHcrLNoITqhVGaH2XewuULJxdTqOjQl8ytWVFIrYU1Glo
 bE+50/99xet8PiPbecmcAAAA=
X-Change-ID: 20250723-gt_count-improvements-d7be01330d73
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

This series improves the way we define values for tile_count and
gt_count. In the first patch, we move the logic that probes for
available tiles to a more appropriate location; in the second patch, we
future-proof the way gt_count is calculated.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Gustavo Sousa (2):
      drm/xe: Probe for tile count during device info initialization
      drm/xe: Use for_each_gt to define gt_count

 drivers/gpu/drm/xe/xe_mmio.c | 33 ---------------------------------
 drivers/gpu/drm/xe/xe_pci.c  | 41 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 39 insertions(+), 35 deletions(-)
---
base-commit: 4f2fec0cf7bc1faf81a924a4ba2e3d139ec42b36
change-id: 20250723-gt_count-improvements-d7be01330d73

Best regards,
-- 
Gustavo Sousa <gustavo.sousa@intel.com>

