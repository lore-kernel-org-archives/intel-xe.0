Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11CECAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 11:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4281610E11F;
	Thu, 18 Sep 2025 11:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dR0LzTpM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1AE10E11F
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 11:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758196126; x=1789732126;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0lW1VKeUuykxRNRX+qQgz5LNxTagThrJHKg4GBMrKUk=;
 b=dR0LzTpMwlh8gJh5lJz4J2zcMdSYRrYV++MATidTCaYYaO+jp7HEMZc1
 Hapx4dOkf9t/OGwE54WtEzDf/jP4nOEASMXqqjTZ0uisQ2yc0QaHKhfDq
 Z+6UAkz5uGrFZpQjnpxiGtoZR8oMtC+nBqDcv+nOHdiUPtKHjJ+UoRpIB
 I1jPeXhgi2Uf7SWEtvC6Nq1BtmPs2OCZMCRwKEFNBYvEXXZwhE0oLFkPx
 hlyqg4eB35y7lgRGpk2OuOsYcLnozWvMeZ4V0bk/IhEJFrJyXonGP3jI/
 l/u5bPjQ3wpHc0NC9aUESXK8UxIoHyhZYX4p8SRbki/dTXNBrHlPCykNd A==;
X-CSE-ConnectionGUID: bbsPZrEORS+9Ef5le2PoEg==
X-CSE-MsgGUID: teV1cxciQTeGfHzJMSlYbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="59563310"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="59563310"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 04:48:46 -0700
X-CSE-ConnectionGUID: bU4RjCCwQSuctVcErOnXMA==
X-CSE-MsgGUID: Dh4tYm8kS+uH1SHHW2QsVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="175092840"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa009.jf.intel.com with ESMTP; 18 Sep 2025 04:48:43 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, michal.wajdeczko@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 0/2] Drop redundant runtime PM usage
Date: Thu, 18 Sep 2025 17:18:02 +0530
Message-Id: <20250918114804.2957177-1-raag.jadav@intel.com>
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

This series attempts to cleanup runtime PM usage in a few places
where applicable. Feel free to join in and help find other similar
cases.

Raag Jadav (2):
  drm/xe/hwmon: Drop redundant runtime PM usage
  drm/xe/sysfs: Drop redundant runtime PM usage

 drivers/gpu/drm/xe/xe_device_sysfs.c | 10 +---------
 drivers/gpu/drm/xe/xe_hwmon.c        |  8 --------
 2 files changed, 1 insertion(+), 17 deletions(-)

-- 
2.34.1

