Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67307C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 08:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302D610E4C3;
	Mon, 10 Feb 2025 08:31:43 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6931D10E068;
 Mon, 10 Feb 2025 08:31:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Cleaning_up_code_related_?=
 =?utf-8?q?to_VRAM_regions_and_its_initialization_-_part_1_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Feb 2025 08:31:42 -0000
Message-ID: <173917630242.181566.15522900294898402685@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250210081511.906452-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250210081511.906452-1-piotr.piorkowski@intel.com>
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

Series: Cleaning up code related to VRAM regions and its initialization - part 1 (rev3)
URL   : https://patchwork.freedesktop.org/series/144172/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fa9a1d2aa6dea19e3d20be29ac3a34e6ec83d528
Author: Piotr Piórkowski <piotr.piorkowski@intel.com>
Date:   Mon Feb 10 09:15:11 2025 +0100

    drm/xe: Move VRAM manager to struct xe_vram_region
    
    VRAM manager is related directly to struct xe_vram_region so it
    should be inside this structure.
    Let's move the VRAM to struct xe_vram_region.
    
    v2:
     - remove xe_vram_region pointer from xe_ttm_vram_mgr
     - stop use dynamic alloaction for xe_ttm_vram_mgr in xe_vram_region
     - rename struct xe_ttm_vram_mgr vram_mgr to ttm
    v3:
     - fix "'ttm' not described in 'xe_vram_region'"
    
    Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 24a5696cb262c7829956cc708c7fc715fefc92fe drm-intel
3e687de9c51c drm/xe: Rename struct xe_mem_region to struct xe_vram_region
fa9a1d2aa6de drm/xe: Move VRAM manager to struct xe_vram_region


