Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5C6C48BC4
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 19:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1BC10E567;
	Tue, 20 Feb 2024 19:58:55 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449FF10E55C;
 Tue, 20 Feb 2024 19:58:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C1/2=5D_drm/dp=3A_move_intel=5Fdp=5Fvsc=5Fsdp=5Fpack=28=29_to_?=
 =?utf-8?q?generic_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Abhinav Kumar" <quic_abhinavk@quicinc.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Feb 2024 19:58:54 -0000
Message-ID: <170845913428.126973.6145499588052659066@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240220195348.1270854-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240220195348.1270854-1-quic_abhinavk@quicinc.com>
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

Series: series starting with [v3,1/2] drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
URL   : https://patchwork.freedesktop.org/series/130147/
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
commit 124adeb83115c5ebcb8e6f3503bae0c14c42d35b
Author: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date:   Tue Feb 20 11:53:47 2024 -0800

    drm/dp: drop the size parameter from drm_dp_vsc_sdp_pack()
    
    Currently the size parameter of drm_dp_vsc_sdp_pack() is always
    the size of struct dp_sdp. Hence lets drop this parameter and
    use sizeof() directly.
    
    Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
    Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
+ /mt/dim checkpatch 2de2802e9aed40b0d223d272ac9e45157bbf7aae drm-intel
633183cdb3a8 drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
124adeb83115 drm/dp: drop the size parameter from drm_dp_vsc_sdp_pack()


