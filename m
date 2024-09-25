Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D2CCCF9E7
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 18:41:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F3610E069;
	Wed, 25 Sep 2024 18:41:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260DD10E2F6;
 Wed, 25 Sep 2024 18:41:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/cx0=3A_Set_power?=
 =?utf-8?q?_state_to_ready_only_on_owned_PHY_lanes_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vamsi Krishna Brahmajosyula" <vamsikrishna.brahmajosyula@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Sep 2024 18:41:51 -0000
Message-ID: <172728971115.1102456.18286442318321064740@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240917124449.223206-1-vamsikrishna.brahmajosyula@gmail.com>
In-Reply-To: <20240917124449.223206-1-vamsikrishna.brahmajosyula@gmail.com>
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

Series: drm/i915/cx0: Set power state to ready only on owned PHY lanes (rev3)
URL   : https://patchwork.freedesktop.org/series/138990/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1a371f2bd58202bce862858e4a77533611a97bcc
Author: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
Date:   Tue Sep 17 18:14:49 2024 +0530

    drm/i915/cx0: Set power state to ready only on owned PHY lanes
    
    In DP alt mode, when pin assignment is D, only one PHY lane is owned
    by the display. intel_cx0pll_enable currently performs a power state
    ready on both the lanes in all cases.
    
    Address the todo to perfom power state ready on owned lanes.
    
    Tested on Meteor Lake-P [Intel Arc Graphics] with DP alt mode.
    
    v2 -> v3:
    - Fix changelog per Jani Nikula's feedback
    v1 -> v2: Address Gustavo Sousa's feedback
    - Use owned lanes mask to set Phy power state to Ready, instead of
      maxpclk_lane with DP alt mode check.
    - Owned lanes are obtained from intel_cx0_get_owned_lane_mask().
    
    Signed-off-by: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
+ /mt/dim checkpatch d5334f14ce6ca46c6537184c69e4e352ff6d7750 drm-intel
1a371f2bd582 drm/i915/cx0: Set power state to ready only on owned PHY lanes


