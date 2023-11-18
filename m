Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5D4C072A2
	for <intel-xe@archiver.kernel.org>; Sat, 18 Nov 2023 03:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6529010E03B;
	Sat, 18 Nov 2023 03:14:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF09810E03B;
 Sat, 18 Nov 2023 03:14:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AD642A0093;
 Sat, 18 Nov 2023 03:14:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Date: Sat, 18 Nov 2023 03:14:46 -0000
Message-ID: <170027728670.12897.5572120285472774405@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231116144316.7-1-francois.dugast@intel.com>
In-Reply-To: <20231116144316.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_uA?=
 =?utf-8?q?PI_Alignment_-_Cleanup_and_future_proof?=
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

Series: uAPI Alignment - Cleanup and future proof
URL   : https://patchwork.freedesktop.org/series/126535/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b37f44e53231980091c0a83c622aceae26bc2e2b
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Thu Nov 16 14:43:16 2023 +0000

    drm/xe/uapi: Add Tile ID information to the GT info query
    
    As an information only. So Userspace can use this information
    and be able to correlate different GTs.
    
    Make API symmetric between Engine and GT info.
    
    There's no need right now to include a tile_query entry
    since there's no other information that we need from tile
    that is not already exposed through different queries.
    
    However, this could be added later if we have different Tile
    information that could matter to userspace. But let's keep
    the API ready for a direct reference to Tile ID based on
    the GT entry.
    
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch cb9b702d436952ddec33b020d549c7998cace9e2 drm-intel
be85929a6 drm/xe: Extend drm_xe_vm_bind_op
5d5873b6a drm/xe/uapi: Separate bo_create placement from flags
f834d66f5 drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
4cfcfea90 drm/xe/uapi: Reject bo creation of unaligned size
d7a926a74 drm/xe/uapi: Align on a common way to return arrays (memory regions)
950652f85 drm/xe/uapi: Align on a common way to return arrays (gt)
c8e36bcde drm/xe/uapi: Align on a common way to return arrays (engines)
b37f44e53 drm/xe/uapi: Add Tile ID information to the GT info query


