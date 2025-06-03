Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC975C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 20:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE87010E0AB;
	Tue,  3 Jun 2025 20:33:44 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7693B10E0AB;
 Tue,  3 Jun 2025 20:33:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Some_more_=5Ftypes=2Eh_cl?=
 =?utf-8?q?eanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Jun 2025 20:33:43 -0000
Message-ID: <174898282348.45504.1554190999596709592@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603202826.681-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250603202826.681-1-michal.wajdeczko@intel.com>
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

Series: Some more _types.h cleanups
URL   : https://patchwork.freedesktop.org/series/149807/
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
commit 816c847264734fb5f55fe9d59b3f30cec16290b9
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jun 3 22:28:26 2025 +0200

    drm/xe: Drop unnecessary include from xe_tile.h
    
    We don't need to include xe_device_types.h there.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch ba486e3b10ce5b4ee4d1ffc58aa4cc3b669c02a3 drm-intel
ad98c23df6f4 drm/xe: Move xe_root_tile_mmio() to xe_device.h
0f10bbea759c drm/xe: Promote struct xe_mmio definition to own file
-:88: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#88: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 116 lines checked
1e405379d958 drm/xe: Promote struct xe_tile definition to own file
-:208: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#208: 
new file mode 100644

-:232: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'tile__' - possible side-effects?
#232: FILE: drivers/gpu/drm/xe/xe_tile_types.h:20:
+#define tile_to_xe(tile__)								\
+	_Generic(tile__,								\
+		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
+		 struct xe_tile * : (tile__)->xe)

total: 0 errors, 1 warnings, 1 checks, 359 lines checked
816c84726473 drm/xe: Drop unnecessary include from xe_tile.h


