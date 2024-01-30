Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DF3C47DB3
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 03:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2F4112CB2;
	Tue, 30 Jan 2024 03:07:29 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB0D112CB2;
 Tue, 30 Jan 2024 03:07:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/sched=3A_Re-queue_run?=
 =?utf-8?q?_job_worker_when_drm=5Fsched=5Fentity=5Fpop=5Fjob=28=29_returns_N?=
 =?utf-8?q?ULL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 30 Jan 2024 03:07:27 -0000
Message-ID: <170658404763.808072.8514997086727346503@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240130030413.2031009-1-matthew.brost@intel.com>
In-Reply-To: <20240130030413.2031009-1-matthew.brost@intel.com>
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

Series: drm/sched: Re-queue run job worker when drm_sched_entity_pop_job() returns NULL
URL   : https://patchwork.freedesktop.org/series/129285/
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
commit ca595a398a56fbf76a84fa0336ca504103c16263
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Jan 29 19:04:13 2024 -0800

    drm/sched: Re-queue run job worker when drm_sched_entity_pop_job() returns NULL
    
    Rather then loop over entities until one with a ready job is found,
    re-queue the run job worker when drm_sched_entity_pop_job() returns NULL.
    
    Fixes: 6dbd9004a55 ("drm/sched: Drain all entities in DRM sched run job worker")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch f4c0dac89bd3cd02a1afe5e7a91ed4bf8de4afc6 drm-intel
ca595a398 drm/sched: Re-queue run job worker when drm_sched_entity_pop_job() returns NULL
Use of uninitialized value $cid in concatenation (.) or string at scripts/checkpatch.pl line 3229.
-:10: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes:  ("drm/sched: Drain all entities in DRM sched run job worker")'
#10: 
Fixes: 6dbd9004a55 ("drm/sched: Drain all entities in DRM sched run job worker")

-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '6dbd9004a55', maybe rebased or not pulled?
#10: 
Fixes: 6dbd9004a55 ("drm/sched: Drain all entities in DRM sched run job worker")

total: 0 errors, 2 warnings, 0 checks, 30 lines checked


