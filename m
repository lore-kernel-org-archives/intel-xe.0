Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFF6CCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 19:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4F210EA91;
	Thu, 16 Oct 2025 19:00:32 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FB410EA85;
 Thu, 16 Oct 2025 19:00:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/frontbuffer=3A_F?=
 =?utf-8?q?ix_the_intel=5Ffrontbuffer_lifetime_mess_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Oct 2025 19:00:31 -0000
Message-ID: <176064123113.23601.5116163662572377399@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251016185408.22735-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251016185408.22735-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/frontbuffer: Fix the intel_frontbuffer lifetime mess (rev2)
URL   : https://patchwork.freedesktop.org/series/155471/
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
commit 60e0051b935509d4429a757e1e9f08c0fe20e2d1
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Thu Oct 16 21:54:08 2025 +0300

    drm/i915/gem: s/i915_gem_object_get_frontbuffer/i915_gem_object_frontbuffer_lookup/
    
    The i915_gem_object_get_frontbuffer() name is rather confusing wrt.
    intel_frontbuffer_get(). Rename to i915_gem_object_frontbuffer_lookup()
    to make things less confusing.
    
    Acked-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch e919806d9a23ee1c2611792492289a170be4cf9d drm-intel
e2894b10e624 drm/i915/overlay: Drop the DIRTYFB flush
ee752dd4248f drm/i915/overlay: Switch to intel_frontbuffer_flip()
53cf494b3401 drm/i915/frontbuffer: Nuke intel_frontbuffer_flip_{prepare, complete}()
2ac736aea0a4 drm/i915/frontbuffer: Turn intel_bo_flush_if_display() into a frontbuffer operation
5d5194ee1b35 drm/i915/frontbuffer: Handle the dirtyfb cache flush inside intel_frontbuffer_flush()
9405441d18c2 drm/i915/frontbuffef: Split fb_tracking.lock into two
35204bd3d404 drm/i915/frontbuffer: Extract intel_frontbuffer_ref()
fcff16599211 drm/i915/frontbuffer: Add intel_frontbuffer::display
95a23c502196 drm/i915/frontbuffer: Fix intel_frontbuffer lifetime handling
-:338: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#338: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 555 lines checked
60e0051b9355 drm/i915/gem: s/i915_gem_object_get_frontbuffer/i915_gem_object_frontbuffer_lookup/


