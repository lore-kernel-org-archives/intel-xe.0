Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9602AC46CD2
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jan 2024 16:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E1E10F2BD;
	Sat, 27 Jan 2024 16:42:34 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354C310F2BE;
 Sat, 27 Jan 2024 16:42:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/hwmon=3A_Fix_abi_doc_?=
 =?utf-8?q?warnings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Date: Sat, 27 Jan 2024 16:42:33 -0000
Message-ID: <170637375321.765365.6031779998911084385@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240127165040.2348009-1-badal.nilawar@intel.com>
In-Reply-To: <20240127165040.2348009-1-badal.nilawar@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/hwmon: Fix abi doc warnings
URL   : https://patchwork.freedesktop.org/series/129238/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2d919ac662b2798c053d68d1cc16b758c61b55ca
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 36aa9403c4058caaf1207d9987aaeb02aa346fcd
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Sat Jan 27 22:20:40 2024 +0530

    drm/hwmon: Fix abi doc warnings
    
    This fixes warnings in xe, i915 hwmon docs
    
    Warning: /sys/devices/.../hwmon/hwmon<i>/curr1_crit is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:35  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:52
    Warning: /sys/devices/.../hwmon/hwmon<i>/energy1_input is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:54  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:65
    Warning: /sys/devices/.../hwmon/hwmon<i>/in0_input is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:46  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:0
    Warning: /sys/devices/.../hwmon/hwmon<i>/power1_crit is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:22  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:39
    Warning: /sys/devices/.../hwmon/hwmon<i>/power1_max is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:0  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:8
    Warning: /sys/devices/.../hwmon/hwmon<i>/power1_max_interval is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:62  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:30
    Warning: /sys/devices/.../hwmon/hwmon<i>/power1_rated_max is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:14  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:22
    
    Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
    Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
    Fixes: fbcdc9d3bf58 ("drm/xe/hwmon: Expose input voltage attribute")
    Fixes: 71d0a32524f9 ("drm/xe/hwmon: Expose hwmon energy attribute")
    Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
    Fixes: f8572bb67525 ("drm/i915/hwmon: Add HWMON current voltage support")
    Fixes: 99f55efb7911 ("drm/i915/hwmon: Power PL1 limit and TDP setting")
    Fixes: 4c2572fe0ae7 ("drm/i915/hwmon: Expose power1_max_interval")
    Fixes: c8939848f7e4 ("drm/i915/hwmon: Expose card reactive critical power")
    Fixes: c41b8bdcc297 ("drm/i915/hwmon: Show device level energy usage")
    
    Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Cc: Lucas Demarchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Closes: https://lore.kernel.org/all/20240125113345.291118ff@canb.auug.org.au/
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 0f1b42b9d395bd4097b2846230a13869dc638216 drm-intel
36aa9403c drm/hwmon: Fix abi doc warnings
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
Warning: /sys/devices/.../hwmon/hwmon<i>/curr1_crit is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:35  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:52

-:16: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'fb1b70607f73', maybe rebased or not pulled?
#16: 
Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")

-:17: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '92d44a422d0d', maybe rebased or not pulled?
#17: 
Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")

-:18: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'fbcdc9d3bf58', maybe rebased or not pulled?
#18: 
Fixes: fbcdc9d3bf58 ("drm/xe/hwmon: Expose input voltage attribute")

-:19: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '71d0a32524f9', maybe rebased or not pulled?
#19: 
Fixes: 71d0a32524f9 ("drm/xe/hwmon: Expose hwmon energy attribute")

-:20: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '4446fcf220ce', maybe rebased or not pulled?
#20: 
Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")

-:21: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'f8572bb67525', maybe rebased or not pulled?
#21: 
Fixes: f8572bb67525 ("drm/i915/hwmon: Add HWMON current voltage support")

-:22: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '99f55efb7911', maybe rebased or not pulled?
#22: 
Fixes: 99f55efb7911 ("drm/i915/hwmon: Power PL1 limit and TDP setting")

-:23: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '4c2572fe0ae7', maybe rebased or not pulled?
#23: 
Fixes: 4c2572fe0ae7 ("drm/i915/hwmon: Expose power1_max_interval")

-:24: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'c8939848f7e4', maybe rebased or not pulled?
#24: 
Fixes: c8939848f7e4 ("drm/i915/hwmon: Expose card reactive critical power")

-:25: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'c41b8bdcc297', maybe rebased or not pulled?
#25: 
Fixes: c41b8bdcc297 ("drm/i915/hwmon: Show device level energy usage")

total: 0 errors, 11 warnings, 0 checks, 106 lines checked


