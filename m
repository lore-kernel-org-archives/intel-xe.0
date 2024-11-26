Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEE0D65521
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 16:43:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A87F10E940;
	Tue, 26 Nov 2024 16:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ekCC5s6k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206A310E940
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Nov 2024 16:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732639419; x=1764175419;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q6HeCtX3y2NP+yV9nY5GVZgxcddv8WxxutRmRRiSEhc=;
 b=ekCC5s6kfIJRAV1k0vRfEfZLUgd/Icp7ZdVL9hpt6/VoKeCIoTeeckSY
 0aKRyP7cQNQChd8vMVEf+4+EtMrNZlU2VRmNRTenU09yv0YTvmOX6tr5a
 E+wmEdJwkFQNUQfvfced6gR6HCzmErv74QirKrGisaJL+IDiweKrgA5se
 43XYGymPFnOU/hi3XILCMx/BXYlZbOMCSR5p81lGFs9YRZ7uiXu0T9GQC
 XDkOEObECuUzixIFxZ8MHyfd9erIUYONhdPaNgMTQp/yHOYfS9OUSNKQt
 3pxVBINZE5c4n0JlUGBDJFujXsmmedgROdQ/6T2h+FPjaNdPqN3X6j9x8 Q==;
X-CSE-ConnectionGUID: ieNfpv2ORs6e93iO61M9Gw==
X-CSE-MsgGUID: D95HcH9KRn22hK/7wE7A6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43307107"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="43307107"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:43:38 -0800
X-CSE-ConnectionGUID: dcZztCpMQReN5XkOY1kRxg==
X-CSE-MsgGUID: /uAySLY1Rwq9IPonnFzsIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="122512855"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:43:37 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH v2 0/3] Make OA buffer size configurable
Date: Tue, 26 Nov 2024 22:05:50 +0530
Message-Id: <20241126163553.449850-1-sai.teja.pottumuttu@intel.com>
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

v2:
  - Rebase

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

