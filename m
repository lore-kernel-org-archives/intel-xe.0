Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE50EC875F
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 01:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D4110E037;
	Fri,  8 Sep 2023 01:17:12 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6F15F10E037;
 Fri,  8 Sep 2023 01:17:11 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 73B9DA0BA8;
 Fri,  8 Sep 2023 01:17:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 08 Sep 2023 01:17:11 -0000
Message-ID: <169413583147.14895.18039483072340046289@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230907193515.7-1-francois.dugast@intel.com>
In-Reply-To: <20230907193515.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/uapi=3A_Remove_MMIO_ioctl?=
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

Series: drm/xe/uapi: Remove MMIO ioctl
URL   : https://patchwork.freedesktop.org/series/123403/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 64a4739e9eab1629db2a1fc83a2c575ab9854dc9
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Thu Sep 7 19:35:15 2023 +0000

    drm/xe/uapi: Remove MMIO ioctl
    
    This was previously used in UMD for timestamp correlation, which can now
    be done with DRM_XE_QUERY_CS_CYCLES.
    
    Link: https://lore.kernel.org/all/20230706042044.GR6953@mdroper-desk1.amr.corp.intel.com/
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/636
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 758f01ec2a6774fda1e8f8075d31f42b81783caf drm-intel
64a4739e9 drm/xe/uapi: Remove MMIO ioctl


