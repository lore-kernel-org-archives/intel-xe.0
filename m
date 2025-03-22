Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4ACC35FFC
	for <intel-xe@archiver.kernel.org>; Sat, 22 Mar 2025 09:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1102710E324;
	Sat, 22 Mar 2025 09:50:46 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B101510E31A;
 Sat, 22 Mar 2025 09:50:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_unmet_direc?=
 =?utf-8?q?t_dependencies_warning?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yue Haibing" <yuehaibing@huawei.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 22 Mar 2025 09:50:44 -0000
Message-ID: <174263704472.66719.9500095296427214361@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250322095521.4153684-1-yuehaibing@huawei.com>
In-Reply-To: <20250322095521.4153684-1-yuehaibing@huawei.com>
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

Series: drm/xe: Fix unmet direct dependencies warning
URL   : https://patchwork.freedesktop.org/series/146625/
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
commit 7d856ec1934acc8ab6dd7d0431ca096c265d6c96
Author: Yue Haibing <yuehaibing@huawei.com>
Date:   Sat Mar 22 17:55:21 2025 +0800

    drm/xe: Fix unmet direct dependencies warning
    
    WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
      Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
      Selected by [m]:
      - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]
    
    FB_IOMEM_HELPERS depends on FB_CORE, Select it before FB_IOMEM_HELPERS.
    
    Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
    Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
+ /mt/dim checkpatch a123616cf3afc205116835d8b083f48272583dcd drm-intel
7d856ec1934a drm/xe: Fix unmet direct dependencies warning


