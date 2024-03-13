Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4BDC54791
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 08:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAB610E2BB;
	Wed, 13 Mar 2024 08:09:53 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A332C10F6CE;
 Wed, 13 Mar 2024 08:09:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/hwmon=3A_Add_infra?=
 =?utf-8?q?_to_support_card_power_and_energy_attributes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Mar 2024 08:09:51 -0000
Message-ID: <171031739166.715418.17360619546472058854@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240313081503.828375-1-karthik.poosa@intel.com>
In-Reply-To: <20240313081503.828375-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Add infra to support card power and energy attributes
URL   : https://patchwork.freedesktop.org/series/131059/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 841d69b9f23f33f5933fed05bb5aa743dbf922ba
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Wed Mar 13 13:45:03 2024 +0530

    drm/xe/hwmon: Add infra to support card power and energy attributes
    
    Add infra to support card power and energy attributes through channel 0.
    Package attributes will be now exposed through channel 1 rather than
    channel 0 as shown below.
    
    Channel 0 i.e power1/engery1_xxx used for card and
    channel 1 i.e power2/energy2_xxx used for package power,energy attributes.
    
    This would be needed for future platforms where they might be
    separate registers for package and card power and energy.
    
    Each discrete GPU supported by xe driver, would have a directory in
    /sys/class/hwmon/ with multiple channels under it.
    Each channel would have attributes for power, energy etc.
    
    Ex: /sys/class/hwmon/hwmon2/power1_max
                               /power1_label
                               /energy1_input
                               /energy1_label
    
    Attributes will have a label to get more description of it.
    Labelling is as below.
                    power1_label/energy1_label - "card",
                    power2_label/energy2_label - "pkg".
    
    power1/curr1_crit and in0_input moved to channel 1, i.e power2/curr2_crit
    and in1_input as there available for package only.
    
    v2: Updated intel-xe-hwmon documentation as per above changes.
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
+ /mt/dim checkpatch 8762453258673794e13e4d59cb9df1042b97ba01 drm-intel
841d69b9f23f drm/xe/hwmon: Add infra to support card power and energy attributes
-:189: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'xe->info.platform == XE_PVC'
#189: FILE: drivers/gpu/drm/xe/xe_hwmon.c:89:
+		if ((xe->info.platform == XE_PVC) && (channel == CHANNEL_PKG))

-:189: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'channel == CHANNEL_PKG'
#189: FILE: drivers/gpu/drm/xe/xe_hwmon.c:89:
+		if ((xe->info.platform == XE_PVC) && (channel == CHANNEL_PKG))

-:197: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'xe->info.platform == XE_PVC'
#197: FILE: drivers/gpu/drm/xe/xe_hwmon.c:95:
+		if ((xe->info.platform == XE_PVC) && (channel == CHANNEL_PKG))

-:197: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'channel == CHANNEL_PKG'
#197: FILE: drivers/gpu/drm/xe/xe_hwmon.c:95:
+		if ((xe->info.platform == XE_PVC) && (channel == CHANNEL_PKG))

-:209: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'xe->info.platform == XE_DG2'
#209: FILE: drivers/gpu/drm/xe/xe_hwmon.c:107:
+		if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))

-:209: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'channel == CHANNEL_PKG'
#209: FILE: drivers/gpu/drm/xe/xe_hwmon.c:107:
+		if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))

-:214: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'xe->info.platform == XE_PVC'
#214: FILE: drivers/gpu/drm/xe/xe_hwmon.c:111:
+		if ((xe->info.platform == XE_PVC) && (channel == CHANNEL_PKG))

-:214: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'channel == CHANNEL_PKG'
#214: FILE: drivers/gpu/drm/xe/xe_hwmon.c:111:
+		if ((xe->info.platform == XE_PVC) && (channel == CHANNEL_PKG))

-:329: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#329: FILE: drivers/gpu/drm/xe/xe_hwmon.c:270:
+xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *attr,
 				  char *buf)

-:352: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#352: FILE: drivers/gpu/drm/xe/xe_hwmon.c:311:
+xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *attr,
 				   const char *buf, size_t count)

-:419: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#419: FILE: drivers/gpu/drm/xe/xe_hwmon.c:422:
+	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL,
+				  HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT | HWMON_P_LABEL),

total: 0 errors, 0 warnings, 11 checks, 656 lines checked


