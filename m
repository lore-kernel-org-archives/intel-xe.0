Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B183C3DA64
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 01:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF30510E8FD;
	Fri, 26 Jul 2024 01:32:02 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D292D10E8FF;
 Fri, 26 Jul 2024 01:32:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Move_GuC_FW_defs_for_LNL_?=
 =?utf-8?q?and_BMG_to_drm-xe-next?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Jul 2024 01:32:01 -0000
Message-ID: <172195752185.384445.14192837536080634610@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240726012610.706749-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240726012610.706749-1-daniele.ceraolospurio@intel.com>
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

Series: Move GuC FW defs for LNL and BMG to drm-xe-next
URL   : https://patchwork.freedesktop.org/series/136544/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1eebe719e4ba18699bcf3d3fbcceb6a3134b124a
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Thu Jul 25 18:26:10 2024 -0700

    drm/xe/guc: Add BMG GuC definition
    
    Set the minimum recommended version to 70.29.1 as this is the release
    that includes all the fixes and WAs required on BMG.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch e4d74e86acba1cf96e4513a63046b793ae43ece7 drm-intel
0a355eba4602 drm/xe: Drop pre-release GuC definitions for LNL and BMG
06b331cd9e08 drm/xe/guc: Bump LNL GuC recommended version to 70.29.1
1eebe719e4ba drm/xe/guc: Add BMG GuC definition


