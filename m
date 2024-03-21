Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1F4C54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 22:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5555A10FD2D;
	Thu, 21 Mar 2024 22:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQDCqmE/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA5F1121CA
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 22:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711059438; x=1742595438;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZI8G3mNgf4DrJ7xYfKXZjyl91trs4b6TZuPZ9KQEweI=;
 b=hQDCqmE/drfeZPUyoaeMJYcJ5IvwtUsOyiJ8CMlZ5OPWwsE77Mnuxw8n
 MJq77uT63wLQerdGx72VUn3FIHeK0Gz1JP67WVMZiVuMNAtay8AWMRjQt
 j5IBohN/k1aTIdM4YjNGoGMqrzxDkWzKVJHDt+IP2DA06pmCBhSfHU3OS
 DHYpMXi1Hm1cBqzSeXpjc9E4uDhpTpITgNjSH4K16BYG1UOGOFNVIQk9j
 qHqNPM8z99ouDGVNiBAITCXAO/3Lc7D/8vySgG9SS9VrxquEPOIzArodY
 RAuqdAGFf9GuqRcw4B4YtKTSCtbka9+dA+ggMdCMfBH4EEJM+VFBroonF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="31525661"
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; d="scan'208";a="31525661"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 15:17:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; d="scan'208";a="52114386"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 15:17:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/2] Fix mips and refactor LRC tables
Date: Thu, 21 Mar 2024 15:17:24 -0700
Message-ID: <20240321221726.102193-1-lucas.demarchi@intel.com>
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

First patch is a straightforward fix the build for mips. This is tested
with gcc 12 with a defconfig + CONFIG_DRM_XE*.

Second patch is a tentative to improve it by moving code around so we
can use ARRAY_SIZE() and avoid the sentinel (that has been a source of
bugs already in early platform support AFAIR). Maybe it will probably
need to be split and resent later though. This one is untested.

Lucas De Marchi (2):
  drm/xe: Fix END redefinition
  drm/xe: Let set_offsets() get the per-platform offsets

 drivers/gpu/drm/xe/xe_lrc.c | 204 ++++++++++++++++++------------------
 1 file changed, 103 insertions(+), 101 deletions(-)

-- 
2.43.0

