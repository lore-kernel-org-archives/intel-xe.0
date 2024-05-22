Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3414AC25B78
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 07:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D733910EE0D;
	Wed, 22 May 2024 07:33:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D5910EE0D;
 Wed, 22 May 2024 07:33:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_flush_gtt_befor?=
 =?utf-8?q?e_signalling_user_fence_on_all_engines?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 May 2024 07:33:46 -0000
Message-ID: <171636322640.2165804.15026849066951021157@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240522-xu_flush_vcs_before_ufence-v2-1-9ac3e9af0323@intel.com>
In-Reply-To: <20240522-xu_flush_vcs_before_ufence-v2-1-9ac3e9af0323@intel.com>
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

Series: drm/xe: flush gtt before signalling user fence on all engines
URL   : https://patchwork.freedesktop.org/series/133906/
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
commit f4461209bd523782ecd50c3b5a9713d244544299
Author: Andrzej Hajda <andrzej.hajda@intel.com>
Date:   Wed May 22 09:27:27 2024 +0200

    drm/xe: flush gtt before signalling user fence on all engines
    
    Tests show that user fence signalling requires kind of write barrier,
    otherwise not all writes performed by the workload will be available
    to userspace. It is already done for render and compute, we need it
    also for the rest: video, gsc, copy.
    
    v2: added gsc and copy engines, added fixes and r-b tags
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1488
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch b134db8544f8d5b8a960b368afe12820c3cbe8cd drm-intel
f4461209bd52 drm/xe: flush gtt before signalling user fence on all engines


