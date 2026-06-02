Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E724FCD6E57
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 10:15:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC82910EE6C;
	Tue,  2 Jun 2026 10:15:44 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA68910EE6C;
 Tue,  2 Jun 2026 10:15:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D/pani?=
 =?utf-8?q?c=3A_drop_dependency_on_struct_intel=5Fframebuffer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Jun 2026 10:15:43 -0000
Message-ID: <178039534369.35116.7802437036740592355@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <cover.1780394867.git.jani.nikula@intel.com>
In-Reply-To: <cover.1780394867.git.jani.nikula@intel.com>
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

Series: drm/{i915, xe}/panic: drop dependency on struct intel_framebuffer
URL   : https://patchwork.freedesktop.org/series/167730/
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
commit 6c244bd41a136b5ec022479837536d26e4400a78
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Jun 2 13:09:09 2026 +0300

    drm/{i915, xe}/panic: drop dependency on struct intel_framebuffer
    
    Store tiling function pointer in struct intel_panic instead of struct
    intel_framebuffer, and store struct intel_panic pointer instead of
    struct intel_framebuffer pointer in struct drm_scanout_buffer private
    member.
    
    To make this happen, pass the tiling function pointer to panic setup
    hook, and initialize sb->private in the hook for clarity.
    
    This allows us to drop the dependency on struct intel_framebuffer from
    i915 and xe panic code.
    
    Note: It would be less verbose to have a typedef for the tiling function
    pointer. However, there isn't a nice location for it that wouldn't also
    increase header interdependencies.
    
    Cc: Jocelyn Falempe <jfalempe@redhat.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 51691efbd097f015d1f412ed410d399f2d9b672f drm-intel
325e269965e9 drm/i915/panic: split out i915_gem_panic.[ch]
-:198: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#198: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 329 lines checked
63735dac3d63 drm/i915/panic: squash i915_panic.c into i915_gem_panic.c
-:135: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#135: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 97 lines checked
7af0c06c778d drm/i915/panic: remove the extra layer from panic hooks
78e4008270ea drm/{i915,xe}/panic: pass obj to panic setup
b9658bfc254a drm/xe/panic: store fb bo in struct intel_panic
6c244bd41a13 drm/{i915, xe}/panic: drop dependency on struct intel_framebuffer
-:47: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#47: FILE: drivers/gpu/drm/i915/display/intel_parent.c:256:
+			     unsigned int (*tiling)(unsigned int x, unsigned int y, unsigned int width))

-:64: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#64: FILE: drivers/gpu/drm/i915/display/intel_parent.h:110:
+			     unsigned int (*tiling)(unsigned int x, unsigned int y, unsigned int width));

-:149: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#149: FILE: drivers/gpu/drm/i915/gem/i915_gem_panic.c:102:
+				       unsigned int (*tiling)(unsigned int x, unsigned int y, unsigned int width))

-:226: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#226: FILE: drivers/gpu/drm/xe/display/xe_panic.c:89:
+			  unsigned int (*tiling)(unsigned int x, unsigned int y, unsigned int width))

total: 0 errors, 4 warnings, 0 checks, 186 lines checked


