Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0141C54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 12:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B80E10E4D0;
	Tue, 27 May 2025 12:14:22 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DFF10E4CD;
 Tue, 27 May 2025 12:14:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Cleaning_up_code_related_?=
 =?utf-8?q?to_VRAM_regions_and_its_initialization_-_part_2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 May 2025 12:14:21 -0000
Message-ID: <174834806147.24233.1512822232023723622@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250526145647.1958756-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250526145647.1958756-1-piotr.piorkowski@intel.com>
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

Series: Cleaning up code related to VRAM regions and its initialization - part 2
URL   : https://patchwork.freedesktop.org/series/149503/
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
commit 3ac5e881852de8439ce01a771a3d030e3d246235
Author: Piotr Piórkowski <piotr.piorkowski@intel.com>
Date:   Mon May 26 16:56:47 2025 +0200

    drm/xe: Unify the initialization of VRAM regions
    
    Currently in the drivers we have defined VRAM regions per device and per
    tile. Initialization of these regions is done in two completely different
    ways. To simplify the logic of the code and make it easier to add new
    regions in the future, let's unify the way we initialize VRAM regions.
    
    Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Cc: Stuart Summers <stuart.summers@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 994b4d24e5526a8b1efca4ca25a3a3be47a886e5 drm-intel
f1c012960fa6 drm/xe: Use dynamic allocation for tile and device VRAM region structures
3ac5e881852d drm/xe: Unify the initialization of VRAM regions


