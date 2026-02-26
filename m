Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E055FFC592F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 11:50:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07BC10E06F;
	Thu, 26 Feb 2026 11:50:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910D310E06F;
 Thu, 26 Feb 2026 11:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Revert_=22drm/xe/compat?=
 =?utf-8?q?=3A_Remove_unused_i915=5Freg=2Eh_from_compat_header=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Feb 2026 11:50:11 -0000
Message-ID: <177210661157.290393.9221540072747812522@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260226113413.2045899-1-uma.shankar@intel.com>
In-Reply-To: <20260226113413.2045899-1-uma.shankar@intel.com>
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

Series: Revert "drm/xe/compat: Remove unused i915_reg.h from compat header"
URL   : https://patchwork.freedesktop.org/series/162209/
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
commit 397725948d46f322a78cac8d56f864d9f18ffaef
Author: Uma Shankar <uma.shankar@intel.com>
Date:   Thu Feb 26 17:04:13 2026 +0530

    Revert "drm/xe/compat: Remove unused i915_reg.h from compat header"
    
    This reverts commit 4953d806a423087fcc49d4f8884fde85cd23ec1e.
    Change breaks build for drm-xe-next, hence revert.
    
    Signed-off-by: Uma Shankar <uma.shankar@intel.com>
+ /mt/dim checkpatch f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440 drm-intel
397725948d46 Revert "drm/xe/compat: Remove unused i915_reg.h from compat header"
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 6 lines checked


