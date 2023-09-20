Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85ADC04FE8
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 18:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8190F10E53A;
	Wed, 20 Sep 2023 18:45:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A8CE510E53A;
 Wed, 20 Sep 2023 18:45:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AA5C7A00CC;
 Wed, 20 Sep 2023 18:45:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Date: Wed, 20 Sep 2023 18:45:40 -0000
Message-ID: <169523554069.6464.18031186529616046532@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230920140339.28322-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20230920140339.28322-1-ville.syrjala@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/3=5D_drm/i915=3A_Use_vblank_worker_to_u?=
 =?utf-8?q?npin_old_legacy_cursor_fb_safely_=28rev2=29?=
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

Series: series starting with [1/3] drm/i915: Use vblank worker to unpin old legacy cursor fb safely (rev2)
URL   : https://patchwork.freedesktop.org/series/123983/
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
commit 905dd90dd0a9f511909d87098f8c18d19e00f5c1
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Sep 20 20:27:51 2023 +0300

    maybe xe is broken enough that it gives you a new vma every time?
    
    v2: drop the warn to let testing proceed w/o taint
+ /mt/dim checkpatch 805557401e7aaeeec5aeb1de6688853390738bee drm-intel
aea09a869 drm/i915: Use vblank worker to unpin old legacy cursor fb safely
78311fc0d drm/vblank: Warn when silently cancelling vblank works
905dd90dd maybe xe is broken enough that it gives you a new vma every time?
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:21: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 8 lines checked


