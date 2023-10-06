Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07207E94104
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 19:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E2610E556;
	Fri,  6 Oct 2023 19:38:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B192B10E561;
 Fri,  6 Oct 2023 19:38:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B0DA2A03D2;
 Fri,  6 Oct 2023 19:38:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: maarten.lankhorst@linux.intel.com
Date: Fri, 06 Oct 2023 19:38:23 -0000
Message-ID: <169662110372.6465.8412370518907890106@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231006171800.1816211-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231006171800.1816211-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Add_uapi_for_dumpable_bos?=
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

Series: drm/xe: Add uapi for dumpable bos
URL   : https://patchwork.freedesktop.org/series/124741/
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
commit dc9a5715b8f80346f846b8acde8ca403fa8db8e6
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Fri Oct 6 19:18:00 2023 +0200

    drm/xe: Add uapi for dumpable bos
    
    Add XE_GEM_CREATE_FLAG_DUMPABLE for use with VM_BIND.
    For BO's with vram regions, XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM
    also needs to be specified.
    
    After this, we can use the flag XE_VM_BIND_FLAG_DUMPABLE to notify
    devcoredump that this mapping should be dumped.
    
    This is not hooked up, but the uapi should be ready before merging.
    If needed, we can relax the restrictions later.
    
    It's also not yet certain whether the BO contents will be preserved,
    or a reference to the BO. The latter allows us to skip a whole lot of
    tricky locking. This requires userspace to destroy all bo's that were
    marked dumpable though, but I feel this is a cleaner solution from
    a kernel perspective.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch d4af396a232e87d1febbc0e8832ae03bb3ecc4ea drm-intel
dc9a5715b drm/xe: Add uapi for dumpable bos
-:42: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#42: FILE: drivers/gpu/drm/xe/xe_bo.c:1816:
+		if (XE_IOCTL_DBG(xe, (bo_flags & XE_BO_CREATE_VRAM_MASK &&
+				 !(bo_flags & XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM))))

-:146: WARNING:TYPO_SPELLING: 'informations' may be misspelled - perhaps 'information'?
#146: FILE: include/uapi/drm/xe_drm.h:651:
+	 * See the NOTE there for more informations.
 	                               ^^^^^^^^^^^^

-:151: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Maarten Lankhorst <dev@lankhorst.se>' != 'Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>'

total: 0 errors, 2 warnings, 1 checks, 104 lines checked


