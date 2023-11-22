Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6CAC072A2
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 07:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BC410E5C1;
	Wed, 22 Nov 2023 07:36:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 80CDD10E5C1;
 Wed, 22 Nov 2023 07:36:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7E086A47DF;
 Wed, 22 Nov 2023 07:36:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 22 Nov 2023 07:36:29 -0000
Message-ID: <170063858951.4726.3608946091714421760@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231121195209.802235-1-lucas.demarchi@intel.com>
In-Reply-To: <20231121195209.802235-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_drm/xe=3A_Remove_XE=5FPVC=5FXT=5FI?=
 =?utf-8?q?DS?=
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

Series: series starting with [1/2] drm/xe: Remove XE_PVC_XT_IDS
URL   : https://patchwork.freedesktop.org/series/126727/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e134a88699b89e753b3be0c540e79f769c874ced
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Nov 21 11:52:09 2023 -0800

    drm/xe: Sync MTL PCI IDs with i915
    
    For Xe1 platforms, it's better to follow the way i915 adds the PCI IDs
    to the header, so it's easier to catch up when there is an update. This
    brings the same logic applied in commit 2e3c369f23a7 ("drm/i915/mtl:
    Eliminate subplatforms") to the equivalent xe header.
    
    The end result of this header for Xe1 platforms is now in sync with i915
    as of commit 5032c607e886 ("drm/i915: ATS-M device ID update"). This can
    be seen by
    
            $ git show 5032c607e886:include/drm/i915_pciids.h > a.h
            $ git diff --color-words  --no-index a.h include/drm/xe_pciids.h
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 89e2bb1e155242dd9aa46bc90e563e71c5f498b0 drm-intel
b288e1a99 drm/xe: Remove XE_PVC_XT_IDS
-:19: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#19: FILE: include/drm/xe_pciids.h:177:
+#define XE_PVC_IDS(MACRO__, ...)		\
 	MACRO__(0x0B69, ## __VA_ARGS__),	\
 	MACRO__(0x0B6E, ## __VA_ARGS__),	\
 	MACRO__(0x0BD5, ## __VA_ARGS__),	\

-:19: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#19: FILE: include/drm/xe_pciids.h:177:
+#define XE_PVC_IDS(MACRO__, ...)		\
 	MACRO__(0x0B69, ## __VA_ARGS__),	\
 	MACRO__(0x0B6E, ## __VA_ARGS__),	\
 	MACRO__(0x0BD5, ## __VA_ARGS__),	\

total: 1 errors, 0 warnings, 1 checks, 17 lines checked
e134a8869 drm/xe: Sync MTL PCI IDs with i915
-:8: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '2e3c369f23a7', maybe rebased or not pulled?
#8: 
brings the same logic applied in commit 2e3c369f23a7 ("drm/i915/mtl:

-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '5032c607e886', maybe rebased or not pulled?
#12: 
as of commit 5032c607e886 ("drm/i915: ATS-M device ID update"). This can

-:29: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#29: FILE: include/drm/xe_pciids.h:177:
+#define XE_MTL_IDS(MACRO__, ...)		\
+	MACRO__(0x7D40, ## __VA_ARGS__),	\
+	MACRO__(0x7D45, ## __VA_ARGS__),	\
+	MACRO__(0x7D55, ## __VA_ARGS__),	\
+	MACRO__(0x7D60, ## __VA_ARGS__),	\
+	MACRO__(0x7D67, ## __VA_ARGS__),	\
+	MACRO__(0x7DD5, ## __VA_ARGS__)

-:29: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#29: FILE: include/drm/xe_pciids.h:177:
+#define XE_MTL_IDS(MACRO__, ...)		\
+	MACRO__(0x7D40, ## __VA_ARGS__),	\
+	MACRO__(0x7D45, ## __VA_ARGS__),	\
+	MACRO__(0x7D55, ## __VA_ARGS__),	\
+	MACRO__(0x7D60, ## __VA_ARGS__),	\
+	MACRO__(0x7D67, ## __VA_ARGS__),	\
+	MACRO__(0x7DD5, ## __VA_ARGS__)

total: 1 errors, 2 warnings, 1 checks, 49 lines checked


