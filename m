Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9087CC36002
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 09:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B13210E76F;
	Fri, 21 Mar 2025 09:50:41 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732CB10E76F;
 Fri, 21 Mar 2025 09:50:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/fbc=3A_disable_F?=
 =?utf-8?q?BC_if_PSR2_selective_fetch_is_enabled_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Mar 2025 09:50:39 -0000
Message-ID: <174255063946.63427.11441674810049503772@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250321094529.197397-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250321094529.197397-1-vinod.govindapillai@intel.com>
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

Series: drm/i915/fbc: disable FBC if PSR2 selective fetch is enabled (rev3)
URL   : https://patchwork.freedesktop.org/series/146402/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e4d878db5301416b8b3141ead72e62686a4d9790
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Fri Mar 21 11:45:29 2025 +0200

    drm/i915/fbc: update the panel_replay dependency in fbc wa's
    
    There are two panel_replay scenarios fbc wa need to be aware of,
    panel replay with and without selective update capability.
    Panel replay without selective update don't have any fbc wa.
    So keep the fbc psr1 wa as it is.
    
    The current fbc psr2 wa is mainly about selective fetch and we
    need to apply the fbc wa if selective fetch is on - irrespective
    of panel replay. Hence we can't exclude panel replay from the
    fbc psr2 wa.
    
    v1: keep panel_replay exclusion in PSR1 case (Jouni)
        Patch description updated
    
    Bspec: 66624, 50442
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch b15a87713d14b1c2986f47a622c5a8c5458e2396 drm-intel
2f88854b2af3 drm/i915/fbc: keep FBC disabled if selective update is on in xe2lpd
e4d878db5301 drm/i915/fbc: update the panel_replay dependency in fbc wa's


