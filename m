Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13656C02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 10:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B257010EC4A;
	Fri, 14 Feb 2025 10:40:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61CA10EC49;
 Fri, 14 Feb 2025 10:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/sched=3A_Job_queue_pe?=
 =?utf-8?q?ek/pop_helpers_and_struct_job_re-order?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Feb 2025 10:40:39 -0000
Message-ID: <173952963973.1999727.16498228721692429345@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214101944.19390-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250214101944.19390-1-tvrtko.ursulin@igalia.com>
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

Series: drm/sched: Job queue peek/pop helpers and struct job re-order
URL   : https://patchwork.freedesktop.org/series/144853/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2fd3db60b5fa58e0b4d152f35cf208128405680f
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Fri Feb 14 10:19:44 2025 +0000

    drm/sched: Group exported prototypes by object type
    
    Do a bit of house keeping in gpu_scheduler.h by grouping the API by type
    of object it operates on.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Danilo Krummrich <dakr@kernel.org>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Philipp Stanner <phasta@kernel.org>
+ /mt/dim checkpatch 57457d93f156d8b4bdff8d138127d81b8f97d8c9 drm-intel
52018c361526 drm/sched: Add internal job peek/pop API
-:73: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#73: 
new file mode 100644

-:78: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#78: FILE: drivers/gpu/drm/scheduler/sched_internal.h:1:
+#ifndef _DRM_GPU_SCHEDULER_INTERNAL_H_

total: 0 errors, 2 warnings, 0 checks, 107 lines checked
f164199f3cc7 drm/amdgpu: Pop jobs from the queue more robustly
1cdc78a9b24e drm/sched: Remove a hole from struct drm_sched_job
8ff7c18e55ea drm/sched: Move drm_sched_entity_is_ready to internal header
529d8a528b33 drm/sched: Move internal prototypes to internal header
-:40: CHECK:LINE_SPACING: Please don't use multiple blank lines
#40: FILE: drivers/gpu/drm/scheduler/sched_internal.h:4:
 
+

total: 0 errors, 0 warnings, 1 checks, 100 lines checked
2fd3db60b5fa drm/sched: Group exported prototypes by object type


