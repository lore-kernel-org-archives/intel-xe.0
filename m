Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EABC021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 04:08:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABB410E211;
	Fri, 21 Feb 2025 04:08:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034EB10E211;
 Fri, 21 Feb 2025 04:08:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/vdsc=3A_Correct_?=
 =?utf-8?q?the_conditions_of_DSC1=2E1_and_DSC_1=2E2_for_rc_params_calculatio?=
 =?utf-8?q?n?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: gareth.yu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Feb 2025 04:08:55 -0000
Message-ID: <174011093500.372071.7596108745195041446@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221041401.2219258-1-gareth.yu@intel.com>
In-Reply-To: <20250221041401.2219258-1-gareth.yu@intel.com>
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

Series: drm/i915/vdsc: Correct the conditions of DSC1.1 and DSC 1.2 for rc params calculation
URL   : https://patchwork.freedesktop.org/series/145210/
State : warning

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
commit 5efd05ceb65f14a18505ba2de539b933725cdd08
Author: Gareth Yu <gareth.yu@intel.com>
Date:   Fri Feb 21 12:14:01 2025 +0800

    drm/i915/vdsc: Correct the conditions of DSC1.1 and DSC 1.2 for rc params calculation
    
    The condition change is because Gen 14 begins to support DSC 1.2
    and need to check if the sink supports DSC1.2
    
    Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13719
    
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Cc: Juha-Pekka Heikkil <juha-pekka.heikkila@intel.com>
    Signed-off-by: Gareth Yu <gareth.yu@intel.com>
+ /mt/dim checkpatch 773b5639a9ff0a33feccb29de7f2d852c6d7f221 drm-intel
5efd05ceb65f drm/i915/vdsc: Correct the conditions of DSC1.1 and DSC 1.2 for rc params calculation
-:25: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'vdsc_cfg->dsc_version_minor >= 2'
#25: FILE: drivers/gpu/drm/i915/display/intel_vdsc.c:323:
+	if ((DISPLAY_VER(dev_priv) >= 14) && (vdsc_cfg->dsc_version_minor >= 2)) {

total: 0 errors, 0 warnings, 1 checks, 8 lines checked


