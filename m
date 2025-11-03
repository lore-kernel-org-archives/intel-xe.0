Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56F3CCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 12:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8598510E3C7;
	Mon,  3 Nov 2025 12:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdOiv4MA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2947E10E1CD
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 12:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762173083; x=1793709083;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bmVLlgyk0rjsjGsgo36us3Y3HMzn/xiK57n1v85wij0=;
 b=EdOiv4MAOGnXZz7ezkcmBANHrhuip8qN2JKzCrO+UBjCR0dlIeGKLjsn
 UFLU3vkQcG8TLCMwPwvUVzpv+P3f9aGsQv6nKVVcx8oE/q/hPCEDDNvIE
 llU93QrLwE3d0t+z1t+BJ+T3FqJzpcsPtVNRk/ekMR/QbIHCpUqMIOtrF
 1wXrFmw3ISryrqDMKDYK4iBaiLQG9kd9HjMipxz73MTjrLicfO+idrw59
 93xfWrzhXb9xl3YO1rAEqc4k3JWjISq1s4NvD6rf1xMGO9+BHky7rBJ+E
 O07HAi8VxflNlcc9KP9Z255VDKFEitZ4lSjtNGMPcRPPTA2Ue7bEsbWKC w==;
X-CSE-ConnectionGUID: 9+0g8VxNTt6A8Ejmdbyo5Q==
X-CSE-MsgGUID: ZGYH1Z9dTHiNIhfJAIVlSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64397353"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="64397353"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 04:31:23 -0800
X-CSE-ConnectionGUID: eRONZ5gVSB+0oGaadZqcuQ==
X-CSE-MsgGUID: DwRJcIGVSqCslWzqQlPEWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="187171970"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 04:31:21 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v3 0/2] Fix user-after-free during driver unbind
Date: Mon,  3 Nov 2025 18:01:45 +0530
Message-ID: <20251103123144.3231829-4-balasubramani.vivekanandan@intel.com>
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

There are a couple of worker threads in the driver which could be
running while unbinding the driver. Ensure those threads are stopped
before unbinding the driver to avoid any user-after-free from those
workers.

Balasubramani Vivekanandan (2):
  drm/xe/gt: Synchronize GT reset with device unbind
  drm/xe/guc: Synchronize Dead CT worker with unbind

 drivers/gpu/drm/xe/xe_gt.c     | 7 +++++++
 drivers/gpu/drm/xe/xe_guc_ct.c | 3 +++
 2 files changed, 10 insertions(+)

-- 
2.43.0

