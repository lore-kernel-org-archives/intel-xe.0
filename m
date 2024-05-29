Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BFEC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 09:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C8F10E12F;
	Wed, 29 May 2024 09:29:33 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E2710E12F;
 Wed, 29 May 2024 09:29:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/tests=3A_Add_a_missin?=
 =?utf-8?q?g_Kconfig_select?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 May 2024 09:29:30 -0000
Message-ID: <171697497060.2232183.18406036940245243277@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240529092251.173685-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240529092251.173685-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/tests: Add a missing Kconfig select
URL   : https://patchwork.freedesktop.org/series/134180/
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
commit e0e6e3b64094a2196a99b2fe1c695564683b6db3
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed May 29 11:22:51 2024 +0200

    drm/tests: Add a missing Kconfig select
    
    Fix the following warning:
    
    WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER
      Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=y] && DRM_DISPLAY_HDMI_HELPER [=n]
      Selected by [y]:
      - DRM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y] && MMU [=y]
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Fixes: 54cb39e2293b ("drm/connector: hdmi: Create an HDMI sub-state")
    Cc: Maxime Ripard <mripard@kernel.org>
    Cc: dri-devel@lists.freedesktop.org
+ /mt/dim checkpatch b84122b07cfd7fe5f7ae7916c9653eeddafb51a1 drm-intel
e0e6e3b64094 drm/tests: Add a missing Kconfig select


