Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3719AEEC2B7
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 00:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF19910E468;
	Tue, 24 Feb 2026 00:17:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A4210E465;
 Tue, 24 Feb 2026 00:17:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Workaround_cleanup_=26_si?=
 =?utf-8?q?mplification_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Feb 2026 00:17:09 -0000
Message-ID: <177189222973.278840.9603682061791257033@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260223-forupstream-wa_cleanup-v3-0-7f201eb2f172@intel.com>
In-Reply-To: <20260223-forupstream-wa_cleanup-v3-0-7f201eb2f172@intel.com>
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

Series: Workaround cleanup & simplification (rev3)
URL   : https://patchwork.freedesktop.org/series/161606/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 12b8d74b55477bccc250a1f3b1707341397a3502
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Mon Feb 23 16:11:33 2026 -0800

    drm/xe/xe2_hpg: Drop invalid workaround Wa_15010599737
    
    Wa_15010599737 was a workaround originally proposed (and ultimately
    rejected) for DG2-G10.  There's no record of it ever being relevant or
    even considered for any other platforms.
    
    The specific bit this workaround was setting is documented as "This bit
    should be set to 1 for the DX9 API and 0 for all other APIs" which means
    that it should almost always be left at the default value of 0 on Linux.
    The register itself is directly accessible from userspace, so in the
    special cases where it might be relevant (e.g., Wine/Proton running
    Windows DX9 apps), the userspace drivers already have the ability to
    change the setting without involvement of the kernel.
    
    Fixes: 7f3ee7d88058 ("drm/xe/xe2hpg: Add initial GT workarounds")
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch b9cfd94d023644192a7c0eb92daed78722960006 drm-intel
bdde6c132fd5 drm/xe: Consolidate workaround entries for Wa_18041344222
-:11: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit a800b95c2498 ("drm/xe/xe2hpg: Remove SRIOV VF check for Wa_18041344222")'
#11: 
 - Drop the FUNC(xe_rtp_match_not_sriov_vf) to align with commit

total: 1 errors, 0 warnings, 0 checks, 48 lines checked
12b8d74b5547 drm/xe/xe2_hpg: Drop invalid workaround Wa_15010599737


