Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02144CCFA02
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 19:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08C310E0D0;
	Fri, 31 Oct 2025 19:10:04 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC0810E0D0;
 Fri, 31 Oct 2025 19:10:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/display/dp=3A_Rename_?=
 =?utf-8?q?bit_4_of_DPCD_TEST=5FREQUEST_to_match_DP2=2E1_spec_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Khaled Almahallawy" <khaled.almahallawy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Oct 2025 19:10:03 -0000
Message-ID: <176193780363.7307.2232944401843102241@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251031175738.3430347-1-khaled.almahallawy@intel.com>
In-Reply-To: <20251031175738.3430347-1-khaled.almahallawy@intel.com>
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

Series: drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to match DP2.1 spec (rev2)
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
commit c495d6a9d720c1bc9d77fb7410b956b885bd3170
Author: Khaled Almahallawy <khaled.almahallawy@intel.com>
Date:   Fri Oct 31 10:57:38 2025 -0700

    drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to match DP2.1 spec
    
    The DP_TEST_LINK_FAUX_PATTERN field was deprecated in the DP 1.3 spec.
    Update its name to align with the DP 2.1 definition and reflect its
    actual use in the code. No functional changes.
    
    v2: Comment about spec version where the bit was introduced (Konrad)
    
    Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: Rob Clark <robin.clark@oss.qualcomm.com>
    Cc: Dmitry Baryshkov <lumag@kernel.org>
    Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
    Cc: Sean Paul <sean@poorly.run>
    Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
    Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
+ /mt/dim checkpatch efcd62f1d00607db85d10ec29387fe6516daee59 drm-intel
c495d6a9d720 drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to match DP2.1 spec
-:31: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'data == DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE'
#31: FILE: drivers/gpu/drm/msm/dp/dp_link.c:668:
+	if (!data || (data == DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE)) {

total: 0 errors, 0 warnings, 1 checks, 16 lines checked


