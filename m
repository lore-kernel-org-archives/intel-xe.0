Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10972C4332F
	for <intel-xe@archiver.kernel.org>; Sat, 11 Nov 2023 16:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F8110E291;
	Sat, 11 Nov 2023 16:22:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 14E83891A3;
 Sat, 11 Nov 2023 16:22:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1020AAADDA;
 Sat, 11 Nov 2023 16:22:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Sat, 11 Nov 2023 16:22:30 -0000
Message-ID: <169971975006.381.17788145353638669247@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231109175132.3084142-1-lucas.demarchi@intel.com>
In-Reply-To: <20231109175132.3084142-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fi?=
 =?utf-8?q?x_builtin_vs_module_configuration_=28rev2=29?=
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

Series: Fix builtin vs module configuration (rev2)
URL   : https://patchwork.freedesktop.org/series/126215/
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
commit d9c64de4fa464160e1fbfc9a465b11ada9cd4be2
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Nov 9 09:51:32 2023 -0800

    drm/xe: Fix build with KUNIT=m
    
    Due to the current integration between "live" xe kunit tests and kunit,
    it's not possible to have a build with the following combination:
    
            CONFIG_DRM_XE=y
            CONFIG_KUNIT=m
    
    ... even if kconfig doesn't block it. The reason for the failure is that
    some compilation units are pulled in xe.ko:
    
            drivers/gpu/drm/xe/xe_bo.c:#include "tests/xe_bo.c"
            drivers/gpu/drm/xe/xe_dma_buf.c:#include "tests/xe_dma_buf.c"
            drivers/gpu/drm/xe/xe_migrate.c:#include "tests/xe_migrate.c"
            drivers/gpu/drm/xe/xe_pci.c:#include "tests/xe_pci.c"
    
    Those files shouldn't use symbols from kunit, which should be reserved
    to the tests/*_test.c files. Detangling this dependency doesn't seem
    very straightforward, so fix the immediate issue instructing kconfig to
    block the problematic configuration.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch edeb8b8fa330a62d4a07b37d08145d86114bc151 drm-intel
ac23a729d fixup! drm/xe/display: Implement display support
d9c64de4f drm/xe: Fix build with KUNIT=m


