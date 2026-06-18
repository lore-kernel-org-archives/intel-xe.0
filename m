Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229DACD98DE
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 06:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DBD10ECA5;
	Thu, 18 Jun 2026 06:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQW0Oexi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D2C10ECA5
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 06:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781763072; x=1813299072;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EoAjHVEa3dg3YNEgnkUVtpJgFgfkK0q5apagKYbFZlU=;
 b=mQW0OexiK5unP6nneszzGUPqL8HEV81dsBap/egLPtkHMLFDKkSBQFSd
 E+nw3BGCkWEyJ0vFHqDkLQxrc7fsQljcUxGktYnXwHkD90uq6X3G2O2Sg
 dG9iENFhSaIQfqE481U+kHdTXUr4Urg+x9o0/8HJJPK0z28T0OFwIj83g
 upSB8ZINpKs6fOrCPHi8SJWnVpw6QklNO3wTry69+rd3z1Zd+rNieuFFT
 6sK3O4hGum6zazEt0CRxpe9w7omXOEarDtBEFNXzK6ehy/VSoS0CHk3J6
 Ty0l/T77jMewet4i1xMs4MFzqU6Frh7GjL0MKl9pDkvzIj3HUgADK1VD1 g==;
X-CSE-ConnectionGUID: xwXfvdGLSf2MvmPg4LhqFQ==
X-CSE-MsgGUID: L2w6lKnZSDK1Qrys3QB9Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86502172"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="86502172"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:11:12 -0700
X-CSE-ConnectionGUID: DIyOvuxcScSU1YlxFjjGWA==
X-CSE-MsgGUID: xPv39EPET3K9ctaSUAER3g==
X-ExtLoop1: 1
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:11:09 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 andi.shyti@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v5 0/1] drm/xe: Add support for GPU health indicator
Date: Thu, 18 Jun 2026 11:40:54 +0530
Message-ID: <20260618061053.3307213-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
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

      GPUs commonly rely on various reactive health monitoring approaches.
The Xe GPU health indicator is intended to fit into such reactive
monitoring flows, where it could be used by management tools to fetch
and update GPU health status.

This patch adds Xe GPU health indicator support as a RAS feature.
It introduces the health command IDs and request/response structures
used by the System Controller mailbox, and integrates the feature
into Xe through the gpu_health sysfs interface.

The sysfs file, gpu_health, is created at the device level and
provides a simple interface for observing and updating the reported
GPU health state. It is exposed as read-only for non admin users while
write access is only provided to the admin users.

The sysfs file (gpu_health) is placed at the device level and behaves
as follows:

  $ cat /sys/.../device/gpu_health
  ok

  $ echo critical > /sys/.../device/gpu_health

  $ cat /sys/.../device/gpu_health
  critical

Userspace consumer (Level Zero Sysman):
  https://github.com/intel/compute-runtime/commit/3d974c6d9b65bede475c118e582761670ef110d2

Soham Purkait (1):
  drm/xe/xe_ras: Add RAS GPU health indicator

 .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 +++
 drivers/gpu/drm/xe/xe_ras.c                   | 177 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |   1 +
 drivers/gpu/drm/xe/xe_ras_types.h             |  61 ++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       |  28 +++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |   3 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
 7 files changed, 304 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras

-- 
2.43.0

