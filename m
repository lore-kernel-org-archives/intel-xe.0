Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622CCC67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 14:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C2111393B;
	Fri,  5 Apr 2024 14:20:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E953811393D;
 Fri,  5 Apr 2024 14:20:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/hwmon=3A_Update_xe?=
 =?utf-8?q?_hwmon_with_couple_of_fixes_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Apr 2024 14:20:32 -0000
Message-ID: <171232683295.1236915.12791881391435790258@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405130127.1392426-1-karthik.poosa@intel.com>
In-Reply-To: <20240405130127.1392426-1-karthik.poosa@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/hwmon: Update xe hwmon with couple of fixes (rev7)
URL   : https://patchwork.freedesktop.org/series/131765/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4d5d019e595d714003af4c0e17df84a68555c4a4
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Fri Apr 5 18:31:27 2024 +0530

    drm/xe/hwmon: Cast result to output precision on left shift of operand
    
    Address potential overflow in result of left shift of a
    lower precision (u32) operand before assignment to higher
    precision (u64) variable.
    
    v2:
     - Update commit message. (Himal)
    
    Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
    Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 5714711c6612120bd9c306824ec807d322c0735b drm-intel
acf01b7e8944 drm/xe: Define xe_reg_is_valid
6ed6f15c8146 drm/xe/hwmon: Update xe_hwmon_get_reg to return struct xe_reg
a276b66a6318 drm/xe/hwmon: Update xe_hwmon_process_reg
-:34: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#34: FILE: drivers/gpu/drm/xe/xe_hwmon.c:125:
+static u64 xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
+				 enum xe_hwmon_reg_operation operation,

total: 0 errors, 0 warnings, 1 checks, 135 lines checked
4d5d019e595d drm/xe/hwmon: Cast result to output precision on left shift of operand


