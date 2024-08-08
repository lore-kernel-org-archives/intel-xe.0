Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89727C52D7B
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 06:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E0110E648;
	Thu,  8 Aug 2024 06:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NsXvRszc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86F910E651
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 06:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723096849; x=1754632849;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ExtB6AFm2kTWX30uXGBDCrcYOjU30iuK/M3cCkeAMYg=;
 b=NsXvRszcEVlvkkaL0DB7T4kRsarl5YzCaoIvsTlvk6DIifzFeEJx5MyI
 8ecMqR5Ah/V3xhnMr+PRC9ots+Tj7rJNx9zaPH75Pn/ZTABTpNNibBxCQ
 /BXBTbTnyP17jXLvObhoKxDSnWK78qkG19wsJqPHL29NvQbhI9V+w5cKi
 r1QKD1IM1Lp0/t2k5gzaein90I8mE3ITObusbiTudoY9lpxjAL8CsiPek
 vmaPi5vuaeqb3E4PwjprvgSMjDU+54ry3t7r9sks7984pABO9FKMjmYAS
 ShK5R4NdiOAsawIXjGLqzidwqneqI+ykF2LrrIq4jRmQaxtAPwzgF/cA3 w==;
X-CSE-ConnectionGUID: +qnlYEOxShag0cv1HHuMww==
X-CSE-MsgGUID: ViRRGb8fSku3tQGAj4M1tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="25075172"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="25075172"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 23:00:48 -0700
X-CSE-ConnectionGUID: Vusbd8B2S6aIC/W3Oh56Zg==
X-CSE-MsgGUID: an+AvilDR+2duZK/95AlLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="88014193"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2024 23:00:46 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 0/2] Shuffle MCR init order and use MCR reg
Date: Thu,  8 Aug 2024 11:32:49 +0530
Message-Id: <20240808060251.510586-1-tejas.upadhyay@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series introduces,
1. Use MCR regsiter as mcr reg and write to all slices
2. MCR init order is updated to init MCR before any mcr read,
   in order to do that lets merge mcr early init into main mcr init.

Tejas Upadhyay (2):
  drm/xe: Write all slices if its mcr register
  drm/xe: Init MCR before any mcr register read

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 +-
 drivers/gpu/drm/xe/xe_gt.c           | 11 +++++------
 drivers/gpu/drm/xe/xe_gt_mcr.c       | 21 +++++----------------
 drivers/gpu/drm/xe/xe_gt_mcr.h       |  1 -
 4 files changed, 11 insertions(+), 24 deletions(-)

-- 
2.25.1

