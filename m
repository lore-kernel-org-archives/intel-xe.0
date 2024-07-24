Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003AAC3DA63
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 23:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B113C10E30C;
	Wed, 24 Jul 2024 23:49:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F93810E30C;
 Wed, 24 Jul 2024 23:49:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/sched=3A_Only_start_T?=
 =?utf-8?q?DR_in_drm=5Fsched=5Fjob=5Fbegin_on_first_job?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Jul 2024 23:49:15 -0000
Message-ID: <172186495558.363900.15070314526490066368@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240724234417.1912357-1-matthew.brost@intel.com>
In-Reply-To: <20240724234417.1912357-1-matthew.brost@intel.com>
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

Series: drm/sched: Only start TDR in drm_sched_job_begin on first job
URL   : https://patchwork.freedesktop.org/series/136461/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d950e415833c394f0eaecee6e612dc1680cdf02f
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jul 24 16:44:17 2024 -0700

    drm/sched: Only start TDR in drm_sched_job_begin on first job
    
    Only start in drm_sched_job_begin on first job being added to the
    pending list as if pending list non-empty the TDR has already been
    started. It is problematic to restart the TDR as it will extend TDR
    period for an already running job, potentially leading to dma-fence
    signaling for a very long period of with continous stream of jobs.
    
    Cc: Christian König <christian.koenig@amd.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 4a9ed276779ab36170c7ee6c5237263eb563acc1 drm-intel
d950e415833c drm/sched: Only start TDR in drm_sched_job_begin on first job
-:13: WARNING:TYPO_SPELLING: 'continous' may be misspelled - perhaps 'continuous'?
#13: 
signaling for a very long period of with continous stream of jobs.
                                         ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


