Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0ADC35FFA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Mar 2025 13:56:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176C110E505;
	Wed, 19 Mar 2025 13:56:19 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A9D10E505;
 Wed, 19 Mar 2025 13:56:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_update_to_FBC=2C_PSR_comb?=
 =?utf-8?q?o_handling_in_xe2lpd?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Mar 2025 13:56:18 -0000
Message-ID: <174239257826.53854.4147015453687965072@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250319135130.122703-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250319135130.122703-1-vinod.govindapillai@intel.com>
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

Series: update to FBC, PSR combo handling in xe2lpd
URL   : https://patchwork.freedesktop.org/series/146487/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://github.com/intel-lgci-fdo-gitlab-mirror/drm.maintainer-tools mt
Cloning into 'mt'...
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 70bce80b6281c9e06c530d828e0c3337699595ef
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Wed Mar 19 15:51:30 2025 +0200

    drm/i915/fbc: remove panel_replay dependency from fbc wa checks
    
    Panel replay is supported from display 14 onwards. So no need
    to check the panel replay status in the previous gen workarounds.
    In the newer panel replay, selective update is supported and it
    is suffice to check selective update status for the workarounds
    in FBC use cases.
    
    Bspec: 66624, 50442
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch a958e31a81b3267201c85b6f171419586afa792c drm-intel
56418e54fd0c drm/i915/fbc: keep FBC disabled if selective update is on in xe2lpd
70bce80b6281 drm/i915/fbc: remove panel_replay dependency from fbc wa checks


