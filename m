Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB05CC25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 10:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F6410E4A2;
	Wed,  5 Jun 2024 10:55:28 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFFA10E4A2;
 Wed,  5 Jun 2024 10:55:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Ensure_write_lo?=
 =?utf-8?q?ck_is_held_when_calling_xe=5Fvma=5Frebind=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Jun 2024 10:55:23 -0000
Message-ID: <171758492382.607.16369793601783617705@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240605101607.29931-1-nirmoy.das@intel.com>
In-Reply-To: <20240605101607.29931-1-nirmoy.das@intel.com>
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

Series: drm/xe: Ensure write lock is held when calling xe_vma_rebind()
URL   : https://patchwork.freedesktop.org/series/134493/
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
commit 40a8ed97fd8a966bbd4c6099dd2b7a10d55271e8
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Wed Jun 5 12:16:07 2024 +0200

    drm/xe: Ensure write lock is held when calling xe_vma_rebind()
    
    xe_vma_rebind() expects write vm lock is held so start out with a
    read lock and upgrade if a vma rebind is required.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1894
    Fixes: bf69918b7199 ("drm/xe: Use xe_vma_ops to implement page fault rebinds")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Oak Zeng <oak.zeng@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch f7994ccb216e6879923aac0a2cdda38817332be2 drm-intel
40a8ed97fd8a drm/xe: Ensure write lock is held when calling xe_vma_rebind()


