Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85D4CD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 04:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C25112D82;
	Thu,  4 Apr 2024 04:48:28 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A268112DBD;
 Thu,  4 Apr 2024 04:48:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/hwmon=3A_Update_xe?=
 =?utf-8?q?_hwmon_with_couple_of_fixes_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Apr 2024 04:48:26 -0000
Message-ID: <171220610643.1190907.1075866535511005770@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240404035441.965590-1-karthik.poosa@intel.com>
In-Reply-To: <20240404035441.965590-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Update xe hwmon with couple of fixes (rev5)
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
commit dc8197989237d75b9b6968adb90193e5aa82cfaa
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Thu Apr 4 09:24:41 2024 +0530

    drm/xe/hwmon: Cast to output precision before multiplying operands
    
    Address potential overflow in result of multiplication of two lower
    precision (u32) operands before widening it to higher precision (u64).
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
+ /mt/dim checkpatch 406e10d886a22211d2866bfa9322aec1727171f8 drm-intel
be77226caa89 drm/xe: Define XE_REG_IS_VALID
2969cf3236d2 drm/xe/hwmon: Update xe_hwmon_get_reg to return struct xe_reg
243da8e61638 drm/xe/hwmon: Update xe_hwmon_process_reg
-:25: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#25: FILE: drivers/gpu/drm/xe/xe_hwmon.c:125:
+static u64 xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
+				 enum xe_hwmon_reg_operation operation,

-:81: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#81: FILE: drivers/gpu/drm/xe/xe_hwmon.c:197:
+		reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
 				     PKG_PWR_LIM_1_EN, 0, channel);

-:84: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#84: FILE: drivers/gpu/drm/xe/xe_hwmon.c:199:
+		reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32,
 				     PKG_PWR_LIM_1_EN, 0, channel);

-:93: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#93: FILE: drivers/gpu/drm/xe/xe_hwmon.c:212:
+	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
 			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val, channel);

-:112: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#112: FILE: drivers/gpu/drm/xe/xe_hwmon.c:254:
+	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ32,
+			     0, 0, channel);

-:123: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#123: FILE: drivers/gpu/drm/xe/xe_hwmon.c:281:
+	r = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
+			     REG_READ32, 0, 0, sensor_index);

-:133: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#133: FILE: drivers/gpu/drm/xe/xe_hwmon.c:370:
+	r = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
 			     PKG_PWR_LIM_1_TIME, rxy, sensor_index);

-:143: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#143: FILE: drivers/gpu/drm/xe/xe_hwmon.c:486:
+	reg_val = xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
+			     REG_READ32, 0, 0, channel);

-:154: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#154: FILE: drivers/gpu/drm/xe/xe_hwmon.c:772:
+		val_sku_unit = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
+				     REG_READ32, 0, 0, 0);

total: 0 errors, 0 warnings, 9 checks, 129 lines checked
dc8197989237 drm/xe/hwmon: Cast to output precision before multiplying operands


