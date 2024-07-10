Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43F0C3DA41
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 22:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88DA10E0CC;
	Wed, 10 Jul 2024 22:23:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67A410E0CC;
 Wed, 10 Jul 2024 22:23:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/uapi=3A_Expose_SIM?=
 =?utf-8?q?D16_EU_mask_in_topology_query?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Jul 2024 22:23:41 -0000
Message-ID: <172065022187.106210.2904351738073830948@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240710220446.2169797-1-lucas.demarchi@intel.com>
In-Reply-To: <20240710220446.2169797-1-lucas.demarchi@intel.com>
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

Series: drm/xe/uapi: Expose SIMD16 EU mask in topology query
URL   : https://patchwork.freedesktop.org/series/135960/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 83bf994106177cd0510d343c78ab4fa0258bc880
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Jul 10 15:02:27 2024 -0700

    drm/xe/uapi: Expose SIMD16 EU mask in topology query
    
    PVC, Xe2 and later platforms have 16-wide EUs. We were implicitly
    reporting for PVC the number of 16-wide EUs without giving userspace any
    hint that they were different than for other platforms. Xe2 and later
    also have 16-wide, but in those cases the reported number would
    correspond to the 8-wide count.
    
    To avoid confusion and make sure the right number is used by userspace
    depending on the platform, add a new item to the topology query and drop
    the one that is not available. The new mask reported for both PVC and
    Xe2 should now match the numbers reported via hwconfig.
    
    v2: Use a different topo item with EU type in its name to report the
        new mask instead of adding the type itself as the item (Matt Roper)
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 36e90f69c967f4cbcdd02c40c9ef25694ffb1a13 drm-intel
83bf99410617 drm/xe/uapi: Expose SIMD16 EU mask in topology query


