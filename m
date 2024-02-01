Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06600C4828F
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 14:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF85B10E3BC;
	Thu,  1 Feb 2024 14:36:51 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B061C10E3BC;
 Thu,  1 Feb 2024 14:36:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm=3A_enable_W=3D1_warni?=
 =?utf-8?q?ngs_by_default_across_the_subsystem?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Feb 2024 14:36:49 -0000
Message-ID: <170679820972.895526.2952949858377751042@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <cover.1706797803.git.jani.nikula@intel.com>
In-Reply-To: <cover.1706797803.git.jani.nikula@intel.com>
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

Series: drm: enable W=1 warnings by default across the subsystem
URL   : https://patchwork.freedesktop.org/series/129421/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d0a6c4872e037e3a5ded70758b0a7baf56c9b018
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Feb 1 16:33:09 2024 +0200

    drm: Add CONFIG_DRM_WERROR
    
    Add kconfig to enable -Werror subsystem wide. This is useful for
    development and CI to keep the subsystem warning free, while avoiding
    issues outside of the subsystem that kernel wide CONFIG_WERROR=y might
    hit.
    
    v2: Don't depend on COMPILE_TEST
    
    Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com> # v1
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 3e58a4940c44430f20cad20ead5e1b77ed209cde drm-intel
83c212b5a drm: enable (most) W=1 warnings by default across the subsystem
d0a6c4872 drm: Add CONFIG_DRM_WERROR


