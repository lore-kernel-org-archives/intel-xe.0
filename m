Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDFBC5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 22:31:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFDB10E314;
	Thu,  5 Jun 2025 22:31:12 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0FD10E321;
 Thu,  5 Jun 2025 22:31:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_CPU_binds_and_ULLS_on_mig?=
 =?utf-8?q?ration_queue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 22:31:10 -0000
Message-ID: <174916267087.53928.17930646187063293837@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605153223.2789122-1-matthew.brost@intel.com>
In-Reply-To: <20250605153223.2789122-1-matthew.brost@intel.com>
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

Series: CPU binds and ULLS on migration queue
URL   : https://patchwork.freedesktop.org/series/149888/
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
commit 279b28877fabf6dc0d532a4a59512f14637941e8
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jun 5 08:32:23 2025 -0700

    drm/xe: Add modparam to enable / disable high SLPC on migrate queue
    
    Having modparam to enable / disable high SLPC on migrate queue will help
    with quick experiments.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 832a676ed68901ea8c404d8602381cd8ca413e88 drm-intel
f4c2f0320be4 drm/xe: Drop struct xe_migrate_pt_update argument from populate / clear vfuns
d813f13debcc drm/xe: Add __xe_migrate_update_pgtables_cpu helper
61e8e5136893 drm/xe: CPU binds for jobs
6f6d95dd398f drm/xe: Remove unused arguments from xe_migrate_pt_update_ops
e310cfc8cc2a drm/xe: Don't use migrate exec queue for page fault binds
0390a9be07e2 drm/xe: Add xe_hw_engine_write_ring_tail
031e47d4be17 drm/xe: Add ULLS support to LRC
150fab7c33a2 drm/xe: Add ULLS migration job support to migration layer
833c20d8b5da drm/xe: Add MI_SEMAPHORE_WAIT instruction defs
35429c87199f drm/xe: Add ULLS migration job support to ring ops
dbc5ead91ac7 drm/xe: Add ULLS migration job support to GuC submission
d09e11ff799f drm/xe: Enable ULLS migration jobs when opening LR VM
fcf6b019327a drm/xe: Set slpc freq to max on ULLS jobs
4125a1114dc2 drm/xe: Add modparam to enable / disable ULLS on migrate queue
279b28877fab drm/xe: Add modparam to enable / disable high SLPC on migrate queue


