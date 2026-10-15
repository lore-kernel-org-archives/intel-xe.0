Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AA8CC6B38
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 19:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F292A11244F;
	Thu, 15 Oct 2026 19:08:50 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B513E11244C;
 Thu, 15 Oct 2026 19:08:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/hwmon=3A_Enable_fa?=
 =?utf-8?q?n_support_for_CRI_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Oct 2026 19:08:45 -0000
Message-ID: <179209132573.31787.15190188743492518300@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261015190113.1268522-1-karthik.poosa@intel.com>
In-Reply-To: <20261015190113.1268522-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Enable fan support for CRI (rev3)
URL   : https://patchwork.freedesktop.org/series/168027/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7aae3365e5b567ea70dab6a8f397d09ffdc8c1a0
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Fri Oct 16 00:31:12 2026 +0530

    drm/xe/hwmon: Update fan info after late binding
    
    Add xe_hwmon_fan_update_post_lb() to update fan info after late binding.
    Add param is_init into xe_hwmon_read_fan_control_info() to avoid
    resetting user pwm mode post-LB.
    Call init path with is_init=true from preregistration.
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
    Assisted-by: LLM
+ /mt/dim checkpatch 551605da81c33c1a2352b6a6116360609798f171 drm-intel
77cb51e90b1a drm/xe/hwmon: initialize fan-control backend and table cache
1ea0ea87a866 drm/xe/hwmon: expose fanN_max
fb88f77c4260 drm/xe/pcode: add ordered write batch helper
5726fac89550 drm/xe/hwmon: expose pwm[1-3]
6669439a5a47 drm/xe/hwmon: expose pwm[1-3]_enable
b8e37492fb4c drm/xe/hwmon: Enable fan curve control support
-:376: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#376: FILE: drivers/gpu/drm/xe/xe_hwmon.c:1638:
+						    fi->fan_table[USER_FAN_TABLE].staged_fcp[point].speed :

-:377: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#377: FILE: drivers/gpu/drm/xe/xe_hwmon.c:1639:
+						    fi->fan_table[active_table].fcp[point].speed) * U8_MAX,

total: 0 errors, 2 warnings, 0 checks, 743 lines checked
07a6270b63a6 drm/xe/hwmon: Add kernel-doc for fan control
47285cc20139 drm/xe/hwmon: preserve fan user table across suspend resume
7aae3365e5b5 drm/xe/hwmon: Update fan info after late binding


