Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356A4C02185
	for <intel-xe@archiver.kernel.org>; Sat, 18 Jan 2025 17:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F378010E335;
	Sat, 18 Jan 2025 17:56:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D420F10E22A;
 Sat, 18 Jan 2025 17:56:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Buiild_error_in_i915/xe_?=
 =?utf-8?q?=28was=3A_=5BPATCH_next_4/7=5D_minmax=2Eh=3A_Use_BUILD=5FBUG=5FON?=
 =?utf-8?q?=5FMSG=28=29_for_the_lo_=3C_hi_test_in_clamp=28=29=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 18 Jan 2025 17:56:45 -0000
Message-ID: <173722300585.1243095.12842344374185622989@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <c50365d214e04f9ba256d417c8bebbc0@AcuMS.aculab.com>
In-Reply-To: <c50365d214e04f9ba256d417c8bebbc0@AcuMS.aculab.com>
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

Series: Buiild error in i915/xe (was: [PATCH next 4/7] minmax.h: Use BUILD_BUG_ON_MSG() for the lo < hi test in clamp())
URL   : https://patchwork.freedesktop.org/series/143702/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 20f727ebe0d34e3f1b19e2ae7cdeda09f371571c
Author: Guenter Roeck <linux@roeck-us.net>
Date:   Sat Jan 18 09:49:21 2025 -0800

    Buiild error in i915/xe (was: [PATCH next 4/7] minmax.h: Use BUILD_BUG_ON_MSG() for the lo < hi test in clamp())
    
    On Sat, Jan 18, 2025 at 05:09:59PM +0000, David Laight wrote:
    > On Sat, 18 Jan 2025 08:13:06 -0800
    > Guenter Roeck <linux@roeck-us.net> wrote:
    >
    > > Hi,
    > >
    > > On Mon, Nov 18, 2024 at 07:13:31PM +0000, David Laight wrote:
    > > > Use BUILD_BUG_ON_MSG(statically_true(ulo > uhi), ...) for the sanity
    > > > check of the bounds in clamp().
    > > > Gives better error coverage and one less expansion of the arguments.
    > > >
    > > > Signed-off-by: David Laight <david.laight@aculab.com>
    > >
    > > This patch triggers a build error when trying to build parisc:allmodconfig.
    > > See error message and bisect log below.
    > >
    > > I don't think there is anything wrong with the patch. The underlying
    > > problem seems to be that parisc:allmodconfig enables CONFIG_DRM_XE which
    > > tries to build the affected file even though CONFIG_DRM_I915 is not
    > > enabled/supported on parisc.
    >
    > This has appeared before.
    > Any idea which inlined copy of scale() is causing the problem.
    > On the face of it they all look ok.
    >
    > If you can reproduce it maybe try commenting out some of the calls.
    >
    
    See diff below. All three changes are needed.
    No idea why the compiler would know that the values are invalid.
    
    Guenter
+ /mt/dim checkpatch 4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4 drm-intel
20f727ebe0d3 Buiild error in i915/xe (was: [PATCH next 4/7] minmax.h: Use BUILD_BUG_ON_MSG() for the lo < hi test in clamp())
-:20: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#20: 
> > This patch triggers a build error when trying to build parisc:allmodconfig.

-:48: WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#48: FILE: drivers/gpu/drm/i915/display/intel_backlight.c:79:
+#if 0

-:63: WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#63: FILE: drivers/gpu/drm/i915/display/intel_backlight.c:126:
+#if 0

-:74: WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#74: FILE: drivers/gpu/drm/i915/display/intel_backlight.c:147:
+#if 0

-:82: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 4 warnings, 0 checks, 36 lines checked


