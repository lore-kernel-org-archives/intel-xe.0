Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D815DC79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 15:49:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADEA10E1E3;
	Fri,  4 Sep 2026 15:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJTHHZoj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BC410E130
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788536960; x=1820072960;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e+m15GEqVPt2z8ZZuLwCkN1OlapOKYEmDaRxkww6MeI=;
 b=VJTHHZojg3xG9u5+2hA5i7HNYULyac5O59ThJFEIG9x+AWheif9vOooP
 ghl56l3B+qZzP7LHT/ExBnzCi3Io7S3zd0etfVihUKrYiMrxjnZNcPwBf
 pMIVGASBUadwn+nzytwwdkyzDY25GQpgjkDvSFtGvqMd+iC9MPNpdQhcX
 3zUdRdcvwwkzmjiZQaKTAaNozp/N12FPZO2K6aBIDueJpKj2zMPdkAXjk
 x38NFBzR7kzO3HLGbYbGr0+0ysREkBhpIQE6oluIistuCyLIagAd6rWw7
 N0TkyVjLkKa4jltZ6biDJNKEm3+QpxBiTKGJwyyMh73W5IT1c0CZtLsqB Q==;
X-CSE-ConnectionGUID: 7tAzsH7PSXOBI4ppBhg2eA==
X-CSE-MsgGUID: ntJN0zJmQeymPIz70wE5fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100563153"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="100563153"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 08:49:19 -0700
X-CSE-ConnectionGUID: TIwV4XOFQZy3ZYMFj9aNRg==
X-CSE-MsgGUID: K4x/rq3PQ4qz7HtrSjXkcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="263871878"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 08:49:16 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, heikki.krogerus@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 0/2] Expose device sysfs for AMC and GPU UUID
Date: Fri,  4 Sep 2026 21:36:09 +0530
Message-ID: <20260904160608.2004174-4-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
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

Expose device sysfs entries for AMC SMBUS alert reason and GPU UUID

Badal Nilawar (2):
  drm/xe/i2c: Expose AMC Alert reason sysfs
  drm/xe/cri: Expose device UUID through sysfs

 .../ABI/testing/sysfs-driver-intel-xe-amc     | 21 +++++++
 .../ABI/testing/sysfs-driver-intel-xe-gpu     | 10 +++
 drivers/gpu/drm/xe/regs/xe_regs.h             |  2 +
 drivers/gpu/drm/xe/xe_amc.c                   | 61 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_device.c                |  3 +
 drivers/gpu/drm/xe/xe_device_sysfs.c          | 36 +++++++++++
 drivers/gpu/drm/xe/xe_device_types.h          |  3 +
 7 files changed, 133 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-amc
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-gpu

-- 
2.54.0

