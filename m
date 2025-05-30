Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458D5C5B549
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 07:58:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F3B10E7F8;
	Fri, 30 May 2025 07:58:21 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DF610E7F8;
 Fri, 30 May 2025 07:58:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Make_VMA_tile?=
 =?utf-8?q?=5Fpresent=2C_tile=5Finvalidated_access_rules_clear_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 May 2025 07:58:20 -0000
Message-ID: <174859190060.34389.4348922577054617610@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250530061433.1819041-1-matthew.brost@intel.com>
In-Reply-To: <20250530061433.1819041-1-matthew.brost@intel.com>
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

Series: drm/xe: Make VMA tile_present, tile_invalidated access rules clear (rev3)
URL   : https://patchwork.freedesktop.org/series/149676/
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
commit c7e7bd5bd79d0dfc2379785cc1fec67c1d4fb65d
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu May 29 23:14:33 2025 -0700

    drm/xe: Make VMA tile_present, tile_invalidated access rules clear
    
    Document VMA tile_invalidated access rules, use READ_ONCE / WRITE_ONCE
    for opportunistic checks of tile_present and tile_invalidated, move
    tile_invalidated state change from page fault handler to PT code under
    the correct locks, and add lockdep asserts to TLB invalidation paths.
    
    v2:
     - Assert VM dma-resv lock rather than BO in zap PTEs
    v3:
     - Back to BO's dma-resv lock, adjust documentation
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch d94defa5c0a9e9fb29a60bd4ce78bac9018224bc drm-intel
c7e7bd5bd79d drm/xe: Make VMA tile_present, tile_invalidated access rules clear


