Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA186C5B543
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 02:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A8510E301;
	Fri,  6 Jun 2025 02:44:21 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C0410E301;
 Fri,  6 Jun 2025 02:44:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vf=3A_Post-migrati?=
 =?utf-8?q?on_recovery_of_queues_and_jobs_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Jun 2025 02:44:20 -0000
Message-ID: <174917786033.53928.5440656784211674047@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250606001823.1010994-1-tomasz.lis@intel.com>
In-Reply-To: <20250606001823.1010994-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Post-migration recovery of queues and jobs (rev4)
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
commit 30c00f8abb88dc184b15bed8d9f4f55ed88ca31b
Author: Tomasz Lis <tomasz.lis@intel.com>
Date:   Fri Jun 6 02:18:23 2025 +0200

    drm/xe/vf: Refresh utilization buffer during migration recovery
    
    The WA buffer we use to capture context utilization contains GGTT
    references. This means its instructions have to be either fixed or
    re-emitted during VF post-migration recovery.
    
    This patch adds re-emitting content of the utilization WA BB during
    the recovery.
    
    Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Michal Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch 308a53b9affc92eca9eaa6117dd62c79d5419ce7 drm-intel
c7ef5f83c3ec drm/xe/sa: Avoid caching GGTT address within the manager
dc33a5bb2245 drm/xe/vf: Finish RESFIX by reset if CTB not enabled
a802bae4af16 drm/xe/vf: Pause submissions during RESFIX fixups
f78036d4b1b5 drm/xe: Block reset while recovering from VF migration
19c7fdd34f6b drm/xe/vf: Rebase HWSP of all contexts after migration
-:109: CHECK:BRACES: Unbalanced braces around else statement
#109: FILE: drivers/gpu/drm/xe/xe_lrc.c:1196:
+	} else

total: 0 errors, 0 warnings, 1 checks, 118 lines checked
c995ad5ff692 drm/xe/vf: Rebase MEMIRQ structures for all contexts after migration
0279455bd633 drm/xe/vf: Post migration, repopulate ring area for pending request
30c00f8abb88 drm/xe/vf: Refresh utilization buffer during migration recovery


