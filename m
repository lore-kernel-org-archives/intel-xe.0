Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E1AC54E41
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 23:00:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0968610ED5B;
	Wed,  6 Mar 2024 23:00:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CAA10ED60;
 Wed,  6 Mar 2024 23:00:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_platform/x86/intel/pmc/ln?=
 =?utf-8?q?l=3A_Remove_SSRAM_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Mar 2024 23:00:00 -0000
Message-ID: <170976600080.562292.12177128722254546291@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240306225350.1910423-1-lucas.demarchi@intel.com>
In-Reply-To: <20240306225350.1910423-1-lucas.demarchi@intel.com>
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

Series: platform/x86/intel/pmc/lnl: Remove SSRAM support
URL   : https://patchwork.freedesktop.org/series/130837/
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
commit e11a71c3069500f21716082a8500031f7819425d
Author: David E. Box <david.e.box@linux.intel.com>
Date:   Wed Mar 6 14:53:50 2024 -0800

    platform/x86/intel/pmc/lnl: Remove SSRAM support
    
    A recent PMC firmware change in Lunar Lake caused the pmc_core driver to
    fail to probe. This is due to a change in the GUID for PMC telemetry coming
    from the SSRAM device. Until a final release is ready this value may
    change again. In the meantime, disable the SSRAM support for Lunar Lake so
    the driver can load and provide some basic functionality.
    
    Fixes: 3748dfdae2a6 ("platform/x86/intel/pmc: Add Lunar Lake M support to intel_pmc_core driver")
    Signed-off-by: David E. Box <david.e.box@linux.intel.com>
    Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
    Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
    Link: https://lore.kernel.org/r/20240227190134.1592072-2-david.e.box@linux.intel.com
    [ topic/core-for-CI: currently this is blocking test on LNL. Patch is
      going through the platform-drivers-x86 tree:
      https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=review-ilpo&id=728720381879e9e0bc68ff9edca52261c1f5bc31
    
      Once proved to work, migrate this comment to gitlab and follow the
      proper way to add patches in topic/core-for-CI. ]
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch ba2149e0e3add9f607c6d41e20479d85ceb0769d drm-intel
e11a71c30695 platform/x86/intel/pmc/lnl: Remove SSRAM support


