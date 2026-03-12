Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D407106ACCD
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 17:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D3210E19C;
	Thu, 12 Mar 2026 17:42:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9648310E360;
 Thu, 12 Mar 2026 17:42:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/wa=3A_Drop_redunda?=
 =?utf-8?q?nt_entries_for_Wa=5F16021867713_=26_Wa=5F14019449301?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Mar 2026 17:42:00 -0000
Message-ID: <177333732060.352406.166509331257223217@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260312-wa_merge_fix-v1-1-2ec6607f1e0c@intel.com>
In-Reply-To: <20260312-wa_merge_fix-v1-1-2ec6607f1e0c@intel.com>
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

Series: drm/xe/wa: Drop redundant entries for Wa_16021867713 & Wa_14019449301
URL   : https://patchwork.freedesktop.org/series/163135/
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
commit 22de8994dcfffc252acad167dd568f32fe43d160
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Thu Mar 12 09:29:23 2026 -0700

    drm/xe/wa: Drop redundant entries for Wa_16021867713 & Wa_14019449301
    
    The Xe2_HPM-specific RTP table entries for Wa_16021867713 and
    Wa_14019449301 were removed by commit 941f538b0af8 ("drm/xe: Consolidate
    workaround entries for Wa_16021867713") and commit aa0f0a678370
    ("drm/xe: Consolidate workaround entries for Wa_14019449301") in favor
    of alternate entries earlier in the table that cover a wider range of IP
    versions.  However these Xe2_HPM-specific entries were accidentally
    resurrected during a backmerge, which causes the Xe driver to complain
    on probe about two entries trying to program the same registers+bits:
    
      <3> [48.491155] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: discarding save-restore reg 1c3f1c (clear: 00000008, set: 00000008, masked: no, mcr: no): ret=-22
      <3> [48.491211] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: discarding save-restore reg 1d3f1c (clear: 00000008, set: 00000008, masked: no, mcr: no): ret=-22
      <3> [48.491225] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: discarding save-restore reg 1c3f08 (clear: 00000020, set: 00000020, masked: no, mcr: no): ret=-22
      <3> [48.491238] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: discarding save-restore reg 1d3f08 (clear: 00000020, set: 00000020, masked: no, mcr: no): ret=-22
    
    Re-drop the redundant Xe2_HPM-specific entries to eliminate the dmesg
    errors.
    
    Fixes: 58351f46de26 ("Merge v7.0-rc3 into drm-next")
    Cc: Simona Vetter <simona.vetter@ffwll.ch>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7608
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 3ccc0e3404591e404d0dee79406cd013f377356a drm-intel
22de8994dcff drm/xe/wa: Drop redundant entries for Wa_16021867713 & Wa_14019449301
-:19: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#19: 
  <3> [48.491155] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: discarding save-restore reg 1c3f1c (clear: 00000008, set: 00000008, masked: no, mcr: no): ret=-22

total: 0 errors, 1 warnings, 0 checks, 20 lines checked


