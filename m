Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C540CD3447
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 10:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212F410E30E;
	Fri,  8 May 2026 10:29:46 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB45010E30E;
 Fri,  8 May 2026 10:29:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_reorganize_di?=
 =?utf-8?q?splay_documentation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 May 2026 10:29:44 -0000
Message-ID: <177823618482.50384.10101113385222809324@5ab824fced77>
X-Patchwork-Hint: ignore
References: <cover.1778235406.git.jani.nikula@intel.com>
In-Reply-To: <cover.1778235406.git.jani.nikula@intel.com>
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

Series: drm/i915: reorganize display documentation
URL   : https://patchwork.freedesktop.org/series/166200/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1d695eb197dac7eaa63eefa53fbc18825e871743
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri May 8 13:20:49 2026 +0300

    Documentation/gpu: add remaining DOC: comments to Intel display documentation
    
    Not all of the overview DOC: comments in the display driver are
    incorporated into the documentation. Add the missing ones, including
    some function documentation.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 680a4832a8182b13ac5d55ab0c03c54ebc2baadd drm-intel
e8be5ee619b5 Documentation/gpu: add dedicated documentation for Intel display
-:44: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#44: FILE: Documentation/gpu/drm-kms.rst:1:
+

-:55: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#55: FILE: Documentation/gpu/i915.rst:1:
+

-:282: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#282: 
new file mode 100644

total: 0 errors, 3 warnings, 0 checks, 487 lines checked
c2a6e01ceab7 Documentation/gpu: use === for Intel display section heading underlines
1d695eb197da Documentation/gpu: add remaining DOC: comments to Intel display documentation
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 51 lines checked


