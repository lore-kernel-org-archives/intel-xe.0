Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEFEC3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 21:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D626A10E453;
	Wed, 17 Jul 2024 21:16:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51BC10E453;
 Wed, 17 Jul 2024 21:16:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Implement_Compression_Sup?=
 =?utf-8?q?port_on_BMG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jul 2024 21:16:44 -0000
Message-ID: <172125100473.271339.16647044964829114925@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1721250309.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1721250309.git.akshata.jahagirdar@intel.com>
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

Series: Implement Compression Support on BMG
URL   : https://patchwork.freedesktop.org/series/136211/
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
commit 9e6879b38c7026d1aeb3d2aaffecbc36c761fd84
Author: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Date:   Wed Jul 17 21:10:08 2024 +0000

    drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx
    
    In xe2+ dgfx, we don't need to handle the copying of ccs
    metadata during migration. This test validates the ccs data post
    clear and copy during evict/restore operation. Thus, we can skip
    this test on xe2+ dgfx.
    
    Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch bd2a84d801982bd4a899a29916b458a8f82cb01f drm-intel
9c8bf348e6c9 drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
8dfca24df842 drm/xe/migrate: Add kunit to test clear functionality
4d36f9a43ec4 drm/xe/migrate: Add helper function to program identity map
64dcb15ac929 drm/xe/xe2: Introduce identity map for compressed pat for vram
20e441cd57eb drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
c32e7c75a975 drm/xe/migrate: Add kunit to test migration functionality for BMG
9e6879b38c70 drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx


