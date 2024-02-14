Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9B7C48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 14:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0FC10E28F;
	Wed, 14 Feb 2024 14:21:11 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5881710E2D2;
 Wed, 14 Feb 2024 14:21:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Expose_user_fence_from_xe=5Fsync=5Fentry?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Feb 2024 14:21:10 -0000
Message-ID: <170792047036.1238604.733116543759775134@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240214141217.361122-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20240214141217.361122-1-mika.kuoppala@linux.intel.com>
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

Series: series starting with [1/2] drm/xe: Expose user fence from xe_sync_entry
URL   : https://patchwork.freedesktop.org/series/129900/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6f3690023ceccd19b15a8adfdaa7b179bf805a5d
Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Date:   Wed Feb 14 16:12:17 2024 +0200

    drm/xe: RFC Deny unbinds if uapi ufence pending
    
    If user fence was provided for MAP in vm_bind_ioctl
    and it has still not been signalled, deny UNMAP of said
    vma with EBUSY as long as unsignalled fence exists.
    
    This guarantees that MAP vs UNMAP sequences won't
    escape under the radar if we ever want to track the
    client's state wrt to completed and accessible MAPs.
    By means of intercepting the ufence release signalling.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1159
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
+ /mt/dim checkpatch 7b20177760d6b94898d9a9fa6c6077027daeacc6 drm-intel
e97e2c9a0 drm/xe: Expose user fence from xe_sync_entry
-:61: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#61: FILE: drivers/gpu/drm/xe/xe_sync.c:42:
+static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 					    u64 value)

total: 0 errors, 0 warnings, 1 checks, 152 lines checked
6f3690023 drm/xe: RFC Deny unbinds if uapi ufence pending


