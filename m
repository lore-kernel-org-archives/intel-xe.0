Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174AAC25B7A
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 11:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3485510E2C8;
	Wed, 22 May 2024 11:41:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9182D10E2B2;
 Wed, 22 May 2024 11:40:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Allow_migrate_v?=
 =?utf-8?q?m_gpu_submissions_from_reclaim_context?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 May 2024 11:40:57 -0000
Message-ID: <171637805759.2167033.11234996980510109474@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240522111751.80380-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240522111751.80380-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Allow migrate vm gpu submissions from reclaim context
URL   : https://patchwork.freedesktop.org/series/133918/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 11a7d39aea73cb933adbded1453fc5f5433bbb20
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed May 22 13:17:51 2024 +0200

    drm/xe: Move job creation out of the struct xe_migrate::job_mutex
    
    In order to be able to run gpu jobs from reclaim context,
    move job creation (where allocation takes place) out of the
    struct xe_migrate::job_mutex, and prime that mutex as reclaim
    tainted.
    
    Jobs that may need to run from reclaim context include
    CCS metadata extraction at shrinking time.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 60134578b28bbd5dca007a0d8abaa6daaca9ddaf drm-intel
bfe9a2f0330e drm/xe: Split lrc seqno fence creation up
fa59794fd036 drm/xe: Don't initialize fences at xe_sched_job_create()
-:94: ERROR:CODE_INDENT: code indent should use tabs where possible
#94: FILE: drivers/gpu/drm/xe/xe_ring_ops.c:416:
+^I^I^I^I        job->ptrs[i].batch_addr,$

-:309: ERROR:CODE_INDENT: code indent should use tabs where possible
#309: FILE: drivers/gpu/drm/xe/xe_sched_job.c:204:
+        if (xe_fence_set_error(job->fence, error))$

-:309: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#309: FILE: drivers/gpu/drm/xe/xe_sched_job.c:204:
+        if (xe_fence_set_error(job->fence, error))$

-:375: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#375: FILE: drivers/gpu/drm/xe/xe_sched_job.c:341:
+		snapshot->batch_addr[i] = xe_device_uncanonicalize_addr(xe, job->ptrs[i].batch_addr);

total: 2 errors, 2 warnings, 0 checks, 361 lines checked
78601d017253 drm/xe: Remove xe_lrc_create_seqno_fence()
11a7d39aea73 drm/xe: Move job creation out of the struct xe_migrate::job_mutex


