Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0A7CDD55C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 21:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DB010E645;
	Wed, 18 Sep 2024 21:39:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F27510E645;
 Wed, 18 Sep 2024 21:39:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_wakeref_fixes?=
 =?utf-8?q?_and_improvements_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 21:39:09 -0000
Message-ID: <172669554938.1027924.12028973072055540404@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1726680898.git.jani.nikula@intel.com>
In-Reply-To: <cover.1726680898.git.jani.nikula@intel.com>
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

Series: drm/i915: wakeref fixes and improvements (rev2)
URL   : https://patchwork.freedesktop.org/series/138811/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c8c4ad80d49dd9543bb960fbbbe262cfc6162c64
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Sep 18 20:35:48 2024 +0300

    drm/i915: switch intel_wakeref_t underlying type to struct ref_tracker *
    
    For intel_wakeref_t, opaque is reasonable, but disguising the underlying
    struct ref_tracker * as an unsigned long is not so great. Update the
    typedef to remove one level of disguise.
    
    Although the kernel coding style strongly discourages pointer typedefs,
    it's a better alternative, and an incremental improvement on the status
    quo. It provides much better type safety than an unsigned long could,
    and prevents passing magic -1 instead of INTEL_WAKEREF_DEF. Moreover, it
    provides a gradual path for replacing intel_wakeref_t with struct
    ref_tracker * if desired.
    
    As an extra safety measure, check for error pointers in
    intel_ref_tracker_free() before passing them on to ref_tracker_free(),
    to catch any mistakes with mock gt special wakeref value.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 2141344f9b4f0bcd6bb20a45afaef94209743c0d drm-intel
262a22333407 drm/i915/gem: fix bitwise and logical AND mixup
51356f34c524 drm/i915: use INTEL_WAKEREF_DEF instead of magic -1 for intel_wakeref_t
578cbb705cfd drm/i915/display: return 0 instead of false for disabled power wakeref
a37321fc760c drm/i915/gt: add a macro for mock gt wakeref special value and use it
904686d2a014 drm/i915/audio: be explicit about intel_wakeref_t conversions
c8c4ad80d49d drm/i915: switch intel_wakeref_t underlying type to struct ref_tracker *
-:46: WARNING:NEW_TYPEDEFS: do not add new typedefs
#46: FILE: drivers/gpu/drm/i915/intel_wakeref.h:24:
+typedef struct ref_tracker *intel_wakeref_t;

-:93: WARNING:NEW_TYPEDEFS: do not add new typedefs
#93: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h:8:
+typedef struct ref_tracker *intel_wakeref_t;

total: 0 errors, 2 warnings, 0 checks, 56 lines checked


