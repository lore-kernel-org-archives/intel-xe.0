Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AA8C021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 17:27:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08EE10E659;
	Tue,  4 Mar 2025 17:27:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E981010E659;
 Tue,  4 Mar 2025 17:27:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_MI=5FMATH_to_apply_RM?=
 =?utf-8?q?W_WA_in_LRC_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 17:27:28 -0000
Message-ID: <174110924895.677839.7346850125859911723@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250303173522.1822-1-michal.wajdeczko@intel.com>
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

Series: Use MI_MATH to apply RMW WA in LRC (rev2)
URL   : https://patchwork.freedesktop.org/series/145732/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0e065e7fc7a503d5e87f2d2781c5e1fc719d16dd
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 02b06068b0e365ae51bf46b4a4052b84a1e6f239
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Mar 3 18:35:22 2025 +0100

    drm/xe/vf: Unblock xe_rtp_process_to_sr for VFs
    
    In commit 9632dfb0def4 ("drm/xe/vf: Don't run any save-restore
    RTP actions if VF") we disabled processing of all RTP rules if
    we were running as a VFs, since many of the RTP actions were
    trying to access registers unaccessible for VFs.
    
    This also included all of LRC WA rules, since some of them were
    implemented in a way that required RMW pattern.
    
    Now, as we can program LRC WAs without accessing such registers
    from the driver, relying on the MI_MATH instruction instead, we
    can unblock xe_rtp_process_to_sr() for VFs.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch ff2d693d88726e29a1d87291105135c31c21fa26 drm-intel
7e76db069a9a drm/xe: Add MI_LOAD_REGISTER_REG command definition
d778ae28f6de drm/xe: Add MI_MATH and ALU instruction definitions
-:19: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#19: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 96 lines checked
80e71ee0a426 drm/xe: Avoid reading RMW registers in emit_wa_job
88bd5d0e0660 drm/xe/vf: Stop applying save-restore MMIOs if VF
02b06068b0e3 drm/xe/vf: Unblock xe_rtp_process_to_sr for VFs


