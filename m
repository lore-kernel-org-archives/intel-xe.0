Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFA6C47DDF
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 15:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F43A10E3C2;
	Fri, 26 Jan 2024 15:27:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A26310E3C2
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 15:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706282861; x=1737818861;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cdMCsQionmUcr6Kg97V12RvBcW6vmddjMs8qgR6iIS0=;
 b=LR05XYyXRDKowfM8zWa2d5USqbfzEW+RSHaY+wuvZy3hwukH44dmPUmf
 qiPF/SshF+0VcONFLXLkIX5txO56juhHTtI2/nLw26x8hs6ScXFzdrYgQ
 LHCLfQUBz6KRCQ7skQoWShADSYFDn8w+w3UKLeKiuTKoF0PrnWNfhZKQP
 uBS2Z+mjm4rX4CqkwV2PoUhNOqWNtlT5/J2MS9n3yc2Xh41tXS0cS4gDl
 lBAcLOaCs05ADz1aW2U9h9QIctKc7SuCiEo4mTCDoyoXC1v3xJCAXwO6z
 PD/+1eEo8Yv6P2TkEAS+8vxqN6XLucPMGA3JGNvJQbKqtTEKqsfjQGItW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="392932124"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="392932124"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 07:27:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="21412421"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 07:27:39 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/hwmon: Fix abi doc warnings
Date: Fri, 26 Jan 2024 21:09:43 +0530
Message-Id: <20240126153943.2294003-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: thomas.hellstrom@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix warnings in xe hwmon documentation

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 8c321bc9dc04..48544bd970ab 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -1,6 +1,6 @@
-What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_max
 Date:		September 2023
-KernelVersion:	6.5
+KernelVersion:	6.8
 Contact:	intel-xe@lists.freedesktop.org
 Description:	RW. Card reactive sustained  (PL1) power limit in microwatts.
 
@@ -12,17 +12,17 @@ Description:	RW. Card reactive sustained  (PL1) power limit in microwatts.
 
 		Only supported for particular Intel xe graphics platforms.
 
-What:		/sys/devices/.../hwmon/hwmon<i>/power1_rated_max
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_rated_max
 Date:		September 2023
-KernelVersion:	6.5
+KernelVersion:	6.8
 Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. Card default power limit (default TDP setting).
 
 		Only supported for particular Intel xe graphics platforms.
 
-What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_crit
 Date:		September 2023
-KernelVersion:	6.5
+KernelVersion:	6.8
 Contact:	intel-xe@lists.freedesktop.org
 Description:	RW. Card reactive critical (I1) power limit in microwatts.
 
@@ -33,9 +33,9 @@ Description:	RW. Card reactive critical (I1) power limit in microwatts.
 
 		Only supported for particular Intel xe graphics platforms.
 
-What:		/sys/devices/.../hwmon/hwmon<i>/curr1_crit
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/curr1_crit
 Date:		September 2023
-KernelVersion:	6.5
+KernelVersion:	6.8
 Contact:	intel-xe@lists.freedesktop.org
 Description:	RW. Card reactive critical (I1) power limit in milliamperes.
 
@@ -44,25 +44,25 @@ Description:	RW. Card reactive critical (I1) power limit in milliamperes.
 		the operating frequency if the power averaged over a window
 		exceeds this limit.
 
-What:		/sys/devices/.../hwmon/hwmon<i>/in0_input
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/in0_input
 Date:		September 2023
-KernelVersion:	6.5
+KernelVersion:	6.8
 Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. Current Voltage in millivolt.
 
 		Only supported for particular Intel xe graphics platforms.
 
-What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/energy1_input
 Date:		September 2023
-KernelVersion:	6.5
+KernelVersion:	6.8
 Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. Energy input of device in microjoules.
 
 		Only supported for particular Intel xe graphics platforms.
 
-What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_max_interval
 Date:		October 2023
-KernelVersion:	6.6
+KernelVersion:	6.8
 Contact:	intel-xe@lists.freedesktop.org
 Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
 		milliseconds over which sustained power is averaged.
-- 
2.25.1

