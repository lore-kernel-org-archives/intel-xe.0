Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A697C369AB
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 15:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A3910E26C;
	Mon, 21 Apr 2025 15:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Muc4rFDI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580BF10E27A
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 15:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745248604; x=1776784604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HnuzhecnBJbmwUXtfcq0EGI9mpept00sxIOqYNODy+0=;
 b=Muc4rFDIhOd+YhXxEwR/6w44YNYQzkED04xOtZvPbyKC6u8dGoRZuEAV
 5r6GwuvA72csvXX0/YjTpY/SGCO0APhYy+hsmt512W7yYd68T3IN81OaB
 UPrSZOPy65YF38d6IYsa7waRPsNznP/cHrKWWTpfKisxD4MfdPBnOT4mT
 3UVcuApAtQxrxnw7t/w8JhMjserqKUzEt+mNoAcOeRBE9f3B3K7Ocnx34
 7SLOaoCAS/aX+Sn6kTGmDeO35RQ91tKyIkN3iFnS0ijHsyxic8LSIksdE
 a4CsTdu1X1DQXDDG39xgFnF2AHSKQ7JLYgPU4U/10ChWTII6mrCBV77Aw Q==;
X-CSE-ConnectionGUID: cr7uFDYERFq3Z6zObYpQYQ==
X-CSE-MsgGUID: uxrQMPn5QHucczCs5WMtkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46882679"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="46882679"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 08:16:34 -0700
X-CSE-ConnectionGUID: b9bfGiHcQXuBVMTwWHR1AA==
X-CSE-MsgGUID: 97f4ufugSJStEPXbl8M5EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="136607270"
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
Subject: [PATCH 1/2] drm/xe/hwmon: Fix kernel version documentation for
 temperature
Date: Mon, 21 Apr 2025 08:15:38 -0700
Message-ID: <20250421-hwmon-doc-fix-v1-1-9f68db702249@intel.com>
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
supported with 6.15.

Fixes: dac328dea701 ("drm/xe/hwmon: expose package and vram temperature")
Reported-by: Ulisses Furquim <ulisses.furquim@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4840
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index adbb9bce15a5d..6fbab98fb639d 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -111,7 +111,7 @@ Description:	RO. Package current voltage in millivolt.
 
 What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
 Date:		March 2025
-KernelVersion:	6.14
+KernelVersion:	6.15
 Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. Package temperature in millidegree Celsius.
 
@@ -119,7 +119,7 @@ Description:	RO. Package temperature in millidegree Celsius.
 
 What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_input
 Date:		March 2025
-KernelVersion:	6.14
+KernelVersion:	6.15
 Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. VRAM temperature in millidegree Celsius.
 

-- 
2.49.0

