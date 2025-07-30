Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F655C87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 08:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676FB10E427;
	Wed, 30 Jul 2025 08:10:24 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED41110E427;
 Wed, 30 Jul 2025 08:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Patch_=22Revert_=22drm/xe?=
 =?utf-8?q?/forcewake=3A_Add_a_helper_xe=5Fforce=5Fwake=5Fref=5Fhas=5Fdomain?=
 =?utf-8?q?=28=29=22=22_has_been_added_to_the_6=2E12-stable_tree?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: gregkh@linuxfoundation.org
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Jul 2025 08:10:22 -0000
Message-ID: <175386302296.197938.11588220293829733959@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250729110525.49838-5-tomitamoeko@gmail.com>
In-Reply-To: <20250729110525.49838-5-tomitamoeko@gmail.com>
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

Series: Patch "Revert "drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()"" has been added to the 6.12-stable tree
URL   : https://patchwork.freedesktop.org/series/152264/
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
commit fb955f4c0cccaa170cd90a1914d78323286c73db
Author: gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>
Date:   Wed Jul 30 10:00:20 2025 +0200

    Patch "Revert "drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()"" has been added to the 6.12-stable tree
    
    This is a note to let you know that I've just added the patch titled
    
        Revert "drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()"
    
    to the 6.12-stable tree which can be found at:
        http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
    
    The filename of the patch is:
         revert-drm-xe-forcewake-add-a-helper-xe_force_wake_ref_has_domain.patch
    and it can be found in the queue-6.12 subdirectory.
    
    If you, or anyone else, feels it should not be added to the stable tree,
    please let <stable@vger.kernel.org> know about it.
    
    From stable+bounces-165055-greg=kroah.com@vger.kernel.org Tue Jul 29 13:06:06 2025
    From: Tomita Moeko <tomitamoeko@gmail.com>
    Date: Tue, 29 Jul 2025 19:05:25 +0800
    Subject: Revert "drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()"
    To: "Lucas De Marchi" <lucas.demarchi@intel.com>, "Thomas Hellström" <thomas.hellstrom@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>
    Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org, Tomita Moeko <tomitamoeko@gmail.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>, Badal Nilawar <badal.nilawar@intel.com>, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Message-ID: <20250729110525.49838-5-tomitamoeko@gmail.com>
    
    From: Tomita Moeko <tomitamoeko@gmail.com>
    
    This reverts commit deb05f8431f31e08fd6ab99a56069fc98014dbec.
    
    The helper function introduced in the reverted commit is for handling
    the "refcounted domain mask" introduced in commit a7ddcea1f5ac
    ("drm/xe: Error handling in xe_force_wake_get()"). Since that API change
    only exists in 6.13 and later, this helper is unnecessary in 6.12 stable
    kernel.
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Tomita Moeko <tomitamoeko@gmail.com>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+ /mt/dim checkpatch 9378b693d04cb60c6d1b13150244c480a7cd2741 drm-intel
fb955f4c0ccc Patch "Revert "drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()"" has been added to the 6.12-stable tree
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

-:29: WARNING:BAD_STABLE_ADDRESS_STYLE: Invalid email format for stable: 'intel-xe@lists.freedesktop.org, stable@vger.kernel.org, Tomita Moeko <tomitamoeko@gmail.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>, Badal Nilawar <badal.nilawar@intel.com>, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>', prefer 'himal.prasad.ghimiray@intel.com # @..,@..,<@.>,<.@.>,<.@.>,'
#29: 
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org, Tomita Moeko <tomitamoeko@gmail.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>, Badal Nilawar <badal.nilawar@intel.com>, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

-:34: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'deb05f8431f31e08fd6ab99a56069fc98014dbec', maybe rebased or not pulled?
#34: 
This reverts commit deb05f8431f31e08fd6ab99a56069fc98014dbec.

total: 0 errors, 3 warnings, 0 checks, 20 lines checked


