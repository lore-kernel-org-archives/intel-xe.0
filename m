Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3970AC83F33
	for <intel-xe@archiver.kernel.org>; Mon,  4 Sep 2023 18:42:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CAD910E1BD;
	Mon,  4 Sep 2023 18:42:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BAC1610E1BD;
 Mon,  4 Sep 2023 18:42:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B7936AADE3;
 Mon,  4 Sep 2023 18:42:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Date: Mon, 04 Sep 2023 18:42:05 -0000
Message-ID: <169385292574.21389.5321306653857974940@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230904182258.2291881-1-badal.nilawar@intel.com>
In-Reply-To: <20230904182258.2291881-1-badal.nilawar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_HWMON_support_for_DGFX_=28rev4=29?=
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

Series: Add HWMON support for DGFX (rev4)
URL   : https://patchwork.freedesktop.org/series/118934/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a668292100b0d525368d7021fac249a73070471a
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Mon Sep 4 23:52:58 2023 +0530

    drm/xe/hwmon: Expose power1_max_interval
    
    Expose power1_max_interval, that is the tau corresponding to PL1, as a
    custom hwmon attribute. Some bit manipulation is needed because of the
    format of PKG_PWR_LIM_1_TIME in
    PACKAGE_RAPL_LIMIT register (1.x * power(2,y))
    
    v2: Get rpm wake ref while accessing power1_max_interval
    v3: %s/hwmon/xe_hwmon/
    
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 7ec520d3a63b6e95174329108cd44359a70907ba drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


