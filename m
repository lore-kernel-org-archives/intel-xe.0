Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3387EB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 14:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC5F10E207;
	Mon, 26 Jun 2023 14:00:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 78BC510E20A;
 Mon, 26 Jun 2023 14:00:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1C831AADED;
 Mon, 26 Jun 2023 14:00:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Mon, 26 Jun 2023 14:00:51 -0000
Message-ID: <168778805111.5705.4615147937821401964@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230626135824.21984-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230626135824.21984-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_se?=
 =?utf-8?q?ries_starting_with_=5BCI=2C1/4=5D_drm/xe/bo=3A_Fix_swapin_when_?=
 =?utf-8?q?moving_to_VRAM?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [CI,1/4] drm/xe/bo: Fix swapin when moving to VRAM
URL   : https://patchwork.freedesktop.org/series/119865/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e6dfc37edb8ddce4edd4c7015cbad35ab77f4e86
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Jun 26 15:58:24 2023 +0200

    drm/xe/bo: Evict VRAM to TT rather than to system
    
    The main difference is that we don't bounce and sync on eviction, allowing
    for pipelined eviction. Moving forward we also need to be careful with
    dma mappings which can be released in SYSTEM but may remain in TT.
    
    v2:
    - Remove a stale comment (Matthew Brost)
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20230619152222.11733-6-thomas.hellstrom@linux.intel.com
+ /mt/dim checkpatch d3fc5af59c7c17ad1a0272c49dbff84534d9d606 drm-intel
60df34789 drm/xe/bo: Fix swapin when moving to VRAM
8cca2bde9 drm/xe/bo: Avoid creating a system resource when allocating a fresh VRAM bo
3e5a016aa drm/xe/bo: Gracefully handle errors from ttm_bo_move_accel_cleanup().
e6dfc37ed drm/xe/bo: Evict VRAM to TT rather than to system


