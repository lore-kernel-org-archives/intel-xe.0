Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460D5C61CE7
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 05:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B5310E33D;
	Wed, 11 Jun 2025 05:47:23 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5E710E33D;
 Wed, 11 Jun 2025 05:47:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Implement_clear?=
 =?utf-8?q?_VRAM_on_free?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Jun 2025 05:47:21 -0000
Message-ID: <174962084181.66341.13151030103882596230@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250611054235.3540936-1-matthew.brost@intel.com>
In-Reply-To: <20250611054235.3540936-1-matthew.brost@intel.com>
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

Series: drm/xe: Implement clear VRAM on free
URL   : https://patchwork.freedesktop.org/series/150074/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c7150d25d4a016d5f7b6b96e2ddd9a9bac567b4d
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jun 10 22:42:35 2025 -0700

    drm/xe: Implement clear VRAM on free
    
    Clearing on free should hide latency of BO clears on new user BO
    allocations.
    
    Implemented via calling xe_migrate_clear in release notify and updating
    iterator in xe_migrate_clear to skip cleared buddy blocks. Only user BOs
    cleared in release notify as kernel BOs could still be in use (e.g., PT
    BOs need to wait for dma-resv to be idle).
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 7bc153635620254b73cfe8714ce42768b2bf6d60 drm-intel
c7150d25d4a0 drm/xe: Implement clear VRAM on free


