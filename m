Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FDAC531DC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 17:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B31F10EC8E;
	Fri, 23 Aug 2024 17:11:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822C410EC8E;
 Fri, 23 Aug 2024 17:11:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm=3A_Use_full_allocated?=
 =?utf-8?q?_minor_range_for_DRM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Aug 2024 17:11:07 -0000
Message-ID: <172443306752.747146.6034255344529050539@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823163048.2676257-1-michal.winiarski@intel.com>
In-Reply-To: <20240823163048.2676257-1-michal.winiarski@intel.com>
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

Series: drm: Use full allocated minor range for DRM
URL   : https://patchwork.freedesktop.org/series/137726/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 034ecab7b2fc62f686aadcc78dbf0254b2530a5f
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Fri Aug 23 18:30:48 2024 +0200

    drm: Expand max DRM device number to full MINORBITS
    
    Having a limit of 64 DRM devices is not good enough for modern world
    where we have multi-GPU servers, SR-IOV virtual functions and virtual
    devices used for testing.
    Let's utilize full minor range for DRM devices.
    To avoid regressing the existing userspace, we're still maintaining the
    numbering scheme where 0-63 is used for primary, 64-127 is reserved
    (formerly for control) and 128-191 is used for render.
    For minors >= 192, we're allocating minors dynamically on a first-come,
    first-served basis.
    
    Acked-by: James Zhu <James.Zhu@amd.com>
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch 96041621daaf71059d790a2ddbaa60114371eada drm-intel
ff7ef370b54c drm: Use XArray instead of IDR for minors
e19253f9a691 accel: Use XArray instead of IDR for minors
034ecab7b2fc drm: Expand max DRM device number to full MINORBITS


