Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB83BC98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 17:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB5010E1F6;
	Fri, 25 Sep 2026 17:33:49 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974C110E1F6;
 Fri, 25 Sep 2026 17:33:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Increase_job_de?=
 =?utf-8?q?pth=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Sep 2026 17:33:47 -0000
Message-ID: <179035762761.208168.12585488212853330351@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260925172603.302050-4-dev@lankhorst.se>
In-Reply-To: <20260925172603.302050-4-dev@lankhorst.se>
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

Series: drm/xe: Increase job depth. (rev2)
URL   : https://patchwork.freedesktop.org/series/174494/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9e473db3072c45ce622b83de6bb894b02c6998fe
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Fri Sep 25 19:26:06 2026 +0200

    drm/xe: Set job credits based on LRC size
    
    This allows to fill the entire LRC and increase
    to a higher limit of outstanding jobs without throttling.
    
    Set maximum fill level to lrc_size - 4, to avoid wraparound
    and ensure the job is 8 byte aligned, since we insert a MI_NOOP
    in xe_lrc_write_ring() that needs to be accounted for.
    
    Changes since previous version:
    - Prevent filling LRC to max.
    - Reserve space for MI_NOOP.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch d3e3b787ba0daa01200907e0efeaa3f7da201a74 drm-intel
a3a2c9ec61e0 drm/xe: Convert job preparation in 2 stages
-:53: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#53: FILE: drivers/gpu/drm/xe/xe_ring_ops.c:390:
+static u32 __prepare_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
+				   u32 *dw, u64 batch_addr, u32 seqno)

total: 0 errors, 0 warnings, 1 checks, 295 lines checked
9e473db3072c drm/xe: Set job credits based on LRC size


