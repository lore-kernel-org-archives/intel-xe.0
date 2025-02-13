Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65434C0219D
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 09:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D88F10EA40;
	Thu, 13 Feb 2025 09:42:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CF110EA40;
 Thu, 13 Feb 2025 09:42:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_s/xe=5Fmmio=5Finit/xe=5Fmmio=5Fprobe=5Fearly_=28r?=
 =?utf-8?q?ev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Feb 2025 09:42:10 -0000
Message-ID: <173943973065.1615821.8176566783716899571@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250130105057.136586-1-ilia.levi@intel.com>
In-Reply-To: <20250130105057.136586-1-ilia.levi@intel.com>
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

Series: series starting with [1/2] drm/xe: s/xe_mmio_init/xe_mmio_probe_early (rev4)
URL   : https://patchwork.freedesktop.org/series/144142/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b2f0d16f30a4aa7374dcff7fd43310706396c502
Author: Ilia Levi <ilia.levi@intel.com>
Date:   Thu Feb 13 11:35:59 2025 +0200

    drm/xe: Add xe_mmio_init() initialization function
    
    Add a convenience function for minimal initialization of struct xe_mmio.
    This function also validates that the entirety of the provided mmio region
    is usable with struct xe_reg.
    
    v2: Modify commit message, add kernel doc, refactor assert (Michal)
    v3: Fix off-by-one bug, add clarifying macro (Michal)
    v4: Derive bitfield width from size (Michal)
    
    Signed-off-by: Ilia Levi <ilia.levi@intel.com>
+ /mt/dim checkpatch dbf65862427b99b51ac5279560a1f7995779480b drm-intel
5ea74c3e7354 drm/xe: s/xe_mmio_init/xe_mmio_probe_early
b2f0d16f30a4 drm/xe: Add xe_mmio_init() initialization function


