Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BE1CAC5B8
	for <intel-xe@archiver.kernel.org>; Sun,  5 Oct 2025 13:42:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881C710E2A6;
	Sun,  5 Oct 2025 13:42:43 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C802210E2A6;
 Sun,  5 Oct 2025 13:42:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Update_tile-based_message?=
 =?utf-8?q?s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 05 Oct 2025 13:42:41 -0000
Message-ID: <175967176181.6312.17379315551679157117@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251005133641.2651-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251005133641.2651-1-michal.wajdeczko@intel.com>
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

Series: Update tile-based messages
URL   : https://patchwork.freedesktop.org/series/155424/
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
commit 52c8c793e65348dfa03124030e762f9c182cbc45
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Sun Oct 5 15:36:40 2025 +0200

    drm/xe: Update MEMIRQ to use tile-based printk macros
    
    We already have tile-based printk macros, there is no need to
    manually prepare MEMIRQ specific messages to include tile id.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch af95880a54d743a43dd2d575764e0807a89da01f drm-intel
4a232f000ad5 drm/xe: Update SRIOV printk macros
10ece9000a95 drm/xe: Add tile-based SRIOV printk macros
-:34: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_gt' - possible side-effects?
#34: FILE: drivers/gpu/drm/xe/xe_gt_sriov_printk.h:12:
+#define __XE_GT_SRIOV_PRINTK_FMT(_gt, _fmt, ...) \
+	__XE_TILE_SRIOV_PRINTK_FMT((_gt)->tile, __XE_GT_PRINTK_FMT((_gt), _fmt, ##__VA_ARGS__))

-:44: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
new file mode 100644

-:63: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_tile' - possible side-effects?
#63: FILE: drivers/gpu/drm/xe/xe_tile_sriov_printk.h:15:
+#define xe_tile_sriov_printk(_tile, _level, _fmt, ...) \
+	xe_sriov_##_level((_tile)->xe, __XE_TILE_SRIOV_PRINTK_FMT((_tile), _fmt, ##__VA_ARGS__))

total: 0 errors, 1 warnings, 2 checks, 48 lines checked
5e8b70562981 drm/xe/pf: Update LMTT to use tile-based messages
52c8c793e653 drm/xe: Update MEMIRQ to use tile-based printk macros


