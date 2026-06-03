Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5A1CD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 15:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CA110E373;
	Wed,  3 Jun 2026 15:06:56 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B9210E373;
 Wed,  3 Jun 2026 15:06:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe=3A_fix_job_timeout_recovery_for_unstarted_jobs_and_k?=
 =?utf-8?q?ernel_queues?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Jun 2026 15:06:54 -0000
Message-ID: <178049921487.40081.14542558818885379564@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260603150059.157355-4-rodrigo.vivi@intel.com>
In-Reply-To: <20260603150059.157355-4-rodrigo.vivi@intel.com>
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

Series: series starting with [1/3] drm/xe: fix job timeout recovery for unstarted jobs and kernel queues
URL   : https://patchwork.freedesktop.org/series/167822/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8a39476c0f162eb6795f78f9a9df5a3066102884
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Jun 3 11:01:02 2026 -0400

    drm/xe/lrc: remove engine_id PPHWSP stash
    
    Now that the hw engine pointer is stored directly in the lrc, the
    workaround that stored ENGINE_ID into the PPHWSP at context restore
    time has no consumers. Remove the stash and all supporting
    infrastructure.
    
    Assisted-by: GitHub-Copilot:claude-sonnet-4.6
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 4354c70593040dcb61935903e0fe1c90ca531df7 drm-intel
fefeb6d3f588 drm/xe: fix job timeout recovery for unstarted jobs and kernel queues
2d5d3edf45cf drm/xe/lrc: fix spurious warning when reading context timestamp
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
  xe 0000:03:00.0: [drm] Tile0: GT0: Unexpected engine class:instance 3:8 for utilization

total: 0 errors, 1 warnings, 0 checks, 47 lines checked
8a39476c0f16 drm/xe/lrc: remove engine_id PPHWSP stash


