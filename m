Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2CEC678DD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 23:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3741E10E254;
	Thu, 17 Aug 2023 23:08:22 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 29E1110E254;
 Thu, 17 Aug 2023 23:08:21 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2675BA47DF;
 Thu, 17 Aug 2023 23:08:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 17 Aug 2023 23:08:21 -0000
Message-ID: <169231370115.12431.1589048072239982071@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230817230407.909816-6-matthew.d.roper@intel.com>
In-Reply-To: <20230817230407.909816-6-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_St?=
 =?utf-8?q?op_tracking_Tile4_support?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Stop tracking Tile4 support
URL   : https://patchwork.freedesktop.org/series/122606/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 12ae6e63552a7cab3e677f2118833206c487d391
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Thu Aug 17 16:04:12 2023 -0700

    drm/xe: Stop tracking 4-tile support
    
    The choice of Y-major tiling format (either the legacy "TileY" or the
    newer "Tile4") is based on graphics IP version (12.50 and beyond have
    Tile4, earlier platforms have TileY).  Only display was using the
    has_4tile feature flag, but that handling is now self-contained within
    the display code itself, so we no longer need to track this feature flag
    in the main Xe driver.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 9112bca10116fdc4c33220478c47aa92f95832fe drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


