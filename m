Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75F8C30653
	for <intel-xe@archiver.kernel.org>; Sat, 29 Jun 2024 20:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F8210E0DD;
	Sat, 29 Jun 2024 20:35:26 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E07810E150;
 Sat, 29 Jun 2024 20:35:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/4=5D_drm/ttm=3A_Add_a_flag_to_allow_drivers_to_skip_clear-o?=
 =?utf-8?q?n-free_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 29 Jun 2024 20:35:25 -0000
Message-ID: <171969332524.13.3194730140306943325@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240628193846.26326-1-nirmoy.das@intel.com>
In-Reply-To: <20240628193846.26326-1-nirmoy.das@intel.com>
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

Series: series starting with [CI,1/4] drm/ttm: Add a flag to allow drivers to skip clear-on-free (rev2)
URL   : https://patchwork.freedesktop.org/series/135538/
State : warning

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
commit d8439cb70c24bfc730ad384bcb8e3ed0a003d161
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Fri Jun 28 21:38:46 2024 +0200

    drm/xe/lnl: Offload system clear page activity to GPU
    
    On LNL because of flat CCS, driver creates a migrate job to clear
    CCS meta data. Extend that to also clear system pages using GPU.
    Inform TTM to allocate pages without __GFP_ZERO to avoid double page
    clearing by clearing out TTM_TT_FLAG_ZERO_ALLOC flag and set
    TTM_TT_FLAG_CLEARED_ON_FREE while freeing to skip ttm pool's
    clearn-on-free as XE now takes care of clearing pages.
    
    To test the patch, I created a small test that tries to submit a job
    after binding various sizes of buffer which shows good gains for larger
    buffer. For lower buffer sizes, the result is not very reliable as the
    results vary a lot.
    
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 886eeb6d89b58f914ee5045fcac54b59a73d8299 drm-intel
094feda2db07 drm/ttm: Add a flag to allow drivers to skip clear-on-free
e5d5fe707c33 drm/xe/migrate: Parameterize ccs and bo data clear in xe_migrate_clear()
989efdb0fa02 drm/xe/migrate: Clear CCS when clearing bo with XE_FAST_COLOR_BLT
-:46: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#46: FILE: drivers/gpu/drm/xe/xe_migrate.c:1081:
+		if (xe_device_has_flat_ccs(xe) && clear_ccs && !(clear_bo_data &&
+		    !is_fast_color_blt_cmd_for_clear(gt))) {

total: 0 errors, 0 warnings, 1 checks, 30 lines checked
d8439cb70c24 drm/xe/lnl: Offload system clear page activity to GPU
-:39: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#39: FILE: drivers/gpu/drm/xe/xe_bo.c:406:
+	uint32_t old_page_flags;

total: 0 errors, 0 warnings, 1 checks, 89 lines checked


