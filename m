Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868E1C67861
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 03:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C65710FC95;
	Wed, 10 Apr 2024 03:10:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B1E10FC95;
 Wed, 10 Apr 2024 03:10:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display=3A_use_mul?=
 =?utf-8?q?=5Fu32=5Fu32_for_multiplying_operands?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Apr 2024 03:10:45 -0000
Message-ID: <171271864507.1318715.10325610502512682548@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410024810.1707500-1-arun.r.murthy@intel.com>
In-Reply-To: <20240410024810.1707500-1-arun.r.murthy@intel.com>
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

Series: drm/xe/display: use mul_u32_u32 for multiplying operands
URL   : https://patchwork.freedesktop.org/series/132242/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 65f8178111b09b7eed7a8f591546db06c4db426f
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Wed Apr 10 08:18:10 2024 +0530

    drm/xe/display: use mul_u32_u32 for multiplying operands
    
    Use mul_u32_u32 to avoid potential overflow in multiplying two u32 and
    store the u64 result.
    
    v2: remove u64 typecast and use mul_u32_u32 (Ville)
    v3: Reframe the commit message <Rodrigo>
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 057ec21a54cddd595a7725fa8731eb4c5bd5abff drm-intel
65f8178111b0 drm/xe/display: use mul_u32_u32 for multiplying operands
-:23: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#23: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:32:
+			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, mul_u32_u32(src_idx, XE_PAGE_SIZE),

-:52: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#52: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:170:
+			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, mul_u32_u32(src_idx, XE_PAGE_SIZE),

total: 0 errors, 2 warnings, 0 checks, 34 lines checked


