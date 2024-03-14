Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB421C5475B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 05:33:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B65D10EA89;
	Thu, 14 Mar 2024 05:33:01 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF28E10EC0B;
 Thu, 14 Mar 2024 05:33:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Refactor_BO_fla?=
 =?utf-8?q?gs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Mar 2024 05:33:00 -0000
Message-ID: <171039438097.750287.10783864719420082921@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240314052619.2628396-1-lucas.demarchi@intel.com>
In-Reply-To: <20240314052619.2628396-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Refactor BO flags
URL   : https://patchwork.freedesktop.org/series/131120/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9e2ee6987ee9b6a2765135bb741792f08c9cacfe
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Mar 13 22:26:19 2024 -0700

    drm/xe: Normalize bo flags macros
    
    The flags stored in the BO grew over time without following
    much a naming pattern. First of all, get rid of the _BIT suffix that was
    banned from everywhere else due to the guideline in
    drivers/gpu/drm/i915/i915_reg.h that xe kind of follows:
    
            Define bits using ``REG_BIT(N)``. Do **not** add ``_BIT`` suffix to the name.
    
    Here the flags aren't for a register, but it's good practice to keep it
    consistent.
    
    Second divergence on names is the use or not of "CREATE". This is
    because most of the flags are passed to xe_bo_create*() family of
    functions, changing its behavior. However, since the flags are also
    stored in the bo itself and checked elsewhere in the code, it seems
    better to just omit the CREATE part.
    
    With those 2 guidelines, all the flags are given the form
    XE_BO_FLAG_<FLAG_NAME> with the following commands:
    
            git grep -le "XE_BO_" -- drivers/gpu/drm/xe | xargs sed -i \
                    -e "s/XE_BO_\([_A-Z0-9]*\)_BIT/XE_BO_\1/g" \
                    -e 's/XE_BO_CREATE_/XE_BO_FLAG_/g'
            git grep -le "XE_BO_" -- drivers/gpu/drm/xe | xargs sed -i -r \
                    -e 's/XE_BO_(DEFER_BACKING|SCANOUT|FIXED_PLACEMENT|PAGETABLE|NEEDS_CPU_ACCESS|NEEDS_UC|INTERNAL_TEST|INTERNAL_64k)/XE_BO_FLAG_\1/g'
    
    And then the defines in drivers/gpu/drm/xe/xe_bo.h are adjusted to
    follow the coding style.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 96e47e3f3a5952e104d56352872becdc0048d26e drm-intel
353db0fc157d drm/xe: Stop passing user flag to xe_bo_create_user()
9e2ee6987ee9 drm/xe: Normalize bo flags macros
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
	Define bits using ``REG_BIT(N)``. Do **not** add ``_BIT`` suffix to the name.

-:108: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#108: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:56:
+					  XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(dev_priv)) |

-:597: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#597: FILE: drivers/gpu/drm/xe/xe_bo.c:1327:
+	if (flags & (XE_BO_FLAG_USER|XE_BO_FLAG_SYSTEM))
 	                            ^

-:823: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'tile' - possible side-effects?
#823: FILE: drivers/gpu/drm/xe/xe_bo.h:34:
+#define XE_BO_FLAG_VRAM_IF_DGFX(tile) (IS_DGFX(tile_to_xe(tile)) ? \
+					XE_BO_FLAG_VRAM0 << (tile)->id : \
+					XE_BO_FLAG_SYSTEM)

total: 0 errors, 2 warnings, 2 checks, 927 lines checked


