Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616ECC0219B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 20:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DB8886A4;
	Tue, 11 Feb 2025 20:18:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D7C886A4;
 Tue, 11 Feb 2025 20:18:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/guc=5Fpc=3A_Do_not_stop_probe_or_resume_if_GuC_PC_fa?=
 =?utf-8?q?ils?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Feb 2025 20:18:00 -0000
Message-ID: <173930508087.1042362.15668558649019396024@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250211200911.199213-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250211200911.199213-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC fails
URL   : https://patchwork.freedesktop.org/series/144681/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7fa8ccd8d325f9ffabbf19a34676eb66829908db
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Tue Feb 11 15:09:11 2025 -0500

    drm/xe/guc_pc: Remove duplicated pc_start call
    
    xe_guc_pc_start() was getting called from both
    xe_uc_init_hw() and from xe_guc_start().
    
    But both are called from do_gt_restart() and only
    xe_uc_init_hw() is called at initialization.
    
    So, let's remove the duplication in the regular gt_restart
    path.
    
    The only place where xe_guc_pc_start() won't get called now
    is on the gt_reset failure path. However, if gt_reset has
    failed, it is really unlikely that the PC start will work
    or is desired.
    
    Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch e1c145994c41ed6dd5265bc0a7a276fe1834f3ee drm-intel
06fd7b7beb87 drm/xe/guc_pc: Do not stop probe or resume if GuC PC fails
7fa8ccd8d325 drm/xe/guc_pc: Remove duplicated pc_start call


