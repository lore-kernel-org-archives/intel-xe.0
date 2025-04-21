Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F97C369D5
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 15:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0F410E27A;
	Mon, 21 Apr 2025 15:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STAPk7oS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C5610E46B
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 15:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745248604; x=1776784604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qoy2aIVzdg/0hbwcipEX8vp+kSzdNDylwfU3RRwXCJY=;
 b=STAPk7oSfu9H7HDVlRgSf+FBvqTIpYsfRZtXQcz3Ojh59/1Rk2Ezqc+B
 6h0R6D+L2SRFw5hju5kH88MVEeyFdIUkBHrVrxeKhe5T4LUe1tcLS+vNt
 qz4wwn3HnJSFn15F5mIJdKOmurVtXNtSaWZ5aUgAxg8FjRU93PK/LWZqx
 n/TiCHv5DgLdvlTWEOWE6rMDxuE1ltEKh14K4Itrghmtd+PIhNDQVHlxI
 BvI8vTqLRZapMOYiMoBTTTlg/6UapUYRkY7LsL4Ow7uUrDYQLDrQCfkBA
 5TiSzkvIfels0nnKjA9aiIsoZhVA0wua/GGWkzwjv2xM9l7AMsUHAOy2h A==;
X-CSE-ConnectionGUID: g3AiNi6UQv6BW+pECrlHeQ==
X-CSE-MsgGUID: HoB9/gagQIawCJN/+lVVeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46882680"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="46882680"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 08:16:34 -0700
X-CSE-ConnectionGUID: yliTaXM+T/mBqbIAsFkP6A==
X-CSE-MsgGUID: sr0BzeZzQ16YK+uxBwyvRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="136607273"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 08:16:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Raag Jadav <raag.jadav@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ulisses Furquim <ulisses.furquim@intel.com>
Subject: [PATCH 2/2] drm/xe/hwmon: Fix kernel version documentation for fan
 speed
Date: Mon, 21 Apr 2025 08:15:39 -0700
Message-ID: <20250421-hwmon-doc-fix-v1-2-9f68db702249@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421-hwmon-doc-fix-v1-0-9f68db702249@intel.com>
References: <20250421-hwmon-doc-fix-v1-0-9f68db702249@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-9a9c7
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

Wrong copy and paste from other entries: these are starting to be
supported with 6.16.

Fixes: 28f79ac609de ("drm/xe/hwmon: expose fan speed")
Reported-by: Ulisses Furquim <ulisses.furquim@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4841
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 6fbab98fb639d..4ca917ac6382d 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -127,7 +127,7 @@ Description:	RO. VRAM temperature in millidegree Celsius.
 
 What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan1_input
 Date:		March 2025
-KernelVersion:	6.14
+KernelVersion:	6.16
 Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. Fan 1 speed in RPM.
 
@@ -135,7 +135,7 @@ Description:	RO. Fan 1 speed in RPM.
 
 What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan2_input
 Date:		March 2025
-KernelVersion:	6.14
+KernelVersion:	6.16
 Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. Fan 2 speed in RPM.
 
@@ -143,7 +143,7 @@ Description:	RO. Fan 2 speed in RPM.
 
 What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan3_input
 Date:		March 2025
-KernelVersion:	6.14
+KernelVersion:	6.16
 Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. Fan 3 speed in RPM.
 

-- 
2.49.0

