Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08AACA1016
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 16:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD1910E578;
	Mon,  8 Sep 2025 16:55:10 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F35A10E578;
 Mon,  8 Sep 2025 16:55:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe=3A_Rename_exec=5Fqueue_ops=2Efini_to_ops=2Edestroy?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Sep 2025 16:55:09 -0000
Message-ID: <175735050964.313432.7855144461107850314@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250905212248.3312537-4-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250905212248.3312537-4-daniele.ceraolospurio@intel.com>
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

Series: series starting with [1/3] drm/xe: Rename exec_queue ops.fini to ops.destroy
URL   : https://patchwork.freedesktop.org/series/154115/
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
commit cefd9cf0f5d243665325f1966160d96ad3c6a525
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Fri Sep 5 14:22:51 2025 -0700

    drm/xe: Allow error injection for xe_pxp_exec_queue_add
    
    This will allow us to simulate this function returning an error like
    we do for other functions called in the exec_queue_create path.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 78cc74214b6f200319b53d36c4c0ce6974af8d5b drm-intel
53105a2f75cd drm/xe: Rename exec_queue ops.fini to ops.destroy
667ad0604bff drm/xe: Fix error handling if PXP fails to start
-:40: WARNING:RETURN_VOID: void function return statements are not generally useful
#40: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:212:
+	return;
+}

total: 0 errors, 1 warnings, 0 checks, 147 lines checked
cefd9cf0f5d2 drm/xe: Allow error injection for xe_pxp_exec_queue_add


