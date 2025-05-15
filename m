Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A57C2D0CD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 22:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E07C10E972;
	Thu, 15 May 2025 22:25:03 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77A310E972;
 Thu, 15 May 2025 22:25:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vf=3A_Post-migrati?=
 =?utf-8?q?on_recovery_of_queues_and_jobs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 May 2025 22:25:01 -0000
Message-ID: <174734790168.86360.6077140091000807396@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250515221827.1493032-1-tomasz.lis@intel.com>
In-Reply-To: <20250515221827.1493032-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Post-migration recovery of queues and jobs (rev2)
URL   : https://patchwork.freedesktop.org/series/148982/
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
commit 3d91176745b6bac271e84306b2d20727c0daa18f
Author: Tomasz Lis <tomasz.lis@intel.com>
Date:   Fri May 16 00:18:27 2025 +0200

    drm/xe/vf: Post migration, repopulate ring area for pending request
    
    The commands within ring area allocated for a request may contain
    references to GGTT. These references require update after VF
    migration, in order to continue any preempted LRCs, or jobs which
    were emitted to the ring but not sent to GuC yet.
    
    This change calls the emit function again for all such jobs,
    as part of post-migration recovery.
    
    v2: Moved few functions to better files
    
    Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch c6d1963954d75071cb66459e1c15c72186f80718 drm-intel
7f887a6fd4d6 drm/xe/sa: Avoid caching GGTT address within the manager
5d240823df59 drm/xe/vf: Finish RESFIX by reset if CTB not enabled
aee4a969d044 drm/xe/vf: Pause submissions during RESFIX fixups
dd239ed5ded4 drm/xe: Block reset while recovering from VF migration
b0de14fde7bd drm/xe/vf: Rebase HWSP of all contexts after migration
-:96: CHECK:BRACES: Unbalanced braces around else statement
#96: FILE: drivers/gpu/drm/xe/xe_lrc.c:1199:
+	} else

total: 0 errors, 0 warnings, 1 checks, 108 lines checked
fac8df78e1b4 drm/xe/vf: Rebase MEMIRQ structures for all contexts after migration
3d91176745b6 drm/xe/vf: Post migration, repopulate ring area for pending request


