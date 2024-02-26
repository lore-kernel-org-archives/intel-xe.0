Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7608EC5478C
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 17:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0784C10E7B8;
	Mon, 26 Feb 2024 17:10:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2DD10E7AE;
 Mon, 26 Feb 2024 17:10:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/3=5D_drm/xe=3A_Move_lrc_snapshot_capturing_to_xe=5Flrc=2Ec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Feb 2024 17:10:49 -0000
Message-ID: <170896744917.299440.2462481558234496387@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240226155913.77158-1-dev@lankhorst.se>
In-Reply-To: <20240226155913.77158-1-dev@lankhorst.se>
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

Series: series starting with [v2,1/3] drm/xe: Move lrc snapshot capturing to xe_lrc.c
URL   : https://patchwork.freedesktop.org/series/130394/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ad2b3bb3dfeeafded3d3ea5808514e49cb1e552
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 30403fbbb102e9b0c5dad7bfaeb1b14533150dbe
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Mon Feb 26 16:59:13 2024 +0100

    drm/xe: Implement capture of HWSP and HWCTX
    
    Dump the HWCTX and HWSP as part of LRC capture.
    
    Changes since v1:
    - Use same layout for HWSP and HWCTX as VM bo's, to simplify dumping.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch c815c7fa9257eb8ff4433c43058dd292b16347eb drm-intel
9585dc32af30 drm/xe: Move lrc snapshot capturing to xe_lrc.c
f0896417ee3c drm/xe: Move LRC snapshot capture to HW engine.
30403fbbb102 drm/xe: Implement capture of HWSP and HWCTX


