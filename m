Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD88CD597AA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 21:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A27F10E66F;
	Tue, 12 Nov 2024 21:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGjp+/Ep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7059210E66F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 21:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731447784; x=1762983784;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PyA8SPpUOzeW+V4RL4xrS3OBs+2xk7mvId7B+7E5RS0=;
 b=fGjp+/Ep32haZuewOAsLBr9fDS0cg9ahRHdhXY9/X+rSaxhL1tTnI4Xl
 e7tG1JhxtTBOlbH0CCHeCw4DQ5dg2BatOwx7nHfQG50jl+5ds2cX8DiZP
 WB83DU+8nb/BpBcrCRHKd2mf7KETknSQV2S3u6ixB/jU5JBzKVutKELLO
 tDlAhJbSmdCJ7YN8JWfRE9+yy8Wf4veS0L5y4Sg73WPlArOQn+Bab9xca
 GN6YwWZFzFILFOl6UAFdUq+ApNBjEM46vMD1uiRVLJ8DhxNbpLT1RR/d5
 8Mr3c/GldB7xEMSPjMhsapJZBo+gezS0P2iB74yty/fZ/dsHjYO2Nk29v g==;
X-CSE-ConnectionGUID: v30SMBStRIu573XkihMX1A==
X-CSE-MsgGUID: 9YM/TRZYSkW8q4AhhLf0tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42700641"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="42700641"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:43:04 -0800
X-CSE-ConnectionGUID: ua1XlkFKSbeLI6ksS4HT2w==
X-CSE-MsgGUID: hN2vxDVYQMeyXksUdR4LEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="110968296"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:43:04 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: sai.teja.pottumuttu@intel.com
Subject: [PATCH 0/1] drm/xe/oa: Increase default OA buffer size to 128 M
Date: Tue, 12 Nov 2024 13:42:54 -0800
Message-ID: <20241112214255.3580459-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Test-with: 20241112185901.2326879-1-sai.teja.pottumuttu@intel.com

Ashutosh Dixit (1):
  drm/xe/oa: Increase default OA buffer size to 128 M

 drivers/gpu/drm/xe/regs/xe_oa_regs.h |  1 +
 drivers/gpu/drm/xe/xe_oa.c           | 10 +++++++++-
 drivers/gpu/drm/xe/xe_oa_types.h     |  2 +-
 3 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.41.0

