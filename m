Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DE1CCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 19:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8984210E03F;
	Fri, 17 Oct 2025 19:53:06 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF3F10E03F;
 Fri, 17 Oct 2025 19:53:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_additional_sysfs_node?=
 =?utf-8?q?_access_CFI_violations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ryan Neph" <ryanneph@google.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Oct 2025 19:53:05 -0000
Message-ID: <176073078511.29124.5471558791325669961@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251017-rn-cfi-v1-0-bf66e6ad4fcd@google.com>
In-Reply-To: <20251017-rn-cfi-v1-0-bf66e6ad4fcd@google.com>
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

Series: Fix additional sysfs node access CFI violations
URL   : https://patchwork.freedesktop.org/series/156151/
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
commit 0ca459d7eeb6651b86e6c60f0f6306140df2bc77
Author: Ryan Neph <ryanneph@google.com>
Date:   Fri Oct 17 12:46:26 2025 -0700

    drm/xe/configfs: fix clang warnings for missing parameter name
    
    Fixes warning from clang-17 that look like:
    
    drivers/gpu/drm/xe/xe_configfs.h:35:97: error: omitting the parameter name in a function definition is a C2x extension [-Werror,-Wc2x-extensions]
       35 | static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
    
    Signed-off-by: Ryan Neph <ryanneph@google.com>
+ /mt/dim checkpatch b1e4a43a6119f12c2cc29f631f991b5b853149cc drm-intel
9c6064fc451e drm/xe/sysfs: Fix additional sysfs node access CFI violations
-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
<https://lore.kernel.org/r/20250422171852.85558-1-jeevaka.badrappan@intel.com>

-:158: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#158: FILE: drivers/gpu/drm/xe/xe_vram_freq.c:53:
 }
+static struct kobj_attribute attr_max_freq = __ATTR_RO(max_freq);

-:174: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#174: FILE: drivers/gpu/drm/xe/xe_vram_freq.c:75:
 }
+static struct kobj_attribute attr_min_freq = __ATTR_RO(min_freq);

total: 0 errors, 1 warnings, 2 checks, 141 lines checked
0ca459d7eeb6 drm/xe/configfs: fix clang warnings for missing parameter name
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
   35 | static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,

total: 0 errors, 1 warnings, 0 checks, 24 lines checked


