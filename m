Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D74C001DF
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 23:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51BD10E4C9;
	Wed, 26 Jul 2023 23:12:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB7D310E4CB;
 Wed, 26 Jul 2023 23:12:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A5983AADF1;
 Wed, 26 Jul 2023 23:12:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Wed, 26 Jul 2023 23:12:29 -0000
Message-ID: <169041314967.23472.17362277250185088115@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230726222528.366732-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230726222528.366732-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_fix_mcr_semaphore_locking_for_MTL?=
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

Series: drm/xe: fix mcr semaphore locking for MTL
URL   : https://patchwork.freedesktop.org/series/121390/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4f5d63e907175850b268f642739af18a89c3b320
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Jul 26 15:25:28 2023 -0700

    drm/xe: fix mcr semaphore locking for MTL
    
    in commit 8604f978f45b ("drm/xe: Convert xe_mmio_wait32 to us so we can
    stop using wait_for_us.") the mcr semaphore register read was
    accidentally switched from waiting for the register to go to 1 to
    waiting for the register to go to 0, so we need to flip it back.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch b8202a008e7c05d97c26cb61012c36d0f249eaa1 drm-intel
4f5d63e90 drm/xe: fix mcr semaphore locking for MTL
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '8604f978f45b', maybe rebased or not pulled?
#6: 
in commit 8604f978f45b ("drm/xe: Convert xe_mmio_wait32 to us so we can

total: 0 errors, 1 warnings, 0 checks, 21 lines checked


