Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E361EDB7E8
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 10:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6001510E3BA;
	Tue,  7 Apr 2026 10:11:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A811410E3BA;
 Tue,  7 Apr 2026 10:11:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/pin=3A_refactor_?=
 =?utf-8?q?to_i915_core?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Apr 2026 10:11:09 -0000
Message-ID: <177555666967.437137.7043093597987356386@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1775556190.git.jani.nikula@intel.com>
In-Reply-To: <cover.1775556190.git.jani.nikula@intel.com>
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

Series: drm/i915/pin: refactor to i915 core
URL   : https://patchwork.freedesktop.org/series/164434/
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
commit 0e16b283c44f416690771e133a26c3509ce4766d
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Apr 7 13:04:37 2026 +0300

    drm/i915/pin: switch to i915 core runtime pm
    
    Remove a dependency on struct intel_display from i915 core code.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 5f8792621868737c8b62a87b66dbf7eca4d9f7e3 drm-intel
8a462eb031d8 drm/i915: move intel_fb_pin.c to i915_fb_pin.c
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
rename from drivers/gpu/drm/i915/display/intel_fb_pin.c

total: 0 errors, 1 warnings, 0 checks, 40 lines checked
99cd0f73f4f2 drm/i915/pin: s/dev_priv/i915/ and drop struct drm_device usage
0e16b283c44f drm/i915/pin: switch to i915 core runtime pm


