Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1230C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 20:04:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E53F10E701;
	Wed, 14 May 2025 20:04:57 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A2110E701;
 Wed, 14 May 2025 20:04:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vf=3A_Post-migrati?=
 =?utf-8?q?on_recovery_of_queues_and_jobs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 20:04:56 -0000
Message-ID: <174725309633.80824.8516270876649577271@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250513224952.701343-1-tomasz.lis@intel.com>
In-Reply-To: <20250513224952.701343-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Post-migration recovery of queues and jobs
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
commit d1a645cf0b31d43f0126b3249eac65039254a971
Author: Tomasz Lis <tomasz.lis@intel.com>
Date:   Wed May 14 00:49:52 2025 +0200

    drm/xe/vf: Post migration, repopulate ring area for pending request
    
    The commands within ring area allocated for a request may contain
    references to GGTT. These references require update after VF
    migration, in order to continue any preempted LRCs, or jobs which
    were emitted to the ring but not sent to GuC yet.
    
    This change calls the emit function again for all such jobs,
    as part of post-migration recovery.
    
    Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
+ /mt/dim checkpatch 3d6670fab64cb00b5e6ed80d2517147db533faf1 drm-intel
bbabe9120f96 drm/xe/sa: Avoid caching GGTT address within the manager
725b46b75176 drm/xe/vf: Finish RESFIX by reset if CTB not enabled
e410cb336c16 drm/xe/vf: Pause submissions during RESFIX fixups
0d8e95b0897a drm/xe: Block reset while recovering from VF migration
229e74e0d035 drm/xe/vf: Rebase HWSP of all contexts after migration
-:38: CHECK:BRACES: Unbalanced braces around else statement
#38: FILE: drivers/gpu/drm/xe/xe_lrc.c:1201:
+	} else

total: 0 errors, 0 warnings, 1 checks, 91 lines checked
5e691aa6b97e drm/xe/vf: Rebase MEMIRQ structures for all contexts after migration
d1a645cf0b31 drm/xe/vf: Post migration, repopulate ring area for pending request


