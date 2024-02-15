Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5B2C4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 16:49:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D1C10E9E5;
	Thu, 15 Feb 2024 16:49:08 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA6610E9E5;
 Thu, 15 Feb 2024 16:49:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Deny_unbinds_if_user_fenc?=
 =?utf-8?q?e_pending?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Feb 2024 16:49:06 -0000
Message-ID: <170801574698.925.9792710847276738391@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240215164021.438913-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20240215164021.438913-1-mika.kuoppala@linux.intel.com>
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

Series: Deny unbinds if user fence pending
URL   : https://patchwork.freedesktop.org/series/129957/
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
commit 200dd5fe0c6d732c009598c89fd6e1561b6b06d0
Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Date:   Thu Feb 15 18:40:21 2024 +0200

    drm/xe: Deny unbinds if uapi ufence pending
    
    If user fence was provided for MAP in vm_bind_ioctl
    and it has still not been signalled, deny UNMAP of said
    vma with EBUSY as long as unsignalled fence exists.
    
    This guarantees that MAP vs UNMAP sequences won't
    escape under the radar if we ever want to track the
    client's state wrt to completed and accessible MAPs.
    By means of intercepting the ufence release signalling.
    
    v2: find ufence with num_fences > 1 (Matt)
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1159
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
+ /mt/dim checkpatch 6d3abf8f7f55420cf53e9ed344872c459ecfd0ed drm-intel
e9ef6a5ff drm/xe: Expose user fence from xe_sync_entry
-:66: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#66: FILE: drivers/gpu/drm/xe/xe_sync.c:53:
+static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 					    u64 value)

total: 0 errors, 0 warnings, 1 checks, 128 lines checked
200dd5fe0 drm/xe: Deny unbinds if uapi ufence pending


