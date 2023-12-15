Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE108C4167B
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 20:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982D810EA84;
	Fri, 15 Dec 2023 20:57:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id F3E8B10EA84;
 Fri, 15 Dec 2023 20:57:50 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F01E3AADF6;
 Fri, 15 Dec 2023 20:57:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display=3A_Fix_dum?=
 =?utf-8?q?my_=5F=5Fi915=5Finject=5Fprobe=5Ferror=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 15 Dec 2023 20:57:50 -0000
Message-ID: <170267387098.27833.16548763540743269773@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231215203331.3297341-1-lucas.demarchi@intel.com>
In-Reply-To: <20231215203331.3297341-1-lucas.demarchi@intel.com>
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

Series: drm/xe/display: Fix dummy __i915_inject_probe_error()
URL   : https://patchwork.freedesktop.org/series/127890/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7ea1f71b3a23e7698b621500be82600846691849
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Dec 15 12:33:31 2023 -0800

    drm/xe/display: Fix dummy __i915_inject_probe_error()
    
    When CONFIG_DRM_I915_DEBUG is not set, a dummy
    __i915_inject_probe_error() is provided on the xe side. Use the same
    logic as in drivers/gpu/drm/i915/i915_utils.c to ifdef it out. This
    fixes the build with W=1 and without that config:
    
              CC [M]  drivers/gpu/drm/xe/display/ext/i915_utils.o
            ../drivers/gpu/drm/xe/display/ext/i915_utils.c:19:5: error: no previous prototype for ‘__i915_inject_probe_error’ [-Werror=missing-prototypes]
               19 | int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
                  |     ^~~~~~~~~~~~~~~~~~~~~~~~~
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch a8ff56e160bbbac0d66e60990001cee38e90cb12 drm-intel
7ea1f71b3 drm/xe/display: Fix dummy __i915_inject_probe_error()
-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
	   19 | int __i915_inject_probe_error(struct drm_i915_private *i915, int err,

total: 0 errors, 1 warnings, 0 checks, 13 lines checked


