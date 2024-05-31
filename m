Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C345C27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 06:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5988310E317;
	Fri, 31 May 2024 06:40:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0D710F1A4;
 Fri, 31 May 2024 06:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Add_member_supported=5Fdomains_to_xe=5Fforce=5Fwa?=
 =?utf-8?q?ke?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 May 2024 06:40:11 -0000
Message-ID: <171713761164.2240145.1973037893828025060@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240531064845.930740-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240531064845.930740-1-himal.prasad.ghimiray@intel.com>
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

Series: series starting with [1/2] drm/xe: Add member supported_domains to xe_force_wake
URL   : https://patchwork.freedesktop.org/series/134277/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2c4af47ebff5240bf0f694c57aae921ffd51ba5d
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Fri May 31 12:18:45 2024 +0530

    drm/xe: Fix xe_force_wake_assert_held for enum XE_FORCEWAKE_ALL
    
    Make sure that the assertion condition covers the wakefulness of all
    supported domains for XE_FORCEWAKE_ALL.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 4e2ea8adc72ce3d1f2968de789b7d068cd58b5df drm-intel
2db64557e69f drm/xe: Add member supported_domains to xe_force_wake
2c4af47ebff5 drm/xe: Fix xe_force_wake_assert_held for enum XE_FORCEWAKE_ALL


