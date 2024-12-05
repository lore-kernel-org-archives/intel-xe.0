Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4B8E7716D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 04:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E585D10ED98;
	Thu,  5 Dec 2024 04:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZumKcllF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BB210ED98
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 04:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733372875; x=1764908875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U7gKAKCc+9mpLnO4tzVuOJ9AwGgfbhdW6obzWx29Ofo=;
 b=ZumKcllFockOQ3GFCTun8MSafnyqyVa9QmlWFa5V1iwvzQK/JWWC0w29
 7B8rUiqghDMjmVOO8TjIcVgmDqJCj+NRY1QxTEtGGbO0Gjfub6sMb7kCh
 jPm0XMTyagSL8SyQGfO+TTLObZ/K4Doyj6tpb9PfdiAHOlvCkyk3A56B1
 zVLdMXwHuH9yRfDBlu6z021wmSe1PSsbvIcFoZx7A5BOXfypIe2Gw54aB
 Ex6hRUO4U62tp3TUDi5Ehsv2eV9E/fYiRwe3RvnCNiivkukSeYz+f4xhI
 FMHl/agmuECdrPg6gaREMI9BqUm8E40nXyUnRdcLbtgJ0A2A3FgUxuND0 A==;
X-CSE-ConnectionGUID: T0wXcFZtQB+jUkl1sdvZZw==
X-CSE-MsgGUID: Sr9PYlaSR/WeylKIJrddSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33005413"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="33005413"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 20:27:54 -0800
X-CSE-ConnectionGUID: Jx54eRxqS5G+vCXcuiUL8A==
X-CSE-MsgGUID: 2Fm3kznMRbO6rVmSwLX1rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="93844501"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 20:27:52 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH v3 0/1] Make OA buffer size configurable
Date: Thu,  5 Dec 2024 09:49:12 +0530
Message-Id: <20241205041913.883767-1-sai.teja.pottumuttu@intel.com>
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
v3:
  - Squash the patches into one patch [Ashutosh]
  - Patch specific fixes mentioned in the respective patches

Test-with: 20241204161606.363295-2-sai.teja.pottumuttu@intel.com

Sai Teja Pottumuttu (1):
  drm/xe/oa/uapi: Make OA buffer size configurable

 drivers/gpu/drm/xe/regs/xe_oa_regs.h |  9 +----
 drivers/gpu/drm/xe/xe_oa.c           | 55 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_oa_types.h     |  2 +-
 drivers/gpu/drm/xe/xe_query.c        |  3 +-
 include/uapi/drm/xe_drm.h            |  9 +++++
 5 files changed, 56 insertions(+), 22 deletions(-)

-- 
2.34.1

