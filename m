Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B40C2BD09
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 19:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C558C10E8E3;
	Wed,  3 Jul 2024 19:46:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B166A10E8E8;
 Wed,  3 Jul 2024 19:46:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2lpm=3A_Extend_W?=
 =?utf-8?q?a=5F16021639441_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ngai-Mint Kwan" <ngai-mint.kwan@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Jul 2024 19:46:14 -0000
Message-ID: <172003597472.27329.4796857567589680494@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240701184637.531794-1-ngai-mint.kwan@linux.intel.com>
In-Reply-To: <20240701184637.531794-1-ngai-mint.kwan@linux.intel.com>
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

Series: drm/xe/xe2lpm: Extend Wa_16021639441 (rev2)
URL   : https://patchwork.freedesktop.org/series/135612/
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
commit 3d3384bc1f38e5a8549f01efc573fee6b896f231
Author: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
Date:   Mon Jul 1 11:46:37 2024 -0700

    drm/xe/xe2lpm: Extend Wa_16021639441
    
    Wa_16021639441 applies to Xe2_LPM.
    
    Signed-off-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch f9bae9be5922368e36324928b898ff4de5280e30 drm-intel
3d3384bc1f38 drm/xe/xe2lpm: Extend Wa_16021639441


