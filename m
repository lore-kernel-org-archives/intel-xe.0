Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A56EC4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 19:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9E410E68B;
	Thu, 15 Feb 2024 19:27:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3628210E68B;
 Thu, 15 Feb 2024 19:26:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/dp=3A_move_intel=5Fdp?=
 =?utf-8?q?=5Fvsc=5Fsdp=5Fpack=28=29_to_generic_helper_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Abhinav Kumar" <quic_abhinavk@quicinc.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Feb 2024 19:26:58 -0000
Message-ID: <170802521822.11.13939622393604048889@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240215190834.3222812-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240215190834.3222812-1-quic_abhinavk@quicinc.com>
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

Series: drm/dp: move intel_dp_vsc_sdp_pack() to generic helper (rev2)
URL   : https://patchwork.freedesktop.org/series/129865/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b5fbae6f76aa7a34289848f47fbee6dde0723fef
Author: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date:   Thu Feb 15 11:08:34 2024 -0800

    drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
    
    intel_dp_vsc_sdp_pack() can be re-used by other DRM drivers as well.
    Lets move this to drm_dp_helper to achieve this.
    
    changes in v2:
            - rebased on top of drm-tip
    
    Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
    Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
+ /mt/dim checkpatch 6d3abf8f7f55420cf53e9ed344872c459ecfd0ed drm-intel
b5fbae6f7 drm/dp: move intel_dp_vsc_sdp_pack() to generic helper


