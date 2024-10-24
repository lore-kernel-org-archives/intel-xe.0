Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CAFCE8E83
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 14:45:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7B010E29D;
	Thu, 24 Oct 2024 14:45:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D0410E29D;
 Thu, 24 Oct 2024 14:45:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_mmio_read_b?=
 =?utf-8?q?efore_GGTT_invalidate?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 14:45:51 -0000
Message-ID: <172978115178.1328167.10721178474901580466@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023221200.1797832-1-matthew.brost@intel.com>
In-Reply-To: <20241023221200.1797832-1-matthew.brost@intel.com>
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

Series: drm/xe: Add mmio read before GGTT invalidate
URL   : https://patchwork.freedesktop.org/series/140400/
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
commit a774e8073a5d926c20936bb4d1a1d7ffdd9d7154
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Oct 23 15:12:00 2024 -0700

    drm/xe: Add mmio read before GGTT invalidate
    
    On LNL without a mmio read before a GGTT invalidate the GuC can
    incorrectly read the GGTT scratch page upon next access leading to jobs
    not getting scheduled. A mmio read before a GGTT invalidate seems to fix
    this. Since a GGTT invalidate is not a hot code path, blindly do a mmio
    read before each GGTT invalidate.
    
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: stable@vger.kernel.org
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3164
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 121cd95da591284c97d6f9ac1c58c7a79d27b201 drm-intel
a774e8073a5d drm/xe: Add mmio read before GGTT invalidate


