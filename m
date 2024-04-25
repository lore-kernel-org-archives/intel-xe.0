Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696E3C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 18:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA4E11A75C;
	Thu, 25 Apr 2024 18:21:28 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF0D11A75C;
 Thu, 25 Apr 2024 18:21:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display=3A_Fix_ADL?=
 =?utf-8?q?-N_detection?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Apr 2024 18:21:26 -0000
Message-ID: <171406928665.1668081.5440291405861194637@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240425181610.2704633-1-lucas.demarchi@intel.com>
In-Reply-To: <20240425181610.2704633-1-lucas.demarchi@intel.com>
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

Series: drm/xe/display: Fix ADL-N detection
URL   : https://patchwork.freedesktop.org/series/132919/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d7ef9999cda999571461cd1303aeb2d6a045b13f
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Apr 25 11:16:09 2024 -0700

    drm/xe/display: Fix ADL-N detection
    
    Contrary to i915, in xe ADL-N is kept as a different platform, not a
    subplatform of ADL-P. Since the display side doesn't need to
    differentiate between P and N, i.e. IS_ALDERLAKE_P_N() is never called,
    just fixup the compat header to check for both P and N.
    
    Moving ADL-N to be a subplatform would be more complex as the firmware
    loading in xe only handles platforms, not subplatforms, as going forward
    the direction is to check on IP version rather than
    platforms/subplatforms.
    
    Fix warning when initializing display:
    
            xe 0000:00:02.0: [drm:intel_pch_type [xe]] Found Alder Lake PCH
            ------------[ cut here ]------------
            xe 0000:00:02.0: drm_WARN_ON(!((dev_priv)->info.platform == XE_ALDERLAKE_S) && !((dev_priv)->info.platform == XE_ALDERLAKE_P))
    
    And wrong paths being taken on the display side.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 92b848b529903fb99d21168491692474aae4872c drm-intel
d7ef9999cda9 drm/xe/display: Fix ADL-N detection
-:20: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#20: 
	xe 0000:00:02.0: drm_WARN_ON(!((dev_priv)->info.platform == XE_ALDERLAKE_S) && !((dev_priv)->info.platform == XE_ALDERLAKE_P))

-:35: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dev_priv' - possible side-effects?
#35: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:81:
+#define IS_ALDERLAKE_P(dev_priv) (IS_PLATFORM(dev_priv, XE_ALDERLAKE_P) || \
+				  IS_PLATFORM(dev_priv, XE_ALDERLAKE_N))

total: 0 errors, 1 warnings, 1 checks, 9 lines checked


