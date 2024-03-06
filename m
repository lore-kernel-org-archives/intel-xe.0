Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871A9C54E41
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 20:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7BE11352E;
	Wed,  6 Mar 2024 20:36:40 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C29E11352E;
 Wed,  6 Mar 2024 20:36:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Return_immediat?=
 =?utf-8?q?ely_on_tile=5Finit_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Mar 2024 20:36:38 -0000
Message-ID: <170975739857.562293.1685597739518466120@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240306203110.146387-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240306203110.146387-1-rodrigo.vivi@intel.com>
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

Series: drm/xe: Return immediately on tile_init failure
URL   : https://patchwork.freedesktop.org/series/130835/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7d6fb25447372de10c7d82d450bf95e4b2e2a0ab
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1770a010943906bd0eebfaddbb054349c3badd1f
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Mar 6 15:31:10 2024 -0500

    drm/xe: Return immediately on tile_init failure
    
    There's no reason to proceed with applying workaround and initing
    sysfs if we are going to abort the probe upon failure.
    
    Fixes: 876611c2b756 ("drm/xe: Memory allocations are tile-based, not GT-based")
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch e96742a33719079709b8e180448b491622e6a427 drm-intel
1770a0109439 drm/xe: Return immediately on tile_init failure


