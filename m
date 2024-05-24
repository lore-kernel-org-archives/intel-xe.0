Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D33C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 08:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E368945A;
	Fri, 24 May 2024 08:18:33 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4550D8945A;
 Fri, 24 May 2024 08:18:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Allow_migrate_v?=
 =?utf-8?q?m_gpu_submissions_from_reclaim_context_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 May 2024 08:18:30 -0000
Message-ID: <171653871028.2172910.1690829135769887725@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Allow migrate vm gpu submissions from reclaim context (rev3)
URL   : https://patchwork.freedesktop.org/series/133918/
State : success

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
commit cf0f7f13c8ccb064270f17404b0baf99abd0d6e5
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri May 24 09:19:40 2024 +0200

    drm/xe: Move job creation out of the struct xe_migrate::job_mutex
    
    In order to be able to run gpu jobs from reclaim context,
    move job creation (where allocation takes place) out of the
    struct xe_migrate::job_mutex, and prime that mutex as reclaim
    tainted.
    
    Jobs that may need to run from reclaim context include
    CCS metadata extraction at shrinking time.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 94810806e111d51cdb3822ee749448997993c732 drm-intel
88c7b5492541 drm/xe: Decouple job seqno and lrc seqno
a68592084c9c drm/xe: Split lrc seqno fence creation up
c930267a707e drm/xe: Don't initialize fences at xe_sched_job_create()
2258e4b071a1 drm/xe: Remove xe_lrc_create_seqno_fence()
cf0f7f13c8cc drm/xe: Move job creation out of the struct xe_migrate::job_mutex


