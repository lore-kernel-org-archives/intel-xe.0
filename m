Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34650FC72C5
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 12:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E742F10E3C6;
	Mon, 23 Mar 2026 12:38:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B45210E3D5;
 Mon, 23 Mar 2026 12:38:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_use_krealloc=5F?=
 =?utf-8?q?array_to_prevent_integer_overflow?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Baoli.Zhang" <baoli.zhang@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Mar 2026 12:38:01 -0000
Message-ID: <177426948155.385995.8654195821744011245@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260323120051.983301-1-baoli.zhang@linux.intel.com>
In-Reply-To: <20260323120051.983301-1-baoli.zhang@linux.intel.com>
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

Series: drm/xe: use krealloc_array to prevent integer overflow
URL   : https://patchwork.freedesktop.org/series/163696/
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
commit 5c7cf7c3f0e50d18efe68663899c224154c628da
Author: Baoli.Zhang <baoli.zhang@linux.intel.com>
Date:   Mon Mar 23 20:00:49 2026 +0800

    drm/xe: use krealloc_array to prevent integer overflow
    
    Replace the use of krealloc() with krealloc_array() in xe driver to
    mitigate the risk of integer overflow during memory allocation size
    calculation.
    
    Signed-off-by: Baoli.Zhang <baoli.zhang@linux.intel.com>
    Signed-off-by: Junxiao.Chang <junxiao.chang@intel.com>
+ /mt/dim checkpatch 5cb7d14d9bd2061386a0192a4649626a3e3a5ec3 drm-intel
5c7cf7c3f0e5 drm/xe: use krealloc_array to prevent integer overflow
-:37: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#37: FILE: drivers/gpu/drm/xe/xe_vm_madvise.c:68:
+			__vmas = krealloc_array(madvise_range->vmas,
+					  max_vmas,

total: 0 errors, 0 warnings, 1 checks, 19 lines checked


