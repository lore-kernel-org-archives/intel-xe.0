Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595F7C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 15:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016CF10ECB7;
	Fri,  7 Jun 2024 15:37:36 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003F910ECB7;
 Fri,  7 Jun 2024 15:37:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pf=3A_Assert_LMEM_?=
 =?utf-8?q?provisioning_is_done_only_on_DGFX?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Jun 2024 15:37:35 -0000
Message-ID: <171777465500.27586.7633704226902856071@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240607153155.1592-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240607153155.1592-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Assert LMEM provisioning is done only on DGFX
URL   : https://patchwork.freedesktop.org/series/134625/
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
commit a47a9fd74614e8e0a593d6a19a9bdfabc77f86ae
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Jun 7 17:31:55 2024 +0200

    drm/xe/pf: Assert LMEM provisioning is done only on DGFX
    
    The Local Memory (aka VRAM) is only available on DGFX platforms.
    We shouldn't attempt to provision VFs with LMEM or attempt to
    update the LMTT on non-DGFX platforms. Add missing asserts that
    would enforce that and fix release code that could crash on iGFX
    due to uninitialized LMTT.
    
    Fixes: c063cce7df3a ("drm/xe/pf: Update the LMTT when freeing VF GT config")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch beb1ace6f49432ecd6f56fb1d69cf7407c79650f drm-intel
a47a9fd74614 drm/xe/pf: Assert LMEM provisioning is done only on DGFX


