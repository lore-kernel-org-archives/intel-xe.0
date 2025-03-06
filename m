Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA03C282EC
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 22:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02ED910EAA8;
	Thu,  6 Mar 2025 22:29:03 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4BD10EAA6;
 Thu,  6 Mar 2025 22:29:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=5Fpc=3A_Remove?=
 =?utf-8?q?_duplicated_pc=5Fstart_call?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Mar 2025 22:29:02 -0000
Message-ID: <174130014238.69983.5310042927285972061@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250306220643.1014049-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250306220643.1014049-1-rodrigo.vivi@intel.com>
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

Series: drm/xe/guc_pc: Remove duplicated pc_start call
URL   : https://patchwork.freedesktop.org/series/145947/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 145cd2d7d9c69d71a61822d3a0ba1b1733c39f15
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Thu Mar 6 17:06:43 2025 -0500

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
    Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3 drm-intel
145cd2d7d9c6 drm/xe/guc_pc: Remove duplicated pc_start call


