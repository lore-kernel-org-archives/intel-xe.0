Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B340ECAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 17:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7522D10E789;
	Wed, 24 Sep 2025 17:03:04 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628A610E782;
 Wed, 24 Sep 2025 17:03:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2Cxe=7D/stole?=
 =?utf-8?q?n=3A_refactor_and_unify_interfaces?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Sep 2025 17:03:02 -0000
Message-ID: <175873338239.362669.8989638400916084295@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1758732183.git.jani.nikula@intel.com>
In-Reply-To: <cover.1758732183.git.jani.nikula@intel.com>
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

Series: drm/{i915,xe}/stolen: refactor and unify interfaces
URL   : https://patchwork.freedesktop.org/series/154984/
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
commit e00da6f6b5d161fee363decfa480024a458ea771
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Sep 24 19:43:40 2025 +0300

    drm/xe/stolen: use the same types as i915 interface
    
    Unify the i915 and xe interfaces by switching to the same types as i915.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch a4d9163251f4832a7d34d4b59449f9a68b9b7adf drm-intel
dac5dcf41f51 drm/{i915, xe}/stolen: rename i915_stolen_fb to intel_stolen_node
957630f94d54 drm/xe/stolen: rename fb to node in stolen compat header
fa714620d819 drm/xe/stolen: convert compat stolen macros to inline functions
7c6c6511572f drm/xe/stolen: switch from BUG_ON() to WARN_ON() in compat
d9143b3712b0 drm/i915/stolen: convert intel_stolen_node into a real struct of its own
835739a752a4 drm/xe/stolen: convert compat static inlines to proper functions
-:156: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#156: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 231 lines checked
5691e34c09f3 drm/{i915, xe}/stolen: make struct intel_stolen_node opaque
da47b233ec84 drm/{i915, xe}/stolen: add device pointer to struct intel_stolen_node
bb76c4bae564 drm/{i915, xe}/stolen: use the stored i915/xe device pointer
2655b4c90402 drm/{i915, xe}/stolen: convert stolen interface to struct drm_device
e00da6f6b5d1 drm/xe/stolen: use the same types as i915 interface


