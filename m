Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC13FC77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 13:33:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9730810E5BB;
	Tue, 24 Jun 2025 13:33:33 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DCA10E5B5;
 Tue, 24 Jun 2025 13:33:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_iommu/vt-d=3A_Enable_ATS_?=
 =?utf-8?q?before_cache_tag_assignment_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Jun 2025 13:33:32 -0000
Message-ID: <175077201280.104499.4347159803303192001@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250624092412.4016009-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250624092412.4016009-1-tejas.upadhyay@intel.com>
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

Series: iommu/vt-d: Enable ATS before cache tag assignment (rev2)
URL   : https://patchwork.freedesktop.org/series/150664/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e62871f3161a1a7546fa770d53afaec196cb71a9
Author: Lu Baolu <baolu.lu@linux.intel.com>
Date:   Tue Jun 24 14:54:12 2025 +0530

    iommu/vt-d: Enable ATS before cache tag assignment
    
    This is a core-for-CI patch for
    https://lore.kernel.org/linux-iommu/20250620060802.3036137-1-baolu.lu@linux.intel.com/
    
    Commit <4f1492efb495> ("iommu/vt-d: Revert ATS timing change to fix boot
    failure") placed the enabling of ATS in the probe_finalize callback. This
    occurs after the default domain attachment, which is when the ATS cache
    tag is assigned. Consequently, the device TLB cache tag is missed when the
    domain is attached, leading to the device TLB not being invalidated in the
    iommu_unmap paths.
    
    Fix it by moving the ATS enabling to the default domain attachment path,
    ensuring ATS is enabled before the cache tag assignment.
    
    Fixes: 4f1492efb495 ("iommu/vt-d: Revert ATS timing change to fix boot failure")
    Link: https://lore.kernel.org/linux-iommu/20250620060802.3036137-1-baolu.lu@linux.intel.com/
    References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14531
    Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch fb5dada21e3cfa26179ca58e1d7c26cdad217201 drm-intel
e62871f3161a iommu/vt-d: Enable ATS before cache tag assignment
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
https://lore.kernel.org/linux-iommu/20250620060802.3036137-1-baolu.lu@linux.intel.com/

-:21: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#21: 
References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14531

total: 0 errors, 2 warnings, 0 checks, 60 lines checked


