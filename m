Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6194BC27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 12:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF3E10F177;
	Fri, 21 Jun 2024 12:53:23 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4655210F177;
 Fri, 21 Jun 2024 12:53:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/lnl=3A_Offload_sys?=
 =?utf-8?q?tem_clear_page_activity_to_GPU_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Jun 2024 12:53:22 -0000
Message-ID: <171897440228.132081.4162604145096114130@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240621123329.22126-1-nirmoy.das@intel.com>
In-Reply-To: <20240621123329.22126-1-nirmoy.das@intel.com>
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

Series: drm/xe/lnl: Offload system clear page activity to GPU (rev3)
URL   : https://patchwork.freedesktop.org/series/135120/
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
commit bb0aa969bb2ddd5cbb4de661a208876e13965a07
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Fri Jun 21 14:33:29 2024 +0200

    drm/xe/lnl: Offload system clear page activity to GPU
    
    On LNL because of flat CCS, driver creates a migrate job to clear
    CCS meta data. Extend that to also clear system pages using GPU.
    Inform TTM to allocate pages without __GFP_ZERO to avoid double page
    clearing by clearing out TTM_TT_FLAG_ZERO_ALLOC flag.
    
    v2: Handle regression on dgfx(Himal)
        Update commit message as no ttm API changes needed.
    
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
    
    O
+ /mt/dim checkpatch 40deb379b103746ee4c9df5f0f1919bd4703c9cc drm-intel
bb0aa969bb2d drm/xe/lnl: Offload system clear page activity to GPU


