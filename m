Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FB1C52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 06:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC0A10E89F;
	Fri, 23 Aug 2024 06:30:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F25E10E89F;
 Fri, 23 Aug 2024 06:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Implement_Dbu?=
 =?utf-8?q?f_overlap_detection_feature_starting_from_LNL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Aug 2024 06:30:09 -0000
Message-ID: <172439460951.745285.13426844190330986152@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823062409.274179-1-vinod.govindapillai@intel.com>
In-Reply-To: <20240823062409.274179-1-vinod.govindapillai@intel.com>
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

Series: drm/i915: Implement Dbuf overlap detection feature starting from LNL
URL   : https://patchwork.freedesktop.org/series/137686/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 64f69f9069a8091366e8097df094f3630912ccd1
Author: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Date:   Fri Aug 23 09:24:09 2024 +0300

    drm/i915: Implement Dbuf overlap detection feature starting from LNL
    
    From LNL onwards there is a new hardware feature, which
    allows to detect if the driver wrongly allocated DBuf
    entries and they happen to overlap. If enabled this will
    cause a specific interrupt to occur.
    We now handle it in the driver, by writing correspondent
    error message to kernel log.
    
    v2: Initialize dbuf overlap flag in runtime_defaults (Jani Nikula)
    
    Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch 7365d672ab38ee0eabb65fcd359e5774a8efbd70 drm-intel
64f69f9069a8 drm/i915: Implement Dbuf overlap detection feature starting from LNL
-:50: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#50: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:125:
+#define HAS_DBUF_OVERLAP_DETECTION(__i915) (DISPLAY_RUNTIME_INFO(__i915)->has_dbuf_overlap_detection)

total: 0 errors, 1 warnings, 0 checks, 58 lines checked


