Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50457CCD1BF
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 00:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2E610E6CA;
	Wed, 29 Oct 2025 00:51:13 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F6E10E6CA;
 Wed, 29 Oct 2025 00:51:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/display/dp=3A_Rename_?=
 =?utf-8?q?bit_4_of_DPCD_TEST=5FREQUEST_to_match_DP2=2E1_spec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Khaled Almahallawy" <khaled.almahallawy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Oct 2025 00:51:11 -0000
Message-ID: <176169907108.65717.15975029094332792521@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
In-Reply-To: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
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

Series: drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to match DP2.1 spec
URL   : https://patchwork.freedesktop.org/series/156695/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8de419876eb963da5ba97fdc6ff7076bbe0d27a8
Author: Khaled Almahallawy <khaled.almahallawy@intel.com>
Date:   Tue Oct 28 15:28:17 2025 -0700

    drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to match DP2.1 spec
    
    The DP_TEST_LINK_FAUX_PATTERN field was deprecated in the DP 1.3 spec.
    Update its name to align with the DP 2.1 definition and reflect its
    actual use in the code. No functional changes.
    
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: Rob Clark <robin.clark@oss.qualcomm.com>
    Cc: Dmitry Baryshkov <lumag@kernel.org>
    Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
    Cc: Sean Paul <sean@poorly.run>
    Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
+ /mt/dim checkpatch eff28ee9a1ec86c9ea6b28f14f36a455bfc1592d drm-intel
8de419876eb9 drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to match DP2.1 spec
-:27: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'data == DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE'
#27: FILE: drivers/gpu/drm/msm/dp/dp_link.c:668:
+	if (!data || (data == DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE)) {

total: 0 errors, 0 warnings, 1 checks, 16 lines checked


