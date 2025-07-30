Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596F7C87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 08:20:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4A110E42D;
	Wed, 30 Jul 2025 08:20:25 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBED10E430;
 Wed, 30 Jul 2025 08:20:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Patch_=22Revert_=22drm/xe?=
 =?utf-8?q?/tests/mocs=3A_Update_xe=5Fforce=5Fwake=5Fget=28=29_return_handli?=
 =?utf-8?q?ng=22=22_has_been_added_to_the_6=2E12-stable_tree?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: gregkh@linuxfoundation.org
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Jul 2025 08:20:24 -0000
Message-ID: <175386362410.197938.16384498485409341318@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250729110525.49838-3-tomitamoeko@gmail.com>
In-Reply-To: <20250729110525.49838-3-tomitamoeko@gmail.com>
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

Series: Patch "Revert "drm/xe/tests/mocs: Update xe_force_wake_get() return handling"" has been added to the 6.12-stable tree
URL   : https://patchwork.freedesktop.org/series/152266/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 18197bce4c0d51cb05eda35a0dc668853cbb491c
Author: gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>
Date:   Wed Jul 30 10:00:21 2025 +0200

    Patch "Revert "drm/xe/tests/mocs: Update xe_force_wake_get() return handling"" has been added to the 6.12-stable tree
    
    This is a note to let you know that I've just added the patch titled
    
        Revert "drm/xe/tests/mocs: Update xe_force_wake_get() return handling"
    
    to the 6.12-stable tree which can be found at:
        http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
    
    The filename of the patch is:
         revert-drm-xe-tests-mocs-update-xe_force_wake_get-return-handling.patch
    and it can be found in the queue-6.12 subdirectory.
    
    If you, or anyone else, feels it should not be added to the stable tree,
    please let <stable@vger.kernel.org> know about it.
    
    From stable+bounces-165053-greg=kroah.com@vger.kernel.org Tue Jul 29 13:05:55 2025
    From: Tomita Moeko <tomitamoeko@gmail.com>
    Date: Tue, 29 Jul 2025 19:05:23 +0800
    Subject: Revert "drm/xe/tests/mocs: Update xe_force_wake_get() return handling"
    To: "Lucas De Marchi" <lucas.demarchi@intel.com>, "Thomas Hellström" <thomas.hellstrom@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>
    Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org, Tomita Moeko <tomitamoeko@gmail.com>, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
    Message-ID: <20250729110525.49838-3-tomitamoeko@gmail.com>
    
    From: Tomita Moeko <tomitamoeko@gmail.com>
    
    This reverts commit 95a75ed2b005447f96fbd4ac61758ccda44069d1.
    
    The reverted commit updated the handling of xe_force_wake_get to match
    the new "return refcounted domain mask" semantics introduced in commit
    a7ddcea1f5ac ("drm/xe: Error handling in xe_force_wake_get()"). However,
    that API change only exists in 6.13 and later.
    
    In 6.12 stable kernel, xe_force_wake_get still returns a status code.
    The update incorrectly treats the return value as a mask, causing the
    return value of 0 to be misinterpreted as an error.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Tomita Moeko <tomitamoeko@gmail.com>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+ /mt/dim checkpatch 9378b693d04cb60c6d1b13150244c480a7cd2741 drm-intel
18197bce4c0d Patch "Revert "drm/xe/tests/mocs: Update xe_force_wake_get() return handling"" has been added to the 6.12-stable tree
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

-:29: WARNING:BAD_STABLE_ADDRESS_STYLE: Invalid email format for stable: 'intel-xe@lists.freedesktop.org, stable@vger.kernel.org, Tomita Moeko <tomitamoeko@gmail.com>, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, Badal Nilawar <badal.nilawar@intel.com>', prefer 'badal.nilawar@intel.com # @..,@..,<@.>,<..@.>,<.@.>,'
#29: 
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org, Tomita Moeko <tomitamoeko@gmail.com>, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, Badal Nilawar <badal.nilawar@intel.com>

-:34: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '95a75ed2b005447f96fbd4ac61758ccda44069d1', maybe rebased or not pulled?
#34: 
This reverts commit 95a75ed2b005447f96fbd4ac61758ccda44069d1.

total: 0 errors, 3 warnings, 0 checks, 52 lines checked


