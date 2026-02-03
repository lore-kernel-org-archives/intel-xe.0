Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A78E8B36C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 21:52:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4932710E28D;
	Tue,  3 Feb 2026 21:52:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7FA10E28D;
 Tue,  3 Feb 2026 21:52:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Some_more_=5Ftypes=2Eh_cl?=
 =?utf-8?q?eanups_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Feb 2026 21:52:15 -0000
Message-ID: <177015553517.221747.8510882562983641798@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260203211240.745-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260203211240.745-1-michal.wajdeczko@intel.com>
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

Series: Some more _types.h cleanups (rev3)
URL   : https://patchwork.freedesktop.org/series/149807/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ddd7273a4915d1a16a132070665a364608a9ed51
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Feb 3 22:12:39 2026 +0100

    drm/xe: Drop unnecessary include from xe_tile.h
    
    We don't need to include xe_device_types.h there.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch ff449f153b0966cfd7a7291670c927f6b6971d2a drm-intel
f331f5f5e3a1 drm/xe: Move xe_root_tile_mmio() to xe_device.h
ce65e112c29a drm/xe: Promote struct xe_mmio definition to own file
-:101: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#101: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 135 lines checked
e979f9b12bba drm/xe: Promote struct xe_tile definition to own file
-:167: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#167: 
new file mode 100644

-:189: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'tile__' - possible side-effects?
#189: FILE: drivers/gpu/drm/xe/xe_tile_types.h:18:
+#define tile_to_xe(tile__)								\
+	_Generic(tile__,								\
+		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
+		 struct xe_tile * : (tile__)->xe)

total: 0 errors, 1 warnings, 1 checks, 288 lines checked
ddd7273a4915 drm/xe: Drop unnecessary include from xe_tile.h


