Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082E6E92705
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 14:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C1210E410;
	Thu,  5 Oct 2023 14:32:10 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9206410E40F;
 Thu,  5 Oct 2023 14:32:08 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 90CECA47E9;
 Thu,  5 Oct 2023 14:32:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Date: Thu, 05 Oct 2023 14:32:08 -0000
Message-ID: <169651632859.7515.11619718678933711383@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231005135918.2345364-1-uma.shankar@intel.com>
In-Reply-To: <20231005135918.2345364-1-uma.shankar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Cleanup_for_addressing_vga_decode?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Cleanup for addressing vga decode
URL   : https://patchwork.freedesktop.org/series/124660/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7d7d25bfc45d690033b2ca87fc0616cbacec0b92
Author: Uma Shankar <uma.shankar@intel.com>
Date:   Thu Oct 5 19:29:17 2023 +0530

    drm/xe: Create a dummy version for vga decode
    
    This implements an exclusive version of vga decode for xe.
    Rest of the display changes will be re-used from i915.
    
    Currently it adds just a dummy implementation. VGA decode
    needs to be handled correctly in i915, proper implementation
    will be adopted once the i915 changes are finalized and merged
    upstream.
    
    Signed-off-by: Uma Shankar <uma.shankar@intel.com>
+ /mt/dim checkpatch 3d2b298aaf52e74d4e90470cd65de047362e4875 drm-intel
abfe54e02 Revert "FIXME: drm/i915/vga: disable vga set decode for xe"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '28da6179478e3f29cb27df30b71f68b904dfff26', maybe rebased or not pulled?
#6: 
This reverts commit 28da6179478e3f29cb27df30b71f68b904dfff26.

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
984b02774 drm/i915/display: Created exclusive version of vga decode setup
7d7d25bfc drm/xe: Create a dummy version for vga decode
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 20 lines checked


