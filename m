Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763F1C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 21:47:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A3210E6D1;
	Wed, 28 May 2025 21:47:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38B910E6D0;
 Wed, 28 May 2025 21:47:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_NPD_when_sa?=
 =?utf-8?q?ving_default_context?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 21:47:51 -0000
Message-ID: <174846887186.29902.3470981495135799520@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250528-fix-sched-v1-1-c042ef23ff8b@intel.com>
In-Reply-To: <20250528-fix-sched-v1-1-c042ef23ff8b@intel.com>
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

Series: drm/xe: Fix NPD when saving default context
URL   : https://patchwork.freedesktop.org/series/149608/
State : success

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
commit a02cd4e3c6952fe9b2dc3d06083282bde2a7aeb4
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed May 28 14:42:22 2025 -0700

    drm/xe: Fix NPD when saving default context
    
    xef is only valid if it's a job from userspace.  For in-kernel jobs it
    causes a NPD like below:
    
            <4> [] RIP: 0010:xe_sched_job_create+0xbd/0x390 [xe]
            ...
            <4> [] Call Trace:
            <4> []  <TASK>
            <4> []  __xe_bb_create_job+0xa2/0x240 [xe]
            <4> []  ? find_held_lock+0x31/0x90
            <4> []  ? xa_find_after+0x12c/0x250
            <4> []  xe_bb_create_job+0x6e/0x380 [xe]
            <4> []  ? xa_find_after+0x136/0x250
            <4> []  ? __drm_dev_dbg+0x7d/0xb0
            <4> []  xe_gt_record_default_lrcs+0x542/0xb00 [xe]
    
    Since drm_file starts with 1 for the unique id, just use 0 for the
    in-kernel jobs.
    
    Fixes: 2956554823ce ("drm/sched: Store the drm client_id in drm_sched_fence")
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
    Cc: Philipp Stanner <phasta@kernel.org>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 76d59d6988dc9194cbd7d3c551c11f47f56f4020 drm-intel
a02cd4e3c695 drm/xe: Fix NPD when saving default context


