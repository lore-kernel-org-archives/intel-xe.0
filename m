Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C326C36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 13:42:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29BF10E7D8;
	Fri, 21 Mar 2025 13:42:45 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E3410E7D8;
 Fri, 21 Mar 2025 13:42:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Simplify_pinned?=
 =?utf-8?q?_bo_iteration_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Mar 2025 13:42:45 -0000
Message-ID: <174256456539.64728.691876484926719617@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250321133709.75327-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250321133709.75327-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Simplify pinned bo iteration (rev2)
URL   : https://patchwork.freedesktop.org/series/146586/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 160bae401859b2c9c47b838da800e22394afa8d2
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Mar 21 14:37:09 2025 +0100

    drm/xe: Simplify pinned bo iteration
    
    Introduce and use a helper to iterate over the various pinned bo lists.
    There are a couple of slight functional changes:
    
    1) GGTT maps are now performed with the bo locked.
    2) If the per-bo callback fails, keep the bo on the original list.
    
    v2:
    - Skip unrelated change in xe_bo.c
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch b15a87713d14b1c2986f47a622c5a8c5458e2396 drm-intel
160bae401859 drm/xe: Simplify pinned bo iteration
-:161: CHECK:CAMELCASE: Avoid CamelCase: <XE_BO_FLAG_GGTTx>
#161: FILE: drivers/gpu/drm/xe/xe_bo_evict.c:129:
+			if (tile != bo->tile && !(bo->flags & XE_BO_FLAG_GGTTx(tile)))

total: 0 errors, 0 warnings, 1 checks, 258 lines checked


