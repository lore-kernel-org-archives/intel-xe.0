Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C776DC52D7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 19:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF3B10E4EE;
	Thu, 15 Aug 2024 19:03:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD6B10E4EE;
 Thu, 15 Aug 2024 19:03:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/display=3A_handle_?=
 =?utf-8?q?HPD_polling_in_display_runtime_suspend/resume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Aug 2024 19:03:03 -0000
Message-ID: <172374858311.634935.15866105438478693938@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240815172500.78479-1-vinod.govindapillai@intel.com>
In-Reply-To: <20240815172500.78479-1-vinod.govindapillai@intel.com>
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

Series: drm/xe/display: handle HPD polling in display runtime suspend/resume
URL   : https://patchwork.freedesktop.org/series/137349/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ec3d7823574e0d6e5a1a36adc4dd50a0e6fa897c
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Thu Aug 15 20:25:00 2024 +0300

    drm/xe/display: handle HPD polling in display runtime suspend/resume
    
    In XE, display runtime suspend / resume routines are called only
    if d3cold is allowed. This makes the driver unable to detect any
    HPDs once the device goes into runtime suspend state in platforms
    like LNL. Update the display runtime suspend / resume routines
    to include HPD polling regardless of d3cold status.
    
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch 154a177a994af4eb2c38eb592d959d98066b0329 drm-intel
ec3d7823574e drm/xe/display: handle HPD polling in display runtime suspend/resume


