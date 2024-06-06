Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBB9C27C52
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 05:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007A910E165;
	Thu,  6 Jun 2024 05:46:30 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E353A10E165;
 Thu,  6 Jun 2024 05:46:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_xe=5Fgt=5Fidle_fixes_=28r?=
 =?utf-8?q?ev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Jun 2024 05:46:28 -0000
Message-ID: <171765278892.3533.348444393270227285@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240606055401.934750-1-riana.tauro@intel.com>
In-Reply-To: <20240606055401.934750-1-riana.tauro@intel.com>
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

Series: xe_gt_idle fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/133519/
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
commit 991bc4fcc258ca7a61c2589f52377c726ad9189d
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Thu Jun 6 11:24:01 2024 +0530

    drm/xe: move disable_c6 call
    
    disable c6 called in guc_pc_fini_hw is unreachable.
    
    GuC PC init returns earlier if skip_guc_pc is true and never
    registers the finish call thus making disable_c6 unreachable.
    
    move this call to gt idle.
    
    v2: rebase
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch ec3e566521b91eb773769fa1df899a28063a10e9 drm-intel
9a06c84f9f09 drm/xe/xe_gt_idle: use GT forcewake domain assertion
991bc4fcc258 drm/xe: move disable_c6 call


