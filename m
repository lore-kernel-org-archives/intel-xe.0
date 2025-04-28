Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CFBC369D9
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 03:36:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5AD10E32D;
	Mon, 28 Apr 2025 03:36:45 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30F210E32D;
 Mon, 28 Apr 2025 03:36:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/gpusvm=3A_set_has=5Fd?=
 =?utf-8?q?ma=5Fmapping_inside_mapping_loop_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dafna Hirschfeld" <dafna.hirschfeld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Apr 2025 03:36:44 -0000
Message-ID: <174581140400.17251.3931831868725907352@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250428024752.881292-1-matthew.brost@intel.com>
In-Reply-To: <20250428024752.881292-1-matthew.brost@intel.com>
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

Series: drm/gpusvm: set has_dma_mapping inside mapping loop (rev2)
URL   : https://patchwork.freedesktop.org/series/148313/
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
commit c77d729be36774104c7414c8ebdd686b58a17109
Author: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
Date:   Sun Apr 27 19:47:52 2025 -0700

    drm/gpusvm: set has_dma_mapping inside mapping loop
    
    The 'has_dma_mapping' flag should be set once there is a
    mapping so it could be unmapped in case of error.
    
    v2:
    - Resend for CI
    
    Fixes: 99624bdff867 ("drm/gpusvm: Add support for GPU Shared Virtual Memory")
    Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 3169be72c46a44190c6bb7dcf3a0b80986809319 drm-intel
c77d729be367 drm/gpusvm: set has_dma_mapping inside mapping loop


