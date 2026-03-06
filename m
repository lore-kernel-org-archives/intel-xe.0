Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BFBF513EE
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 03:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602CD10E311;
	Fri,  6 Mar 2026 03:43:00 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B701010E311;
 Fri,  6 Mar 2026 03:42:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_DP=3A_Read_LTTPR_caps_fol?=
 =?utf-8?q?lowed_by_DPRX_caps?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Mar 2026 03:42:59 -0000
Message-ID: <177276857973.323437.16804606393237567789@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
In-Reply-To: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
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

Series: DP: Read LTTPR caps followed by DPRX caps
URL   : https://patchwork.freedesktop.org/series/162641/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 63df2fffda77eeac4dc0d0485a91d44db77ac63e
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Thu Mar 5 13:48:14 2026 +0530

    drm/i915/dp: DPRX/LTTPR caps for DP should be read once
    
    The DPRX/LTTPR caps for DP is read on detect and should be read only
    once. This value is stored in intl_dp struct and will be retained until
    hotplug.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 79792a2fc5d37b5446e543f1de05158ab0f551c9 drm-intel
432ac5d30d49 drm/display/dp: Read LTTPR caps without DPRX caps
-:105: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#105: FILE: include/drm/display/drm_dp_helper.h:759:
+int drm_dp_read_lttpr_caps(struct drm_dp_aux *aux,
+				  u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);

total: 0 errors, 0 warnings, 1 checks, 77 lines checked
d0de58ea46ad drm/i915/dp: Read LTTPR caps followed by DPRX caps
e95770d03946 drm/i915/dp: On HPD read LTTPR caps followed by DPRX caps
63df2fffda77 drm/i915/dp: DPRX/LTTPR caps for DP should be read once


