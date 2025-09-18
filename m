Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7BACAC597
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 04:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE1110E635;
	Thu, 18 Sep 2025 04:12:03 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33D910E635;
 Thu, 18 Sep 2025 04:12:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_some_rebar_?=
 =?utf-8?q?issues?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Sep 2025 04:12:01 -0000
Message-ID: <175816872199.343381.15239584889453820349@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
In-Reply-To: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
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

Series: drm/xe: Fix some rebar issues
URL   : https://patchwork.freedesktop.org/series/154679/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8ce3f0e0745c1f88caa1fde9e69d854c7dc8f193
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Sep 17 14:37:32 2025 -0700

    drm/xe: Move rebar to its own file
    
    Now that xe_pci.c calls the rebar directly, it doens't make sense to
    keep it in xe_vram.c since it's closer to the PCI initialization than to
    the vram. Move it to its own file.
    
    While at it, add a better comment to document the possible values for
    the vram_bar_size module parameter.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch f7ca3a88eeec7df8739bbc31beb824f64c1b68fa drm-intel
7621a97968da PCI: Release BAR0 of an integrated bridge to allow GPU BAR resize
-:37: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#37: 
Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: <stable@vger.kernel.org> # 6.12+

-:70: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 23 lines checked
91eef4234c52 drm/xe: Move rebar to be done earlier
-:19: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#19: 
	[] xe 0000:03:00.0: [drm] Attempting to resize bar from 8192MiB -> 16384MiB

-:135: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 66 lines checked
8ce3f0e0745c drm/xe: Move rebar to its own file
-:49: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#49: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 282 lines checked


