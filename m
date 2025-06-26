Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F408C7EE30
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 21:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212E410E2F1;
	Thu, 26 Jun 2025 21:22:31 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A4D10E2F1;
 Thu, 26 Jun 2025 21:22:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_xe_with/without?=
 =?utf-8?q?_kunit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Jun 2025 21:22:30 -0000
Message-ID: <175097295039.113638.234747821854452588@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250626-xe-kunit-v1-0-2440e6d9a4b5@intel.com>
In-Reply-To: <20250626-xe-kunit-v1-0-2440e6d9a4b5@intel.com>
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

Series: drm/xe: xe with/without kunit
URL   : https://patchwork.freedesktop.org/series/150844/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d67fc8428ed5c81540d653583f9a4926f650ae34
Author: Harry Austen <hpausten@protonmail.com>
Date:   Thu Jun 26 13:56:19 2025 -0700

    drm/xe: Allow dropping kunit dependency as built-in
    
    Fix Kconfig symbol dependency on KUNIT, which isn't actually required
    for XE to be built-in. However, if KUNIT is enabled, it must be built-in
    too.
    
    Fixes: 08987a8b6820 ("drm/xe: Fix build with KUNIT=m")
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Signed-off-by: Harry Austen <hpausten@protonmail.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 98f015a92833e2d04fda89e1657a13d7290403e8 drm-intel
3f780d39218e FOR_CI: pcode-fix
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
at https://lore.kernel.org/intel-xe/gbisrh7ep2gn2fxv7xz4g4sy75qjpmcr5yqdx5atlab2oxevlx@j3zwx3k4o4x4/

-:20: CHECK:LINE_SPACING: Please don't use multiple blank lines
#20: FILE: drivers/gpu/drm/xe/xe_pcode.c:340:
 
+

total: 0 errors, 1 warnings, 1 checks, 16 lines checked
d67fc8428ed5 drm/xe: Allow dropping kunit dependency as built-in


