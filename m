Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85785C4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 19:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429FA10F2C2;
	Thu,  1 Feb 2024 19:07:56 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5BE10F2C2;
 Thu,  1 Feb 2024 19:07:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_loop_in_vm?=
 =?utf-8?q?=5Fbind=5Fioctl=5Fops=5Funwind?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Feb 2024 19:07:55 -0000
Message-ID: <170681447539.896769.6301151905262668906@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240201175532.2303168-1-matthew.brost@intel.com>
In-Reply-To: <20240201175532.2303168-1-matthew.brost@intel.com>
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

Series: drm/xe: Fix loop in vm_bind_ioctl_ops_unwind
URL   : https://patchwork.freedesktop.org/series/129432/
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
commit 1f95a9730513027118dfebf57c789b85a1735815
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Feb 1 09:55:32 2024 -0800

    drm/xe: Fix loop in vm_bind_ioctl_ops_unwind
    
    The logic for the unwind loop is incorrect resulting in an infinite
    loop. Fix to unwind to go from the last operations list to he first.
    
    Fixes: 617eebb9c480 ("drm/xe: Fix array of binds")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 3e58a4940c44430f20cad20ead5e1b77ed209cde drm-intel
1f95a9730 drm/xe: Fix loop in vm_bind_ioctl_ops_unwind
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '617eebb9c480', maybe rebased or not pulled?
#9: 
Fixes: 617eebb9c480 ("drm/xe: Fix array of binds")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


