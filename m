Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B01CD98D2
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 11:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4234F10EE94;
	Thu, 11 Jun 2026 11:25:49 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFBA10E1A7;
 Thu, 11 Jun 2026 11:25:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Allow_pushing_m?=
 =?utf-8?q?ore_jobs_into_LRC=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jun 2026 11:25:48 -0000
Message-ID: <178117714819.68367.16464612297204955837@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260611103613.191719-1-dev@lankhorst.se>
In-Reply-To: <20260611103613.191719-1-dev@lankhorst.se>
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

Series: drm/xe: Allow pushing more jobs into LRC.
URL   : https://patchwork.freedesktop.org/series/168339/
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
commit e483a4f2cd9167d86c62c5154acdf9fc6f0fa8af
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Thu Jun 11 12:36:13 2026 +0200

    drm/xe: Set job credits based on LRC size
    
    This allows to fill the entire LRC and increase
    to a higher limit of outstanding jobs without throttling.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 4fdfaadba04dc0f2f2490dbc91922caa290463a5 drm-intel
803e8d73e922 drm/xe: Convert job preparation in 2 stages
-:53: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#53: FILE: drivers/gpu/drm/xe/xe_ring_ops.c:380:
+static u32 __prepare_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
+				   u32 *dw, u64 batch_addr, u32 seqno)

total: 0 errors, 0 warnings, 1 checks, 295 lines checked
e483a4f2cd91 drm/xe: Set job credits based on LRC size


