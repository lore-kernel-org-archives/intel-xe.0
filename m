Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DF8CD37AB
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 18:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF57F10E580;
	Tue,  3 Sep 2024 18:41:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F212410E580;
 Tue,  3 Sep 2024 18:41:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/ttm=3A_Forward_-ENOSP?=
 =?utf-8?q?C_to_drivers_requesting_it?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Sep 2024 18:41:33 -0000
Message-ID: <172538889398.919808.13373394355773561000@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240903133849.17119-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240903133849.17119-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/ttm: Forward -ENOSPC to drivers requesting it
URL   : https://patchwork.freedesktop.org/series/138148/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ab3e852df792beba62be7a38646a250e6e5e18c2
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Sep 3 15:38:49 2024 +0200

    drm/ttm: Forward -ENOSPC to drivers requesting it
    
    Some user-space APIs distinguison between graphics memory OOMs and
    system (host) memory OOMs. To aid UMDs in determining the type of
    OOM, allow forwarding the ENOSPC from resource managers to drivers
    on calls to ttm_bo_validate().
    
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: dri-devel@lists.freedesktop.org
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 7378077b0be32160022a73b7050b963d52364618 drm-intel
ab3e852df792 drm/ttm: Forward -ENOSPC to drivers requesting it


