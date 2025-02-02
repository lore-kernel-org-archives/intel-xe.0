Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5A2C0218F
	for <intel-xe@archiver.kernel.org>; Sun,  2 Feb 2025 11:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF8210E25F;
	Sun,  2 Feb 2025 11:56:07 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A6E10E25F;
 Sun,  2 Feb 2025 11:56:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_s/xe=5Fmmio=5Finit/xe=5Fmmio=5Fprobe=5Fearly_=28r?=
 =?utf-8?q?ev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 02 Feb 2025 11:56:06 -0000
Message-ID: <173849736661.3947389.5122322249963487017@b555e5b46a47>
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

Series: series starting with [1/2] drm/xe: s/xe_mmio_init/xe_mmio_probe_early (rev2)
URL   : https://patchwork.freedesktop.org/series/144142/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 89f782bd13334df299e43d69c82d3374990433e1
Author: Ilia Levi <ilia.levi@intel.com>
Date:   Sun Feb 2 13:00:35 2025 +0200

    drm/xe: Add xe_mmio_init() initialization function
    
    Add a convenience function for minimal initialization of struct xe_mmio.
    This function also validates that the entirety of the provided mmio region
    is usable with struct xe_reg.
    
    v2: Modify commit message, add kernel doc, refactor assert (Michal)
    
    Signed-off-by: Ilia Levi <ilia.levi@intel.com>
+ /mt/dim checkpatch 01f54d1da1ffffff78047186f62b5916dfd43939 drm-intel
ab6b33c2b90f drm/xe: s/xe_mmio_init/xe_mmio_probe_early
89f782bd1333 drm/xe: Add xe_mmio_init() initialization function


