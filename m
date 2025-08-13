Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF86CA0EE0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 10:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263D410E0CB;
	Wed, 13 Aug 2025 10:44:13 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4018E10E6F1;
 Wed, 13 Aug 2025 10:44:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Untangle_vm=5Fb?=
 =?utf-8?q?ind=5Fioctl_cleanup_order_and_fix_double_free_bug_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christoph Manszewski" <christoph.manszewski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Aug 2025 10:44:12 -0000
Message-ID: <175508185225.232118.13392571985419234736@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250813101231.196632-1-christoph.manszewski@intel.com>
In-Reply-To: <20250813101231.196632-1-christoph.manszewski@intel.com>
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

Series: drm/xe: Untangle vm_bind_ioctl cleanup order and fix double free bug (rev2)
URL   : https://patchwork.freedesktop.org/series/152835/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6f9293a391ff3c575bc021f454be5d0a0c076f57
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ddd66098df3cd799ab37a2cfc79071ff311b283e
Author: Christoph Manszewski <christoph.manszewski@intel.com>
Date:   Wed Aug 13 12:12:31 2025 +0200

    drm/xe: Untangle vm_bind_ioctl cleanup order
    
    Change the resource cleanup order to align with reverse allocation order.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
+ /mt/dim checkpatch 546fc742f08b8dbd3fa1486933c9b15085e11d13 drm-intel
2aceae6b34bb drm/xe: Fix vm_bind_ioctl double free bug
-:18: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#18: 
CPU: 5 UID: 0 PID: 14198 Comm: xe_vm Not tainted 6.16.0-xe-eudebug-cmanszew+ #520 PREEMPT(full)

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
ddd66098df3c drm/xe: Untangle vm_bind_ioctl cleanup order


