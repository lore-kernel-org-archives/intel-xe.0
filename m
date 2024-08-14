Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABBFC52D7F
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 10:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E850610E21D;
	Wed, 14 Aug 2024 10:02:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC84210E21D;
 Wed, 14 Aug 2024 10:02:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Shuffle_enable=5Fhost=5Fl?=
 =?utf-8?q?2=5Fvram_order_and_use_MCR_reg_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Aug 2024 10:02:05 -0000
Message-ID: <172362972589.630433.11418821753970350232@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240814095614.909774-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240814095614.909774-1-tejas.upadhyay@intel.com>
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

Series: Shuffle enable_host_l2_vram order and use MCR reg (rev2)
URL   : https://patchwork.freedesktop.org/series/137031/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fabaa8137a98b7f46ee73e3771ba87f80bc64bfd
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Wed Aug 14 15:26:14 2024 +0530

    drm/xe: Define STATELESS_COMPRESSION_CTRL as mcr register
    
    Register STATELESS_COMPRESSION_CTRL should be considered
    mcr register which should write to all slices as per
    documentation.
    
    Bspec: 71185
    Fixes: ecabb5e6ce54 ("drm/xe/xe2: Add performance turning changes")
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 95179e2efd2e2f61d5453d323fdb6e136fc15df6 drm-intel
0bd692707d25 drm/xe: Move enable host l2 VRAM post MCR init
7d7ce663115c drm/xe: Write all slices if its mcr register
fabaa8137a98 drm/xe: Define STATELESS_COMPRESSION_CTRL as mcr register


