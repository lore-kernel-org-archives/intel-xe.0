Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDA8C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 09:57:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D29F10E994;
	Thu,  3 Apr 2025 09:57:13 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E95B10E994;
 Thu,  3 Apr 2025 09:57:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_LOBF_enablement_fix_=28re?=
 =?utf-8?q?v6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Apr 2025 09:57:12 -0000
Message-ID: <174367423231.31994.3947069125298181617@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250403092825.484347-1-animesh.manna@intel.com>
In-Reply-To: <20250403092825.484347-1-animesh.manna@intel.com>
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

Series: LOBF enablement fix (rev6)
URL   : https://patchwork.freedesktop.org/series/142278/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7f3c8ea5c5e81de316b711fbcc0401e365a53b3d
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Thu Apr 3 14:58:25 2025 +0530

    drm/i915/lobf: Check for sink error and disable LOBF
    
    Disable LOBF/ALPM for any erroneous condition from sink side.
    
    v1: Initial version.
    v2: Add centralized alpm error handling. [Jouni]
    v3: Improve debug print. [Jouni]
    v4: Disable alpm permanently for sink error. [Jouni]
    
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch 135e2838ed7d44d880e7e19971b1234e6ae04ded drm-intel
18f79e3f6034 drm/i915/lobf: Add lobf enablement in post plane update
98c8d852d87c drm/i915/lobf: Add debug print for LOBF
233da9871435 drm/i915/lobf: Disintegrate alpm_disable from psr_disable
1c4ce38c330d drm/i915/lobf: Add fixed refresh rate check in compute_config()
83172759f366 drm/i915/lobf: Update lobf if any change in dependent parameters
931c72ed7ef3 drm/i915/lobf: Add debug interface for lobf
57e3a31d1bc2 drm/i915/lobf: Add mutex for alpm update
-:89: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#89: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:1809:
+		struct mutex lock;

total: 0 errors, 0 warnings, 1 checks, 66 lines checked
7f3c8ea5c5e8 drm/i915/lobf: Check for sink error and disable LOBF


