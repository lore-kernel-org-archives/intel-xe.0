Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50670C52D6F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 23:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2084C10E610;
	Wed,  7 Aug 2024 23:58:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7821E10E610;
 Wed,  7 Aug 2024 23:58:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/2=5D_drm/xe=3A_fix_WA_14018094691?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Aug 2024 23:58:54 -0000
Message-ID: <172307513448.547558.15889848677908370037@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240807235333.1370915-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240807235333.1370915-1-daniele.ceraolospurio@intel.com>
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

Series: series starting with [v2,1/2] drm/xe: fix WA 14018094691
URL   : https://patchwork.freedesktop.org/series/137013/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
66551fd1be58212fb46d0bc97f2e5ae43c69b733
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6825b88f27f19d44196558496f538d8e2cd4275e
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Aug 7 16:53:33 2024 -0700

    drm/xe/bmg: extend WA 14018094691 to BMG
    
    The WA applies to BMG as well, with no changes compared to LNL
    
    v2: rebase on use of GRAPHICS_VERSION() instead of PLATFORM()
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 4f5d551409fb5562ab0d732120e7ac9b698b5864 drm-intel
2e19d8ed3d12 drm/xe: fix WA 14018094691
6825b88f27f1 drm/xe/bmg: extend WA 14018094691 to BMG


