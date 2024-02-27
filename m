Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02668C54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 18:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B593F10E735;
	Tue, 27 Feb 2024 18:50:39 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCB210E735;
 Tue, 27 Feb 2024 18:50:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe=3A_Fix_display_runtime=5Fpm_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Feb 2024 18:50:37 -0000
Message-ID: <170905983770.351698.16120343672590359524@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240227183725.505699-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240227183725.505699-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/3] drm/xe: Fix display runtime_pm handling
URL   : https://patchwork.freedesktop.org/series/130450/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9ab59fc4b7cb7663906ac4471a262434aef57f03
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit aa42aea3a24ff0749396793d413c4f46d39d5dcf
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Tue Feb 27 13:37:25 2024 -0500

    drm/xe: Prepare display for D3Cold
    
    Prepare power-well and DC handling for a full power
    lost during D3Cold, then sanitize it upon D3->D0.
    Otherwise we get a bunch of state mismatch.
    
    Ideally we could leave DC9 enabled and wouldn't need
    to move DC9->DC0 on every runtime resume, however,
    the disable_DC is part of the power-well checks and
    intrinsic to the dc_off power well. In the future that
    can be detangled so we can have even bigger power savings.
    But for now, let's focus on getting a D3Cold, which saves
    much more power by itself.
    
    v2: We cannot do the full-suspend-resume path or we end
    with a deadlock between xe_gem_fault and the modeset-ioctl.
    Reduce only to the power-well & DC sanitization.
    
    Cc: Anshuman Gupta <anshuman.gupta@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 0d7a78693be62a8d1cd311376815b89b18de8204 drm-intel
5c6deaffa01c drm/xe: Fix display runtime_pm handling
8e7dfaba2e2e drm/xe: Create a xe_pm_runtime_resume_and_get variant for display
aa42aea3a24f drm/xe: Prepare display for D3Cold


