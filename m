Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2A6CD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 10:04:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946C411B30F;
	Thu,  4 Apr 2024 10:04:29 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD0611B2F4;
 Thu,  4 Apr 2024 10:04:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_Update_xe?=
 =?utf-8?q?_hwmon_with_couple_of_fixes_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Apr 2024 10:04:27 -0000
Message-ID: <171222506724.1209302.14565726014442587426@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240404100827.1109447-1-karthik.poosa@intel.com>
In-Reply-To: <20240404100827.1109447-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Update xe hwmon with couple of fixes (rev6)
URL   : https://patchwork.freedesktop.org/series/131765/
State : success

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
commit cb6199afd3c79dcc6275c8c1ec1785a25d7ea527
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Thu Apr 4 15:38:27 2024 +0530

    drm/xe/hwmon: Cast to output precision before multiplying operands
    
    Address potential overflow in result of multiplication of two lower
    precision (u32) operands before widening it to higher precision (u64).
    
    Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
    Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 714417be4833696db248e963e5010e6639610bda drm-intel
3dd693083653 drm/xe: Define XE_REG_IS_VALID
a36ba65553e4 drm/xe/hwmon: Update xe_hwmon_get_reg to return struct xe_reg
43a79c861f8b drm/xe/hwmon: Update xe_hwmon_process_reg
cb6199afd3c7 drm/xe/hwmon: Cast to output precision before multiplying operands


