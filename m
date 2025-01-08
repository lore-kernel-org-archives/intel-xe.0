Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CE7E77188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 15:52:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C147C10E1BC;
	Wed,  8 Jan 2025 15:52:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B8A10E02F;
 Wed,  8 Jan 2025 15:52:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/audio=3A_convert?=
 =?utf-8?q?_to_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Jan 2025 15:52:57 -0000
Message-ID: <173635157753.1338748.3578687909324566765@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1736345025.git.jani.nikula@intel.com>
In-Reply-To: <cover.1736345025.git.jani.nikula@intel.com>
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

Series: drm/i915/audio: convert to struct intel_display
URL   : https://patchwork.freedesktop.org/series/143247/
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
commit 233cdb6762e5486c0c262103ce2e115a0b862953
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Jan 8 16:04:15 2025 +0200

    drm/i915/audio: rename function prefixes from i915 to intel
    
    The intel prefix is more accurate for display stuff. Rename.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48 drm-intel
0b5f3310950b drm/i915/audio: convert to struct intel_display
d21ce0976a9c drm/i915/audio: convert LPE audio to struct intel_display
-:425: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#425: FILE: drivers/gpu/drm/i915/display/intel_lpe_audio.h:27:
 }
+static inline void intel_lpe_audio_teardown(struct intel_display *display)

-:429: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#429: FILE: drivers/gpu/drm/i915/display/intel_lpe_audio.h:30:
 }
+static inline void intel_lpe_audio_irq_handler(struct intel_display *display)

-:433: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#433: FILE: drivers/gpu/drm/i915/display/intel_lpe_audio.h:33:
 }
+static inline void intel_lpe_audio_notify(struct intel_display *display,

total: 0 errors, 0 warnings, 3 checks, 417 lines checked
233cdb6762e5 drm/i915/audio: rename function prefixes from i915 to intel


