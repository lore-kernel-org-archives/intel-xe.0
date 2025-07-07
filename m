Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B003C8303C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 18:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F5A10E50C;
	Mon,  7 Jul 2025 18:54:13 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778E510E50C;
 Mon,  7 Jul 2025 18:54:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/panthor=3A_support_re?=
 =?utf-8?q?peated_mappings_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Caterina Shablia" <caterina.shablia@collabora.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Jul 2025 18:54:12 -0000
Message-ID: <175191445248.141239.3423173618577504923@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
In-Reply-To: <20250707170442.1437009-1-caterina.shablia@collabora.com>
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

Series: drm/panthor: support repeated mappings (rev2)
URL   : https://patchwork.freedesktop.org/series/151264/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 86cb3bd359371456e56b1163b89748cdf09e0f25
Author: Boris Brezillon <boris.brezillon@collabora.com>
Date:   Mon Jul 7 17:04:33 2025 +0000

    drm/panthor: Add support for repeated mappings
    
    This allows us to optimize mapping of a relatively small
    portion of a BO over and over in a large VA range, which
    is useful to support Vulkan sparse bindings in an efficient
    way.
    
    Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
    Co-developed-by: Caterina Shablia <caterina.shablia@collabora.com>
    Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
+ /mt/dim checkpatch b9993cff911b1dd0abde4929435cc1eeb79e1c8f drm-intel
0b3ffd077d9f drm/panthor: Add support for atomic page table updates
8d73950ebff2 drm/gpuvm: Kill drm_gpuva_init()
3a7847d428de drm/gpuvm: Pass map arguments through a struct
cbd0f4101a91 drm/gpuvm: Add a helper to check if two VA can be merged
a58b40d4be38 drm/gpuvm: Add a flags field to drm_gpuvm_map_req/drm_gpuva_op_map
c8f532ad85a1 drm/gpuvm: Add DRM_GPUVA_REPEAT flag and logic
-:273: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email subaddress mismatch: 'From: Asahi Lina <lina+kernel@asahilina.net>' != 'Signed-off-by: Asahi Lina <lina@asahilina.net>'

total: 0 errors, 1 warnings, 0 checks, 223 lines checked
86cb3bd35937 drm/panthor: Add support for repeated mappings


