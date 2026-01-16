Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5435C98306
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 23:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DBA10E009;
	Fri, 16 Jan 2026 23:15:21 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517D010E009;
 Fri, 16 Jan 2026 23:15:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_MCR_inconsistencies_i?=
 =?utf-8?q?n_RTP_tables?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Jan 2026 23:15:20 -0000
Message-ID: <176860532033.163695.13432878951184224116@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
In-Reply-To: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
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

Series: Fix MCR inconsistencies in RTP tables
URL   : https://patchwork.freedesktop.org/series/160223/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
ee83616c430ce70bd254bd2774d143a5733c8666
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 86c91aa9da5c9c898586b54a74de10847edfd89f
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Fri Jan 16 19:12:20 2026 -0300

    drm/xe/reg_sr: Do sanity check for MCR vs non-MCR
    
    The type struct xe_reg_mcr exists to ensure that the correct API is used
    when handling MCR registers.  However, for in the register save/restore
    functionality, the RTP processing always cast the register to a struct
    xe_reg and then apply_one_mmio() selects the MMIO API based on the "mcr"
    field of the register instance.
    
    This allows the developer to commit mistakes like passing a MCR register
    for an RTP action for a platform where the respective register is not
    MCR; and vice-versa.
    
    To capture such scenarios, do a sanity check in xe_reg_sr_add() and
    raise warnings if inconsistencies are detected.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 0f3aa82816dce3da347333a317ea112d16e5d237 drm-intel
bfb25d30a24e drm/xe: Define CACHE_MODE_1 as MCR register
673ed5a01ed4 drm/xe: Define and use MCR version of COMMON_SLICE_CHICKEN1
1241bff4d010 drm/xe: Define and use MCR version of COMMON_SLICE_CHICKEN4
87917ffc18c0 drm/xe/kunit: Add xe_kunit_is_live_test()
5c26fecd3c4e drm/xe/kunit: Abort test if MMIO operation is attempted
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 108 lines checked
19f20fd9f766 drm/xe/kunit: Allow intercepting MMIO operations
-:165: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#165: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 308 lines checked
06dfac910deb drm/xe: Extract xe_hw_engine_setup_reg_lrc()
1869343aa59e drm/xe: Extract xe_hw_engines_setup_runtime_mask()
22d9a9b45672 drm/xe/kunit: Use KUNIT_EXPECT_EQ() in xe_wa_gt()
946a4b44b5d1 drm/xe/kunit: Include hw_engines in xe_wa test
17266dbb5bd1 drm/xe/mcr: Extract reg_in_steering_type_ranges()
86c91aa9da5c drm/xe/reg_sr: Do sanity check for MCR vs non-MCR


