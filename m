Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CF2C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 14:03:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C8510EBBE;
	Fri,  7 Mar 2025 14:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DJqFpqLN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD1310EBBE
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 14:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741356217; x=1772892217;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bsYz9Urf0tVKbtKTnW7lIq6wJFSpTqx3Dbw19IeM8r0=;
 b=DJqFpqLNmxM2tYaKHYwRhcRmQQq+pZojg2CB4aQyfbX+F5/C24JHS1up
 /1EVdHvw05fqCxniuv2RAgZxS/XDPvXp5AnaxlYvdmRBORcwb7Q2jypve
 GtbAO7PfDnrj69MauNZNt5fcZEHl2ZJR6yWoLz7vILqFQj68fmpGooKSW
 DjmquC/ByIBbalpZ9+vXsdyh0RqLHkc+eypqmcNiIsq/ssHgL86A3zayA
 /akXZPfHdrZWTcLYqgchARClPwhnsrCE+pfVe9xTp+U6XtZbiHzIk5Ms1
 wlKvSSEoVNXv8oP1HhMPhkCQcsRCROoXUrqmlQmxJunQFNEszMOE6gske w==;
X-CSE-ConnectionGUID: AjFJBxl3SdSZb9qnrnE7kw==
X-CSE-MsgGUID: ifQ/sVjmSoaGk0tPwf2E8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59961417"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="59961417"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 06:03:36 -0800
X-CSE-ConnectionGUID: 08zcZPckRwejcGpxLj0hpw==
X-CSE-MsgGUID: SyWcnkQ5T3ySKPm3tF6qcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124552983"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 06:03:34 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, lucas.demarchi@intel.com
Subject: [PATCH 0/2] Add configfs support for survivability mode
Date: Fri,  7 Mar 2025 19:54:43 +0530
Message-ID: <20250307142446.1790715-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

This RFC series proposes to expose attributes via xe configfs
subsystem. survivability mode attribute is added here that allows
the user to configure the device to enter survivability mode.

This is done by

echo "domain:bus:dev.fn" > /sys/bus/pci/drivers/xe/unbind
echo "domain:bus:dev.fn" > sys/kernel/config/xe/survivability_mode
echo "domain:bus:dev.fn" > /sys/bus/pci/drivers/xe/bind

This is an alternative to introducing module param that causes
all the connected and supported cards to enter survivability mode.
Manually entering survivability mode is useful when pcode does not
report failure and for validation

Riana Tauro (2):
  drm/xe: Add configfs to enable survivability mode
  drm/xe: Enable configfs support for survivability mode

 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_configfs.c           | 117 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h           |  16 +++
 drivers/gpu/drm/xe/xe_module.c             |   5 +
 drivers/gpu/drm/xe/xe_module.h             |   1 +
 drivers/gpu/drm/xe/xe_pci.c                |   8 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c |  21 +++-
 7 files changed, 163 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs.h

-- 
2.47.1

