Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055BAD3B9A7
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 15:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D3910E13A;
	Tue, 26 Nov 2024 15:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhTK+7Gi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9284C10E13A
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Nov 2024 15:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732635035; x=1764171035;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QYaXhOB68aL36iLqllTPyl1L5sG2MxbEU8bGFtcTMPw=;
 b=BhTK+7GiYbGK0sTkAh9RdYilqjV07G2UnQqFzJ1YN/PocHJAq4kj3utG
 x2+2AxJXwHVOt35OFINlChM0LrcyKP6WJnMrEpx5QtKE4Oxcs8cKQQlZZ
 jdge/ztflrgmkLlnEm9sWOTAQrZ0c2r3M136aQTm0mxKXctMgrDUj8vNZ
 sm3WaQKXPtOM6kacKsJ/8sPQTw8SFmhZE3p980Hnuv3IHHDAVOxRMyB94
 DGkUiygoBInvH/mvx9fJKyfsdIM+kWtImZVjM9449FUwLIoVMpxQ9UQ9e
 tTBPbviXTxJwiHUu6uaIacIr6NUO8/PYwVdRHqXuId+j52kFET5OMm/mb g==;
X-CSE-ConnectionGUID: +E6oQgiBQd+9rQ0U/crh1w==
X-CSE-MsgGUID: k+d3/p6IRl6wMBAqOfvvRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32960706"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32960706"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 07:30:35 -0800
X-CSE-ConnectionGUID: 98f9wn3KRvGYJQ8j/HRfSg==
X-CSE-MsgGUID: uDdQUd3hRhSHHCSAtcrknw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="96706999"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 07:30:33 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH 0/3] Make OA buffer size configurable
Date: Tue, 26 Nov 2024 20:52:47 +0530
Message-Id: <20241126152250.371478-1-sai.teja.pottumuttu@intel.com>
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

The patch series makes OA buffer size configurable by adding
a new property DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE. With this
OA buffer size would now be configurable between 128KB and
128MB.

The patch series also takes care of the respective register bits
required to enable >16MB buffer size and removes hardcoded instances
of OA buffer size.

Note that a link to the UMD patch using this property would be posted
in the coming up revisions.

Ashutosh Dixit (1):
  drm/xe/oa: Increase default OA buffer size to 128 M

Sai Teja Pottumuttu (2):
  drm/xe/oa: Make OA buffer size configurable
  drm/xe/oa: Remove all the instances of hardcoded OA buffer size

 drivers/gpu/drm/xe/regs/xe_oa_regs.h |  1 +
 drivers/gpu/drm/xe/xe_oa.c           | 56 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_oa_types.h     |  2 +-
 include/uapi/drm/xe_drm.h            |  7 ++++
 4 files changed, 54 insertions(+), 12 deletions(-)

-- 
2.34.1

