Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5C1C27C6E
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 08:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CC810E216;
	Mon, 17 Jun 2024 08:18:53 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763D810E199;
 Mon, 17 Jun 2024 08:18:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Apply_Wa=5F22019338487_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jun 2024 08:18:51 -0000
Message-ID: <171861233148.97055.11800340961387843538@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240617081051.3340442-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240617081051.3340442-1-vinay.belgaumkar@intel.com>
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

Series: Apply Wa_22019338487 (rev2)
URL   : https://patchwork.freedesktop.org/series/134921/
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
commit 65e50cbea2109c2e70e4bf0249cfc2858fd5f5e5
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Mon Jun 17 01:10:51 2024 -0700

    drm/xe/guc: Request max GT freq during resume
    
    We already request max freq in the load path, moving it
    to __xe_guc_upload will ensure this speeds up GuC load in
    the resume path as well.
    
    v2: Rename xe_guc_pc_init_early since we now call it per
    GuC load (Michal W)
    
    v3: Keep pc_init_early() and init RPx values there (Rodrigo)
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 9063661ba438a2b1f01b73b6035be9a7156c4345 drm-intel
1da891341513 drm/xe/lnl: Apply Wa_22019338487
-:193: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#193: FILE: drivers/gpu/drm/xe/xe_gt.c:821:
+	if ((!xe_uc_fw_is_available(&gt->uc.gsc.fw) ||
+	    xe_uc_fw_is_loaded(&gt->uc.gsc.fw)) &&

total: 0 errors, 0 warnings, 1 checks, 294 lines checked
65e50cbea210 drm/xe/guc: Request max GT freq during resume


