Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B069C83F07
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 13:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8EA10E47C;
	Mon,  7 Jul 2025 13:08:04 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B503010E47B;
 Mon,  7 Jul 2025 13:08:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/panthor=3A_support_re?=
 =?utf-8?q?peated_mappings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Caterina Shablia" <caterina.shablia@collabora.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Jul 2025 13:08:03 -0000
Message-ID: <175189368373.139854.2586309807062642133@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250703205308.19419-1-caterina.shablia@collabora.com>
In-Reply-To: <20250703205308.19419-1-caterina.shablia@collabora.com>
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

Series: drm/panthor: support repeated mappings
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
commit f492a9c282f0ef76731f0a8f99001eb80df0d77a
Author: Boris Brezillon <boris.brezillon@collabora.com>
Date:   Thu Jul 3 20:52:59 2025 +0000

    drm/panthor: Add support for repeated mappings
    
    This allows us to optimize mapping of a relatively small
    portion of a BO over and over in a large VA range, which
    is useful to support Vulkan sparse bindings in an efficient
    way.
    
    Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
    Co-developed-by: Caterina Shablia <caterina.shablia@collabora.com>
    Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
+ /mt/dim checkpatch 1e771eeb8454dcea561bff0df9ef9b83136c2461 drm-intel
32b0e527c4aa drm/panthor: Add support for atomic page table updates
eea5f2e68c5e drm/gpuvm: Kill drm_gpuva_init()
7c9a83e3a40f drm/gpuvm: Pass map arguments through a struct
-:136: CHECK:LINE_SPACING: Please don't use multiple blank lines
#136: FILE: drivers/gpu/drm/drm_gpuvm.c:2229:
 
+

total: 0 errors, 0 warnings, 1 checks, 323 lines checked
10003454aaf4 drm/gpuvm: Add a helper to check if two VA can be merged
f1b547ee0fdf drm/gpuvm: Add a flags field to drm_gpuvm_map_req/drm_gpuva_op_map
41b814d4fd30 drm/gpuvm: Add DRM_GPUVA_REPEAT flag and logic
-:81: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'va_range < req->gem.range'
#81: FILE: drivers/gpu/drm/drm_gpuvm.c:2164:
+		if (unlikely(!req->gem.range ||
+			     (va_range < req->gem.range) ||
+			     do_div(va_range, req->gem.range)))

total: 0 errors, 0 warnings, 1 checks, 222 lines checked
f492a9c282f0 drm/panthor: Add support for repeated mappings


