Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A96C3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 17:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3279310E869;
	Wed,  7 May 2025 17:05:17 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279D510E869;
 Wed,  7 May 2025 17:05:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D=3A_c?=
 =?utf-8?q?onvert_i915-=3Edisplay_and_xe-=3Edisplay_into_pointers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 May 2025 17:05:16 -0000
Message-ID: <174663751615.56619.2722747625963985433@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <cover.1746610601.git.jani.nikula@intel.com>
In-Reply-To: <cover.1746610601.git.jani.nikula@intel.com>
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

Series: drm/{i915, xe}: convert i915->display and xe->display into pointers (rev2)
URL   : https://patchwork.freedesktop.org/series/148684/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1f9bdbf842ccdd925af3a5b606d16b0b83fc8f0c
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed May 7 18:22:54 2025 +0300

    drm/{i915, xe}: convert i915 and xe display members into pointers
    
    As the first step towards making struct intel_display an opaque pointer
    in i915 and xe drivers, convert the struct drm_i915_private and struct
    xe_device display members into pointers.
    
    Initially, add temporary struct intel_display __display members, and
    point display at it to avoid dynamic allocation. In the future, we can
    drop this, and switch to dynamic allocation.
    
    The conversion is done simply with sed:
    
    sed -i 's/&\([a-zA-Z0-9_>.-]*\)\(dev_priv\|i915\|xe\)->display\([^.]\)/\1\2->display\3/g' \
        $(git ls-files -- drivers/gpu/drm/i915 drivers/gpu/drm/xe)
    
    sed -i 's/\(dev_priv\|i915\|xe\)->display\./\1->display->/g' \
        $(git ls-files -- drivers/gpu/drm/i915 drivers/gpu/drm/xe)
    
    With a couple of manual tweaks on top.
    
    v2: Initialize i915->display also in selftest mock_gem_device()
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch c3be982edfd7bb6de5d4d3346d5d4189d7453d8d drm-intel
6f581313ea6c drm/xe/rpm: use to_xe_device() instead of container_of
c2e08cb021a4 drm/xe/display: do not reference xe->display inline
b70f6037aaa9 drm/i915: do not reference i915->display inline
1f9bdbf842cc drm/{i915, xe}: convert i915 and xe display members into pointers
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
sed -i 's/&\([a-zA-Z0-9_>.-]*\)\(dev_priv\|i915\|xe\)->display\([^.]\)/\1\2->display\3/g' \

total: 0 errors, 1 warnings, 0 checks, 823 lines checked


