Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E842C25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 23:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BD210E571;
	Tue,  4 Jun 2024 23:33:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8871E10E571;
 Tue,  4 Jun 2024 23:33:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_flush_engine_bu?=
 =?utf-8?q?ffers_before_signalling_user_fence_on_all_engines?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Jun 2024 23:33:32 -0000
Message-ID: <171754401255.2266479.17300314963528500800@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240604-fix_user_fence_posted-v2-0-9276ecef973a@intel.com>
In-Reply-To: <20240604-fix_user_fence_posted-v2-0-9276ecef973a@intel.com>
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

Series: drm/xe: flush engine buffers before signalling user fence on all engines
URL   : https://patchwork.freedesktop.org/series/134432/
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
commit 6df5122a820231b3c83e82087250b254a4a83131
Author: Andrzej Hajda <andrzej.hajda@intel.com>
Date:   Tue Jun 4 11:38:52 2024 +0200

    drm/xe: flush engine buffers before signalling user fence on all engines
    
    Tests show that user fence signalling requires kind of write barrier,
    otherwise not all writes performed by the workload will be available
    to userspace. It is already done for render and compute, we need it
    also for the rest: video, gsc, copy.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
+ /mt/dim checkpatch 596cf447db94909c4788fd612876520531e439b0 drm-intel
497acae83316 Revert "drm/xe: flush gtt before signalling user fence on all engines"
6df5122a8202 drm/xe: flush engine buffers before signalling user fence on all engines


