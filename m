Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E82D35154
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 20:20:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDC210E061;
	Wed,  1 Apr 2026 20:20:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4546F10E061;
 Wed,  1 Apr 2026 20:20:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Drop_redundant_?=
 =?utf-8?q?rtp_entries_for_Wa=5F14019988906_=26_Wa=5F14019877138?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Apr 2026 20:20:02 -0000
Message-ID: <177507480225.425430.15701759707931560303@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260401-wa_merge_conflict-v1-1-b477ab53fedc@intel.com>
In-Reply-To: <20260401-wa_merge_conflict-v1-1-b477ab53fedc@intel.com>
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

Series: drm/xe: Drop redundant rtp entries for Wa_14019988906 & Wa_14019877138
URL   : https://patchwork.freedesktop.org/series/164264/
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
commit 1c60a2404d41043fb4a2e98c630fb8410b371909
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Wed Apr 1 13:12:44 2026 -0700

    drm/xe: Drop redundant rtp entries for Wa_14019988906 & Wa_14019877138
    
    There appears to have been a silent merge conflict between some commits
    updating the workaround tables on Xe's -fixes and -next branches:
    
     - Commit bc6387a2e0c1 ("drm/xe/xe2_hpg: Fix handling of Wa_14019988906
       & Wa_14019877138") from the fixes branch moved the Xe2_HPG instance
       of two workarounds touching the PSS_CHICKEN register from the
       engine_was[] table to the lrc_was[] table; the equivalent
       implementation for all other platforms/IPs were already properly
       located on lrc_was[].  This commit on the fixes branch is a
       cherry-pick of commit e04c609eedf4 ("drm/xe/xe2_hpg: Fix handling of
       Wa_14019988906 & Wa_14019877138") that already existed on the next
       branch.
    
     - Commit 55b19abb6c44 ("drm/xe: Consolidate workaround entries for
       Wa_14019877138") and commit c2142a1a8415 ("drm/xe: Consolidate
       workaround entries for Wa_14019988906") consolidated the individual
       entries per IP generation for each workaround into single, larger
       range-based entries.
    
    During merge conflict resolution the Xe2_HPG-specific entries (i.e.,
    those with rule "GRAPHICS_VERSION_RANGE(2001, 2002)") were accidentally
    resurrected, even though the table already contains the consolidated
    entries that match a superset of thse ranges.  These redundant entries
    don't cause any build failures but do trigger a dmesg error during probe
    on BMG-G21 devices:
    
      xe 0000:03:00.0: [drm] *ERROR* Tile0: GT0: discarding save-restore reg 7044 (clear: 00000400, set: 00000400, masked: yes, mcr: yes): ret=-22
      xe 0000:03:00.0: [drm] *ERROR* Tile0: GT0: discarding save-restore reg 7044 (clear: 00000020, set: 00000020, masked: yes, mcr: yes): ret=-22
    
    Re-drop the Xe2_HPG-specific table entries to eliminate the error.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7433
    Fixes: 17b95278ae6a ("Merge tag 'drm-xe-next-2026-03-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next")
    Cc: Dave Airlie <airlied@redhat.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 3bc4b20741a977a593763678ab6d5b23c3e10d6c drm-intel
1c60a2404d41 drm/xe: Drop redundant rtp entries for Wa_14019988906 & Wa_14019877138
-:33: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#33: 
  xe 0000:03:00.0: [drm] *ERROR* Tile0: GT0: discarding save-restore reg 7044 (clear: 00000400, set: 00000400, masked: yes, mcr: yes): ret=-22

total: 0 errors, 1 warnings, 0 checks, 14 lines checked


