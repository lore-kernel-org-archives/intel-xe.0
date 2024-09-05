Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1469CD4F4E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 03:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B4F10E54B;
	Thu,  5 Sep 2024 03:16:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1931F10E54B;
 Thu,  5 Sep 2024 03:16:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm=3A_add_two_missing_DR?=
 =?utf-8?q?M=5FDISPLAY=5FDSC=5FHELPER_selects?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Sep 2024 03:16:08 -0000
Message-ID: <172550616808.949219.6229761753965523562@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org>
In-Reply-To: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org>
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

Series: drm: add two missing DRM_DISPLAY_DSC_HELPER selects
URL   : https://patchwork.freedesktop.org/series/138226/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6eacae71006365964ed803cc48caa2c92a745d1e
Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu Sep 5 06:08:22 2024 +0300

    drm/msm: add another DRM_DISPLAY_DSC_HELPER selection
    
    In the drm/msm driver both DSI and DPU subdrivers use drm_dsc_*
    functions, but only DSI selects DRM_DISPLAY_DSC_HELPER symbol. Add
    missing select to the DPU subdriver too.
    
    Fixes: ca097d4d94d8 ("drm/display: split DSC helpers from DP helpers")
    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202409040129.rqhtRTeC-lkp@intel.com/
    Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+ /mt/dim checkpatch 8b1096500fd6fae573f7d9c4416778d6442e985d drm-intel
c83223ef7383 drm/xe: select DRM_DISPLAY_DSC_HELPER
6eacae710063 drm/msm: add another DRM_DISPLAY_DSC_HELPER selection


