Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE37CEB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 10:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA8610E22E;
	Mon, 17 Jul 2023 10:46:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C4D6110E22F;
 Mon, 17 Jul 2023 10:46:54 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C1B32A73C7;
 Mon, 17 Jul 2023 10:46:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Mon, 17 Jul 2023 10:46:54 -0000
Message-ID: <168959081479.24539.13440737495572870296@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230717095900.1561736-1-riana.tauro@intel.com>
In-Reply-To: <20230717095900.1561736-1-riana.tauro@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_remove_gucrc_disable_from_suspend_path_=28rev4=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: remove gucrc disable from suspend path (rev4)
URL   : https://patchwork.freedesktop.org/series/120263/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1b49c995962a37f14f5502cfd67cba441a5025b3
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon Jul 17 15:29:00 2023 +0530

    drm/xe: remove gucrc disable from suspend path
    
    Currently GuCRC is disabled in suspend path for xe.
    Rc6 is a prerequiste to enable s0ix and
    should not be disabled for s2idle. There is no requirement
    to disable GuCRC for S3+.
    
    Remove it from xe_guc_pc_stop, thus removing from suspend path.
    Retain the call in other places where xe_guc_pc_stop is
    called.
    
    v2: add description and return statement to kernel-doc (Rodrigo)
    v3: update commit message (Rodrigo)
    v4: add mem_access_get to the gucrc disable function
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 71340f700edfaa0cdc35eab8f3c563c44c0a6ca1 drm-intel
1b49c9959 drm/xe: remove gucrc disable from suspend path


