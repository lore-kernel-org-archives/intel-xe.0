Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20F9C5478C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 16:19:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7352D10E547;
	Wed, 28 Feb 2024 16:19:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8045F10E547;
 Wed, 28 Feb 2024 16:19:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/lnl=3A_Modeset_s?=
 =?utf-8?q?equence_change_for_DP_on_LNL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Feb 2024 16:19:09 -0000
Message-ID: <170913714952.369198.15709505326719734317@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240228161144.648776-1-shekhar.chauhan@intel.com>
In-Reply-To: <20240228161144.648776-1-shekhar.chauhan@intel.com>
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

Series: drm/i915/lnl: Modeset sequence change for DP on LNL
URL   : https://patchwork.freedesktop.org/series/130514/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9ab59fc4b7cb7663906ac4471a262434aef57f03
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a17f1fbc68da0e25b88d9de1278d1c6cce267668
Author: Shekhar Chauhan <shekhar.chauhan@intel.com>
Date:   Wed Feb 28 21:41:44 2024 +0530

    drm/i915/lnl: Modeset sequence change for DP on LNL
    
    Currently, the driver is only waiting for 1ms for
    idle patterns. But starting from LNL and beyond,
    the MST wants the driver to wait for 1640us before
    timing out (which we round up to 2ms).
    
    BSpec: 68849
    Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
+ /mt/dim checkpatch 3bdccc6629ee909a167daedd6a8b75f6967ab726 drm-intel
a17f1fbc68da drm/i915/lnl: Modeset sequence change for DP on LNL


