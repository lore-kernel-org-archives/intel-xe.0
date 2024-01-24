Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66132C46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 21:10:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DE310EA5D;
	Wed, 24 Jan 2024 21:10:33 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDDD10EA5D;
 Wed, 24 Jan 2024 21:10:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/sched=3A_Drain_all_en?=
 =?utf-8?q?tities_in_DRM_sched_run_job_worker?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 24 Jan 2024 21:10:31 -0000
Message-ID: <170613063185.709515.10518965976423779428@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240124210811.1639040-1-matthew.brost@intel.com>
In-Reply-To: <20240124210811.1639040-1-matthew.brost@intel.com>
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

Series: drm/sched: Drain all entities in DRM sched run job worker
URL   : https://patchwork.freedesktop.org/series/129142/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
b2ca823f819193c33ab811dfac08c614138d6d46
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9198f283992b1bdf0694bdfc764c04e78a2c1314
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jan 24 13:08:11 2024 -0800

    drm/sched: Drain all entities in DRM sched run job worker
    
    All entities must be drained in the DRM scheduler run job worker to
    avoid the following case. An entity found that is ready, no job found
    ready on entity, and run job worker goes idle with other entities + jobs
    ready. Draining all ready entities (i.e. loop over all ready entities)
    in the run job worker ensures all job that are ready will be scheduled.
    
    Cc: Thorsten Leemhuis <regressions@leemhuis.info>
    Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
    Closes: https://lore.kernel.org/all/CABXGCsM2VLs489CH-vF-1539-s3in37=bwuOWtoeeE+q26zE+Q@mail.gmail.com/
    Reported-and-tested-by: Mario Limonciello <mario.limonciello@amd.com>
    Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3124
    Link: https://lore.kernel.org/all/20240123021155.2775-1-mario.limonciello@amd.com/
    Reported-by: Vlastimil Babka <vbabka@suse.cz>
    Closes: https://lore.kernel.org/dri-devel/05ddb2da-b182-4791-8ef7-82179fd159a8@amd.com/T/#m0c31d4d1b9ae9995bb880974c4f1dbaddc33a48a
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 7ec08146b3938f825a1cbe49e36a5362b10204be drm-intel
9198f2839 drm/sched: Drain all entities in DRM sched run job worker


