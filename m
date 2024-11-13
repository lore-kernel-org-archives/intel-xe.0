Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751F4D41C07
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 06:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4416E10E34E;
	Wed, 13 Nov 2024 06:27:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E55210E34E;
 Wed, 13 Nov 2024 06:27:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/cx0=3A_Set_power?=
 =?utf-8?q?_state_to_ready_only_on_owned_PHY_lanes_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vamsi Krishna Brahmajosyula" <vamsikrishna.brahmajosyula@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 06:27:07 -0000
Message-ID: <173147922757.3402358.4252810526420954697@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112124852.6940-1-vamsikrishna.brahmajosyula@gmail.com>
In-Reply-To: <20241112124852.6940-1-vamsikrishna.brahmajosyula@gmail.com>
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

Series: drm/i915/cx0: Set power state to ready only on owned PHY lanes (rev4)
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
commit ad0b3ee5f750f32094da1fd863e923b358d64729
Author: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
Date:   Tue Nov 12 18:18:52 2024 +0530

    drm/i915/cx0: Set power state to ready only on owned PHY lanes
    
    In DP alt mode, when pin assignment is D, only one PHY lane is owned
    by the display. intel_cx0pll_enable currently performs a power state
    ready on both the lanes in all cases.
    
    Address the following todo to perfom power state ready on owned lanes.
        TODO: For DP alt mode use only one lane.
    
    Tested on Meteor Lake-P [Intel Arc Graphics] with DP alt mode.
    
    Signed-off-by: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
+ /mt/dim checkpatch 26f5fe99791def93b32e27e79e71dbd0666c117b drm-intel
ad0b3ee5f750 drm/i915/cx0: Set power state to ready only on owned PHY lanes


