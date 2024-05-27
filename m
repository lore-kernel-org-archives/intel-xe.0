Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2954C25B74
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 14:06:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB17510E285;
	Mon, 27 May 2024 14:06:07 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C8110E285;
 Mon, 27 May 2024 14:06:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Allow_migrate_v?=
 =?utf-8?q?m_gpu_submissions_from_reclaim_context?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 May 2024 14:06:05 -0000
Message-ID: <171681876572.2213173.13005798590829892068@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240527135912.152156-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240527135912.152156-1-thomas.hellstrom@linux.intel.com>
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
URL   : https://patchwork.freedesktop.org/series/134087/
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
commit 81044b5bd81dc66c9552cd7bd5ced4afaca4fd97
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon May 27 15:59:12 2024 +0200

    drm/xe: Move job creation out of the struct xe_migrate::job_mutex
    
    In order to be able to run gpu jobs from reclaim context,
    move job creation (where allocation takes place) out of the
    struct xe_migrate::job_mutex, and prime that mutex as reclaim
    tainted.
    
    Jobs that may need to run from reclaim context include
    CCS metadata extraction at shrinking time.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch f2c37d7fd878c82ea57075948d614f60a168128c drm-intel
30b307b89956 drm/xe: Decouple job seqno and lrc seqno
c103d7d6b259 drm/xe: Split lrc seqno fence creation up
61e22870531d drm/xe: Don't initialize fences at xe_sched_job_create()
ae8aa4180f0b drm/xe: Remove xe_lrc_create_seqno_fence()
81044b5bd81d drm/xe: Move job creation out of the struct xe_migrate::job_mutex


